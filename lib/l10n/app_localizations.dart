import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

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
    Locale('ar'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en', 'AU'),
    Locale('en', 'CA'),
    Locale('en', 'GB'),
    Locale('es'),
    Locale('es', 'MX'),
    Locale('fi'),
    Locale('fr'),
    Locale('fr', 'CA'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ko'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
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
  /// **'Practice noticing the positive.'**
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
  /// **'Failed to save some settings'**
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

  /// No description provided for @deleteHistory.
  ///
  /// In en, this message translates to:
  /// **'Delete History'**
  String get deleteHistory;

  /// No description provided for @deleteHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Delete training history only (goal points preserved)'**
  String get deleteHistorySubtitle;

  /// No description provided for @deleteHistoryAndGoal.
  ///
  /// In en, this message translates to:
  /// **'Delete History & Goal'**
  String get deleteHistoryAndGoal;

  /// No description provided for @deleteHistoryAndGoalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all history and goal points'**
  String get deleteHistoryAndGoalSubtitle;

  /// No description provided for @deleteHistoryConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete History'**
  String get deleteHistoryConfirmTitle;

  /// No description provided for @deleteHistoryConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all training history?\n\n*Goal points will be preserved'**
  String get deleteHistoryConfirmMessage;

  /// No description provided for @deleteHistoryAndGoalConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete History & Goal'**
  String get deleteHistoryAndGoalConfirmTitle;

  /// No description provided for @deleteHistoryAndGoalConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all history and goal points?\n\n*This action cannot be undone'**
  String get deleteHistoryAndGoalConfirmMessage;

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

  /// No description provided for @historyDeleted.
  ///
  /// In en, this message translates to:
  /// **'History deleted'**
  String get historyDeleted;

  /// No description provided for @historyAndGoalDeleted.
  ///
  /// In en, this message translates to:
  /// **'History and goal deleted'**
  String get historyAndGoalDeleted;

  /// No description provided for @historyDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete history'**
  String get historyDeleteFailed;

  /// No description provided for @historyAndGoalDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete history and goal'**
  String get historyAndGoalDeleteFailed;

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
  /// **'• Your goal appears in the home screen chart\n• Start small and increase your goal at your own pace\n• Each correct choice earns up to 6 points'**
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
  /// **'A short game for practicing how you direct your attention to positive images.'**
  String get appIntroFocusMintRoleContent;

  /// No description provided for @appIntroScientificEvidenceTitle.
  ///
  /// In en, this message translates to:
  /// **'About this exercise'**
  String get appIntroScientificEvidenceTitle;

  /// No description provided for @appIntroScientificEvidenceContent.
  ///
  /// In en, this message translates to:
  /// **'Practice finding positive images. FocusMint is a self-care exercise, not a medical treatment. Results vary from person to person.'**
  String get appIntroScientificEvidenceContent;

  /// No description provided for @appIntroExpectedEffectsTitle.
  ///
  /// In en, this message translates to:
  /// **'What you can practice'**
  String get appIntroExpectedEffectsTitle;

  /// No description provided for @appIntroEffect1.
  ///
  /// In en, this message translates to:
  /// **'Looking for positive images'**
  String get appIntroEffect1;

  /// No description provided for @appIntroEffect2.
  ///
  /// In en, this message translates to:
  /// **'Noticing smiles around you'**
  String get appIntroEffect2;

  /// No description provided for @appIntroEffect3.
  ///
  /// In en, this message translates to:
  /// **'Making time for a short daily routine'**
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

  /// No description provided for @imageManagement.
  ///
  /// In en, this message translates to:
  /// **'Image Management'**
  String get imageManagement;

  /// No description provided for @hiddenImagesCount.
  ///
  /// In en, this message translates to:
  /// **'Hidden images: {count}/{max}'**
  String hiddenImagesCount(int count, int max);

  /// No description provided for @unsavedChanges.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes'**
  String get unsavedChanges;

  /// No description provided for @unsavedChangesMessage.
  ///
  /// In en, this message translates to:
  /// **'You have {count} unsaved changes to image display settings.'**
  String unsavedChangesMessage(Object count);

  /// No description provided for @unsavedChangesWarning.
  ///
  /// In en, this message translates to:
  /// **'Changes will be lost if you close this screen now.'**
  String get unsavedChangesWarning;

  /// No description provided for @discardChanges.
  ///
  /// In en, this message translates to:
  /// **'Discard Changes'**
  String get discardChanges;

  /// No description provided for @saveAndExit.
  ///
  /// In en, this message translates to:
  /// **'Save and Exit'**
  String get saveAndExit;

  /// No description provided for @settingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved {count} settings'**
  String settingsSaved(Object count);

  /// No description provided for @saveError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while saving settings'**
  String get saveError;

  /// No description provided for @imageSettingsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Image settings have been updated'**
  String get imageSettingsUpdated;

  /// No description provided for @allImages.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allImages;

  /// No description provided for @positiveImages.
  ///
  /// In en, this message translates to:
  /// **'Positive'**
  String get positiveImages;

  /// No description provided for @negativeImages.
  ///
  /// In en, this message translates to:
  /// **'Negative'**
  String get negativeImages;

  /// No description provided for @smileImages.
  ///
  /// In en, this message translates to:
  /// **'Smile'**
  String get smileImages;

  /// No description provided for @vegetableImages.
  ///
  /// In en, this message translates to:
  /// **'Nourishing food'**
  String get vegetableImages;

  /// No description provided for @healthImages.
  ///
  /// In en, this message translates to:
  /// **'Movement & connection'**
  String get healthImages;

  /// No description provided for @sadImages.
  ///
  /// In en, this message translates to:
  /// **'Anger, sadness & worry'**
  String get sadImages;

  /// No description provided for @badFoodImages.
  ///
  /// In en, this message translates to:
  /// **'Junk food & sweets'**
  String get badFoodImages;

  /// No description provided for @badImages.
  ///
  /// In en, this message translates to:
  /// **'Unhealthy habits'**
  String get badImages;

  /// No description provided for @imageManagementHint.
  ///
  /// In en, this message translates to:
  /// **'Tap to toggle image visibility. You can hide up to 15 images.'**
  String get imageManagementHint;

  /// No description provided for @unsaved.
  ///
  /// In en, this message translates to:
  /// **'Unsaved'**
  String get unsaved;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @hiddenImages.
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get hiddenImages;

  /// No description provided for @noHiddenImages.
  ///
  /// In en, this message translates to:
  /// **'No hidden images'**
  String get noHiddenImages;

  /// No description provided for @settingsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load settings'**
  String get settingsLoadFailed;

  /// No description provided for @imagesAdded.
  ///
  /// In en, this message translates to:
  /// **'Added {count} images'**
  String imagesAdded(int count);

  /// No description provided for @imageAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add images'**
  String get imageAddFailed;

  /// No description provided for @imageSelectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to select images'**
  String get imageSelectionFailed;

  /// No description provided for @settingsChangeFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to change settings'**
  String get settingsChangeFailed;

  /// No description provided for @groupTitle.
  ///
  /// In en, this message translates to:
  /// **'Group: {name}'**
  String groupTitle(String name);

  /// No description provided for @displayToggle.
  ///
  /// In en, this message translates to:
  /// **'Display Toggle'**
  String get displayToggle;

  /// No description provided for @imageCount.
  ///
  /// In en, this message translates to:
  /// **'{count} images'**
  String imageCount(int count);

  /// No description provided for @noticeTitle.
  ///
  /// In en, this message translates to:
  /// **'Important Notes'**
  String get noticeTitle;

  /// No description provided for @notice1.
  ///
  /// In en, this message translates to:
  /// **'Custom image feature has been added!'**
  String get notice1;

  /// No description provided for @notice2.
  ///
  /// In en, this message translates to:
  /// **'You can add your own images from the settings screen'**
  String get notice2;

  /// No description provided for @notice3.
  ///
  /// In en, this message translates to:
  /// **'Please check the settings screen for details'**
  String get notice3;

  /// No description provided for @customImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom Images'**
  String get customImageTitle;

  /// No description provided for @customImageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add and manage your own images'**
  String get customImageSubtitle;

  /// No description provided for @addCustomImages.
  ///
  /// In en, this message translates to:
  /// **'Add Custom Images'**
  String get addCustomImages;

  /// No description provided for @selectImages.
  ///
  /// In en, this message translates to:
  /// **'Select Images'**
  String get selectImages;

  /// No description provided for @unknownImage.
  ///
  /// In en, this message translates to:
  /// **'Unknown Image'**
  String get unknownImage;

  /// No description provided for @customImageSettings.
  ///
  /// In en, this message translates to:
  /// **'Custom Image Settings'**
  String get customImageSettings;

  /// No description provided for @useCustomImages.
  ///
  /// In en, this message translates to:
  /// **'Use Custom Images'**
  String get useCustomImages;

  /// No description provided for @useCustomImagesDescription.
  ///
  /// In en, this message translates to:
  /// **'Use your own images for training. Enable mixing below to include built-in images.'**
  String get useCustomImagesDescription;

  /// No description provided for @groupSettings.
  ///
  /// In en, this message translates to:
  /// **'Group Settings'**
  String get groupSettings;

  /// No description provided for @minOneGroupRequired.
  ///
  /// In en, this message translates to:
  /// **'At least one group must be enabled'**
  String get minOneGroupRequired;

  /// No description provided for @settingsLoadFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load settings'**
  String get settingsLoadFailedMessage;

  /// No description provided for @customImageNotice1.
  ///
  /// In en, this message translates to:
  /// **'When groups are enabled, images are displayed randomly for each group.'**
  String get customImageNotice1;

  /// No description provided for @customImageNotice2.
  ///
  /// In en, this message translates to:
  /// **'Images uploaded and set by users are not shared with developers or third parties and are stored only in the app\'s area on the device.'**
  String get customImageNotice2;

  /// No description provided for @customImageNotice3.
  ///
  /// In en, this message translates to:
  /// **'This allows offline use.'**
  String get customImageNotice3;

  /// No description provided for @customImageNotice4.
  ///
  /// In en, this message translates to:
  /// **'Adding many images uses storage. If you have problems, turn off custom images or remove unused images in Settings.'**
  String get customImageNotice4;

  /// No description provided for @customImageNotice5.
  ///
  /// In en, this message translates to:
  /// **'When you delete the app, the set images will be deleted.'**
  String get customImageNotice5;

  /// No description provided for @customImageRequirementNotMet.
  ///
  /// In en, this message translates to:
  /// **'To use custom images, you need at least 1 good image and 3 not good images in enabled groups.'**
  String get customImageRequirementNotMet;

  /// No description provided for @customImageRequirement.
  ///
  /// In en, this message translates to:
  /// **'To use custom images, you need at least 1 good image and 3 not good images in enabled groups.'**
  String get customImageRequirement;

  /// No description provided for @sunnyWeather.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get sunnyWeather;

  /// No description provided for @rainyWeather.
  ///
  /// In en, this message translates to:
  /// **'Not good'**
  String get rainyWeather;

  /// No description provided for @addImages.
  ///
  /// In en, this message translates to:
  /// **'Add Images'**
  String get addImages;

  /// No description provided for @imageDeleted.
  ///
  /// In en, this message translates to:
  /// **'Image deleted'**
  String get imageDeleted;

  /// No description provided for @imageDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete image'**
  String get imageDeleteFailed;

  /// No description provided for @deleteImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Image'**
  String get deleteImageTitle;

  /// No description provided for @deleteImageMessage.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete this image? This action cannot be undone.'**
  String get deleteImageMessage;

  /// No description provided for @groupImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Group {groupId} {weather} Images'**
  String groupImageTitle(int groupId, String weather);

  /// No description provided for @registeredCount.
  ///
  /// In en, this message translates to:
  /// **'Registered: {count} images'**
  String registeredCount(int count);

  /// No description provided for @noImagesRegistered.
  ///
  /// In en, this message translates to:
  /// **'No images registered'**
  String get noImagesRegistered;

  /// No description provided for @imagePreview.
  ///
  /// In en, this message translates to:
  /// **'Image Preview'**
  String get imagePreview;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @contactEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'FocusMint - Contact'**
  String get contactEmailSubject;

  /// No description provided for @contactEmailBody.
  ///
  /// In en, this message translates to:
  /// **'Please share your feedback and questions.'**
  String get contactEmailBody;

  /// No description provided for @mixWithBuiltInImages.
  ///
  /// In en, this message translates to:
  /// **'Mix with built-in images'**
  String get mixWithBuiltInImages;

  /// No description provided for @mixWithBuiltInImagesDescription.
  ///
  /// In en, this message translates to:
  /// **'Use a mix of built-in images and your own images'**
  String get mixWithBuiltInImagesDescription;

  /// No description provided for @supportIntro.
  ///
  /// In en, this message translates to:
  /// **'Chat anonymously with the developer. Questions and suggestions are welcome. You can send 3 messages per day. Each developer reply resets your allowance to 3.'**
  String get supportIntro;

  /// No description provided for @supportReceived.
  ///
  /// In en, this message translates to:
  /// **'Message received. We usually reply within 2–3 days.'**
  String get supportReceived;

  /// No description provided for @supportComposer.
  ///
  /// In en, this message translates to:
  /// **'Type a message'**
  String get supportComposer;

  /// No description provided for @supportSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get supportSend;

  /// No description provided for @supportRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get supportRetry;

  /// No description provided for @supportSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get supportSent;

  /// No description provided for @supportUnsent.
  ///
  /// In en, this message translates to:
  /// **'Unsent · saved on this device'**
  String get supportUnsent;

  /// No description provided for @supportAttach.
  ///
  /// In en, this message translates to:
  /// **'Attach image'**
  String get supportAttach;

  /// No description provided for @supportRemoveImage.
  ///
  /// In en, this message translates to:
  /// **'Remove image'**
  String get supportRemoveImage;

  /// No description provided for @supportImage.
  ///
  /// In en, this message translates to:
  /// **'Attachment'**
  String get supportImage;

  /// No description provided for @supportClear.
  ///
  /// In en, this message translates to:
  /// **'Delete history'**
  String get supportClear;

  /// No description provided for @supportClearConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this conversation? Unsent drafts and server history will also be deleted. This does not reset your allowance.'**
  String get supportClearConfirm;

  /// No description provided for @supportQuota.
  ///
  /// In en, this message translates to:
  /// **'You have used today’s 3 messages. Send another tomorrow or after a developer reply.'**
  String get supportQuota;

  /// No description provided for @supportConnectionError.
  ///
  /// In en, this message translates to:
  /// **'Could not connect. Saved drafts have not been sent.'**
  String get supportConnectionError;

  /// No description provided for @supportSendError.
  ///
  /// In en, this message translates to:
  /// **'Could not send. Your message is saved on this device. Please retry.'**
  String get supportSendError;

  /// No description provided for @supportStorageError.
  ///
  /// In en, this message translates to:
  /// **'Could not save. Please try again.'**
  String get supportStorageError;

  /// No description provided for @supportClearError.
  ///
  /// In en, this message translates to:
  /// **'Could not delete history. Check your connection and retry.'**
  String get supportClearError;

  /// No description provided for @supportImageError.
  ///
  /// In en, this message translates to:
  /// **'Could not load the image. Please choose an image under 30 MB.'**
  String get supportImageError;

  /// No description provided for @supportRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} messages remaining today'**
  String supportRemaining(int count);

  /// No description provided for @supportUnread.
  ///
  /// In en, this message translates to:
  /// **'{count} unread replies'**
  String supportUnread(int count);

  /// No description provided for @supportGuide.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get supportGuide;

  /// No description provided for @supportDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get supportDeveloper;

  /// No description provided for @supportPrivacy.
  ///
  /// In en, this message translates to:
  /// **'About support data'**
  String get supportPrivacy;

  /// No description provided for @breathingTitle.
  ///
  /// In en, this message translates to:
  /// **'Take a breath'**
  String get breathingTitle;

  /// No description provided for @breathingHint.
  ///
  /// In en, this message translates to:
  /// **'Follow the gentle movement\nof the lungs at a comfortable pace.'**
  String get breathingHint;

  /// No description provided for @breathingIn.
  ///
  /// In en, this message translates to:
  /// **'Breathe in'**
  String get breathingIn;

  /// No description provided for @breathingOut.
  ///
  /// In en, this message translates to:
  /// **'Breathe out'**
  String get breathingOut;

  /// No description provided for @breathingProgress.
  ///
  /// In en, this message translates to:
  /// **'Breathing progress'**
  String get breathingProgress;

  /// No description provided for @breathingResultHint.
  ///
  /// In en, this message translates to:
  /// **'Your results will appear automatically.'**
  String get breathingResultHint;

  /// No description provided for @breathingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip to results'**
  String get breathingSkip;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fi',
    'fr',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sv',
    'th',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en':
      {
        switch (locale.countryCode) {
          case 'AU':
            return AppLocalizationsEnAu();
          case 'CA':
            return AppLocalizationsEnCa();
          case 'GB':
            return AppLocalizationsEnGb();
        }
        break;
      }
    case 'es':
      {
        switch (locale.countryCode) {
          case 'MX':
            return AppLocalizationsEsMx();
        }
        break;
      }
    case 'fr':
      {
        switch (locale.countryCode) {
          case 'CA':
            return AppLocalizationsFrCa();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
