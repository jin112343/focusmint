// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'वर्तमान पॉइंट';

  @override
  String goalLabel(int goal) {
    return 'लक्ष्य: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'शेष: $remaining';
  }

  @override
  String get goalAchieved => '🎉 लक्ष्य प्राप्त!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage =>
      'सकारात्मक बातों पर ध्यान देने का अभ्यास करें।';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'शेष समय: $minutes मिनट $seconds सेकंड';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'शेष समय: $seconds सेकंड';
  }

  @override
  String scoreLabel(String score) {
    return 'स्कोर: $score पॉइंट';
  }

  @override
  String get imagePreparationMessage => 'छवियाँ तैयार की जा रही हैं...';

  @override
  String get noStimuliAvailable => 'कोई उद्दीपक उपलब्ध नहीं है';

  @override
  String get invalidGridSize => 'अमान्य ग्रिड आकार';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'शुरू हो रहा है...';

  @override
  String get excellentPerformance => 'उत्कृष्ट प्रदर्शन!';

  @override
  String get greatJob => 'बहुत बढ़िया!';

  @override
  String get goodPerformance => 'अच्छा प्रदर्शन';

  @override
  String get keepPracticingFeedback => 'अभ्यास जारी रखें';

  @override
  String get takeYourTimeFeedback => 'आराम से करें';

  @override
  String get happy => 'खुश';

  @override
  String get angry => 'गुस्सा';

  @override
  String get fear => 'डर';

  @override
  String get sad => 'उदास';

  @override
  String get historyPageTitle => 'प्रशिक्षण इतिहास';

  @override
  String get dataLoading => 'डेटा लोड हो रहा है...';

  @override
  String get pointsHistory => 'पॉइंट इतिहास';

  @override
  String get weekly => 'साप्ताहिक';

  @override
  String get monthly => 'मासिक';

  @override
  String get noDataAvailable => 'कोई डेटा उपलब्ध नहीं';

  @override
  String get goalAchievementRate => 'लक्ष्य प्राप्ति दर';

  @override
  String get scoreStatistics => 'स्कोर आँकड़े';

  @override
  String get bestScore => 'सर्वश्रेष्ठ स्कोर';

  @override
  String get totalScore => 'कुल स्कोर';

  @override
  String get trainingTime => 'प्रशिक्षण समय';

  @override
  String get totalTrainingTime => 'कुल प्रशिक्षण समय';

  @override
  String get detailedStatistics => 'विस्तृत आँकड़े';

  @override
  String get averageScorePerMinute => 'प्रति मिनट औसत स्कोर';

  @override
  String get pointsToGoal => 'लक्ष्य तक शेष पॉइंट';

  @override
  String get goalSetting => 'लक्ष्य निर्धारण';

  @override
  String get secondsUnit => 'से';

  @override
  String get minutesUnit => 'मि';

  @override
  String get hoursUnit => 'घं';

  @override
  String get pointsUnit => 'पॉइंट';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'रवि';

  @override
  String get mondayShort => 'सोम';

  @override
  String get tuesdayShort => 'मंगल';

  @override
  String get wednesdayShort => 'बुध';

  @override
  String get thursdayShort => 'गुरु';

  @override
  String get fridayShort => 'शुक्र';

  @override
  String get saturdayShort => 'शनि';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get goalPointsSetting => 'लक्ष्य पॉइंट सेटिंग';

  @override
  String currentGoalPoints(int points) {
    return 'वर्तमान लक्ष्य: $points पॉइंट';
  }

  @override
  String get newGoalPointsLabel => 'नए लक्ष्य पॉइंट';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'पॉइंट';

  @override
  String get saveGoalButton => 'लक्ष्य सहेजें';

  @override
  String goalSetTo(int points) {
    return 'लक्ष्य $points पॉइंट पर सेट किया गया';
  }

  @override
  String get enterGoalPoints => 'कृपया लक्ष्य पॉइंट दर्ज करें';

  @override
  String get enterValidNumber =>
      'कृपया मान्य संख्या दर्ज करें (1 से 99999999 तक)';

  @override
  String get saveFailed => 'सहेजने में विफल';

  @override
  String get emailOpenFailed => 'ईमेल ऐप नहीं खोला जा सका';

  @override
  String get pageOpenFailed => 'पेज नहीं खोला जा सका';

  @override
  String get appInfoSupport => 'ऐप जानकारी और सहायता';

  @override
  String get contactUs => 'संपर्क करें';

  @override
  String get contactUsSubtitle => 'अपनी प्रतिक्रिया और प्रश्न साझा करें';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get termsSubtitle => 'ऐप की सेवा शर्तें देखें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get privacySubtitle => 'गोपनीयता जानकारी के प्रबंधन के बारे में';

  @override
  String get tutorialTitle => 'ट्यूटोरियल';

  @override
  String get tutorialSubtitle => 'ऐप का उपयोग करना सीखें';

  @override
  String get dataManagement => 'डेटा प्रबंधन';

  @override
  String get deleteHistory => 'इतिहास हटाएं';

  @override
  String get deleteHistorySubtitle =>
      'केवल प्रशिक्षण इतिहास हटाएं (लक्ष्य पॉइंट सुरक्षित रहेंगे)';

  @override
  String get deleteHistoryAndGoal => 'इतिहास और लक्ष्य हटाएं';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'सारा इतिहास और लक्ष्य पॉइंट हटाएं';

  @override
  String get deleteHistoryConfirmTitle => 'इतिहास हटाएं';

  @override
  String get deleteHistoryConfirmMessage =>
      'क्या आप वाकई सारा प्रशिक्षण इतिहास हटाना चाहते हैं?\n\n*लक्ष्य पॉइंट सुरक्षित रहेंगे';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'इतिहास और लक्ष्य हटाएं';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'क्या आप वाकई सारा इतिहास और लक्ष्य पॉइंट हटाना चाहते हैं?\n\n*यह क्रिया पूर्ववत नहीं की जा सकती';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get delete => 'हटाएं';

  @override
  String get historyDeleted => 'इतिहास हटा दिया गया';

  @override
  String get historyAndGoalDeleted => 'इतिहास और लक्ष्य हटा दिए गए';

  @override
  String get historyDeleteFailed => 'इतिहास हटाने में विफल';

  @override
  String get historyAndGoalDeleteFailed => 'इतिहास और लक्ष्य हटाने में विफल';

  @override
  String get tutorialDisplayFailed => 'ट्यूटोरियल दिखाने में विफल';

  @override
  String get tips => 'सुझाव';

  @override
  String get tipsContent =>
      '• आपका लक्ष्य होम स्क्रीन के चार्ट में दिखता है\n• छोटे लक्ष्य से शुरू करें और अपनी गति से बढ़ाएँ\n• हर सही चुनाव पर अधिकतम 6 अंक मिलते हैं';

  @override
  String get backToHome => 'होम पर वापस जाएं';

  @override
  String get tutorialSkip => 'छोड़ें';

  @override
  String get tutorialGoalAndPoints => 'लक्ष्य और वर्तमान पॉइंट';

  @override
  String get tutorialGoalDescription =>
      'बाहरी वृत्त आपका लक्ष्य दिखाता है, भीतरी वृत्त कुल पॉइंट। लक्ष्य के करीब पहुंचने पर वृत्त भरता जाता है।';

  @override
  String get tutorialOneMinuteTraining => '1 मिनट का प्रशिक्षण';

  @override
  String get tutorialTrainingDescription =>
      '1 मिनट का गेम शुरू करें। 4 विकल्पों में से सकारात्मक छवियाँ या अच्छी आदतें चुनें।';

  @override
  String get tutorialScoreProgress => 'स्कोर प्रगति';

  @override
  String get tutorialScoreDescription =>
      'अपने अर्जित स्कोर की विस्तृत जानकारी देखें।';

  @override
  String get tutorialSettingsAndData => 'सेटिंग्स और डेटा प्रबंधन';

  @override
  String get tutorialSettingsDescription =>
      'लक्ष्य मान बदलें, ऐप जानकारी देखें और डेटा रीसेट करें।';

  @override
  String get appIntroAttentionBiasTitle => 'अटेंशन बायस के बारे में';

  @override
  String get appIntroAttentionBiasContent =>
      'जब चिंता अधिक होती है, तो हम अनजाने में केवल नकारात्मक चीज़ों पर ध्यान देने लगते हैं।';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMint की भूमिका';

  @override
  String get appIntroFocusMintRoleContent =>
      'सकारात्मक तस्वीरों की ओर ध्यान मोड़ने के अभ्यास के लिए एक छोटा खेल।';

  @override
  String get appIntroScientificEvidenceTitle => 'इस अभ्यास के बारे में';

  @override
  String get appIntroScientificEvidenceContent =>
      'सकारात्मक तस्वीरें ढूँढने का अभ्यास करें। FocusMint अपनी देखभाल के लिए एक साधन है, कोई चिकित्सीय उपचार नहीं। परिणाम हर व्यक्ति के लिए अलग हो सकते हैं।';

  @override
  String get appIntroExpectedEffectsTitle => 'आप क्या अभ्यास कर सकते हैं';

  @override
  String get appIntroEffect1 => 'सकारात्मक तस्वीरें ढूँढना';

  @override
  String get appIntroEffect2 => 'आसपास की मुस्कान पर ध्यान देना';

  @override
  String get appIntroEffect3 => 'रोज़ थोड़े समय का अभ्यास अपनाना';

  @override
  String get appIntroHowToUse => 'उपयोग विधि देखें';

  @override
  String get pointsEarned => 'पॉइंट मिले!';

  @override
  String get yourScore => 'आपका स्कोर';

  @override
  String get totalPlayTime => 'कुल खेल समय';

  @override
  String get imageManagement => 'छवि प्रबंधन';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'छिपी छवियाँ: $count/$max';
  }

  @override
  String get unsavedChanges => 'आपके पास सहेजे नहीं गए परिवर्तन हैं';

  @override
  String unsavedChangesMessage(Object count) {
    return 'छवि प्रदर्शन सेटिंग्स में आपके $count परिवर्तन सहेजे नहीं गए हैं।';
  }

  @override
  String get unsavedChangesWarning =>
      'अभी स्क्रीन बंद करने पर परिवर्तन खो जाएंगे।';

  @override
  String get discardChanges => 'परिवर्तन त्यागें';

  @override
  String get saveAndExit => 'सहेजें और बाहर निकलें';

  @override
  String settingsSaved(Object count) {
    return '$count सेटिंग्स सहेजी गईं';
  }

  @override
  String get saveError => 'सेटिंग्स सहेजते समय एक त्रुटि हुई';

  @override
  String get imageSettingsUpdated => 'छवि सेटिंग्स अपडेट कर दी गई हैं';

  @override
  String get allImages => 'सभी';

  @override
  String get positiveImages => 'सकारात्मक';

  @override
  String get negativeImages => 'नकारात्मक';

  @override
  String get smileImages => 'मुस्कान';

  @override
  String get vegetableImages => 'पौष्टिक भोजन';

  @override
  String get healthImages => 'व्यायाम और मेलजोल';

  @override
  String get sadImages => 'गुस्सा, उदासी और चिंता';

  @override
  String get badFoodImages => 'फास्ट फूड और मिठाइयाँ';

  @override
  String get badImages => 'अस्वस्थ आदतें';

  @override
  String get imageManagementHint =>
      'छवि दिखाने/छिपाने के लिए टैप करें। आप अधिकतम 15 छवियाँ छिपा सकते हैं।';

  @override
  String get unsaved => 'सहेजा नहीं गया';

  @override
  String get save => 'सहेजें';

  @override
  String get hiddenImages => 'छिपी हुई';

  @override
  String get noHiddenImages => 'कोई छिपी छवि नहीं';

  @override
  String get settingsLoadFailed => 'सेटिंग्स लोड करने में विफल';

  @override
  String imagesAdded(int count) {
    return '$count छवियाँ जोड़ी गईं';
  }

  @override
  String get imageAddFailed => 'छवियाँ जोड़ने में विफल';

  @override
  String get imageSelectionFailed => 'छवियाँ चुनने में विफल';

  @override
  String get settingsChangeFailed => 'सेटिंग्स बदलने में विफल';

  @override
  String groupTitle(String name) {
    return 'समूह: $name';
  }

  @override
  String get displayToggle => 'प्रदर्शन टॉगल';

  @override
  String imageCount(int count) {
    return '$count छवियाँ';
  }

  @override
  String get noticeTitle => 'महत्वपूर्ण जानकारी';

  @override
  String get notice1 => 'कस्टम छवि सुविधा जोड़ी गई है!';

  @override
  String get notice2 => 'आप सेटिंग्स स्क्रीन से अपनी छवियाँ जोड़ सकते हैं';

  @override
  String get notice3 => 'विवरण के लिए कृपया सेटिंग्स स्क्रीन देखें';

  @override
  String get customImageTitle => 'कस्टम छवियाँ';

  @override
  String get customImageSubtitle => 'अपनी छवियाँ जोड़ें और प्रबंधित करें';

  @override
  String get addCustomImages => 'कस्टम छवियाँ जोड़ें';

  @override
  String get selectImages => 'छवियाँ चुनें';

  @override
  String get unknownImage => 'अज्ञात छवि';

  @override
  String get customImageSettings => 'कस्टम छवि सेटिंग्स';

  @override
  String get useCustomImages => 'कस्टम छवियाँ उपयोग करें';

  @override
  String get useCustomImagesDescription =>
      'अभ्यास में अपनी तस्वीरों का उपयोग करें। ऐप की तस्वीरें भी शामिल करने के लिए नीचे मिलाने का विकल्प चालू करें।';

  @override
  String get groupSettings => 'समूह सेटिंग्स';

  @override
  String get minOneGroupRequired => 'कम से कम एक समूह सक्षम होना चाहिए';

  @override
  String get settingsLoadFailedMessage => 'सेटिंग्स लोड करने में विफल';

  @override
  String get customImageNotice1 =>
      'समूह सक्षम होने पर प्रत्येक समूह के लिए छवियाँ यादृच्छिक रूप से दिखाई जाती हैं।';

  @override
  String get customImageNotice2 =>
      'उपयोगकर्ताओं द्वारा अपलोड और सेट की गई छवियाँ डेवलपर या किसी तीसरे पक्ष के साथ साझा नहीं की जातीं और केवल डिवाइस पर ऐप के क्षेत्र में संग्रहीत रहती हैं।';

  @override
  String get customImageNotice3 => 'इससे ऑफ़लाइन उपयोग संभव होता है।';

  @override
  String get customImageNotice4 =>
      'बहुत सारी तस्वीरें जोड़ने से स्टोरेज भरता है। समस्या होने पर सेटिंग में अपनी तस्वीरों का उपयोग बंद करें या अनुपयोगी तस्वीरें हटाएँ।';

  @override
  String get customImageNotice5 => 'ऐप हटाने पर सेट की गई छवियाँ भी हट जाएंगी।';

  @override
  String get customImageRequirementNotMet =>
      'कस्टम छवियाँ उपयोग करने के लिए सक्षम समूहों में कम से कम 1 अच्छी छवि और 3 अच्छी-नहीं छवियाँ आवश्यक हैं।';

  @override
  String get customImageRequirement =>
      'कस्टम छवियाँ उपयोग करने के लिए सक्षम समूहों में कम से कम 1 अच्छी छवि और 3 अच्छी-नहीं छवियाँ आवश्यक हैं।';

  @override
  String get sunnyWeather => 'अच्छी';

  @override
  String get rainyWeather => 'अच्छी नहीं';

  @override
  String get addImages => 'छवियाँ जोड़ें';

  @override
  String get imageDeleted => 'छवि हटा दी गई';

  @override
  String get imageDeleteFailed => 'छवि हटाने में विफल';

  @override
  String get deleteImageTitle => 'छवि हटाएं';

  @override
  String get deleteImageMessage =>
      'क्या आप यह छवि हटाना चाहते हैं? यह क्रिया पूर्ववत नहीं की जा सकती।';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'समूह $groupId $weather छवियाँ';
  }

  @override
  String registeredCount(int count) {
    return 'पंजीकृत: $count छवियाँ';
  }

  @override
  String get noImagesRegistered => 'कोई छवि पंजीकृत नहीं';

  @override
  String get imagePreview => 'छवि पूर्वावलोकन';

  @override
  String get close => 'बंद करें';

  @override
  String get contactEmailSubject => 'FocusMint - संपर्क';

  @override
  String get contactEmailBody => 'कृपया अपनी प्रतिक्रिया और प्रश्न साझा करें।';

  @override
  String get mixWithBuiltInImages => 'ऐप की तस्वीरों के साथ मिलाएँ';

  @override
  String get mixWithBuiltInImagesDescription =>
      'अपनी तस्वीरें और ऐप की तस्वीरें साथ में उपयोग करें';

  @override
  String get supportIntro =>
      'अपनी पहचान बताए बिना डेवलपर से बात करें। सवाल और सुझाव भेज सकते हैं। रोज़ 3 संदेश भेजे जा सकते हैं। डेवलपर के हर जवाब के बाद उपलब्ध संदेशों की संख्या फिर से 3 हो जाती है।';

  @override
  String get supportReceived =>
      'संदेश मिल गया। हम आम तौर पर 2–3 दिनों में जवाब देते हैं।';

  @override
  String get supportComposer => 'संदेश लिखें';

  @override
  String get supportSend => 'भेजें';

  @override
  String get supportRetry => 'फिर कोशिश करें';

  @override
  String get supportSent => 'भेज दिया गया';

  @override
  String get supportUnsent => 'नहीं भेजा गया · इस डिवाइस पर सहेजा गया';

  @override
  String get supportAttach => 'तस्वीर जोड़ें';

  @override
  String get supportRemoveImage => 'तस्वीर हटाएँ';

  @override
  String get supportImage => 'संलग्नक';

  @override
  String get supportClear => 'बातचीत का इतिहास मिटाएँ';

  @override
  String get supportClearConfirm =>
      'यह बातचीत मिटाएँ? न भेजे गए ड्राफ्ट और सर्वर पर मौजूद इतिहास भी मिट जाएगा। इससे संदेशों की सीमा रीसेट नहीं होगी।';

  @override
  String get supportQuota =>
      'आज के 3 संदेश इस्तेमाल हो चुके हैं। कल या डेवलपर के जवाब के बाद फिर भेज सकते हैं।';

  @override
  String get supportConnectionError =>
      'कनेक्ट नहीं हो सका। सहेजे गए ड्राफ्ट नहीं भेजे गए हैं।';

  @override
  String get supportSendError =>
      'भेजा नहीं जा सका। संदेश इस डिवाइस पर सहेजा गया है। फिर कोशिश करें।';

  @override
  String get supportStorageError => 'सहेजा नहीं जा सका। फिर कोशिश करें।';

  @override
  String get supportClearError =>
      'इतिहास मिटाया नहीं जा सका। कनेक्शन जाँचकर फिर कोशिश करें।';

  @override
  String get supportImageError =>
      'तस्वीर लोड नहीं हो सकी। 30 MB से छोटी तस्वीर चुनें।';

  @override
  String supportRemaining(int count) {
    return 'आज उपलब्ध संदेश: $count';
  }

  @override
  String supportUnread(int count) {
    return 'बिना पढ़े जवाब: $count';
  }

  @override
  String get supportGuide => 'जानकारी';

  @override
  String get supportDeveloper => 'डेवलपर';

  @override
  String get supportPrivacy => 'सहायता अनुरोध के डेटा के बारे में';

  @override
  String get breathingTitle => 'एक शांत साँस लें';

  @override
  String get breathingHint =>
      'अपनी सहज गति से\nफेफड़ों की हल्की गति के साथ साँस लें।';

  @override
  String get breathingIn => 'धीरे साँस अंदर लें';

  @override
  String get breathingOut => 'धीरे साँस बाहर छोड़ें';

  @override
  String get breathingProgress => 'श्वास अभ्यास की प्रगति';

  @override
  String get breathingResultHint => 'समाप्त होने पर परिणाम अपने आप दिखेंगे।';

  @override
  String get breathingSkip => 'सीधे परिणाम देखें';
}
