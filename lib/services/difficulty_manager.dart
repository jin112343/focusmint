import 'package:flutter/material.dart';
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

class DifficultyManager {
  static final Logger _logger = Logger();
  
  DifficultyLevel _currentLevel;
  int _consecutiveCorrect;
  int _consecutiveIncorrect;
  bool _adjustmentEnabled;
  final List<bool> _recentPerformance;
  static const int _performanceWindowSize = 10;
  
  DifficultyManager({
    DifficultyLevel initialLevel = DifficultyLevel.easy,
    bool adjustmentEnabled = true,
  }) : _currentLevel = initialLevel,
       _consecutiveCorrect = 0,
       _consecutiveIncorrect = 0,
       _adjustmentEnabled = adjustmentEnabled,
       _recentPerformance = [];
  
  DifficultyLevel get currentLevel => _currentLevel;
  int get gridSize => _currentLevel.gridSize;
  int get stimulusTimeLimit => _currentLevel.stimulusTimeLimit;
  int get distractorCount => _currentLevel.distractorCount;
  String get levelLabel => _currentLevel.label;
  bool get isAdjustmentEnabled => _adjustmentEnabled;
  
  double get recentAccuracy {
    if (_recentPerformance.isEmpty) return 0.0;
    final correct = _recentPerformance.where((r) => r).length;
    return correct / _recentPerformance.length;
  }
  
  void setAdjustmentEnabled(bool enabled) {
    _adjustmentEnabled = enabled;
    _logger.i('Difficulty adjustment ${enabled ? 'enabled' : 'disabled'}');
  }
  
  void recordTrialResult(bool correct) {
    _updateRecentPerformance(correct);
    
    if (!_adjustmentEnabled) {
      _logger.d('Trial result recorded but adjustment disabled: $correct');
      return;
    }
    
    if (correct) {
      _consecutiveCorrect++;
      _consecutiveIncorrect = 0;
      _checkForIncrease();
    } else {
      _consecutiveIncorrect++;
      _consecutiveCorrect = 0;
      _checkForDecrease();
    }
    
    _logger.d('Trial result: $correct, consecutive correct: $_consecutiveCorrect, '
              'consecutive incorrect: $_consecutiveIncorrect, '
              'current level: ${_currentLevel.label}');
  }
  
  void _updateRecentPerformance(bool correct) {
    _recentPerformance.add(correct);
    if (_recentPerformance.length > _performanceWindowSize) {
      _recentPerformance.removeAt(0);
    }
  }
  
  void _checkForIncrease() {
    if (_consecutiveCorrect >= TrainingConstants.correctsToIncrement) {
      final nextLevel = _currentLevel.next;
      if (nextLevel != null) {
        _currentLevel = nextLevel;
        _consecutiveCorrect = 0;
        _logger.i('Difficulty increased to ${_currentLevel.label} '
                  '(grid: $gridSize, time: ${stimulusTimeLimit}ms)');
      } else {
        _logger.d('Already at maximum difficulty level');
      }
    }
  }
  
  void _checkForDecrease() {
    if (_consecutiveIncorrect >= TrainingConstants.errorsToDecrement) {
      final prevLevel = _currentLevel.previous;
      if (prevLevel != null) {
        _currentLevel = prevLevel;
        _consecutiveIncorrect = 0;
        _logger.i('Difficulty decreased to ${_currentLevel.label} '
                  '(grid: $gridSize, time: ${stimulusTimeLimit}ms)');
      } else {
        _logger.d('Already at minimum difficulty level');
      }
    }
  }
  
  void reset({DifficultyLevel? level}) {
    _currentLevel = level ?? DifficultyLevel.easy;
    _consecutiveCorrect = 0;
    _consecutiveIncorrect = 0;
    _recentPerformance.clear();
    _logger.i('Difficulty manager reset to ${_currentLevel.label}');
  }
  
  Map<String, dynamic> getState() {
    return {
      'currentLevel': _currentLevel.index,
      'consecutiveCorrect': _consecutiveCorrect,
      'consecutiveIncorrect': _consecutiveIncorrect,
      'adjustmentEnabled': _adjustmentEnabled,
      'recentAccuracy': recentAccuracy,
      'gridSize': gridSize,
      'stimulusTimeLimit': stimulusTimeLimit,
    };
  }
  
  void restoreState(Map<String, dynamic> state) {
    try {
      final levelIndex = state['currentLevel'] as int? ?? 0;
      _currentLevel = DifficultyLevel.values[levelIndex];
      _consecutiveCorrect = state['consecutiveCorrect'] as int? ?? 0;
      _consecutiveIncorrect = state['consecutiveIncorrect'] as int? ?? 0;
      _adjustmentEnabled = state['adjustmentEnabled'] as bool? ?? true;
      
      _logger.i('Difficulty manager state restored: ${_currentLevel.label}');
    } catch (e) {
      _logger.e('Failed to restore difficulty manager state: $e');
      reset();
    }
  }
  
  bool isPerformingWell() {
    return recentAccuracy > TrainingConstants.targetAccuracy;
  }
  
  bool isPerformingPoorly() {
    return recentAccuracy < (TrainingConstants.targetAccuracy - 0.15); // 60%未満
  }
  
  String getPerformanceFeedback(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final accuracy = recentAccuracy;
    
    if (_recentPerformance.length < 5) {
      return l10n.gettingStarted;
    }
    
    if (accuracy >= 0.90) {
      return l10n.excellentPerformance;
    } else if (accuracy >= 0.80) {
      return l10n.greatJob;
    } else if (accuracy >= 0.70) {
      return l10n.goodPerformance;
    } else if (accuracy >= 0.60) {
      return l10n.keepPracticingFeedback;
    } else {
      return l10n.takeYourTimeFeedback;
    }
  }
  
  @override
  String toString() {
    return 'DifficultyManager(level: ${_currentLevel.label}, '
           'grid: $gridSize, timeLimit: ${stimulusTimeLimit}ms, '
           'recentAccuracy: ${(recentAccuracy * 100).toStringAsFixed(1)}%)';
  }
}