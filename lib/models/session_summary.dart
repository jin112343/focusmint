class SessionSummary {
  final String sessionId;
  final int totalTrials;
  final int correctTrials;
  final double accuracy;
  final int medianRtMs;
  final double averageRtMs;
  final double bisScore;
  final double iesScore;
  final int displayScore;
  final double dynamicPoints;
  final int maxConsecutiveCorrect;
  final DateTime startTime;
  final DateTime endTime;
  final int sessionDurationSeconds;
  final Map<int, int> trialsByDifficultyLevel;
  
  const SessionSummary({
    required this.sessionId,
    required this.totalTrials,
    required this.correctTrials,
    required this.accuracy,
    required this.medianRtMs,
    required this.averageRtMs,
    required this.bisScore,
    required this.iesScore,
    required this.displayScore,
    required this.dynamicPoints,
    required this.maxConsecutiveCorrect,
    required this.startTime,
    required this.endTime,
    required this.sessionDurationSeconds,
    required this.trialsByDifficultyLevel,
  });
  
  int get errorTrials => totalTrials - correctTrials;
  
  double get errorRate => 1.0 - accuracy;
  
  double get accuracyPercentage => accuracy * 100.0;
  
  double get medianRtSeconds => medianRtMs / 1000.0;
  
  double get averageRtSeconds => averageRtMs / 1000.0;
  
  Duration get sessionDuration => endTime.difference(startTime);
  
  @override
  String toString() => 
    'SessionSummary(id: $sessionId, trials: $totalTrials, '
    'accuracy: ${accuracyPercentage.toStringAsFixed(1)}%, '
    'bisScore: ${bisScore.toStringAsFixed(2)}, '
    'displayScore: $displayScore, '
    'dynamicPoints: ${dynamicPoints.toStringAsFixed(2)})';
  
  SessionSummary copyWith({
    String? sessionId,
    int? totalTrials,
    int? correctTrials,
    double? accuracy,
    int? medianRtMs,
    double? averageRtMs,
    double? bisScore,
    double? iesScore,
    int? displayScore,
    double? dynamicPoints,
    int? maxConsecutiveCorrect,
    DateTime? startTime,
    DateTime? endTime,
    int? sessionDurationSeconds,
    Map<int, int>? trialsByDifficultyLevel,
  }) {
    return SessionSummary(
      sessionId: sessionId ?? this.sessionId,
      totalTrials: totalTrials ?? this.totalTrials,
      correctTrials: correctTrials ?? this.correctTrials,
      accuracy: accuracy ?? this.accuracy,
      medianRtMs: medianRtMs ?? this.medianRtMs,
      averageRtMs: averageRtMs ?? this.averageRtMs,
      bisScore: bisScore ?? this.bisScore,
      iesScore: iesScore ?? this.iesScore,
      displayScore: displayScore ?? this.displayScore,
      dynamicPoints: dynamicPoints ?? this.dynamicPoints,
      maxConsecutiveCorrect: maxConsecutiveCorrect ?? this.maxConsecutiveCorrect,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      sessionDurationSeconds: sessionDurationSeconds ?? this.sessionDurationSeconds,
      trialsByDifficultyLevel: trialsByDifficultyLevel ?? this.trialsByDifficultyLevel,
    );
  }
}