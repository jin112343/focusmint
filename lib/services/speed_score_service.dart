import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class SpeedScoreService {
  static const String _bestScoreKey = 'best_score';
  static const String _totalTimeKey = 'total_time_seconds';
  static const String _totalScoreKey = 'total_score';
  static const String _goalPointsKey = 'goal_points';
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
    // 500ms以降は1msごとに0.01ポイント減点
    // 最低0.01ポイント
    double score;
    if (reactionTimeMs <= 500) {
      score = 6.0;
    } else {
      score = 6.0 - ((reactionTimeMs - 500) * 0.01);
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
}