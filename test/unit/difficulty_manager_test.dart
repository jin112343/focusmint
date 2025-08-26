import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:focusmint/services/difficulty_manager.dart';
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/l10n/app_localizations.dart';

void main() {
  group('DifficultyManager', () {
    late DifficultyManager manager;

    setUp(() {
      manager = DifficultyManager();
    });

    test('should start at easy difficulty by default', () {
      expect(manager.currentLevel, equals(DifficultyLevel.easy));
      expect(manager.gridSize, equals(TrainingConstants.minGridSize));
      expect(manager.stimulusTimeLimit, equals(TrainingConstants.stimulusTimeLimitsMs[0]));
    });

    test('should allow custom initial level', () {
      final customManager = DifficultyManager(initialLevel: DifficultyLevel.hard);
      expect(customManager.currentLevel, equals(DifficultyLevel.hard));
    });

    test('should increase difficulty after consecutive correct trials', () {
      // Record correct trials to trigger increase
      manager.recordTrialResult(true); // 1 correct
      
      expect(manager.currentLevel, equals(DifficultyLevel.medium));
      expect(manager.gridSize, equals(TrainingConstants.mediumGridSize));
    });

    test('should decrease difficulty after consecutive incorrect trials', () {
      // First go to medium level
      manager.recordTrialResult(true);
      expect(manager.currentLevel, equals(DifficultyLevel.medium));
      
      // Now record incorrect trials to trigger decrease
      manager.recordTrialResult(false); // 1 incorrect
      manager.recordTrialResult(false); // 2 incorrect - should decrease
      
      expect(manager.currentLevel, equals(DifficultyLevel.easy));
    });

    test('should not increase beyond hard difficulty', () {
      // Go to hard level
      manager.recordTrialResult(true); // easy -> medium
      manager.recordTrialResult(true); // medium -> hard
      
      expect(manager.currentLevel, equals(DifficultyLevel.hard));
      
      // Try to increase again
      manager.recordTrialResult(true);
      
      expect(manager.currentLevel, equals(DifficultyLevel.hard)); // Should stay at hard
    });

    test('should not decrease below easy difficulty', () {
      expect(manager.currentLevel, equals(DifficultyLevel.easy));
      
      // Try to decrease from easy
      manager.recordTrialResult(false);
      manager.recordTrialResult(false);
      
      expect(manager.currentLevel, equals(DifficultyLevel.easy)); // Should stay at easy
    });

    test('should reset consecutive counters when switching between correct/incorrect', () {
      // Record some correct trials
      manager.recordTrialResult(true); // Should move to medium
      expect(manager.currentLevel, equals(DifficultyLevel.medium));
      
      // Record one incorrect (should reset correct counter but not trigger decrease yet)
      manager.recordTrialResult(false);
      expect(manager.currentLevel, equals(DifficultyLevel.medium)); // Still medium
      
      // Record correct again (should not trigger increase since counter was reset)
      manager.recordTrialResult(true);
      expect(manager.currentLevel, equals(DifficultyLevel.hard)); // Should move to hard now
    });

    test('should track recent performance accuracy', () {
      expect(manager.recentAccuracy, equals(0.0)); // No trials yet
      
      // Add some trials
      for (int i = 0; i < 5; i++) {
        manager.recordTrialResult(true);
      }
      for (int i = 0; i < 5; i++) {
        manager.recordTrialResult(false);
      }
      
      expect(manager.recentAccuracy, equals(0.5)); // 50% accuracy
    });

    test('should limit recent performance window', () {
      // Add more than window size trials
      for (int i = 0; i < 15; i++) {
        manager.recordTrialResult(true);
      }
      
      // Should only consider last 10 trials (window size)
      expect(manager.recentAccuracy, equals(1.0));
    });

    testWidgets('should provide appropriate performance feedback', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ja'),
          ],
          home: Builder(
            builder: (context) {
              expect(manager.getPerformanceFeedback(context), equals('Getting started...'));
              
              // Add some high accuracy trials
              for (int i = 0; i < 10; i++) {
                manager.recordTrialResult(true);
              }
              expect(manager.getPerformanceFeedback(context), equals('Excellent performance!'));
              
              // Reset and add medium accuracy
              manager.reset();
              for (int i = 0; i < 7; i++) {
                manager.recordTrialResult(true);
              }
              for (int i = 0; i < 3; i++) {
                manager.recordTrialResult(false);
              }
              expect(manager.getPerformanceFeedback(context), equals('Good performance'));
              
              return const SizedBox();
            },
          ),
        ),
      );
    });

    test('should correctly identify performing well/poorly', () {
      // Test performing well (above target)
      for (int i = 0; i < 8; i++) {
        manager.recordTrialResult(true);
      }
      for (int i = 0; i < 2; i++) {
        manager.recordTrialResult(false);
      }
      expect(manager.isPerformingWell(), isTrue);
      expect(manager.isPerformingPoorly(), isFalse);
      
      // Test performing poorly (well below target)
      manager.reset();
      for (int i = 0; i < 4; i++) {
        manager.recordTrialResult(true);
      }
      for (int i = 0; i < 6; i++) {
        manager.recordTrialResult(false);
      }
      expect(manager.isPerformingWell(), isFalse);
      expect(manager.isPerformingPoorly(), isTrue);
    });

    test('should allow disabling adjustment', () {
      manager.setAdjustmentEnabled(false);
      expect(manager.isAdjustmentEnabled, isFalse);
      
      // Try to increase difficulty - should not work
      manager.recordTrialResult(true);
      expect(manager.currentLevel, equals(DifficultyLevel.easy));
    });

    test('should save and restore state correctly', () {
      // Modify state
      manager.recordTrialResult(true); // Move to medium
      manager.recordTrialResult(true); // Move to hard
      manager.setAdjustmentEnabled(false);
      
      // Save state
      final state = manager.getState();
      
      // Create new manager and restore state
      final newManager = DifficultyManager();
      newManager.restoreState(state);
      
      expect(newManager.currentLevel, equals(DifficultyLevel.hard));
      expect(newManager.isAdjustmentEnabled, isFalse);
    });

    test('should handle invalid state gracefully', () {
      // Try to restore invalid state
      manager.restoreState({'invalid': 'state'});
      
      // Should reset to default
      expect(manager.currentLevel, equals(DifficultyLevel.easy));
      expect(manager.isAdjustmentEnabled, isTrue);
    });

    test('should reset to specified level', () {
      // Move to hard
      manager.recordTrialResult(true);
      manager.recordTrialResult(true);
      expect(manager.currentLevel, equals(DifficultyLevel.hard));
      
      // Reset to medium
      manager.reset(level: DifficultyLevel.medium);
      expect(manager.currentLevel, equals(DifficultyLevel.medium));
    });

    test('toString should provide meaningful description', () {
      final description = manager.toString();
      expect(description, contains('DifficultyManager'));
      expect(description, contains('Easy'));
      expect(description, contains('grid'));
      expect(description, contains('timeLimit'));
    });
  });

  group('DifficultyLevel enum', () {
    test('should have correct labels', () {
      expect(DifficultyLevel.easy.label, equals('Easy'));
      expect(DifficultyLevel.medium.label, equals('Medium'));
      expect(DifficultyLevel.hard.label, equals('Hard'));
    });

    test('should have correct grid sizes', () {
      expect(DifficultyLevel.easy.gridSize, equals(TrainingConstants.minGridSize));
      expect(DifficultyLevel.medium.gridSize, equals(TrainingConstants.mediumGridSize));
      expect(DifficultyLevel.hard.gridSize, equals(TrainingConstants.maxGridSize));
    });

    test('should have correct stimulus time limits', () {
      expect(DifficultyLevel.easy.stimulusTimeLimit, equals(TrainingConstants.stimulusTimeLimitsMs[0]));
      expect(DifficultyLevel.medium.stimulusTimeLimit, equals(TrainingConstants.stimulusTimeLimitsMs[1]));
      expect(DifficultyLevel.hard.stimulusTimeLimit, equals(TrainingConstants.stimulusTimeLimitsMs[2]));
    });

    test('should calculate correct distractor counts', () {
      expect(DifficultyLevel.easy.distractorCount, equals(3)); // 4 - 1
      expect(DifficultyLevel.medium.distractorCount, equals(8)); // 9 - 1
      expect(DifficultyLevel.hard.distractorCount, equals(15)); // 16 - 1
    });

    test('should navigate between levels correctly', () {
      expect(DifficultyLevel.easy.next, equals(DifficultyLevel.medium));
      expect(DifficultyLevel.medium.next, equals(DifficultyLevel.hard));
      expect(DifficultyLevel.hard.next, isNull);

      expect(DifficultyLevel.easy.previous, isNull);
      expect(DifficultyLevel.medium.previous, equals(DifficultyLevel.easy));
      expect(DifficultyLevel.hard.previous, equals(DifficultyLevel.medium));
    });
  });
}