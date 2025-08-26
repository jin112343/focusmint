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

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'FocusMint'**
  String get appTitle;

  /// No description provided for @abmTraining.
  ///
  /// In en, this message translates to:
  /// **'ABM Training'**
  String get abmTraining;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Attention Bias Modification (ABM) positive search training!\nTrain your attention towards positive stimuli with a focused 5-minute session.'**
  String get welcomeMessage;

  /// No description provided for @startTraining.
  ///
  /// In en, this message translates to:
  /// **'Start Training'**
  String get startTraining;

  /// No description provided for @startTrainingDescription.
  ///
  /// In en, this message translates to:
  /// **'Begin a 5-minute training session'**
  String get startTrainingDescription;

  /// No description provided for @startButton.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startButton;

  /// No description provided for @aboutTraining.
  ///
  /// In en, this message translates to:
  /// **'About Training'**
  String get aboutTraining;

  /// No description provided for @sessionTime.
  ///
  /// In en, this message translates to:
  /// **'Session Time'**
  String get sessionTime;

  /// No description provided for @sessionDuration.
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get sessionDuration;

  /// No description provided for @trialCount.
  ///
  /// In en, this message translates to:
  /// **'Trials'**
  String get trialCount;

  /// No description provided for @trialRange.
  ///
  /// In en, this message translates to:
  /// **'120-160 trials'**
  String get trialRange;

  /// No description provided for @difficultyAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Difficulty Adjustment'**
  String get difficultyAdjustment;

  /// No description provided for @difficultyMethod.
  ///
  /// In en, this message translates to:
  /// **'Adaptive (1-up/2-down)'**
  String get difficultyMethod;

  /// No description provided for @scoreEvaluation.
  ///
  /// In en, this message translates to:
  /// **'Score Evaluation'**
  String get scoreEvaluation;

  /// No description provided for @bisScore.
  ///
  /// In en, this message translates to:
  /// **'BIS (Balanced Integration Score)'**
  String get bisScore;

  /// No description provided for @noRecentSessions.
  ///
  /// In en, this message translates to:
  /// **'No recent sessions'**
  String get noRecentSessions;

  /// No description provided for @startFirstSession.
  ///
  /// In en, this message translates to:
  /// **'Start your first training session!'**
  String get startFirstSession;

  /// No description provided for @recentSessions.
  ///
  /// In en, this message translates to:
  /// **'Recent Sessions'**
  String get recentSessions;

  /// No description provided for @moreSessionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} more sessions'**
  String moreSessionsCount(int count);

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String daysAgo(int days);

  /// No description provided for @trialUnit.
  ///
  /// In en, this message translates to:
  /// **'trials'**
  String get trialUnit;

  /// No description provided for @dataLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data'**
  String get dataLoadError;

  /// No description provided for @training.
  ///
  /// In en, this message translates to:
  /// **'Training'**
  String get training;

  /// No description provided for @trialCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Trial: {count}'**
  String trialCountLabel(int count);

  /// No description provided for @difficultyLabel.
  ///
  /// In en, this message translates to:
  /// **'Difficulty: {level}'**
  String difficultyLabel(String level);

  /// No description provided for @recentAccuracyLabel.
  ///
  /// In en, this message translates to:
  /// **'Recent Accuracy: {accuracy}%'**
  String recentAccuracyLabel(String accuracy);

  /// No description provided for @preparingSession.
  ///
  /// In en, this message translates to:
  /// **'Preparing session...'**
  String get preparingSession;

  /// No description provided for @trainingStart.
  ///
  /// In en, this message translates to:
  /// **'Training Start'**
  String get trainingStart;

  /// No description provided for @findSmileyInstruction.
  ///
  /// In en, this message translates to:
  /// **'Find and tap the happy face quickly'**
  String get findSmileyInstruction;

  /// No description provided for @sessionComplete.
  ///
  /// In en, this message translates to:
  /// **'Session Complete!'**
  String get sessionComplete;

  /// No description provided for @showingResults.
  ///
  /// In en, this message translates to:
  /// **'Showing results...'**
  String get showingResults;

  /// No description provided for @sessionAborted.
  ///
  /// In en, this message translates to:
  /// **'Session was interrupted'**
  String get sessionAborted;

  /// No description provided for @canStartNewSession.
  ///
  /// In en, this message translates to:
  /// **'You can start a new session anytime'**
  String get canStartNewSession;

  /// No description provided for @returnHome.
  ///
  /// In en, this message translates to:
  /// **'Return Home'**
  String get returnHome;

  /// No description provided for @trainingInterruption.
  ///
  /// In en, this message translates to:
  /// **'Training Interruption'**
  String get trainingInterruption;

  /// No description provided for @interruptionMessage.
  ///
  /// In en, this message translates to:
  /// **'Do you want to interrupt the training?\nProgress will not be saved.'**
  String get interruptionMessage;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @interruptButton.
  ///
  /// In en, this message translates to:
  /// **'Interrupt'**
  String get interruptButton;

  /// No description provided for @sessionResults.
  ///
  /// In en, this message translates to:
  /// **'Session Results'**
  String get sessionResults;

  /// No description provided for @sessionScore.
  ///
  /// In en, this message translates to:
  /// **'Session Score'**
  String get sessionScore;

  /// No description provided for @bisScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'BIS Score: {score}'**
  String bisScoreLabel(String score);

  /// No description provided for @performanceStats.
  ///
  /// In en, this message translates to:
  /// **'Performance Statistics'**
  String get performanceStats;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @trials.
  ///
  /// In en, this message translates to:
  /// **'Trials'**
  String get trials;

  /// No description provided for @reactionTime.
  ///
  /// In en, this message translates to:
  /// **'Reaction Time'**
  String get reactionTime;

  /// No description provided for @consecutiveCorrect.
  ///
  /// In en, this message translates to:
  /// **'Consecutive Correct'**
  String get consecutiveCorrect;

  /// No description provided for @sessionDetails.
  ///
  /// In en, this message translates to:
  /// **'Session Details'**
  String get sessionDetails;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// No description provided for @sessionDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'Session Duration'**
  String get sessionDurationLabel;

  /// No description provided for @minutesUnit.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minutesUnit;

  /// No description provided for @avgReactionTime.
  ///
  /// In en, this message translates to:
  /// **'Average Reaction Time'**
  String get avgReactionTime;

  /// No description provided for @iesScore.
  ///
  /// In en, this message translates to:
  /// **'IES Score'**
  String get iesScore;

  /// No description provided for @difficultyBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Trials by Difficulty'**
  String get difficultyBreakdown;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @trialsSuffix.
  ///
  /// In en, this message translates to:
  /// **'trials'**
  String get trialsSuffix;

  /// No description provided for @startNewSession.
  ///
  /// In en, this message translates to:
  /// **'Start New Session'**
  String get startNewSession;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get goHome;

  /// No description provided for @excellentResult.
  ///
  /// In en, this message translates to:
  /// **'Excellent result!'**
  String get excellentResult;

  /// No description provided for @goodJob.
  ///
  /// In en, this message translates to:
  /// **'Well done!'**
  String get goodJob;

  /// No description provided for @keepPracticing.
  ///
  /// In en, this message translates to:
  /// **'Keep practicing'**
  String get keepPracticing;

  /// No description provided for @takeYourTime.
  ///
  /// In en, this message translates to:
  /// **'Take your time'**
  String get takeYourTime;

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
