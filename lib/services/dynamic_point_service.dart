import 'dart:math' as math;
import 'package:focusmint/models/session_summary.dart';
import 'package:logger/logger.dart';

/// 時間と共に変動するポイントシステムを管理するサービス
class DynamicPointService {
  static final Logger _logger = Logger();
  
  // 時間による変動係数
  static const double _morningBonus = 1.15;    // 朝のボーナス (6-12時)
  static const double _afternoonNeutral = 1.0;  // 昼は標準 (12-18時)
  static const double _eveningBonus = 1.1;     // 夕方のボーナス (18-21時)
  static const double _nightPenalty = 0.9;     // 夜はペナルティ (21-6時)
  
  // 曜日による変動係数
  static const double _weekdayBonus = 1.05;    // 平日ボーナス
  static const double _weekendNeutral = 1.0;   // 週末は標準
  
  // 継続性ボーナス
  static const double _maxStreakBonus = 1.2;   // 最大継続ボーナス
  static const int _maxStreakDays = 7;         // 最大ボーナス到達日数
  
  // パフォーマンス履歴による変動
  static const double _improvementBonus = 1.1; // 改善ボーナス
  static const double _declineNeutral = 1.0;   // 低下時は標準

  /// 時間変動ポイントを計算する
  /// [baseScore]: 基本スコア（BISスコアから計算）
  /// [sessionTime]: セッション時刻
  /// [consecutiveDays]: 連続実行日数
  /// [recentSessions]: 最近のセッション履歴
  static double calculateDynamicPoints({
    required double baseScore,
    required DateTime sessionTime,
    int consecutiveDays = 0,
    List<SessionSummary> recentSessions = const [],
  }) {
    try {
      // 基本ポイント（小数点以下を保持）
      double dynamicPoints = baseScore;
      
      // 1. 時間帯による変動
      final timeMultiplier = _calculateTimeMultiplier(sessionTime);
      dynamicPoints *= timeMultiplier;
      
      // 2. 曜日による変動
      final dayMultiplier = _calculateDayMultiplier(sessionTime);
      dynamicPoints *= dayMultiplier;
      
      // 3. 継続性ボーナス
      final streakMultiplier = _calculateStreakMultiplier(consecutiveDays);
      dynamicPoints *= streakMultiplier;
      
      // 4. パフォーマンス履歴による変動
      final performanceMultiplier = _calculatePerformanceMultiplier(
        baseScore, 
        recentSessions,
      );
      dynamicPoints *= performanceMultiplier;
      
      // 5. ランダム要素（±2%の微小変動）
      final randomMultiplier = _calculateRandomMultiplier();
      dynamicPoints *= randomMultiplier;
      
      // 範囲を0.0-100.0に制限
      dynamicPoints = math.max(0.0, math.min(100.0, dynamicPoints));
      
      _logger.d(
        'Dynamic points calculation: '
        'base=$baseScore, '
        'time=${timeMultiplier.toStringAsFixed(3)}, '
        'day=${dayMultiplier.toStringAsFixed(3)}, '
        'streak=${streakMultiplier.toStringAsFixed(3)}, '
        'performance=${performanceMultiplier.toStringAsFixed(3)}, '
        'random=${randomMultiplier.toStringAsFixed(3)}, '
        'final=${dynamicPoints.toStringAsFixed(2)}'
      );
      
      return dynamicPoints;
      
    } catch (e, stackTrace) {
      _logger.e(
        'calculateDynamicPoints failed',
        error: e,
        stackTrace: stackTrace,
      );
      return baseScore; // エラー時は基本スコアを返す
    }
  }
  
  /// 時間帯による変動係数を計算
  static double _calculateTimeMultiplier(DateTime sessionTime) {
    final hour = sessionTime.hour;
    
    if (hour >= 6 && hour < 12) {
      return _morningBonus;
    } else if (hour >= 12 && hour < 18) {
      return _afternoonNeutral;
    } else if (hour >= 18 && hour < 21) {
      return _eveningBonus;
    } else {
      return _nightPenalty;
    }
  }
  
  /// 曜日による変動係数を計算
  static double _calculateDayMultiplier(DateTime sessionTime) {
    final weekday = sessionTime.weekday; // 1=月曜, 7=日曜
    
    if (weekday >= 1 && weekday <= 5) {
      return _weekdayBonus; // 平日
    } else {
      return _weekendNeutral; // 週末
    }
  }
  
  /// 継続性による変動係数を計算
  static double _calculateStreakMultiplier(int consecutiveDays) {
    if (consecutiveDays <= 0) return 1.0;
    
    // 日数に応じて線形にボーナス増加、最大値で上限
    final normalizedDays = math.min(consecutiveDays, _maxStreakDays);
    final bonusRatio = normalizedDays / _maxStreakDays;
    
    return 1.0 + (bonusRatio * (_maxStreakBonus - 1.0));
  }
  
  /// パフォーマンス履歴による変動係数を計算
  static double _calculatePerformanceMultiplier(
    double currentScore,
    List<SessionSummary> recentSessions,
  ) {
    if (recentSessions.isEmpty) return 1.0;
    
    // 最近5セッションの平均BISスコアと比較
    final recentCount = math.min(5, recentSessions.length);
    final recentScores = recentSessions
        .take(recentCount)
        .map((s) => s.bisScore)
        .toList();
    
    final averageRecentScore = recentScores.reduce((a, b) => a + b) / recentScores.length;
    
    // 基本スコアからBISスコアを逆算（概算）
    final currentBisScore = (currentScore - 50.0) / 10.0;
    
    // 改善していればボーナス、そうでなければ標準
    if (currentBisScore > averageRecentScore) {
      return _improvementBonus;
    } else {
      return _declineNeutral;
    }
  }
  
  /// ランダム要素による微小変動（±2%）
  static double _calculateRandomMultiplier() {
    final random = math.Random();
    final variation = (random.nextDouble() - 0.5) * 0.04; // ±2%
    return 1.0 + variation;
  }
  
  /// ポイントを小数点第二位まで丸めて文字列として返す
  static String formatPoints(double points) {
    return points.toStringAsFixed(2);
  }
  
  /// 時間変動の詳細情報を取得（デバッグ用）
  static Map<String, dynamic> getVariationDetails({
    required double baseScore,
    required DateTime sessionTime,
    int consecutiveDays = 0,
    List<SessionSummary> recentSessions = const [],
  }) {
    return {
      'baseScore': baseScore,
      'timeMultiplier': _calculateTimeMultiplier(sessionTime),
      'timeOfDay': _getTimeOfDayLabel(sessionTime),
      'dayMultiplier': _calculateDayMultiplier(sessionTime),
      'dayType': _getDayTypeLabel(sessionTime),
      'streakMultiplier': _calculateStreakMultiplier(consecutiveDays),
      'consecutiveDays': consecutiveDays,
      'performanceMultiplier': _calculatePerformanceMultiplier(baseScore, recentSessions),
      'recentSessionsCount': recentSessions.length,
    };
  }
  
  /// 時間帯のラベルを取得
  static String _getTimeOfDayLabel(DateTime sessionTime) {
    final hour = sessionTime.hour;
    
    if (hour >= 6 && hour < 12) {
      return '朝 (ボーナス +15%)';
    } else if (hour >= 12 && hour < 18) {
      return '昼 (標準)';
    } else if (hour >= 18 && hour < 21) {
      return '夕方 (ボーナス +10%)';
    } else {
      return '夜 (ペナルティ -10%)';
    }
  }
  
  /// 曜日タイプのラベルを取得
  static String _getDayTypeLabel(DateTime sessionTime) {
    final weekday = sessionTime.weekday;
    
    if (weekday >= 1 && weekday <= 5) {
      return '平日 (ボーナス +5%)';
    } else {
      return '週末 (標準)';
    }
  }
}