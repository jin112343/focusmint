// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FocusMint';

  @override
  String get abmTraining => 'ABM Training';

  @override
  String get welcomeMessage =>
      'Welcome to Attention Bias Modification (ABM) positive search training!\nTrain your attention towards positive stimuli with a focused 5-minute session.';

  @override
  String get startTraining => 'Start Training';

  @override
  String get startTrainingDescription => 'Begin a 5-minute training session';

  @override
  String get startButton => 'Start';

  @override
  String get aboutTraining => 'About Training';

  @override
  String get sessionTime => 'Session Time';

  @override
  String get sessionDuration => '5 minutes';

  @override
  String get trialCount => 'Trials';

  @override
  String get trialRange => '120-160 trials';

  @override
  String get difficultyAdjustment => 'Difficulty Adjustment';

  @override
  String get difficultyMethod => 'Adaptive (1-up/2-down)';

  @override
  String get scoreEvaluation => 'Score Evaluation';

  @override
  String get bisScore => 'BIS (Balanced Integration Score)';

  @override
  String get noRecentSessions => 'No recent sessions';

  @override
  String get startFirstSession => 'Start your first training session!';

  @override
  String get recentSessions => 'Recent Sessions';

  @override
  String moreSessionsCount(int count) {
    return '$count more sessions';
  }

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String daysAgo(int days) {
    return '$days days ago';
  }

  @override
  String get trialUnit => 'trials';

  @override
  String get dataLoadError => 'Failed to load data';

  @override
  String get training => 'Training';

  @override
  String trialCountLabel(int count) {
    return 'Trial: $count';
  }

  @override
  String difficultyLabel(String level) {
    return 'Difficulty: $level';
  }

  @override
  String recentAccuracyLabel(String accuracy) {
    return 'Recent Accuracy: $accuracy%';
  }

  @override
  String get preparingSession => 'Preparing session...';

  @override
  String get trainingStart => 'Training Start';

  @override
  String get findSmileyInstruction => 'Find and tap the happy face quickly';

  @override
  String get sessionComplete => 'Session Complete!';

  @override
  String get showingResults => 'Showing results...';

  @override
  String get sessionAborted => 'Session was interrupted';

  @override
  String get canStartNewSession => 'You can start a new session anytime';

  @override
  String get returnHome => 'Return Home';

  @override
  String get trainingInterruption => 'Training Interruption';

  @override
  String get interruptionMessage =>
      'Do you want to interrupt the training?\nProgress will not be saved.';

  @override
  String get continueButton => 'Continue';

  @override
  String get interruptButton => 'Interrupt';

  @override
  String get sessionResults => 'Session Results';

  @override
  String get sessionScore => 'Session Score';

  @override
  String bisScoreLabel(String score) {
    return 'BIS Score: $score';
  }

  @override
  String get performanceStats => 'Performance Statistics';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get trials => 'Trials';

  @override
  String get reactionTime => 'Reaction Time';

  @override
  String get consecutiveCorrect => 'Consecutive Correct';

  @override
  String get sessionDetails => 'Session Details';

  @override
  String get startTime => 'Start Time';

  @override
  String get endTime => 'End Time';

  @override
  String get sessionDurationLabel => 'Session Duration';

  @override
  String get minutesUnit => 'min';

  @override
  String get avgReactionTime => 'Average Reaction Time';

  @override
  String get iesScore => 'IES Score';

  @override
  String get difficultyBreakdown => 'Trials by Difficulty';

  @override
  String get easy => 'Easy';

  @override
  String get medium => 'Medium';

  @override
  String get hard => 'Hard';

  @override
  String get trialsSuffix => 'trials';

  @override
  String get startNewSession => 'Start New Session';

  @override
  String get goHome => 'Go Home';

  @override
  String get excellentResult => 'Excellent result!';

  @override
  String get goodJob => 'Well done!';

  @override
  String get keepPracticing => 'Keep practicing';

  @override
  String get takeYourTime => 'Take your time';

  @override
  String get noStimuliAvailable => 'No stimuli available';

  @override
  String get invalidGridSize => 'Invalid grid size';

  @override
  String get happy => 'Happy';

  @override
  String get angry => 'Angry';

  @override
  String get fear => 'Fear';

  @override
  String get sad => 'Sad';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Getting started...';

  @override
  String get excellentPerformance => 'Excellent performance!';

  @override
  String get greatJob => 'Great job!';

  @override
  String get goodPerformance => 'Good performance';

  @override
  String get keepPracticingFeedback => 'Keep practicing';

  @override
  String get takeYourTimeFeedback => 'Take your time';
}
