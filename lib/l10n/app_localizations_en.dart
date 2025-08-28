// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Current Points';

  @override
  String goalLabel(int goal) {
    return 'Goal: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Remaining: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Goal Achieved!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'Reduce stress and improve your mood.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Time left: ${minutes}m ${seconds}s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Time left: ${seconds}s';
  }

  @override
  String scoreLabel(String score) {
    return 'Score: $score Points';
  }

  @override
  String get imagePreparationMessage => 'Preparing images...';

  @override
  String get noStimuliAvailable => 'No stimuli available';

  @override
  String get invalidGridSize => 'Invalid grid size';

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

  @override
  String get happy => 'Happy';

  @override
  String get angry => 'Angry';

  @override
  String get fear => 'Fear';

  @override
  String get sad => 'Sad';

  @override
  String get historyPageTitle => 'Training History';

  @override
  String get dataLoading => 'Loading data...';

  @override
  String get pointsHistory => 'Points History';

  @override
  String get weekly => 'Weekly';

  @override
  String get monthly => 'Monthly';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get goalAchievementRate => 'Goal Achievement Rate';

  @override
  String get scoreStatistics => 'Score Statistics';

  @override
  String get bestScore => 'Best Score';

  @override
  String get totalScore => 'Total Score';

  @override
  String get trainingTime => 'Training Time';

  @override
  String get totalTrainingTime => 'Total Training Time';

  @override
  String get detailedStatistics => 'Detailed Statistics';

  @override
  String get averageScorePerMinute => 'Average score per minute';

  @override
  String get pointsToGoal => 'Points to goal';

  @override
  String get goalSetting => 'Goal setting';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'm';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'points';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Sun';

  @override
  String get mondayShort => 'Mon';

  @override
  String get tuesdayShort => 'Tue';

  @override
  String get wednesdayShort => 'Wed';

  @override
  String get thursdayShort => 'Thu';

  @override
  String get fridayShort => 'Fri';

  @override
  String get saturdayShort => 'Sat';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get goalPointsSetting => 'Goal Points Setting';

  @override
  String currentGoalPoints(int points) {
    return 'Current goal: $points points';
  }

  @override
  String get newGoalPointsLabel => 'New goal points';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'points';

  @override
  String get saveGoalButton => 'Save Goal';

  @override
  String goalSetTo(int points) {
    return 'Goal set to $points points';
  }

  @override
  String get enterGoalPoints => 'Please enter goal points';

  @override
  String get enterValidNumber => 'Please enter a valid number (1 to 99999999)';

  @override
  String get saveFailed => 'Failed to save';

  @override
  String get emailOpenFailed => 'Could not open email app';

  @override
  String get pageOpenFailed => 'Could not open page';

  @override
  String get appInfoSupport => 'App Info & Support';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get contactUsSubtitle => 'Share your feedback and questions';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get termsSubtitle => 'Review the app\'s terms of service';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacySubtitle => 'About privacy information handling';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Learn how to use the app';

  @override
  String get dataManagement => 'Data Management';

  @override
  String get deleteData => 'Delete Data';

  @override
  String get deleteDataSubtitle => 'Delete all records (except goal points)';

  @override
  String get deleteDataConfirmTitle => 'Delete Data';

  @override
  String get deleteDataConfirmMessage =>
      'Are you sure you want to delete all data?\n\n*Goal points will be preserved';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get dataDeleted => 'Data deleted';

  @override
  String get dataDeleteFailed => 'Failed to delete data';

  @override
  String get tutorialDisplayFailed => 'Failed to display tutorial';

  @override
  String get tips => 'Tips';

  @override
  String get tipsContent =>
      '• Goal points are reflected in the pie chart on the home screen\n• Start with small goals and gradually increase them when achieved\n• You can earn up to 6 points in a single session';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get tutorialSkip => 'Skip';

  @override
  String get tutorialGoalAndPoints => 'Goal and Current Points';

  @override
  String get tutorialGoalDescription =>
      'The outer circle shows your goal, the inner circle shows total points. The circle fills as you approach your goal.';

  @override
  String get tutorialOneMinuteTraining => '1-Minute Training';

  @override
  String get tutorialTrainingDescription =>
      'Start a 1-minute game. Choose positive images or good habits from 4 options.';

  @override
  String get tutorialScoreProgress => 'Score Progress';

  @override
  String get tutorialScoreDescription =>
      'View detailed information about your earned scores.';

  @override
  String get tutorialSettingsAndData => 'Settings and Data Management';

  @override
  String get tutorialSettingsDescription =>
      'Change goal values, view app information, and reset data.';

  @override
  String get appIntroAttentionBiasTitle => 'About Attention Bias';

  @override
  String get appIntroAttentionBiasContent =>
      'When anxiety is high, we unconsciously tend to focus only on negative things.';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMint\'s Role';

  @override
  String get appIntroFocusMintRoleContent =>
      'By practicing selecting positive images, you\'ll naturally learn to focus your attention on the good side.';

  @override
  String get appIntroScientificEvidenceTitle => 'Scientific Evidence';

  @override
  String get appIntroScientificEvidenceContent =>
      'Research has confirmed that 25 minutes of training significantly reduces anxiety and stress.\n\n(e.g., Amir et al., 2009 Journal of Abnormal Psychology / Hakamata et al., 2010 Psychological Bulletin)';

  @override
  String get appIntroExpectedEffectsTitle => 'Expected Effects';

  @override
  String get appIntroEffect1 => 'Reduction of anxiety and tension';

  @override
  String get appIntroEffect2 => 'Better awareness of smiles around you';

  @override
  String get appIntroEffect3 => 'Easier social interactions';

  @override
  String get appIntroHowToUse => 'See How to Use';

  @override
  String get pointsEarned => 'Points Earned!';

  @override
  String get yourScore => 'Your Score';

  @override
  String get totalPlayTime => 'Total Play Time';
}
