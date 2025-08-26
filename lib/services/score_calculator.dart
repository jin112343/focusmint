import 'dart:math' as math;
import 'package:focusmint/models/trial_log.dart';
import 'package:focusmint/models/session_summary.dart';
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/services/dynamic_point_service.dart';
import 'package:logger/logger.dart';

class ScoreCalculator {
  static final Logger _logger = Logger();
  
  static int clampInt(int value, int min, int max) {
    return math.max(min, math.min(value, max));
  }
  
  static int processRt({
    required int rawRtMs,
    required bool correct,
  }) {
    final clampedRt = clampInt(
      rawRtMs,
      TrainingConstants.minValidRtMs,
      TrainingConstants.maxValidRtMs,
    );
    
    if (correct) {
      return clampedRt;
    } else {
      final penalizedRt = clampedRt + TrainingConstants.errorPenaltyMs;
      return clampInt(penalizedRt, 
          TrainingConstants.minValidRtMs,
          TrainingConstants.maxPenalizedRtMs);
    }
  }
  
  static double calculateAccuracy(List<TrialLog> trials) {
    if (trials.isEmpty) return 0.0;
    
    final correctTrials = trials.where((trial) => trial.correct).length;
    return correctTrials / trials.length;
  }
  
  static int calculateMedianRt(List<TrialLog> trials) {
    if (trials.isEmpty) return 0;
    
    final rtValues = trials
        .map((trial) => trial.processedRtMs)
        .toList()
      ..sort();
    
    final middle = rtValues.length ~/ 2;
    if (rtValues.length % 2 == 0) {
      return ((rtValues[middle - 1] + rtValues[middle]) / 2).round();
    } else {
      return rtValues[middle];
    }
  }
  
  static double calculateAverageRt(List<TrialLog> trials) {
    if (trials.isEmpty) return 0.0;
    
    final totalRt = trials.fold<int>(
      0,
      (sum, trial) => sum + trial.processedRtMs,
    );
    
    return totalRt / trials.length;
  }
  
  static double calculateBis({
    required List<TrialLog> trials,
    double? referenceMeanAccuracy,
    double? referenceStdAccuracy,
    double? referenceMeanRt,
    double? referenceStdRt,
  }) {
    if (trials.isEmpty) return 0.0;
    
    final accuracy = calculateAccuracy(trials);
    final medianRt = calculateMedianRt(trials);
    
    double zAccuracy = 0.0;
    double zRt = 0.0;
    
    // z標準化（参照データがある場合）
    if (referenceMeanAccuracy != null && 
        referenceStdAccuracy != null && 
        referenceStdAccuracy > 0) {
      zAccuracy = (accuracy - referenceMeanAccuracy) / referenceStdAccuracy;
    }
    
    if (referenceMeanRt != null && 
        referenceStdRt != null && 
        referenceStdRt > 0) {
      zRt = (medianRt - referenceMeanRt) / referenceStdRt;
    }
    
    // BIS = z(accuracy) - z(RT)
    // 高い精度かつ速い反応時間で高スコア
    final bis = zAccuracy - zRt;
    
    _logger.d('BIS calculation: accuracy=$accuracy, medianRt=$medianRt, '
              'zAcc=$zAccuracy, zRt=$zRt, BIS=$bis');
    
    return bis;
  }
  
  static double calculateIes(List<TrialLog> trials) {
    if (trials.isEmpty) return 0.0;
    
    final accuracy = calculateAccuracy(trials);
    final averageRt = calculateAverageRt(trials);
    
    if (accuracy == 0.0) return double.infinity;
    
    // IES = Average RT / Accuracy
    return averageRt / accuracy;
  }
  
  static int calculateDisplayScore(double bisScore) {
    // displayScore = clamp(50 + 10 * BIS, 0, 100)
    final score = TrainingConstants.baseDisplayScore + 
                  (TrainingConstants.scoreScalingFactor * bisScore);
    
    return clampInt(
      score.round(),
      TrainingConstants.minDisplayScore,
      TrainingConstants.maxDisplayScore,
    );
  }
  
  static int calculateMaxConsecutiveCorrect(List<TrialLog> trials) {
    if (trials.isEmpty) return 0;
    
    int maxStreak = 0;
    int currentStreak = 0;
    
    for (final trial in trials) {
      if (trial.correct) {
        currentStreak++;
        maxStreak = math.max(maxStreak, currentStreak);
      } else {
        currentStreak = 0;
      }
    }
    
    return maxStreak;
  }
  
  static Map<int, int> calculateTrialsByDifficultyLevel(List<TrialLog> trials) {
    final Map<int, int> counts = {};
    
    for (final trial in trials) {
      counts[trial.difficultyLevel] = (counts[trial.difficultyLevel] ?? 0) + 1;
    }
    
    return counts;
  }
  
  static SessionSummary calculateSessionSummary({
    required String sessionId,
    required List<TrialLog> trials,
    required DateTime startTime,
    required DateTime endTime,
    double? referenceMeanAccuracy,
    double? referenceStdAccuracy,
    double? referenceMeanRt,
    double? referenceStdRt,
    int consecutiveDays = 0,
    List<SessionSummary> recentSessions = const [],
  }) {
    if (trials.isEmpty) {
      _logger.w('Empty trials list for session $sessionId');
      return _createEmptySessionSummary(sessionId, startTime, endTime);
    }
    
    final accuracy = calculateAccuracy(trials);
    final medianRtMs = calculateMedianRt(trials);
    final averageRtMs = calculateAverageRt(trials);
    final correctTrials = trials.where((t) => t.correct).length;
    
    final bisScore = calculateBis(
      trials: trials,
      referenceMeanAccuracy: referenceMeanAccuracy,
      referenceStdAccuracy: referenceStdAccuracy,
      referenceMeanRt: referenceMeanRt,
      referenceStdRt: referenceStdRt,
    );
    
    final iesScore = calculateIes(trials);
    final displayScore = calculateDisplayScore(bisScore);
    
    // 時間変動ポイントを計算
    final dynamicPoints = DynamicPointService.calculateDynamicPoints(
      baseScore: displayScore.toDouble(),
      sessionTime: startTime,
      consecutiveDays: consecutiveDays,
      recentSessions: recentSessions,
    );
    
    final maxConsecutiveCorrect = calculateMaxConsecutiveCorrect(trials);
    final trialsByDifficulty = calculateTrialsByDifficultyLevel(trials);
    final sessionDurationSeconds = endTime.difference(startTime).inSeconds;
    
    _logger.i('Session summary calculated for $sessionId: '
              'trials=${trials.length}, accuracy=${(accuracy * 100).toStringAsFixed(1)}%, '
              'BIS=${bisScore.toStringAsFixed(2)}, displayScore=$displayScore, '
              'dynamicPoints=${dynamicPoints.toStringAsFixed(2)}');
    
    return SessionSummary(
      sessionId: sessionId,
      totalTrials: trials.length,
      correctTrials: correctTrials,
      accuracy: accuracy,
      medianRtMs: medianRtMs,
      averageRtMs: averageRtMs,
      bisScore: bisScore,
      iesScore: iesScore,
      displayScore: displayScore,
      dynamicPoints: dynamicPoints,
      maxConsecutiveCorrect: maxConsecutiveCorrect,
      startTime: startTime,
      endTime: endTime,
      sessionDurationSeconds: sessionDurationSeconds,
      trialsByDifficultyLevel: trialsByDifficulty,
    );
  }
  
  static SessionSummary _createEmptySessionSummary(
    String sessionId,
    DateTime startTime,
    DateTime endTime,
  ) {
    final baseScore = TrainingConstants.baseDisplayScore.toDouble();
    final dynamicPoints = DynamicPointService.calculateDynamicPoints(
      baseScore: baseScore,
      sessionTime: startTime,
      consecutiveDays: 0,
      recentSessions: [],
    );
    
    return SessionSummary(
      sessionId: sessionId,
      totalTrials: 0,
      correctTrials: 0,
      accuracy: 0.0,
      medianRtMs: 0,
      averageRtMs: 0.0,
      bisScore: 0.0,
      iesScore: 0.0,
      displayScore: TrainingConstants.baseDisplayScore,
      dynamicPoints: dynamicPoints,
      maxConsecutiveCorrect: 0,
      startTime: startTime,
      endTime: endTime,
      sessionDurationSeconds: endTime.difference(startTime).inSeconds,
      trialsByDifficultyLevel: {},
    );
  }
  
  static bool isValidSession(SessionSummary summary) {
    return summary.totalTrials >= TrainingConstants.minTrialsForValidSession &&
           summary.accuracy >= TrainingConstants.minAccuracyForValidSession;
  }
}