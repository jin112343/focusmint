import 'package:focusmint/models/image_stimulus.dart';

class TrialLog {
  final int id;
  final String sessionId;
  final String targetId;
  final List<String> distractorIds;
  final int setSize;
  final bool correct;
  final int rawRtMs;
  final int processedRtMs;
  final int difficultyLevel;
  final DateTime timestamp;
  final ImageStimulus targetStimulus;
  final List<ImageStimulus> distractorStimuli;
  
  const TrialLog({
    required this.id,
    required this.sessionId,
    required this.targetId,
    required this.distractorIds,
    required this.setSize,
    required this.correct,
    required this.rawRtMs,
    required this.processedRtMs,
    required this.difficultyLevel,
    required this.timestamp,
    required this.targetStimulus,
    required this.distractorStimuli,
  });
  
  bool get isError => !correct;
  
  int get gridSize => setSize;
  
  double get rtSeconds => processedRtMs / 1000.0;
  
  @override
  String toString() => 
    'TrialLog(id: $id, correct: $correct, rtMs: $processedRtMs, setSize: $setSize)';
  
  TrialLog copyWith({
    int? id,
    String? sessionId,
    String? targetId,
    List<String>? distractorIds,
    int? setSize,
    bool? correct,
    int? rawRtMs,
    int? processedRtMs,
    int? difficultyLevel,
    DateTime? timestamp,
    ImageStimulus? targetStimulus,
    List<ImageStimulus>? distractorStimuli,
  }) {
    return TrialLog(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      targetId: targetId ?? this.targetId,
      distractorIds: distractorIds ?? this.distractorIds,
      setSize: setSize ?? this.setSize,
      correct: correct ?? this.correct,
      rawRtMs: rawRtMs ?? this.rawRtMs,
      processedRtMs: processedRtMs ?? this.processedRtMs,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      timestamp: timestamp ?? this.timestamp,
      targetStimulus: targetStimulus ?? this.targetStimulus,
      distractorStimuli: distractorStimuli ?? this.distractorStimuli,
    );
  }
}