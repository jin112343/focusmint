import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class SpeedScoreService {
  static const String _bestScoreKey = 'best_score';
  static const String _totalTimeKey = 'total_time_seconds';
  static const String _totalScoreKey = 'total_score';
  static const String _goalPointsKey = 'goal_points';
  static const String _weeklyHistoryKey = 'weekly_history';
  static const String _monthlyHistoryKey = 'monthly_history';
  static final Logger _logger = Logger();
  
  DateTime? _stimulusStartTime;
  
  void startStimulus() {
    _stimulusStartTime = DateTime.now();
  }
  
  double calculateScore(bool isCorrect) {
    if (_stimulusStartTime == null) {
      _logger.w('calculateScore called without startStimulus');
      return isCorrect ? 3.0 : 0.0;
    }
    
    final reactionTime = DateTime.now().difference(_stimulusStartTime!);
    final reactionTimeMs = reactionTime.inMilliseconds;
    
    if (!isCorrect) {
      return 0.0;
    }
    
    // 正解の場合、反応時間に基づいて細かくスコアを計算
    // 500ms（0.5秒）までは満点6.0ポイント
    // 500ms以降は10秒（10000ms）で0.01ポイントまで減点
    // 最低0.01ポイント
    double score;
    if (reactionTimeMs <= 500) {
      score = 6.0;
    } else {
      // 500msから10000msの間で6.0から0.01まで線形減少
      // 減点係数 = (6.0 - 0.01) / (10000 - 500) = 5.99 / 9500 ≈ 0.000631
      final decreaseRate = 5.99 / 9500.0;
      score = 6.0 - ((reactionTimeMs - 500) * decreaseRate);
    }
    
    // 最低点と最高点の制限
    if (score < 0.01) {
      score = 0.01;
    } else if (score > 6.0) {
      score = 6.0;
    }
    
    // 小数点第2位まで丸める
    score = double.parse(score.toStringAsFixed(2));
    
    _logger.i('Reaction time: ${reactionTimeMs}ms, Score: $score');
    return score;
  }
  
  Future<void> saveBestScore(double score) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentBest = prefs.getDouble(_bestScoreKey) ?? 0.0;
      
      if (score > currentBest) {
        await prefs.setDouble(_bestScoreKey, score);
        _logger.i('New best score saved: $score');
      }
    } catch (e, stackTrace) {
      _logger.e('Failed to save best score', error: e, stackTrace: stackTrace);
    }
  }
  
  Future<double> getBestScore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(_bestScoreKey) ?? 0.0;
    } catch (e, stackTrace) {
      _logger.e('Failed to get best score', error: e, stackTrace: stackTrace);
      return 0.0;
    }
  }
  
  Future<void> addTotalTime(int seconds) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentTotal = prefs.getInt(_totalTimeKey) ?? 0;
      await prefs.setInt(_totalTimeKey, currentTotal + seconds);
      _logger.i('Total time updated: ${currentTotal + seconds} seconds');
    } catch (e, stackTrace) {
      _logger.e('Failed to add total time', error: e, stackTrace: stackTrace);
    }
  }
  
  Future<double> getTotalTimeMinutes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final totalSeconds = prefs.getInt(_totalTimeKey) ?? 0;
      return totalSeconds / 60.0;
    } catch (e, stackTrace) {
      _logger.e('Failed to get total time', error: e, stackTrace: stackTrace);
      return 0.0;
    }
  }
  
  Future<void> addTotalScore(double score) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentTotal = prefs.getDouble(_totalScoreKey) ?? 0.0;
      await prefs.setDouble(_totalScoreKey, currentTotal + score);
      
      // 週次・月次履歴にもポイントを追加
      await _addToWeeklyHistory(score);
      await _addToMonthlyHistory(score);
      
      _logger.i('Total score updated: ${currentTotal + score}');
    } catch (e, stackTrace) {
      _logger.e('Failed to add total score', error: e, stackTrace: stackTrace);
    }
  }
  
  Future<double> getTotalScore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(_totalScoreKey) ?? 0.0;
    } catch (e, stackTrace) {
      _logger.e('Failed to get total score', error: e, stackTrace: stackTrace);
      return 0.0;
    }
  }
  
  Future<void> setGoalPoints(int goalPoints) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_goalPointsKey, goalPoints);
      _logger.i('Goal points set to: $goalPoints');
    } catch (e, stackTrace) {
      _logger.e('Failed to set goal points', error: e, stackTrace: stackTrace);
    }
  }
  
  Future<int> getGoalPoints() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_goalPointsKey) ?? 1000; // デフォルト1000ポイント
    } catch (e, stackTrace) {
      _logger.e('Failed to get goal points', error: e, stackTrace: stackTrace);
      return 1000;
    }
  }

  // 週のキーを生成する（例: "2024-W35"）
  String _getWeekKey(DateTime date) {
    // ISO週番号を計算
    final startOfYear = DateTime(date.year, 1, 1);
    final daysSinceStartOfYear = date.difference(startOfYear).inDays;
    final weekNumber = ((daysSinceStartOfYear + startOfYear.weekday - 1) ~/ 7) + 1;
    return '${date.year}-W${weekNumber.toString().padLeft(2, '0')}';
  }

  // 月のキーを生成する（例: "2024-03"）
  String _getMonthKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}';
  }

  Future<void> _addToWeeklyHistory(double score) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final now = DateTime.now();
      final weekKey = _getWeekKey(now);
      
      final historyJson = prefs.getString(_weeklyHistoryKey) ?? '{}';
      final Map<String, dynamic> history = json.decode(historyJson);
      
      final currentScore = (history[weekKey] as double?) ?? 0.0;
      history[weekKey] = currentScore + score;
      
      await prefs.setString(_weeklyHistoryKey, json.encode(history));
      _logger.i('Weekly history updated for week $weekKey: ${history[weekKey]}');
    } catch (e, stackTrace) {
      _logger.e('Failed to update weekly history', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> _addToMonthlyHistory(double score) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final now = DateTime.now();
      final monthKey = _getMonthKey(now);
      
      final historyJson = prefs.getString(_monthlyHistoryKey) ?? '{}';
      final Map<String, dynamic> history = json.decode(historyJson);
      
      final currentScore = (history[monthKey] as double?) ?? 0.0;
      history[monthKey] = currentScore + score;
      
      await prefs.setString(_monthlyHistoryKey, json.encode(history));
      _logger.i('Monthly history updated for month $monthKey: ${history[monthKey]}');
    } catch (e, stackTrace) {
      _logger.e('Failed to update monthly history', error: e, stackTrace: stackTrace);
    }
  }

  Future<Map<String, int>> getWeeklyHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyJson = prefs.getString(_weeklyHistoryKey) ?? '{}';
      final Map<String, dynamic> rawHistory = json.decode(historyJson);
      
      // 過去8週間のデータを取得
      final result = <String, int>{};
      final now = DateTime.now();
      
      for (int i = 7; i >= 0; i--) {
        final targetDate = now.subtract(Duration(days: i * 7));
        final weekKey = _getWeekKey(targetDate);
        final score = (rawHistory[weekKey] as double?) ?? 0.0;
        result[weekKey] = score.toInt();
      }
      
      return result;
    } catch (e, stackTrace) {
      _logger.e('Failed to get weekly history', error: e, stackTrace: stackTrace);
      return {};
    }
  }

  Future<Map<String, int>> getMonthlyHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyJson = prefs.getString(_monthlyHistoryKey) ?? '{}';
      final Map<String, dynamic> rawHistory = json.decode(historyJson);
      
      // 過去6ヶ月のデータを取得
      final result = <String, int>{};
      final now = DateTime.now();
      
      for (int i = 5; i >= 0; i--) {
        final targetYear = now.month - i > 0 ? now.year : now.year - 1;
        final targetMonth = now.month - i > 0 ? now.month - i : 12 + (now.month - i);
        final targetDate = DateTime(targetYear, targetMonth, 1);
        final monthKey = _getMonthKey(targetDate);
        final score = (rawHistory[monthKey] as double?) ?? 0.0;
        result[monthKey] = score.toInt();
      }
      
      return result;
    } catch (e, stackTrace) {
      _logger.e('Failed to get monthly history', error: e, stackTrace: stackTrace);
      return {};
    }
  }

  // 週キーを表示用文字列に変換
  String formatWeekKey(String weekKey) {
    final parts = weekKey.split('-W');
    if (parts.length == 2) {
      final year = parts[0];
      final week = parts[1];
      return '${year}年 第${week}週';
    }
    return weekKey;
  }

  // 月キーを表示用文字列に変換
  String formatMonthKey(String monthKey) {
    final parts = monthKey.split('-');
    if (parts.length == 2) {
      final year = parts[0];
      final month = parts[1];
      return '${year}年 ${month}月';
    }
    return monthKey;
  }
}