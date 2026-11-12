// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Τρέχοντες πόντοι';

  @override
  String goalLabel(int goal) {
    return 'Στόχος: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Απομένουν: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Ο στόχος επιτεύχθηκε!';

  @override
  String get startButtonText => 'ΕΝΑΡΞΗ';

  @override
  String get stressReductionMessage =>
      'Εξασκηθείτε στο να παρατηρείτε το θετικό.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Υπολειπόμενος χρόνος: $minutes λ. $seconds δ.';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Υπολειπόμενος χρόνος: $seconds δ.';
  }

  @override
  String scoreLabel(String score) {
    return 'Σκορ: $score πόντοι';
  }

  @override
  String get imagePreparationMessage => 'Προετοιμασία εικόνων...';

  @override
  String get noStimuliAvailable => 'Δεν υπάρχουν διαθέσιμα ερεθίσματα';

  @override
  String get invalidGridSize => 'Μη έγκυρο μέγεθος πλέγματος';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Ξεκινάμε...';

  @override
  String get excellentPerformance => 'Εξαιρετική επίδοση!';

  @override
  String get greatJob => 'Πολύ καλή δουλειά!';

  @override
  String get goodPerformance => 'Καλή επίδοση';

  @override
  String get keepPracticingFeedback => 'Συνεχίστε την εξάσκηση';

  @override
  String get takeYourTimeFeedback => 'Με την ησυχία σας';

  @override
  String get happy => 'Χαρούμενος';

  @override
  String get angry => 'Θυμωμένος';

  @override
  String get fear => 'Φόβος';

  @override
  String get sad => 'Λυπημένος';

  @override
  String get historyPageTitle => 'Ιστορικό προπόνησης';

  @override
  String get dataLoading => 'Φόρτωση δεδομένων...';

  @override
  String get pointsHistory => 'Ιστορικό πόντων';

  @override
  String get weekly => 'Εβδομαδιαία';

  @override
  String get monthly => 'Μηνιαία';

  @override
  String get noDataAvailable => 'Δεν υπάρχουν δεδομένα';

  @override
  String get goalAchievementRate => 'Ποσοστό επίτευξης στόχου';

  @override
  String get scoreStatistics => 'Στατιστικά σκορ';

  @override
  String get bestScore => 'Καλύτερο σκορ';

  @override
  String get totalScore => 'Συνολικό σκορ';

  @override
  String get trainingTime => 'Χρόνος προπόνησης';

  @override
  String get totalTrainingTime => 'Συνολικός χρόνος προπόνησης';

  @override
  String get detailedStatistics => 'Αναλυτικά στατιστικά';

  @override
  String get averageScorePerMinute => 'Μέσο σκορ ανά λεπτό';

  @override
  String get pointsToGoal => 'Πόντοι έως τον στόχο';

  @override
  String get goalSetting => 'Ορισμός στόχου';

  @override
  String get secondsUnit => 'δ.';

  @override
  String get minutesUnit => 'λ.';

  @override
  String get hoursUnit => 'ώ.';

  @override
  String get pointsUnit => 'πόντοι';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Κυρ';

  @override
  String get mondayShort => 'Δευ';

  @override
  String get tuesdayShort => 'Τρί';

  @override
  String get wednesdayShort => 'Τετ';

  @override
  String get thursdayShort => 'Πέμ';

  @override
  String get fridayShort => 'Παρ';

  @override
  String get saturdayShort => 'Σάβ';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get goalPointsSetting => 'Ορισμός πόντων στόχου';

  @override
  String currentGoalPoints(int points) {
    return 'Τρέχων στόχος: $points πόντοι';
  }

  @override
  String get newGoalPointsLabel => 'Νέοι πόντοι στόχου';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'πόντοι';

  @override
  String get saveGoalButton => 'Αποθήκευση στόχου';

  @override
  String goalSetTo(int points) {
    return 'Ο στόχος ορίστηκε σε $points πόντους';
  }

  @override
  String get enterGoalPoints => 'Εισαγάγετε τους πόντους στόχου';

  @override
  String get enterValidNumber =>
      'Εισαγάγετε έναν έγκυρο αριθμό (1 έως 99999999)';

  @override
  String get saveFailed => 'Η αποθήκευση ορισμένων ρυθμίσεων απέτυχε';

  @override
  String get emailOpenFailed =>
      'Δεν ήταν δυνατό το άνοιγμα της εφαρμογής email';

  @override
  String get pageOpenFailed => 'Δεν ήταν δυνατό το άνοιγμα της σελίδας';

  @override
  String get appInfoSupport => 'Πληροφορίες εφαρμογής και υποστήριξη';

  @override
  String get contactUs => 'Επικοινωνήστε μαζί μας';

  @override
  String get contactUsSubtitle => 'Μοιραστείτε τα σχόλια και τις ερωτήσεις σας';

  @override
  String get termsOfService => 'Όροι χρήσης';

  @override
  String get termsSubtitle => 'Δείτε τους όρους χρήσης της εφαρμογής';

  @override
  String get privacyPolicy => 'Πολιτική απορρήτου';

  @override
  String get privacySubtitle =>
      'Σχετικά με τη διαχείριση των προσωπικών δεδομένων';

  @override
  String get tutorialTitle => 'Οδηγός χρήσης';

  @override
  String get tutorialSubtitle => 'Μάθετε πώς να χρησιμοποιείτε την εφαρμογή';

  @override
  String get dataManagement => 'Διαχείριση δεδομένων';

  @override
  String get deleteHistory => 'Διαγραφή ιστορικού';

  @override
  String get deleteHistorySubtitle =>
      'Διαγραφή μόνο του ιστορικού προπόνησης (οι πόντοι στόχου διατηρούνται)';

  @override
  String get deleteHistoryAndGoal => 'Διαγραφή ιστορικού και στόχου';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Διαγραφή όλου του ιστορικού και των πόντων στόχου';

  @override
  String get deleteHistoryConfirmTitle => 'Διαγραφή ιστορικού';

  @override
  String get deleteHistoryConfirmMessage =>
      'Θέλετε σίγουρα να διαγράψετε όλο το ιστορικό προπόνησης;\n\n*Οι πόντοι στόχου θα διατηρηθούν';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Διαγραφή ιστορικού και στόχου';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Θέλετε σίγουρα να διαγράψετε όλο το ιστορικό και τους πόντους στόχου;\n\n*Αυτή η ενέργεια δεν μπορεί να αναιρεθεί';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get historyDeleted => 'Το ιστορικό διαγράφηκε';

  @override
  String get historyAndGoalDeleted => 'Το ιστορικό και ο στόχος διαγράφηκαν';

  @override
  String get historyDeleteFailed => 'Η διαγραφή του ιστορικού απέτυχε';

  @override
  String get historyAndGoalDeleteFailed =>
      'Η διαγραφή του ιστορικού και του στόχου απέτυχε';

  @override
  String get tutorialDisplayFailed => 'Η εμφάνιση του οδηγού απέτυχε';

  @override
  String get tips => 'Συμβουλές';

  @override
  String get tipsContent =>
      '• Ο στόχος σας εμφανίζεται στο γράφημα της αρχικής οθόνης\n• Ξεκινήστε με μικρό στόχο και αυξήστε τον με τον δικό σας ρυθμό\n• Κάθε σωστή επιλογή δίνει έως 6 πόντους';

  @override
  String get backToHome => 'Επιστροφή στην αρχική';

  @override
  String get tutorialSkip => 'Παράλειψη';

  @override
  String get tutorialGoalAndPoints => 'Στόχος και τρέχοντες πόντοι';

  @override
  String get tutorialGoalDescription =>
      'Ο εξωτερικός κύκλος δείχνει τον στόχο σας και ο εσωτερικός τους συνολικούς πόντους. Ο κύκλος γεμίζει καθώς πλησιάζετε τον στόχο σας.';

  @override
  String get tutorialOneMinuteTraining => 'Προπόνηση 1 λεπτού';

  @override
  String get tutorialTrainingDescription =>
      'Ξεκινήστε ένα παιχνίδι 1 λεπτού. Επιλέξτε θετικές εικόνες ή καλές συνήθειες από 4 επιλογές.';

  @override
  String get tutorialScoreProgress => 'Εξέλιξη σκορ';

  @override
  String get tutorialScoreDescription =>
      'Δείτε αναλυτικές πληροφορίες για τα σκορ που έχετε κερδίσει.';

  @override
  String get tutorialSettingsAndData => 'Ρυθμίσεις και διαχείριση δεδομένων';

  @override
  String get tutorialSettingsDescription =>
      'Αλλάξτε τις τιμές στόχου, δείτε πληροφορίες για την εφαρμογή και επαναφέρετε τα δεδομένα.';

  @override
  String get appIntroAttentionBiasTitle =>
      'Σχετικά με την προκατάληψη προσοχής';

  @override
  String get appIntroAttentionBiasContent =>
      'Όταν το άγχος είναι έντονο, τείνουμε ασυναίσθητα να εστιάζουμε μόνο στα αρνητικά.';

  @override
  String get appIntroFocusMintRoleTitle => 'Ο ρόλος του FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Ένα σύντομο παιχνίδι για εξάσκηση στην εστίαση της προσοχής σε θετικές εικόνες.';

  @override
  String get appIntroScientificEvidenceTitle => 'Σχετικά με αυτή την άσκηση';

  @override
  String get appIntroScientificEvidenceContent =>
      'Εξασκηθείτε στην εύρεση θετικών εικόνων. Το FocusMint είναι εργαλείο αυτοφροντίδας, όχι ιατρική θεραπεία. Τα αποτελέσματα διαφέρουν από άτομο σε άτομο.';

  @override
  String get appIntroExpectedEffectsTitle => 'Τι μπορείτε να εξασκήσετε';

  @override
  String get appIntroEffect1 => 'Αναζήτηση θετικών εικόνων';

  @override
  String get appIntroEffect2 => 'Παρατήρηση των χαμόγελων γύρω σας';

  @override
  String get appIntroEffect3 =>
      'Δημιουργία μιας σύντομης καθημερινής συνήθειας';

  @override
  String get appIntroHowToUse => 'Δείτε πώς λειτουργεί';

  @override
  String get pointsEarned => 'Κερδίσατε πόντους!';

  @override
  String get yourScore => 'Το σκορ σας';

  @override
  String get totalPlayTime => 'Συνολικός χρόνος παιχνιδιού';

  @override
  String get imageManagement => 'Διαχείριση εικόνων';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Κρυφές εικόνες: $count/$max';
  }

  @override
  String get unsavedChanges => 'Έχετε μη αποθηκευμένες αλλαγές';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Έχετε $count μη αποθηκευμένες αλλαγές στις ρυθμίσεις εμφάνισης εικόνων.';
  }

  @override
  String get unsavedChangesWarning =>
      'Οι αλλαγές θα χαθούν αν κλείσετε τώρα αυτήν την οθόνη.';

  @override
  String get discardChanges => 'Απόρριψη αλλαγών';

  @override
  String get saveAndExit => 'Αποθήκευση και έξοδος';

  @override
  String settingsSaved(Object count) {
    return 'Αποθηκεύτηκαν $count ρυθμίσεις';
  }

  @override
  String get saveError =>
      'Παρουσιάστηκε σφάλμα κατά την αποθήκευση των ρυθμίσεων';

  @override
  String get imageSettingsUpdated => 'Οι ρυθμίσεις εικόνων ενημερώθηκαν';

  @override
  String get allImages => 'Όλες';

  @override
  String get positiveImages => 'Θετικές';

  @override
  String get negativeImages => 'Αρνητικές';

  @override
  String get smileImages => 'Χαμόγελο';

  @override
  String get vegetableImages => 'Θρεπτικές τροφές';

  @override
  String get healthImages => 'Κίνηση και κοινωνική επαφή';

  @override
  String get sadImages => 'Θυμός, θλίψη και ανησυχία';

  @override
  String get badFoodImages => 'Γρήγορο φαγητό και γλυκά';

  @override
  String get badImages => 'Ανθυγιεινές συνήθειες';

  @override
  String get imageManagementHint =>
      'Πατήστε για εμφάνιση ή απόκρυψη εικόνας. Μπορείτε να αποκρύψετε έως 15 εικόνες.';

  @override
  String get unsaved => 'Μη αποθηκευμένο';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get hiddenImages => 'Κρυφές';

  @override
  String get noHiddenImages => 'Δεν υπάρχουν κρυφές εικόνες';

  @override
  String get settingsLoadFailed => 'Η φόρτωση των ρυθμίσεων απέτυχε';

  @override
  String imagesAdded(int count) {
    return 'Προστέθηκαν $count εικόνες';
  }

  @override
  String get imageAddFailed => 'Η προσθήκη εικόνων απέτυχε';

  @override
  String get imageSelectionFailed => 'Η επιλογή εικόνων απέτυχε';

  @override
  String get settingsChangeFailed => 'Η αλλαγή των ρυθμίσεων απέτυχε';

  @override
  String groupTitle(String name) {
    return 'Ομάδα: $name';
  }

  @override
  String get displayToggle => 'Εναλλαγή εμφάνισης';

  @override
  String imageCount(int count) {
    return '$count εικόνες';
  }

  @override
  String get noticeTitle => 'Σημαντικές σημειώσεις';

  @override
  String get notice1 => 'Προστέθηκε η δυνατότητα προσαρμοσμένων εικόνων!';

  @override
  String get notice2 =>
      'Μπορείτε να προσθέσετε δικές σας εικόνες από την οθόνη ρυθμίσεων';

  @override
  String get notice3 => 'Για λεπτομέρειες, ανατρέξτε στην οθόνη ρυθμίσεων';

  @override
  String get customImageTitle => 'Προσαρμοσμένες εικόνες';

  @override
  String get customImageSubtitle =>
      'Προσθέστε και διαχειριστείτε δικές σας εικόνες';

  @override
  String get addCustomImages => 'Προσθήκη προσαρμοσμένων εικόνων';

  @override
  String get selectImages => 'Επιλογή εικόνων';

  @override
  String get unknownImage => 'Άγνωστη εικόνα';

  @override
  String get customImageSettings => 'Ρυθμίσεις προσαρμοσμένων εικόνων';

  @override
  String get useCustomImages => 'Χρήση προσαρμοσμένων εικόνων';

  @override
  String get useCustomImagesDescription =>
      'Χρησιμοποιήστε τις δικές σας εικόνες στην άσκηση. Ενεργοποιήστε την ανάμειξη παρακάτω για να συμπεριλάβετε και τις εικόνες της εφαρμογής.';

  @override
  String get groupSettings => 'Ρυθμίσεις ομάδων';

  @override
  String get minOneGroupRequired =>
      'Πρέπει να είναι ενεργοποιημένη τουλάχιστον μία ομάδα';

  @override
  String get settingsLoadFailedMessage => 'Η φόρτωση των ρυθμίσεων απέτυχε';

  @override
  String get customImageNotice1 =>
      'Όταν οι ομάδες είναι ενεργοποιημένες, οι εικόνες εμφανίζονται τυχαία για κάθε ομάδα.';

  @override
  String get customImageNotice2 =>
      'Οι εικόνες που ανεβάζουν και ορίζουν οι χρήστες δεν κοινοποιούνται στους προγραμματιστές ή σε τρίτους και αποθηκεύονται μόνο στον χώρο της εφαρμογής στη συσκευή.';

  @override
  String get customImageNotice3 => 'Έτσι είναι δυνατή η χρήση εκτός σύνδεσης.';

  @override
  String get customImageNotice4 =>
      'Η προσθήκη πολλών εικόνων καταλαμβάνει αποθηκευτικό χώρο. Αν παρουσιαστεί πρόβλημα, απενεργοποιήστε τις προσωπικές εικόνες ή αφαιρέστε όσες δεν χρησιμοποιείτε από τις ρυθμίσεις.';

  @override
  String get customImageNotice5 =>
      'Όταν διαγράψετε την εφαρμογή, οι ορισμένες εικόνες θα διαγραφούν.';

  @override
  String get customImageRequirementNotMet =>
      'Για να χρησιμοποιήσετε προσαρμοσμένες εικόνες, χρειάζεστε τουλάχιστον 1 καλή εικόνα και 3 όχι καλές εικόνες στις ενεργοποιημένες ομάδες.';

  @override
  String get customImageRequirement =>
      'Για να χρησιμοποιήσετε προσαρμοσμένες εικόνες, χρειάζεστε τουλάχιστον 1 καλή εικόνα και 3 όχι καλές εικόνες στις ενεργοποιημένες ομάδες.';

  @override
  String get sunnyWeather => 'Καλές';

  @override
  String get rainyWeather => 'Όχι καλές';

  @override
  String get addImages => 'Προσθήκη εικόνων';

  @override
  String get imageDeleted => 'Η εικόνα διαγράφηκε';

  @override
  String get imageDeleteFailed => 'Η διαγραφή της εικόνας απέτυχε';

  @override
  String get deleteImageTitle => 'Διαγραφή εικόνας';

  @override
  String get deleteImageMessage =>
      'Θέλετε να διαγράψετε αυτήν την εικόνα; Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Ομάδα $groupId – $weather εικόνες';
  }

  @override
  String registeredCount(int count) {
    return 'Καταχωρισμένες: $count εικόνες';
  }

  @override
  String get noImagesRegistered => 'Δεν έχουν καταχωριστεί εικόνες';

  @override
  String get imagePreview => 'Προεπισκόπηση εικόνας';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get contactEmailSubject => 'FocusMint - Επικοινωνία';

  @override
  String get contactEmailBody =>
      'Μοιραστείτε μαζί μας τα σχόλια και τις ερωτήσεις σας.';

  @override
  String get mixWithBuiltInImages => 'Ανάμειξη με εικόνες της εφαρμογής';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Χρήση των δικών σας εικόνων μαζί με τις εικόνες της εφαρμογής';

  @override
  String get supportIntro =>
      'Επικοινωνήστε ανώνυμα με τον προγραμματιστή. Ερωτήσεις και προτάσεις είναι ευπρόσδεκτες. Μπορείτε να στείλετε 3 μηνύματα την ημέρα. Κάθε απάντηση του προγραμματιστή επαναφέρει το διαθέσιμο όριο στα 3.';

  @override
  String get supportReceived =>
      'Το μήνυμα ελήφθη. Συνήθως απαντάμε εντός 2–3 ημερών.';

  @override
  String get supportComposer => 'Γράψτε ένα μήνυμα';

  @override
  String get supportSend => 'Αποστολή';

  @override
  String get supportRetry => 'Νέα προσπάθεια';

  @override
  String get supportSent => 'Εστάλη';

  @override
  String get supportUnsent => 'Δεν εστάλη · αποθηκεύτηκε σε αυτή τη συσκευή';

  @override
  String get supportAttach => 'Επισύναψη εικόνας';

  @override
  String get supportRemoveImage => 'Αφαίρεση εικόνας';

  @override
  String get supportImage => 'Συνημμένο';

  @override
  String get supportClear => 'Διαγραφή ιστορικού';

  @override
  String get supportClearConfirm =>
      'Να διαγραφεί αυτή η συνομιλία; Θα διαγραφούν επίσης τα μη απεσταλμένα πρόχειρα και το ιστορικό στον διακομιστή. Το όριο μηνυμάτων δεν επαναφέρεται.';

  @override
  String get supportQuota =>
      'Χρησιμοποιήσατε τα 3 σημερινά μηνύματα. Στείλτε νέο αύριο ή μετά από απάντηση του προγραμματιστή.';

  @override
  String get supportConnectionError =>
      'Η σύνδεση απέτυχε. Τα αποθηκευμένα πρόχειρα δεν έχουν σταλεί.';

  @override
  String get supportSendError =>
      'Η αποστολή απέτυχε. Το μήνυμα αποθηκεύτηκε σε αυτή τη συσκευή. Δοκιμάστε ξανά.';

  @override
  String get supportStorageError => 'Η αποθήκευση απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get supportClearError =>
      'Δεν ήταν δυνατή η διαγραφή του ιστορικού. Ελέγξτε τη σύνδεση και δοκιμάστε ξανά.';

  @override
  String get supportImageError =>
      'Δεν ήταν δυνατή η φόρτωση της εικόνας. Επιλέξτε εικόνα μικρότερη από 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Διαθέσιμα μηνύματα σήμερα: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Μη αναγνωσμένες απαντήσεις: $count';
  }

  @override
  String get supportGuide => 'Πληροφορίες';

  @override
  String get supportDeveloper => 'Προγραμματιστής';

  @override
  String get supportPrivacy => 'Δεδομένα επικοινωνίας με την υποστήριξη';

  @override
  String get breathingTitle => 'Πάρτε μια ήρεμη ανάσα';

  @override
  String get breathingHint =>
      'Ακολουθήστε την απαλή κίνηση των πνευμόνων\nμε άνετο ρυθμό.';

  @override
  String get breathingIn => 'Εισπνεύστε αργά';

  @override
  String get breathingOut => 'Εκπνεύστε αργά';

  @override
  String get breathingProgress => 'Πρόοδος της άσκησης αναπνοής';

  @override
  String get breathingResultHint =>
      'Τα αποτελέσματά σας θα εμφανιστούν αυτόματα.';

  @override
  String get breathingSkip => 'Μετάβαση στα αποτελέσματα';
}
