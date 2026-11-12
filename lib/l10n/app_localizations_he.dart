// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'נקודות נוכחיות';

  @override
  String goalLabel(int goal) {
    return 'יעד: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'נותרו: $remaining';
  }

  @override
  String get goalAchieved => '🎉 היעד הושג!';

  @override
  String get startButtonText => 'התחל';

  @override
  String get stressReductionMessage => 'תרגלו תשומת לב לדברים חיוביים.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'זמן נותר: $minutes דק׳ $seconds שנ׳';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'זמן נותר: $seconds שנ׳';
  }

  @override
  String scoreLabel(String score) {
    return 'ניקוד: $score נקודות';
  }

  @override
  String get imagePreparationMessage => 'מכין תמונות...';

  @override
  String get noStimuliAvailable => 'אין גירויים זמינים';

  @override
  String get invalidGridSize => 'גודל רשת לא חוקי';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'מתחילים...';

  @override
  String get excellentPerformance => 'ביצועים מצוינים!';

  @override
  String get greatJob => 'עבודה מצוינת!';

  @override
  String get goodPerformance => 'ביצועים טובים';

  @override
  String get keepPracticingFeedback => 'המשיכו להתאמן';

  @override
  String get takeYourTimeFeedback => 'קחו את הזמן';

  @override
  String get happy => 'שמח';

  @override
  String get angry => 'כועס';

  @override
  String get fear => 'פחד';

  @override
  String get sad => 'עצוב';

  @override
  String get historyPageTitle => 'היסטוריית אימונים';

  @override
  String get dataLoading => 'טוען נתונים...';

  @override
  String get pointsHistory => 'היסטוריית נקודות';

  @override
  String get weekly => 'שבועי';

  @override
  String get monthly => 'חודשי';

  @override
  String get noDataAvailable => 'אין נתונים זמינים';

  @override
  String get goalAchievementRate => 'שיעור השגת היעד';

  @override
  String get scoreStatistics => 'סטטיסטיקת ניקוד';

  @override
  String get bestScore => 'הניקוד הטוב ביותר';

  @override
  String get totalScore => 'ניקוד כולל';

  @override
  String get trainingTime => 'זמן אימון';

  @override
  String get totalTrainingTime => 'זמן אימון כולל';

  @override
  String get detailedStatistics => 'סטטיסטיקה מפורטת';

  @override
  String get averageScorePerMinute => 'ניקוד ממוצע לדקה';

  @override
  String get pointsToGoal => 'נקודות עד היעד';

  @override
  String get goalSetting => 'הגדרת יעד';

  @override
  String get secondsUnit => 'שנ׳';

  @override
  String get minutesUnit => 'דק׳';

  @override
  String get hoursUnit => 'שע׳';

  @override
  String get pointsUnit => 'נקודות';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'א׳';

  @override
  String get mondayShort => 'ב׳';

  @override
  String get tuesdayShort => 'ג׳';

  @override
  String get wednesdayShort => 'ד׳';

  @override
  String get thursdayShort => 'ה׳';

  @override
  String get fridayShort => 'ו׳';

  @override
  String get saturdayShort => 'ש׳';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get goalPointsSetting => 'הגדרת נקודות יעד';

  @override
  String currentGoalPoints(int points) {
    return 'יעד נוכחי: $points נקודות';
  }

  @override
  String get newGoalPointsLabel => 'נקודות יעד חדשות';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'נקודות';

  @override
  String get saveGoalButton => 'שמור יעד';

  @override
  String goalSetTo(int points) {
    return 'היעד הוגדר ל-$points נקודות';
  }

  @override
  String get enterGoalPoints => 'נא להזין נקודות יעד';

  @override
  String get enterValidNumber => 'נא להזין מספר חוקי (1 עד 99999999)';

  @override
  String get saveFailed => 'שמירת חלק מההגדרות נכשלה';

  @override
  String get emailOpenFailed => 'לא ניתן היה לפתוח את אפליקציית הדוא״ל';

  @override
  String get pageOpenFailed => 'לא ניתן היה לפתוח את הדף';

  @override
  String get appInfoSupport => 'מידע על האפליקציה ותמיכה';

  @override
  String get contactUs => 'צרו קשר';

  @override
  String get contactUsSubtitle => 'שתפו אותנו במשוב ובשאלות';

  @override
  String get termsOfService => 'תנאי שימוש';

  @override
  String get termsSubtitle => 'עיינו בתנאי השימוש של האפליקציה';

  @override
  String get privacyPolicy => 'מדיניות פרטיות';

  @override
  String get privacySubtitle => 'על הטיפול במידע פרטי';

  @override
  String get tutorialTitle => 'מדריך';

  @override
  String get tutorialSubtitle => 'למדו כיצד להשתמש באפליקציה';

  @override
  String get dataManagement => 'ניהול נתונים';

  @override
  String get deleteHistory => 'מחיקת היסטוריה';

  @override
  String get deleteHistorySubtitle =>
      'מחיקת היסטוריית האימונים בלבד (נקודות היעד יישמרו)';

  @override
  String get deleteHistoryAndGoal => 'מחיקת היסטוריה ויעד';

  @override
  String get deleteHistoryAndGoalSubtitle => 'מחיקת כל ההיסטוריה ונקודות היעד';

  @override
  String get deleteHistoryConfirmTitle => 'מחיקת היסטוריה';

  @override
  String get deleteHistoryConfirmMessage =>
      'האם למחוק את כל היסטוריית האימונים?\n\n*נקודות היעד יישמרו';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'מחיקת היסטוריה ויעד';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'האם למחוק את כל ההיסטוריה ונקודות היעד?\n\n*לא ניתן לבטל פעולה זו';

  @override
  String get cancel => 'ביטול';

  @override
  String get delete => 'מחיקה';

  @override
  String get historyDeleted => 'ההיסטוריה נמחקה';

  @override
  String get historyAndGoalDeleted => 'ההיסטוריה והיעד נמחקו';

  @override
  String get historyDeleteFailed => 'מחיקת ההיסטוריה נכשלה';

  @override
  String get historyAndGoalDeleteFailed => 'מחיקת ההיסטוריה והיעד נכשלה';

  @override
  String get tutorialDisplayFailed => 'הצגת המדריך נכשלה';

  @override
  String get tips => 'טיפים';

  @override
  String get tipsContent =>
      '• היעד מופיע בתרשים שבמסך הבית\n• התחילו ביעד קטן והגדילו אותו בקצב שלכם\n• כל בחירה נכונה מזכה בעד 6 נקודות';

  @override
  String get backToHome => 'חזרה למסך הבית';

  @override
  String get tutorialSkip => 'דלג';

  @override
  String get tutorialGoalAndPoints => 'יעד ונקודות נוכחיות';

  @override
  String get tutorialGoalDescription =>
      'המעגל החיצוני מציג את היעד, והמעגל הפנימי את סך הנקודות. המעגל מתמלא ככל שמתקרבים ליעד.';

  @override
  String get tutorialOneMinuteTraining => 'אימון של דקה אחת';

  @override
  String get tutorialTrainingDescription =>
      'התחילו משחק של דקה אחת. בחרו תמונות חיוביות או הרגלים טובים מתוך 4 אפשרויות.';

  @override
  String get tutorialScoreProgress => 'התקדמות הניקוד';

  @override
  String get tutorialScoreDescription => 'צפו במידע מפורט על הניקוד שצברתם.';

  @override
  String get tutorialSettingsAndData => 'הגדרות וניהול נתונים';

  @override
  String get tutorialSettingsDescription =>
      'שנו את ערכי היעד, צפו במידע על האפליקציה ואפסו נתונים.';

  @override
  String get appIntroAttentionBiasTitle => 'על הטיה קשבית';

  @override
  String get appIntroAttentionBiasContent =>
      'כשהחרדה גבוהה, אנו נוטים באופן לא מודע להתמקד רק בדברים שליליים.';

  @override
  String get appIntroFocusMintRoleTitle => 'התפקיד של FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'משחק קצר לתרגול הפניית תשומת הלב לתמונות חיוביות.';

  @override
  String get appIntroScientificEvidenceTitle => 'על התרגול הזה';

  @override
  String get appIntroScientificEvidenceContent =>
      'תרגלו מציאת תמונות חיוביות. FocusMint הוא כלי לטיפוח עצמי ואינו טיפול רפואי. התוצאות משתנות מאדם לאדם.';

  @override
  String get appIntroExpectedEffectsTitle => 'מה אפשר לתרגל';

  @override
  String get appIntroEffect1 => 'חיפוש תמונות חיוביות';

  @override
  String get appIntroEffect2 => 'הבחנה בחיוכים סביבכם';

  @override
  String get appIntroEffect3 => 'יצירת שגרה יומית קצרה';

  @override
  String get appIntroHowToUse => 'ראו כיצד להשתמש';

  @override
  String get pointsEarned => 'צברתם נקודות!';

  @override
  String get yourScore => 'הניקוד שלך';

  @override
  String get totalPlayTime => 'זמן משחק כולל';

  @override
  String get imageManagement => 'ניהול תמונות';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'תמונות מוסתרות: $count/$max';
  }

  @override
  String get unsavedChanges => 'יש שינויים שלא נשמרו';

  @override
  String unsavedChangesMessage(Object count) {
    return 'יש $count שינויים שלא נשמרו בהגדרות תצוגת התמונות.';
  }

  @override
  String get unsavedChangesWarning => 'השינויים יאבדו אם תסגרו את המסך כעת.';

  @override
  String get discardChanges => 'בטל שינויים';

  @override
  String get saveAndExit => 'שמור וצא';

  @override
  String settingsSaved(Object count) {
    return '$count הגדרות נשמרו';
  }

  @override
  String get saveError => 'אירעה שגיאה בעת שמירת ההגדרות';

  @override
  String get imageSettingsUpdated => 'הגדרות התמונות עודכנו';

  @override
  String get allImages => 'הכול';

  @override
  String get positiveImages => 'חיוביות';

  @override
  String get negativeImages => 'שליליות';

  @override
  String get smileImages => 'חיוך';

  @override
  String get vegetableImages => 'מזון מזין';

  @override
  String get healthImages => 'תנועה וקשרים חברתיים';

  @override
  String get sadImages => 'כעס, עצב ודאגה';

  @override
  String get badFoodImages => 'מזון מהיר וממתקים';

  @override
  String get badImages => 'הרגלים לא בריאים';

  @override
  String get imageManagementHint =>
      'הקישו כדי להציג או להסתיר תמונה. ניתן להסתיר עד 15 תמונות.';

  @override
  String get unsaved => 'לא נשמר';

  @override
  String get save => 'שמירה';

  @override
  String get hiddenImages => 'מוסתרות';

  @override
  String get noHiddenImages => 'אין תמונות מוסתרות';

  @override
  String get settingsLoadFailed => 'טעינת ההגדרות נכשלה';

  @override
  String imagesAdded(int count) {
    return 'נוספו $count תמונות';
  }

  @override
  String get imageAddFailed => 'הוספת התמונות נכשלה';

  @override
  String get imageSelectionFailed => 'בחירת התמונות נכשלה';

  @override
  String get settingsChangeFailed => 'שינוי ההגדרות נכשל';

  @override
  String groupTitle(String name) {
    return 'קבוצה: $name';
  }

  @override
  String get displayToggle => 'הצגה/הסתרה';

  @override
  String imageCount(int count) {
    return '$count תמונות';
  }

  @override
  String get noticeTitle => 'הערות חשובות';

  @override
  String get notice1 => 'נוספה תכונת תמונות מותאמות אישית!';

  @override
  String get notice2 => 'ניתן להוסיף תמונות משלכם ממסך ההגדרות';

  @override
  String get notice3 => 'לפרטים נוספים עיינו במסך ההגדרות';

  @override
  String get customImageTitle => 'תמונות מותאמות אישית';

  @override
  String get customImageSubtitle => 'הוסיפו ונהלו תמונות משלכם';

  @override
  String get addCustomImages => 'הוספת תמונות מותאמות אישית';

  @override
  String get selectImages => 'בחירת תמונות';

  @override
  String get unknownImage => 'תמונה לא ידועה';

  @override
  String get customImageSettings => 'הגדרות תמונות מותאמות אישית';

  @override
  String get useCustomImages => 'שימוש בתמונות מותאמות אישית';

  @override
  String get useCustomImagesDescription =>
      'השתמשו בתמונות שלכם לתרגול. הפעילו את אפשרות השילוב למטה כדי לכלול גם את תמונות האפליקציה.';

  @override
  String get groupSettings => 'הגדרות קבוצות';

  @override
  String get minOneGroupRequired => 'יש להפעיל לפחות קבוצה אחת';

  @override
  String get settingsLoadFailedMessage => 'טעינת ההגדרות נכשלה';

  @override
  String get customImageNotice1 =>
      'כשקבוצות מופעלות, התמונות מוצגות באקראי עבור כל קבוצה.';

  @override
  String get customImageNotice2 =>
      'תמונות שהמשתמשים מעלים ומגדירים אינן משותפות עם המפתחים או צדדים שלישיים, ונשמרות רק באזור האפליקציה במכשיר.';

  @override
  String get customImageNotice3 =>
      'כך ניתן להשתמש באפליקציה גם ללא חיבור לאינטרנט.';

  @override
  String get customImageNotice4 =>
      'הוספת תמונות רבות תופסת מקום אחסון. אם מתעוררת בעיה, כבו את השימוש בתמונות אישיות או הסירו תמונות שאינן בשימוש בהגדרות.';

  @override
  String get customImageNotice5 => 'מחיקת האפליקציה תמחק את התמונות שהוגדרו.';

  @override
  String get customImageRequirementNotMet =>
      'כדי להשתמש בתמונות מותאמות אישית, נדרשות לפחות תמונה טובה אחת ו-3 תמונות לא טובות בקבוצות המופעלות.';

  @override
  String get customImageRequirement =>
      'כדי להשתמש בתמונות מותאמות אישית, נדרשות לפחות תמונה טובה אחת ו-3 תמונות לא טובות בקבוצות המופעלות.';

  @override
  String get sunnyWeather => 'טובות';

  @override
  String get rainyWeather => 'לא טובות';

  @override
  String get addImages => 'הוספת תמונות';

  @override
  String get imageDeleted => 'התמונה נמחקה';

  @override
  String get imageDeleteFailed => 'מחיקת התמונה נכשלה';

  @override
  String get deleteImageTitle => 'מחיקת תמונה';

  @override
  String get deleteImageMessage => 'האם למחוק תמונה זו? לא ניתן לבטל פעולה זו.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'קבוצה $groupId – תמונות $weather';
  }

  @override
  String registeredCount(int count) {
    return 'רשומות: $count תמונות';
  }

  @override
  String get noImagesRegistered => 'לא נרשמו תמונות';

  @override
  String get imagePreview => 'תצוגה מקדימה של תמונה';

  @override
  String get close => 'סגירה';

  @override
  String get contactEmailSubject => 'FocusMint - יצירת קשר';

  @override
  String get contactEmailBody => 'נשמח לקבל משוב ושאלות.';

  @override
  String get mixWithBuiltInImages => 'שילוב עם תמונות האפליקציה';

  @override
  String get mixWithBuiltInImagesDescription =>
      'שימוש בתמונות שלכם ובתמונות האפליקציה יחד';

  @override
  String get supportIntro =>
      'אפשר לשוחח בעילום שם עם המפתח. שאלות והצעות יתקבלו בברכה. ניתן לשלוח 3 הודעות ביום. כל תשובה מהמפתח מחזירה את המכסה הזמינה ל־3.';

  @override
  String get supportReceived =>
      'ההודעה התקבלה. בדרך כלל נשיב בתוך יומיים עד שלושה ימים.';

  @override
  String get supportComposer => 'כתבו הודעה';

  @override
  String get supportSend => 'שליחה';

  @override
  String get supportRetry => 'ניסיון חוזר';

  @override
  String get supportSent => 'נשלח';

  @override
  String get supportUnsent => 'לא נשלח · נשמר במכשיר הזה';

  @override
  String get supportAttach => 'צירוף תמונה';

  @override
  String get supportRemoveImage => 'הסרת תמונה';

  @override
  String get supportImage => 'קובץ מצורף';

  @override
  String get supportClear => 'מחיקת היסטוריה';

  @override
  String get supportClearConfirm =>
      'למחוק את השיחה? גם הטיוטות שלא נשלחו וההיסטוריה בשרת יימחקו. המכסה הזמינה לא תתאפס.';

  @override
  String get supportQuota =>
      'ניצלתם את 3 ההודעות של היום. ניתן לשלוח שוב מחר או לאחר תשובה מהמפתח.';

  @override
  String get supportConnectionError =>
      'לא ניתן להתחבר. הטיוטות השמורות לא נשלחו.';

  @override
  String get supportSendError =>
      'השליחה נכשלה. ההודעה נשמרה במכשיר הזה. נסו שוב.';

  @override
  String get supportStorageError => 'השמירה נכשלה. נסו שוב.';

  @override
  String get supportClearError =>
      'לא ניתן למחוק את ההיסטוריה. בדקו את החיבור ונסו שוב.';

  @override
  String get supportImageError =>
      'לא ניתן לטעון את התמונה. בחרו תמונה שגודלה פחות מ־30 מגה־בייט.';

  @override
  String supportRemaining(int count) {
    return 'הודעות שנותרו היום: $count';
  }

  @override
  String supportUnread(int count) {
    return 'תשובות שלא נקראו: $count';
  }

  @override
  String get supportGuide => 'מידע';

  @override
  String get supportDeveloper => 'המפתח';

  @override
  String get supportPrivacy => 'על נתוני הפנייה';

  @override
  String get breathingTitle => 'קחו רגע לנשום';

  @override
  String get breathingHint =>
      'עקבו אחר התנועה העדינה של הריאות\nבקצב שנוח לכם.';

  @override
  String get breathingIn => 'שאפו לאט';

  @override
  String get breathingOut => 'נשפו לאט';

  @override
  String get breathingProgress => 'התקדמות תרגול הנשימה';

  @override
  String get breathingResultHint => 'התוצאות יוצגו אוטומטית בסיום.';

  @override
  String get breathingSkip => 'דילוג לתוצאות';
}
