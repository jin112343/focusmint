import 'package:flutter_test/flutter_test.dart';
import 'package:focusmint/services/score_calculator.dart';
import 'package:focusmint/models/trial_log.dart' as models;
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/constants/training_constants.dart';

void main() {
  group('ScoreCalculator', () {
    late List<models.TrialLog> sampleTrials;

    setUp(() {
      sampleTrials = [
        models.TrialLog(
          id: 1,
          sessionId: 'test_session',
          targetId: 'target1',
          distractorIds: ['dist1', 'dist2', 'dist3'],
          setSize: 4,
          correct: true,
          rawRtMs: 1200,
          processedRtMs: 1200,
          difficultyLevel: 0,
          timestamp: DateTime.now(),
          targetStimulus: const ImageStimulus(
            id: 'target1',
            assetPath: 'test.png',
            valence: Valence.positive,
            emotion: Emotion.happiness,
          ),
          distractorStimuli: [],
        ),
        models.TrialLog(
          id: 2,
          sessionId: 'test_session',
          targetId: 'target2',
          distractorIds: ['dist4', 'dist5', 'dist6'],
          setSize: 4,
          correct: false,
          rawRtMs: 800,
          processedRtMs: 1400, // 800 + 600 penalty
          difficultyLevel: 0,
          timestamp: DateTime.now(),
          targetStimulus: const ImageStimulus(
            id: 'target2',
            assetPath: 'test2.png',
            valence: Valence.positive,
            emotion: Emotion.happiness,
          ),
          distractorStimuli: [],
        ),
      ];
    });

    test('clampInt should constrain values within bounds', () {
      expect(ScoreCalculator.clampInt(50, 100, 200), equals(100));
      expect(ScoreCalculator.clampInt(150, 100, 200), equals(150));
      expect(ScoreCalculator.clampInt(250, 100, 200), equals(200));
    });

    test('processRt should handle correct trials', () {
      const rawRt = 1000;
      const correct = true;
      
      final result = ScoreCalculator.processRt(rawRtMs: rawRt, correct: correct);
      
      expect(result, equals(1000)); // No penalty for correct
    });

    test('processRt should add penalty for incorrect trials', () {
      const rawRt = 1000;
      const correct = false;
      
      final result = ScoreCalculator.processRt(rawRtMs: rawRt, correct: correct);
      
      expect(result, equals(1600)); // 1000 + 600 penalty
    });

    test('processRt should clamp extreme values', () {
      // Test minimum clamp
      var result = ScoreCalculator.processRt(rawRtMs: 100, correct: true);
      expect(result, equals(TrainingConstants.minValidRtMs));
      
      // Test maximum clamp
      result = ScoreCalculator.processRt(rawRtMs: 5000, correct: true);
      expect(result, equals(TrainingConstants.maxValidRtMs));
    });

    test('calculateAccuracy should return correct percentage', () {
      final accuracy = ScoreCalculator.calculateAccuracy(sampleTrials);
      expect(accuracy, equals(0.5)); // 1 correct out of 2 trials
    });

    test('calculateMedianRt should return middle value', () {
      final medianRt = ScoreCalculator.calculateMedianRt(sampleTrials);
      expect(medianRt, equals(1300)); // (1200 + 1400) / 2
    });

    test('calculateAverageRt should return mean value', () {
      final averageRt = ScoreCalculator.calculateAverageRt(sampleTrials);
      expect(averageRt, equals(1300.0)); // (1200 + 1400) / 2
    });

    test('calculateBis without reference values should return 0', () {
      final bis = ScoreCalculator.calculateBis(trials: sampleTrials);
      expect(bis, equals(0.0)); // No reference values provided
    });

    test('calculateBis with reference values should compute z-scores', () {
      final bis = ScoreCalculator.calculateBis(
        trials: sampleTrials,
        referenceMeanAccuracy: 0.7,
        referenceStdAccuracy: 0.1,
        referenceMeanRt: 1500.0,
        referenceStdRt: 200.0,
      );
      
      // BIS = z(accuracy) - z(RT)
      // z(accuracy) = (0.5 - 0.7) / 0.1 = -2.0
      // z(RT) = (1300 - 1500) / 200 = -1.0
      // BIS = -2.0 - (-1.0) = -1.0
      expect(bis, equals(-1.0));
    });

    test('calculateIes should compute inverse efficiency score', () {
      final ies = ScoreCalculator.calculateIes(sampleTrials);
      // IES = Average RT / Accuracy = 1300 / 0.5 = 2600
      expect(ies, equals(2600.0));
    });

    test('calculateDisplayScore should convert BIS to 0-100 range', () {
      expect(ScoreCalculator.calculateDisplayScore(0.0), equals(50));
      expect(ScoreCalculator.calculateDisplayScore(1.0), equals(60));
      expect(ScoreCalculator.calculateDisplayScore(-1.0), equals(40));
      expect(ScoreCalculator.calculateDisplayScore(5.0), equals(100)); // Clamped
      expect(ScoreCalculator.calculateDisplayScore(-5.0), equals(0)); // Clamped
    });

    test('calculateMaxConsecutiveCorrect should find longest streak', () {
      final trialsWithStreak = [
        models.TrialLog(
          id: 1, sessionId: 'test', targetId: 'target', distractorIds: [],
          setSize: 4, correct: true, rawRtMs: 1000, processedRtMs: 1000,
          difficultyLevel: 0, timestamp: DateTime.now(),
          targetStimulus: const ImageStimulus(
            id: 'target', assetPath: 'test.png',
            valence: Valence.positive, emotion: Emotion.happiness,
          ),
          distractorStimuli: [],
        ),
        models.TrialLog(
          id: 2, sessionId: 'test', targetId: 'target', distractorIds: [],
          setSize: 4, correct: true, rawRtMs: 1000, processedRtMs: 1000,
          difficultyLevel: 0, timestamp: DateTime.now(),
          targetStimulus: const ImageStimulus(
            id: 'target', assetPath: 'test.png',
            valence: Valence.positive, emotion: Emotion.happiness,
          ),
          distractorStimuli: [],
        ),
        models.TrialLog(
          id: 3, sessionId: 'test', targetId: 'target', distractorIds: [],
          setSize: 4, correct: false, rawRtMs: 1000, processedRtMs: 1000,
          difficultyLevel: 0, timestamp: DateTime.now(),
          targetStimulus: const ImageStimulus(
            id: 'target', assetPath: 'test.png',
            valence: Valence.positive, emotion: Emotion.happiness,
          ),
          distractorStimuli: [],
        ),
        models.TrialLog(
          id: 4, sessionId: 'test', targetId: 'target', distractorIds: [],
          setSize: 4, correct: true, rawRtMs: 1000, processedRtMs: 1000,
          difficultyLevel: 0, timestamp: DateTime.now(),
          targetStimulus: const ImageStimulus(
            id: 'target', assetPath: 'test.png',
            valence: Valence.positive, emotion: Emotion.happiness,
          ),
          distractorStimuli: [],
        ),
      ];

      final maxStreak = ScoreCalculator.calculateMaxConsecutiveCorrect(trialsWithStreak);
      expect(maxStreak, equals(2)); // First two trials are correct
    });

    test('calculateSessionSummary should create complete summary', () {
      final startTime = DateTime.now().subtract(const Duration(minutes: 5));
      final endTime = DateTime.now();

      final summary = ScoreCalculator.calculateSessionSummary(
        sessionId: 'test_session',
        trials: sampleTrials,
        startTime: startTime,
        endTime: endTime,
      );

      expect(summary.sessionId, equals('test_session'));
      expect(summary.totalTrials, equals(2));
      expect(summary.correctTrials, equals(1));
      expect(summary.accuracy, equals(0.5));
      expect(summary.medianRtMs, equals(1300));
    });

    test('isValidSession should validate session quality', () {
      final validSummary = ScoreCalculator.calculateSessionSummary(
        sessionId: 'valid_session',
        trials: List.generate(100, (index) => models.TrialLog(
          id: index,
          sessionId: 'valid_session',
          targetId: 'target$index',
          distractorIds: [],
          setSize: 4,
          correct: true,
          rawRtMs: 1000,
          processedRtMs: 1000,
          difficultyLevel: 0,
          timestamp: DateTime.now(),
          targetStimulus: const ImageStimulus(
            id: 'target',
            assetPath: 'test.png',
            valence: Valence.positive,
            emotion: Emotion.happiness,
          ),
          distractorStimuli: [],
        )),
        startTime: DateTime.now().subtract(const Duration(minutes: 5)),
        endTime: DateTime.now(),
      );

      expect(ScoreCalculator.isValidSession(validSummary), isTrue);

      final invalidSummary = ScoreCalculator.calculateSessionSummary(
        sessionId: 'invalid_session',
        trials: [sampleTrials.first], // Only 1 trial
        startTime: DateTime.now().subtract(const Duration(minutes: 5)),
        endTime: DateTime.now(),
      );

      expect(ScoreCalculator.isValidSession(invalidSummary), isFalse);
    });
  });
}