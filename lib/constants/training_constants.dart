class TrainingConstants {
  static const int sessionDurationSeconds = 5 * 60; // 5 minutes
  
  // Trial timing (milliseconds)
  static const int fixationPointMinMs = 400;
  static const int fixationPointMaxMs = 600;
  static const int stimulusPresentationMaxMs = 2000;
  static const int interTrialIntervalMinMs = 300;
  static const int interTrialIntervalMaxMs = 500;
  
  // RT processing (IAT-compliant)
  static const int minValidRtMs = 300;
  static const int maxValidRtMs = 3000;
  static const int errorPenaltyMs = 600;
  static const int maxPenalizedRtMs = 3600; // maxValidRtMs + errorPenaltyMs
  
  // Expected trial counts
  static const int minTrialsPerSession = 120;
  static const int maxTrialsPerSession = 160;
  static const double averageTrialDurationMs = 1850; // Conservative estimate
  
  // Difficulty levels
  static const int minGridSize = 4; // 2x2
  static const int mediumGridSize = 9; // 3x3
  static const int maxGridSize = 16; // 4x4
  
  static const List<int> gridSizes = [
    minGridSize,
    mediumGridSize,
    maxGridSize,
  ];
  
  // Stimulus presentation times by difficulty
  static const List<int> stimulusTimeLimitsMs = [
    2000, // Easy (2x2)
    1500, // Medium (3x3)
    1200, // Hard (4x4)
  ];
  
  // 1-up/2-down staircase parameters
  static const int correctsToIncrement = 1;
  static const int errorsToDecrement = 2;
  static const double targetAccuracy = 0.75; // 75% (between 70-80%)
  
  // Scoring parameters
  static const int baseDisplayScore = 50;
  static const int scoreScalingFactor = 10;
  static const int minDisplayScore = 0;
  static const int maxDisplayScore = 100;
  
  // Session validation
  static const int minTrialsForValidSession = 50;
  static const double minAccuracyForValidSession = 0.3; // 30%
  
  // Data retention
  static const int maxSessionsToRetain = 100;
  static const int sessionHistoryForZScore = 10; // Last N sessions for z-score calculation
  
  // Image configuration
  static const int targetCount = 1; // Always 1 positive target
  static const int minDistractors = 3; // 2x2 - 1 = 3
  static const int mediumDistractors = 8; // 3x3 - 1 = 8  
  static const int maxDistractors = 15; // 4x4 - 1 = 15
}

enum DifficultyLevel {
  easy,
  medium,
  hard;
  
  String get label {
    switch (this) {
      case DifficultyLevel.easy:
        return 'Easy';
      case DifficultyLevel.medium:
        return 'Medium';
      case DifficultyLevel.hard:
        return 'Hard';
    }
  }
  
  int get gridSize {
    switch (this) {
      case DifficultyLevel.easy:
        return TrainingConstants.minGridSize;
      case DifficultyLevel.medium:
        return TrainingConstants.mediumGridSize;
      case DifficultyLevel.hard:
        return TrainingConstants.maxGridSize;
    }
  }
  
  int get stimulusTimeLimit => TrainingConstants.stimulusTimeLimitsMs[index];
  int get distractorCount => gridSize - TrainingConstants.targetCount;
  
  DifficultyLevel? get next {
    if (index < DifficultyLevel.values.length - 1) {
      return DifficultyLevel.values[index + 1];
    }
    return null;
  }
  
  DifficultyLevel? get previous {
    if (index > 0) {
      return DifficultyLevel.values[index - 1];
    }
    return null;
  }
}

class PlaceholderImages {
  static const String facesPath = 'assets/images/faces/';
  static const String placeholdersPath = 'assets/images/placeholders/';
  
  // Placeholder image filenames (will be replaced with actual images)
  static const List<String> positiveImages = [
    'happy_001.png',
    'happy_002.png',
    'happy_003.png',
    'happy_004.png',
    'happy_005.png',
  ];
  
  static const List<String> negativeImages = [
    'angry_001.png',
    'angry_002.png',
    'fear_001.png',
    'fear_002.png',
    'sad_001.png',
    'sad_002.png',
  ];
  
}

class TrainingLayouts {
  // Grid layouts
  static const Map<int, Map<String, dynamic>> gridLayouts = {
    4: { // 2x2
      'rows': 2,
      'columns': 2,
      'aspectRatio': 1.0,
    },
    9: { // 3x3
      'rows': 3,
      'columns': 3,
      'aspectRatio': 1.0,
    },
    16: { // 4x4
      'rows': 4,
      'columns': 4,
      'aspectRatio': 1.0,
    },
  };
}