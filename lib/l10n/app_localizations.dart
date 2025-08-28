import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
  ];

  /// No description provided for @focusMintTitle.
  ///
  /// In en, this message translates to:
  /// **'FOCUS MINT'**
  String get focusMintTitle;

  /// No description provided for @currentPoints.
  ///
  /// In en, this message translates to:
  /// **'Current Points'**
  String get currentPoints;

  /// No description provided for @goalLabel.
  ///
  /// In en, this message translates to:
  /// **'Goal: {goal}'**
  String goalLabel(int goal);

  /// No description provided for @remainingLabel.
  ///
  /// In en, this message translates to:
  /// **'Remaining: {remaining}'**
  String remainingLabel(int remaining);

  /// No description provided for @goalAchieved.
  ///
  /// In en, this message translates to:
  /// **'🎉 Goal Achieved!'**
  String get goalAchieved;

  /// No description provided for @startButtonText.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get startButtonText;

  /// No description provided for @stressReductionMessage.
  ///
  /// In en, this message translates to:
  /// **'Reduce stress and improve your mood.'**
  String get stressReductionMessage;

  /// No description provided for @remainingTimeMinutes.
  ///
  /// In en, this message translates to:
  /// **'Time left: {minutes}m {seconds}s'**
  String remainingTimeMinutes(int minutes, int seconds);

  /// No description provided for @remainingTimeSeconds.
  ///
  /// In en, this message translates to:
  /// **'Time left: {seconds}s'**
  String remainingTimeSeconds(int seconds);

  /// No description provided for @scoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Score: {score} Points'**
  String scoreLabel(String score);

  /// No description provided for @imagePreparationMessage.
  ///
  /// In en, this message translates to:
  /// **'Preparing images...'**
  String get imagePreparationMessage;

  /// No description provided for @noStimuliAvailable.
  ///
  /// In en, this message translates to:
  /// **'No stimuli available'**
  String get noStimuliAvailable;

  /// No description provided for @invalidGridSize.
  ///
  /// In en, this message translates to:
  /// **'Invalid grid size'**
  String get invalidGridSize;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'?'**
  String get unknown;

  /// No description provided for @gettingStarted.
  ///
  /// In en, this message translates to:
  /// **'Getting started...'**
  String get gettingStarted;

  /// No description provided for @excellentPerformance.
  ///
  /// In en, this message translates to:
  /// **'Excellent performance!'**
  String get excellentPerformance;

  /// No description provided for @greatJob.
  ///
  /// In en, this message translates to:
  /// **'Great job!'**
  String get greatJob;

  /// No description provided for @goodPerformance.
  ///
  /// In en, this message translates to:
  /// **'Good performance'**
  String get goodPerformance;

  /// No description provided for @keepPracticingFeedback.
  ///
  /// In en, this message translates to:
  /// **'Keep practicing'**
  String get keepPracticingFeedback;

  /// No description provided for @takeYourTimeFeedback.
  ///
  /// In en, this message translates to:
  /// **'Take your time'**
  String get takeYourTimeFeedback;

  /// No description provided for @happy.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get happy;

  /// No description provided for @angry.
  ///
  /// In en, this message translates to:
  /// **'Angry'**
  String get angry;

  /// No description provided for @fear.
  ///
  /// In en, this message translates to:
  /// **'Fear'**
  String get fear;

  /// No description provided for @sad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get sad;

  /// No description provided for @historyPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Training History'**
  String get historyPageTitle;

  /// No description provided for @dataLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading data...'**
  String get dataLoading;

  /// No description provided for @pointsHistory.
  ///
  /// In en, this message translates to:
  /// **'Points History'**
  String get pointsHistory;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataAvailable;

  /// No description provided for @goalAchievementRate.
  ///
  /// In en, this message translates to:
  /// **'Goal Achievement Rate'**
  String get goalAchievementRate;

  /// No description provided for @scoreStatistics.
  ///
  /// In en, this message translates to:
  /// **'Score Statistics'**
  String get scoreStatistics;

  /// No description provided for @bestScore.
  ///
  /// In en, this message translates to:
  /// **'Best Score'**
  String get bestScore;

  /// No description provided for @totalScore.
  ///
  /// In en, this message translates to:
  /// **'Total Score'**
  String get totalScore;

  /// No description provided for @trainingTime.
  ///
  /// In en, this message translates to:
  /// **'Training Time'**
  String get trainingTime;

  /// No description provided for @totalTrainingTime.
  ///
  /// In en, this message translates to:
  /// **'Total Training Time'**
  String get totalTrainingTime;

  /// No description provided for @detailedStatistics.
  ///
  /// In en, this message translates to:
  /// **'Detailed Statistics'**
  String get detailedStatistics;

  /// No description provided for @averageScorePerMinute.
  ///
  /// In en, this message translates to:
  /// **'Average score per minute'**
  String get averageScorePerMinute;

  /// No description provided for @pointsToGoal.
  ///
  /// In en, this message translates to:
  /// **'Points to goal'**
  String get pointsToGoal;

  /// No description provided for @goalSetting.
  ///
  /// In en, this message translates to:
  /// **'Goal setting'**
  String get goalSetting;

  /// No description provided for @secondsUnit.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get secondsUnit;

  /// No description provided for @minutesUnit.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get minutesUnit;

  /// No description provided for @hoursUnit.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get hoursUnit;

  /// No description provided for @pointsUnit.
  ///
  /// In en, this message translates to:
  /// **'points'**
  String get pointsUnit;

  /// No description provided for @monthSuffix.
  ///
  /// In en, this message translates to:
  /// **''**
  String get monthSuffix;

  /// No description provided for @sundayShort.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sundayShort;

  /// No description provided for @mondayShort.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mondayShort;

  /// No description provided for @tuesdayShort.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesdayShort;

  /// No description provided for @wednesdayShort.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesdayShort;

  /// No description provided for @thursdayShort.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursdayShort;

  /// No description provided for @fridayShort.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fridayShort;

  /// No description provided for @saturdayShort.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturdayShort;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @goalPointsSetting.
  ///
  /// In en, this message translates to:
  /// **'Goal Points Setting'**
  String get goalPointsSetting;

  /// No description provided for @currentGoalPoints.
  ///
  /// In en, this message translates to:
  /// **'Current goal: {points} points'**
  String currentGoalPoints(int points);

  /// No description provided for @newGoalPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'New goal points'**
  String get newGoalPointsLabel;

  /// No description provided for @goalPointsHint.
  ///
  /// In en, this message translates to:
  /// **'1000'**
  String get goalPointsHint;

  /// No description provided for @pointsUnit2.
  ///
  /// In en, this message translates to:
  /// **'points'**
  String get pointsUnit2;

  /// No description provided for @saveGoalButton.
  ///
  /// In en, this message translates to:
  /// **'Save Goal'**
  String get saveGoalButton;

  /// No description provided for @goalSetTo.
  ///
  /// In en, this message translates to:
  /// **'Goal set to {points} points'**
  String goalSetTo(int points);

  /// No description provided for @enterGoalPoints.
  ///
  /// In en, this message translates to:
  /// **'Please enter goal points'**
  String get enterGoalPoints;

  /// No description provided for @enterValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number (1 to 99999999)'**
  String get enterValidNumber;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save'**
  String get saveFailed;

  /// No description provided for @emailOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open email app'**
  String get emailOpenFailed;

  /// No description provided for @pageOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open page'**
  String get pageOpenFailed;

  /// No description provided for @appInfoSupport.
  ///
  /// In en, this message translates to:
  /// **'App Info & Support'**
  String get appInfoSupport;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contactUsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Share your feedback and questions'**
  String get contactUsSubtitle;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @termsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Review the app\'s terms of service'**
  String get termsSubtitle;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'About privacy information handling'**
  String get privacySubtitle;

  /// No description provided for @tutorialTitle.
  ///
  /// In en, this message translates to:
  /// **'Tutorial'**
  String get tutorialTitle;

  /// No description provided for @tutorialSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn how to use the app'**
  String get tutorialSubtitle;

  /// No description provided for @dataManagement.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get dataManagement;

  /// No description provided for @deleteData.
  ///
  /// In en, this message translates to:
  /// **'Delete Data'**
  String get deleteData;

  /// No description provided for @deleteDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all records (except goal points)'**
  String get deleteDataSubtitle;

  /// No description provided for @deleteDataConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Data'**
  String get deleteDataConfirmTitle;

  /// No description provided for @deleteDataConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all data?\n\n*Goal points will be preserved'**
  String get deleteDataConfirmMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @dataDeleted.
  ///
  /// In en, this message translates to:
  /// **'Data deleted'**
  String get dataDeleted;

  /// No description provided for @dataDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete data'**
  String get dataDeleteFailed;

  /// No description provided for @tutorialDisplayFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to display tutorial'**
  String get tutorialDisplayFailed;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get tips;

  /// No description provided for @tipsContent.
  ///
  /// In en, this message translates to:
  /// **'• Goal points are reflected in the pie chart on the home screen\n• Start with small goals and gradually increase them when achieved\n• You can earn up to 6 points in a single session'**
  String get tipsContent;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @tutorialSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get tutorialSkip;

  /// No description provided for @tutorialGoalAndPoints.
  ///
  /// In en, this message translates to:
  /// **'Goal and Current Points'**
  String get tutorialGoalAndPoints;

  /// No description provided for @tutorialGoalDescription.
  ///
  /// In en, this message translates to:
  /// **'The outer circle shows your goal, the inner circle shows total points. The circle fills as you approach your goal.'**
  String get tutorialGoalDescription;

  /// No description provided for @tutorialOneMinuteTraining.
  ///
  /// In en, this message translates to:
  /// **'1-Minute Training'**
  String get tutorialOneMinuteTraining;

  /// No description provided for @tutorialTrainingDescription.
  ///
  /// In en, this message translates to:
  /// **'Start a 1-minute game. Choose positive images or good habits from 4 options.'**
  String get tutorialTrainingDescription;

  /// No description provided for @tutorialScoreProgress.
  ///
  /// In en, this message translates to:
  /// **'Score Progress'**
  String get tutorialScoreProgress;

  /// No description provided for @tutorialScoreDescription.
  ///
  /// In en, this message translates to:
  /// **'View detailed information about your earned scores.'**
  String get tutorialScoreDescription;

  /// No description provided for @tutorialSettingsAndData.
  ///
  /// In en, this message translates to:
  /// **'Settings and Data Management'**
  String get tutorialSettingsAndData;

  /// No description provided for @tutorialSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Change goal values, view app information, and reset data.'**
  String get tutorialSettingsDescription;

  /// No description provided for @appIntroAttentionBiasTitle.
  ///
  /// In en, this message translates to:
  /// **'About Attention Bias'**
  String get appIntroAttentionBiasTitle;

  /// No description provided for @appIntroAttentionBiasContent.
  ///
  /// In en, this message translates to:
  /// **'When anxiety is high, we unconsciously tend to focus only on negative things.'**
  String get appIntroAttentionBiasContent;

  /// No description provided for @appIntroFocusMintRoleTitle.
  ///
  /// In en, this message translates to:
  /// **'FocusMint\'s Role'**
  String get appIntroFocusMintRoleTitle;

  /// No description provided for @appIntroFocusMintRoleContent.
  ///
  /// In en, this message translates to:
  /// **'By practicing selecting positive images, you\'ll naturally learn to focus your attention on the good side.'**
  String get appIntroFocusMintRoleContent;

  /// No description provided for @appIntroScientificEvidenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Scientific Evidence'**
  String get appIntroScientificEvidenceTitle;

  /// No description provided for @appIntroScientificEvidenceContent.
  ///
  /// In en, this message translates to:
  /// **'Research has confirmed that 25 minutes of training significantly reduces anxiety and stress.\n\n(e.g., Amir et al., 2009 Journal of Abnormal Psychology / Hakamata et al., 2010 Psychological Bulletin)'**
  String get appIntroScientificEvidenceContent;

  /// No description provided for @appIntroExpectedEffectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Expected Effects'**
  String get appIntroExpectedEffectsTitle;

  /// No description provided for @appIntroEffect1.
  ///
  /// In en, this message translates to:
  /// **'Reduction of anxiety and tension'**
  String get appIntroEffect1;

  /// No description provided for @appIntroEffect2.
  ///
  /// In en, this message translates to:
  /// **'Better awareness of smiles around you'**
  String get appIntroEffect2;

  /// No description provided for @appIntroEffect3.
  ///
  /// In en, this message translates to:
  /// **'Easier social interactions'**
  String get appIntroEffect3;

  /// No description provided for @appIntroHowToUse.
  ///
  /// In en, this message translates to:
  /// **'See How to Use'**
  String get appIntroHowToUse;

  /// No description provided for @pointsEarned.
  ///
  /// In en, this message translates to:
  /// **'Points Earned!'**
  String get pointsEarned;

  /// No description provided for @yourScore.
  ///
  /// In en, this message translates to:
  /// **'Your Score'**
  String get yourScore;

  /// No description provided for @totalPlayTime.
  ///
  /// In en, this message translates to:
  /// **'Total Play Time'**
  String get totalPlayTime;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
