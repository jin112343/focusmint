// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'النقاط الحالية';

  @override
  String goalLabel(int goal) {
    return 'الهدف: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'المتبقي: $remaining';
  }

  @override
  String get goalAchieved => '🎉 تم تحقيق الهدف!';

  @override
  String get startButtonText => 'ابدأ';

  @override
  String get stressReductionMessage => 'تدرّب على ملاحظة الجوانب الإيجابية.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'الوقت المتبقي: $minutes د $seconds ث';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'الوقت المتبقي: $seconds ث';
  }

  @override
  String scoreLabel(String score) {
    return 'النتيجة: $score نقطة';
  }

  @override
  String get imagePreparationMessage => 'جارٍ تجهيز الصور...';

  @override
  String get noStimuliAvailable => 'لا توجد مؤثرات متاحة';

  @override
  String get invalidGridSize => 'حجم شبكة غير صالح';

  @override
  String get unknown => '؟';

  @override
  String get gettingStarted => 'جارٍ البدء...';

  @override
  String get excellentPerformance => 'أداء ممتاز!';

  @override
  String get greatJob => 'عمل رائع!';

  @override
  String get goodPerformance => 'أداء جيد';

  @override
  String get keepPracticingFeedback => 'واصل التمرين';

  @override
  String get takeYourTimeFeedback => 'خذ وقتك';

  @override
  String get happy => 'سعيد';

  @override
  String get angry => 'غاضب';

  @override
  String get fear => 'خوف';

  @override
  String get sad => 'حزين';

  @override
  String get historyPageTitle => 'سجل التدريب';

  @override
  String get dataLoading => 'جارٍ تحميل البيانات...';

  @override
  String get pointsHistory => 'سجل النقاط';

  @override
  String get weekly => 'أسبوعي';

  @override
  String get monthly => 'شهري';

  @override
  String get noDataAvailable => 'لا توجد بيانات';

  @override
  String get goalAchievementRate => 'معدل تحقيق الهدف';

  @override
  String get scoreStatistics => 'إحصاءات النتائج';

  @override
  String get bestScore => 'أفضل نتيجة';

  @override
  String get totalScore => 'النتيجة الإجمالية';

  @override
  String get trainingTime => 'وقت التدريب';

  @override
  String get totalTrainingTime => 'إجمالي وقت التدريب';

  @override
  String get detailedStatistics => 'إحصاءات مفصلة';

  @override
  String get averageScorePerMinute => 'متوسط النتيجة في الدقيقة';

  @override
  String get pointsToGoal => 'النقاط المتبقية للهدف';

  @override
  String get goalSetting => 'تحديد الهدف';

  @override
  String get secondsUnit => 'ث';

  @override
  String get minutesUnit => 'د';

  @override
  String get hoursUnit => 'س';

  @override
  String get pointsUnit => 'نقطة';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'أحد';

  @override
  String get mondayShort => 'اثنين';

  @override
  String get tuesdayShort => 'ثلاثاء';

  @override
  String get wednesdayShort => 'أربعاء';

  @override
  String get thursdayShort => 'خميس';

  @override
  String get fridayShort => 'جمعة';

  @override
  String get saturdayShort => 'سبت';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get goalPointsSetting => 'تحديد نقاط الهدف';

  @override
  String currentGoalPoints(int points) {
    return 'الهدف الحالي: $points نقطة';
  }

  @override
  String get newGoalPointsLabel => 'نقاط الهدف الجديدة';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'نقطة';

  @override
  String get saveGoalButton => 'حفظ الهدف';

  @override
  String goalSetTo(int points) {
    return 'تم تحديد الهدف عند $points نقطة';
  }

  @override
  String get enterGoalPoints => 'يرجى إدخال نقاط الهدف';

  @override
  String get enterValidNumber => 'يرجى إدخال رقم صالح (من 1 إلى 99999999)';

  @override
  String get saveFailed => 'فشل حفظ بعض الإعدادات';

  @override
  String get emailOpenFailed => 'تعذّر فتح تطبيق البريد الإلكتروني';

  @override
  String get pageOpenFailed => 'تعذّر فتح الصفحة';

  @override
  String get appInfoSupport => 'معلومات التطبيق والدعم';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get contactUsSubtitle => 'شاركنا ملاحظاتك وأسئلتك';

  @override
  String get termsOfService => 'شروط الاستخدام';

  @override
  String get termsSubtitle => 'الاطلاع على شروط استخدام التطبيق';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get privacySubtitle => 'حول التعامل مع معلومات الخصوصية';

  @override
  String get tutorialTitle => 'الدليل التعليمي';

  @override
  String get tutorialSubtitle => 'تعرّف على كيفية استخدام التطبيق';

  @override
  String get dataManagement => 'إدارة البيانات';

  @override
  String get deleteHistory => 'حذف السجل';

  @override
  String get deleteHistorySubtitle =>
      'حذف سجل التدريب فقط (مع الاحتفاظ بنقاط الهدف)';

  @override
  String get deleteHistoryAndGoal => 'حذف السجل والهدف';

  @override
  String get deleteHistoryAndGoalSubtitle => 'حذف كل السجل ونقاط الهدف';

  @override
  String get deleteHistoryConfirmTitle => 'حذف السجل';

  @override
  String get deleteHistoryConfirmMessage =>
      'هل أنت متأكد من حذف كل سجل التدريب؟\n\n*سيتم الاحتفاظ بنقاط الهدف';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'حذف السجل والهدف';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'هل أنت متأكد من حذف كل السجل ونقاط الهدف؟\n\n*لا يمكن التراجع عن هذا الإجراء';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get historyDeleted => 'تم حذف السجل';

  @override
  String get historyAndGoalDeleted => 'تم حذف السجل والهدف';

  @override
  String get historyDeleteFailed => 'فشل حذف السجل';

  @override
  String get historyAndGoalDeleteFailed => 'فشل حذف السجل والهدف';

  @override
  String get tutorialDisplayFailed => 'فشل عرض الدليل التعليمي';

  @override
  String get tips => 'نصائح';

  @override
  String get tipsContent =>
      '• يظهر هدفك في الرسم البياني على الشاشة الرئيسية\n• ابدأ بهدف صغير وزده بالوتيرة التي تناسبك\n• يمنحك كل اختيار صحيح ما يصل إلى 6 نقاط';

  @override
  String get backToHome => 'العودة إلى الرئيسية';

  @override
  String get tutorialSkip => 'تخطي';

  @override
  String get tutorialGoalAndPoints => 'الهدف والنقاط الحالية';

  @override
  String get tutorialGoalDescription =>
      'تُظهر الدائرة الخارجية هدفك، وتُظهر الدائرة الداخلية إجمالي النقاط. تمتلئ الدائرة كلما اقتربت من هدفك.';

  @override
  String get tutorialOneMinuteTraining => 'تدريب لمدة دقيقة واحدة';

  @override
  String get tutorialTrainingDescription =>
      'ابدأ لعبة مدتها دقيقة واحدة. اختر الصور الإيجابية أو العادات الجيدة من بين 4 خيارات.';

  @override
  String get tutorialScoreProgress => 'تطور النتيجة';

  @override
  String get tutorialScoreDescription =>
      'اطّلع على معلومات مفصلة حول النتائج التي حصلت عليها.';

  @override
  String get tutorialSettingsAndData => 'الإعدادات وإدارة البيانات';

  @override
  String get tutorialSettingsDescription =>
      'غيّر قيم الهدف، واطّلع على معلومات التطبيق، وأعد تعيين البيانات.';

  @override
  String get appIntroAttentionBiasTitle => 'حول الانحياز الانتباهي';

  @override
  String get appIntroAttentionBiasContent =>
      'عندما يشتد القلق، نميل دون وعي إلى التركيز على الأمور السلبية فقط.';

  @override
  String get appIntroFocusMintRoleTitle => 'دور FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'لعبة قصيرة للتدرّب على توجيه الانتباه إلى الصور الإيجابية.';

  @override
  String get appIntroScientificEvidenceTitle => 'عن هذا التمرين';

  @override
  String get appIntroScientificEvidenceContent =>
      'تدرّب على العثور على صور إيجابية. FocusMint أداة للعناية بالنفس، وليس علاجًا طبيًا. تختلف النتائج من شخص إلى آخر.';

  @override
  String get appIntroExpectedEffectsTitle => 'ما يمكنك التدرّب عليه';

  @override
  String get appIntroEffect1 => 'البحث عن الصور الإيجابية';

  @override
  String get appIntroEffect2 => 'ملاحظة الابتسامات من حولك';

  @override
  String get appIntroEffect3 => 'تخصيص وقت لعادة يومية قصيرة';

  @override
  String get appIntroHowToUse => 'عرض طريقة الاستخدام';

  @override
  String get pointsEarned => 'لقد كسبت نقاطًا!';

  @override
  String get yourScore => 'نتيجتك';

  @override
  String get totalPlayTime => 'إجمالي وقت اللعب';

  @override
  String get imageManagement => 'إدارة الصور';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'الصور المخفية: $count/$max';
  }

  @override
  String get unsavedChanges => 'لديك تغييرات غير محفوظة';

  @override
  String unsavedChangesMessage(Object count) {
    return 'لديك $count من التغييرات غير المحفوظة في إعدادات عرض الصور.';
  }

  @override
  String get unsavedChangesWarning =>
      'ستفقد التغييرات إذا أغلقت هذه الشاشة الآن.';

  @override
  String get discardChanges => 'تجاهل التغييرات';

  @override
  String get saveAndExit => 'حفظ وخروج';

  @override
  String settingsSaved(Object count) {
    return 'تم حفظ $count من الإعدادات';
  }

  @override
  String get saveError => 'حدث خطأ أثناء حفظ الإعدادات';

  @override
  String get imageSettingsUpdated => 'تم تحديث إعدادات الصور';

  @override
  String get allImages => 'الكل';

  @override
  String get positiveImages => 'إيجابية';

  @override
  String get negativeImages => 'سلبية';

  @override
  String get smileImages => 'ابتسامة';

  @override
  String get vegetableImages => 'أطعمة مغذية';

  @override
  String get healthImages => 'الحركة والتواصل';

  @override
  String get sadImages => 'الغضب والحزن والقلق';

  @override
  String get badFoodImages => 'الوجبات السريعة والحلويات';

  @override
  String get badImages => 'عادات غير صحية';

  @override
  String get imageManagementHint =>
      'انقر لتبديل إظهار الصورة أو إخفائها. يمكنك إخفاء حتى 15 صورة.';

  @override
  String get unsaved => 'غير محفوظ';

  @override
  String get save => 'حفظ';

  @override
  String get hiddenImages => 'مخفية';

  @override
  String get noHiddenImages => 'لا توجد صور مخفية';

  @override
  String get settingsLoadFailed => 'فشل تحميل الإعدادات';

  @override
  String imagesAdded(int count) {
    return 'تمت إضافة $count من الصور';
  }

  @override
  String get imageAddFailed => 'فشلت إضافة الصور';

  @override
  String get imageSelectionFailed => 'فشل اختيار الصور';

  @override
  String get settingsChangeFailed => 'فشل تغيير الإعدادات';

  @override
  String groupTitle(String name) {
    return 'المجموعة: $name';
  }

  @override
  String get displayToggle => 'تبديل العرض';

  @override
  String imageCount(int count) {
    return '$count صورة';
  }

  @override
  String get noticeTitle => 'ملاحظات مهمة';

  @override
  String get notice1 => 'تمت إضافة ميزة الصور المخصصة!';

  @override
  String get notice2 => 'يمكنك إضافة صورك الخاصة من شاشة الإعدادات';

  @override
  String get notice3 => 'يرجى مراجعة شاشة الإعدادات لمزيد من التفاصيل';

  @override
  String get customImageTitle => 'الصور المخصصة';

  @override
  String get customImageSubtitle => 'أضف صورك الخاصة وأدرها';

  @override
  String get addCustomImages => 'إضافة صور مخصصة';

  @override
  String get selectImages => 'اختيار الصور';

  @override
  String get unknownImage => 'صورة غير معروفة';

  @override
  String get customImageSettings => 'إعدادات الصور المخصصة';

  @override
  String get useCustomImages => 'استخدام الصور المخصصة';

  @override
  String get useCustomImagesDescription =>
      'استخدم صورك الخاصة في التمرين. فعّل المزج أدناه لتضمين صور التطبيق أيضًا.';

  @override
  String get groupSettings => 'إعدادات المجموعات';

  @override
  String get minOneGroupRequired => 'يجب تفعيل مجموعة واحدة على الأقل';

  @override
  String get settingsLoadFailedMessage => 'فشل تحميل الإعدادات';

  @override
  String get customImageNotice1 =>
      'عند تفعيل المجموعات، تُعرض الصور عشوائيًا لكل مجموعة.';

  @override
  String get customImageNotice2 =>
      'الصور التي يحمّلها المستخدم ويعيّنها لا تُشارك مع المطورين أو أي طرف ثالث، وتُخزن فقط في منطقة التطبيق على الجهاز.';

  @override
  String get customImageNotice3 => 'هذا يتيح الاستخدام دون اتصال بالإنترنت.';

  @override
  String get customImageNotice4 =>
      'تستهلك إضافة صور كثيرة مساحة تخزين. إذا واجهت مشكلة، عطّل الصور المخصصة أو احذف الصور غير المستخدمة من الإعدادات.';

  @override
  String get customImageNotice5 => 'عند حذف التطبيق، سيتم حذف الصور المعيّنة.';

  @override
  String get customImageRequirementNotMet =>
      'لاستخدام الصور المخصصة، تحتاج إلى صورة جيدة واحدة على الأقل و3 صور غير جيدة على الأقل في المجموعات المفعّلة.';

  @override
  String get customImageRequirement =>
      'لاستخدام الصور المخصصة، تحتاج إلى صورة جيدة واحدة على الأقل و3 صور غير جيدة على الأقل في المجموعات المفعّلة.';

  @override
  String get sunnyWeather => 'جيدة';

  @override
  String get rainyWeather => 'غير جيدة';

  @override
  String get addImages => 'إضافة صور';

  @override
  String get imageDeleted => 'تم حذف الصورة';

  @override
  String get imageDeleteFailed => 'فشل حذف الصورة';

  @override
  String get deleteImageTitle => 'حذف الصورة';

  @override
  String get deleteImageMessage =>
      'هل تريد حذف هذه الصورة؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'المجموعة $groupId - صور $weather';
  }

  @override
  String registeredCount(int count) {
    return 'المسجلة: $count صورة';
  }

  @override
  String get noImagesRegistered => 'لا توجد صور مسجلة';

  @override
  String get imagePreview => 'معاينة الصورة';

  @override
  String get close => 'إغلاق';

  @override
  String get contactEmailSubject => 'FocusMint - اتصل بنا';

  @override
  String get contactEmailBody => 'يرجى مشاركة ملاحظاتك وأسئلتك.';

  @override
  String get mixWithBuiltInImages => 'المزج مع صور التطبيق';

  @override
  String get mixWithBuiltInImagesDescription =>
      'استخدام صورك الخاصة وصور التطبيق معًا';

  @override
  String get supportIntro =>
      'تواصل مع المطوّر دون الكشف عن هويتك. نرحّب بالأسئلة والاقتراحات. يمكنك إرسال 3 رسائل يوميًا، ويعيد كل رد من المطوّر عدد الرسائل المتاحة إلى 3.';

  @override
  String get supportReceived =>
      'تم استلام الرسالة. نردّ عادةً خلال يومين إلى ثلاثة أيام.';

  @override
  String get supportComposer => 'اكتب رسالة';

  @override
  String get supportSend => 'إرسال';

  @override
  String get supportRetry => 'إعادة المحاولة';

  @override
  String get supportSent => 'تم الإرسال';

  @override
  String get supportUnsent => 'لم تُرسل · محفوظة على هذا الجهاز';

  @override
  String get supportAttach => 'إرفاق صورة';

  @override
  String get supportRemoveImage => 'إزالة الصورة';

  @override
  String get supportImage => 'مرفق';

  @override
  String get supportClear => 'حذف السجل';

  @override
  String get supportClearConfirm =>
      'هل تريد حذف هذه المحادثة؟ ستُحذف أيضًا المسودات غير المرسلة والسجل على الخادم. لن يعيد ذلك عدد الرسائل المتاحة.';

  @override
  String get supportQuota =>
      'استخدمت رسائلك الثلاث لهذا اليوم. يمكنك الإرسال غدًا أو بعد ردّ المطوّر.';

  @override
  String get supportConnectionError =>
      'تعذّر الاتصال. لم تُرسل المسودات المحفوظة.';

  @override
  String get supportSendError =>
      'تعذّر الإرسال. رسالتك محفوظة على هذا الجهاز. أعد المحاولة.';

  @override
  String get supportStorageError => 'تعذّر الحفظ. أعد المحاولة.';

  @override
  String get supportClearError =>
      'تعذّر حذف السجل. تحقّق من الاتصال وأعد المحاولة.';

  @override
  String get supportImageError =>
      'تعذّر تحميل الصورة. اختر صورة يقل حجمها عن 30 ميغابايت.';

  @override
  String supportRemaining(int count) {
    return 'الرسائل المتبقية اليوم: $count';
  }

  @override
  String supportUnread(int count) {
    return 'الردود غير المقروءة: $count';
  }

  @override
  String get supportGuide => 'معلومات';

  @override
  String get supportDeveloper => 'المطوّر';

  @override
  String get supportPrivacy => 'حول بيانات المحادثة';

  @override
  String get breathingTitle => 'خذ نفسًا بهدوء';

  @override
  String get breathingHint => 'اتبع الحركة اللطيفة للرئتين\nبوتيرة مريحة لك.';

  @override
  String get breathingIn => 'شهيق ببطء';

  @override
  String get breathingOut => 'زفير ببطء';

  @override
  String get breathingProgress => 'تقدّم تمرين التنفّس';

  @override
  String get breathingResultHint => 'ستظهر نتائجك تلقائيًا عند الانتهاء.';

  @override
  String get breathingSkip => 'الانتقال إلى النتائج';
}
