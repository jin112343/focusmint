// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Puncte actuale';

  @override
  String goalLabel(int goal) {
    return 'Obiectiv: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Rămas: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Obiectiv atins!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage =>
      'Exersează observarea lucrurilor pozitive.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Timp rămas: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Timp rămas: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Scor: $score puncte';
  }

  @override
  String get imagePreparationMessage => 'Se pregătesc imaginile...';

  @override
  String get noStimuliAvailable => 'Niciun stimul disponibil';

  @override
  String get invalidGridSize => 'Dimensiune nevalidă a grilei';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Se începe...';

  @override
  String get excellentPerformance => 'Performanță excelentă!';

  @override
  String get greatJob => 'Foarte bine!';

  @override
  String get goodPerformance => 'Performanță bună';

  @override
  String get keepPracticingFeedback => 'Continuați să exersați';

  @override
  String get takeYourTimeFeedback => 'Nu vă grăbiți';

  @override
  String get happy => 'Fericit';

  @override
  String get angry => 'Furios';

  @override
  String get fear => 'Frică';

  @override
  String get sad => 'Trist';

  @override
  String get historyPageTitle => 'Istoricul antrenamentelor';

  @override
  String get dataLoading => 'Se încarcă datele...';

  @override
  String get pointsHistory => 'Istoricul punctelor';

  @override
  String get weekly => 'Săptămânal';

  @override
  String get monthly => 'Lunar';

  @override
  String get noDataAvailable => 'Nu există date disponibile';

  @override
  String get goalAchievementRate => 'Rata de atingere a obiectivului';

  @override
  String get scoreStatistics => 'Statistici scor';

  @override
  String get bestScore => 'Cel mai bun scor';

  @override
  String get totalScore => 'Scor total';

  @override
  String get trainingTime => 'Timp de antrenament';

  @override
  String get totalTrainingTime => 'Timp total de antrenament';

  @override
  String get detailedStatistics => 'Statistici detaliate';

  @override
  String get averageScorePerMinute => 'Scor mediu pe minut';

  @override
  String get pointsToGoal => 'Puncte până la obiectiv';

  @override
  String get goalSetting => 'Setarea obiectivului';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'puncte';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dum';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mie';

  @override
  String get thursdayShort => 'Joi';

  @override
  String get fridayShort => 'Vin';

  @override
  String get saturdayShort => 'Sâm';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get goalPointsSetting => 'Setarea punctelor obiectiv';

  @override
  String currentGoalPoints(int points) {
    return 'Obiectiv actual: $points puncte';
  }

  @override
  String get newGoalPointsLabel => 'Puncte obiectiv noi';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'puncte';

  @override
  String get saveGoalButton => 'Salvați obiectivul';

  @override
  String goalSetTo(int points) {
    return 'Obiectiv setat la $points puncte';
  }

  @override
  String get enterGoalPoints => 'Introduceți punctele obiectiv';

  @override
  String get enterValidNumber =>
      'Introduceți un număr valid (între 1 și 99999999)';

  @override
  String get saveFailed => 'Unele setări nu au putut fi salvate';

  @override
  String get emailOpenFailed => 'Aplicația de e-mail nu a putut fi deschisă';

  @override
  String get pageOpenFailed => 'Pagina nu a putut fi deschisă';

  @override
  String get appInfoSupport => 'Informații despre aplicație și asistență';

  @override
  String get contactUs => 'Contactați-ne';

  @override
  String get contactUsSubtitle => 'Împărtășiți-ne părerile și întrebările dvs.';

  @override
  String get termsOfService => 'Termeni și condiții';

  @override
  String get termsSubtitle => 'Consultați termenii și condițiile aplicației';

  @override
  String get privacyPolicy => 'Politica de confidențialitate';

  @override
  String get privacySubtitle => 'Despre gestionarea informațiilor private';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Aflați cum se folosește aplicația';

  @override
  String get dataManagement => 'Gestionarea datelor';

  @override
  String get deleteHistory => 'Ștergeți istoricul';

  @override
  String get deleteHistorySubtitle =>
      'Șterge doar istoricul antrenamentelor (punctele obiectiv sunt păstrate)';

  @override
  String get deleteHistoryAndGoal => 'Ștergeți istoricul și obiectivul';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Șterge tot istoricul și punctele obiectiv';

  @override
  String get deleteHistoryConfirmTitle => 'Ștergeți istoricul';

  @override
  String get deleteHistoryConfirmMessage =>
      'Sigur doriți să ștergeți tot istoricul antrenamentelor?\n\n*Punctele obiectiv vor fi păstrate';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Ștergeți istoricul și obiectivul';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Sigur doriți să ștergeți tot istoricul și punctele obiectiv?\n\n*Această acțiune nu poate fi anulată';

  @override
  String get cancel => 'Anulare';

  @override
  String get delete => 'Ștergere';

  @override
  String get historyDeleted => 'Istoricul a fost șters';

  @override
  String get historyAndGoalDeleted => 'Istoricul și obiectivul au fost șterse';

  @override
  String get historyDeleteFailed => 'Ștergerea istoricului a eșuat';

  @override
  String get historyAndGoalDeleteFailed =>
      'Ștergerea istoricului și a obiectivului a eșuat';

  @override
  String get tutorialDisplayFailed => 'Afișarea tutorialului a eșuat';

  @override
  String get tips => 'Sfaturi';

  @override
  String get tipsContent =>
      '• Obiectivul apare în graficul de pe ecranul principal\n• Începe cu un obiectiv mic și mărește-l în ritmul tău\n• Fiecare alegere corectă aduce până la 6 puncte';

  @override
  String get backToHome => 'Înapoi la ecranul principal';

  @override
  String get tutorialSkip => 'Omiteți';

  @override
  String get tutorialGoalAndPoints => 'Obiectivul și punctele actuale';

  @override
  String get tutorialGoalDescription =>
      'Cercul exterior arată obiectivul, iar cel interior punctele totale. Cercul se umple pe măsură ce vă apropiați de obiectiv.';

  @override
  String get tutorialOneMinuteTraining => 'Antrenament de 1 minut';

  @override
  String get tutorialTrainingDescription =>
      'Începeți un joc de 1 minut. Alegeți imagini pozitive sau obiceiuri bune din 4 opțiuni.';

  @override
  String get tutorialScoreProgress => 'Evoluția scorului';

  @override
  String get tutorialScoreDescription =>
      'Vizualizați informații detaliate despre scorurile obținute.';

  @override
  String get tutorialSettingsAndData => 'Setări și gestionarea datelor';

  @override
  String get tutorialSettingsDescription =>
      'Modificați obiectivul, consultați informațiile despre aplicație și resetați datele.';

  @override
  String get appIntroAttentionBiasTitle => 'Despre biasul atențional';

  @override
  String get appIntroAttentionBiasContent =>
      'Când anxietatea este ridicată, avem tendința inconștientă de a observa doar lucrurile negative.';

  @override
  String get appIntroFocusMintRoleTitle => 'Rolul FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Un joc scurt pentru a exersa orientarea atenției către imagini pozitive.';

  @override
  String get appIntroScientificEvidenceTitle => 'Despre acest exercițiu';

  @override
  String get appIntroScientificEvidenceContent =>
      'Exersează găsirea imaginilor pozitive. FocusMint este un instrument de îngrijire personală, nu un tratament medical. Rezultatele pot varia de la o persoană la alta.';

  @override
  String get appIntroExpectedEffectsTitle => 'Ce poți exersa';

  @override
  String get appIntroEffect1 => 'Căutarea imaginilor pozitive';

  @override
  String get appIntroEffect2 => 'Observarea zâmbetelor din jur';

  @override
  String get appIntroEffect3 => 'Crearea unei scurte rutine zilnice';

  @override
  String get appIntroHowToUse => 'Vedeți cum se folosește';

  @override
  String get pointsEarned => 'Puncte câștigate!';

  @override
  String get yourScore => 'Scorul dvs.';

  @override
  String get totalPlayTime => 'Timp total de joc';

  @override
  String get imageManagement => 'Gestionarea imaginilor';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Imagini ascunse: $count/$max';
  }

  @override
  String get unsavedChanges => 'Aveți modificări nesalvate';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Aveți $count modificări nesalvate la setările de afișare a imaginilor.';
  }

  @override
  String get unsavedChangesWarning =>
      'Modificările se vor pierde dacă închideți acest ecran acum.';

  @override
  String get discardChanges => 'Renunțați la modificări';

  @override
  String get saveAndExit => 'Salvați și ieșiți';

  @override
  String settingsSaved(Object count) {
    return '$count setări salvate';
  }

  @override
  String get saveError => 'A apărut o eroare la salvarea setărilor';

  @override
  String get imageSettingsUpdated => 'Setările imaginilor au fost actualizate';

  @override
  String get allImages => 'Toate';

  @override
  String get positiveImages => 'Pozitive';

  @override
  String get negativeImages => 'Negative';

  @override
  String get smileImages => 'Zâmbete';

  @override
  String get vegetableImages => 'Alimente hrănitoare';

  @override
  String get healthImages => 'Mișcare și socializare';

  @override
  String get sadImages => 'Furie, tristețe și îngrijorare';

  @override
  String get badFoodImages => 'Fast-food și dulciuri';

  @override
  String get badImages => 'Obiceiuri nesănătoase';

  @override
  String get imageManagementHint =>
      'Atingeți pentru a afișa sau ascunde imaginile. Puteți ascunde până la 15 imagini.';

  @override
  String get unsaved => 'Nesalvat';

  @override
  String get save => 'Salvare';

  @override
  String get hiddenImages => 'Ascunse';

  @override
  String get noHiddenImages => 'Nicio imagine ascunsă';

  @override
  String get settingsLoadFailed => 'Încărcarea setărilor a eșuat';

  @override
  String imagesAdded(int count) {
    return '$count imagini adăugate';
  }

  @override
  String get imageAddFailed => 'Adăugarea imaginilor a eșuat';

  @override
  String get imageSelectionFailed => 'Selectarea imaginilor a eșuat';

  @override
  String get settingsChangeFailed => 'Modificarea setărilor a eșuat';

  @override
  String groupTitle(String name) {
    return 'Grup: $name';
  }

  @override
  String get displayToggle => 'Comutare afișare';

  @override
  String imageCount(int count) {
    return '$count imagini';
  }

  @override
  String get noticeTitle => 'Note importante';

  @override
  String get notice1 => 'A fost adăugată funcția de imagini personalizate!';

  @override
  String get notice2 => 'Puteți adăuga propriile imagini din ecranul de setări';

  @override
  String get notice3 => 'Consultați ecranul de setări pentru detalii';

  @override
  String get customImageTitle => 'Imagini personalizate';

  @override
  String get customImageSubtitle => 'Adăugați și gestionați propriile imagini';

  @override
  String get addCustomImages => 'Adăugați imagini personalizate';

  @override
  String get selectImages => 'Selectați imagini';

  @override
  String get unknownImage => 'Imagine necunoscută';

  @override
  String get customImageSettings => 'Setări imagini personalizate';

  @override
  String get useCustomImages => 'Folosiți imagini personalizate';

  @override
  String get useCustomImagesDescription =>
      'Folosește imaginile tale pentru exercițiu. Activează combinarea de mai jos pentru a include și imaginile aplicației.';

  @override
  String get groupSettings => 'Setări grupuri';

  @override
  String get minOneGroupRequired => 'Cel puțin un grup trebuie să fie activat';

  @override
  String get settingsLoadFailedMessage => 'Încărcarea setărilor a eșuat';

  @override
  String get customImageNotice1 =>
      'Când grupurile sunt activate, imaginile sunt afișate aleatoriu pentru fiecare grup.';

  @override
  String get customImageNotice2 =>
      'Imaginile încărcate și setate de utilizator nu sunt partajate cu dezvoltatorii sau cu terți și sunt stocate doar în zona aplicației de pe dispozitiv.';

  @override
  String get customImageNotice3 =>
      'Astfel, aplicația poate fi folosită offline.';

  @override
  String get customImageNotice4 =>
      'Adăugarea multor imagini ocupă spațiu de stocare. Dacă apar probleme, dezactivează imaginile personale sau șterge imaginile nefolosite din setări.';

  @override
  String get customImageNotice5 =>
      'Când ștergeți aplicația, imaginile setate vor fi șterse.';

  @override
  String get customImageRequirementNotMet =>
      'Pentru a folosi imagini personalizate, aveți nevoie de cel puțin o imagine din categoria „Bune” și 3 imagini din categoria „Mai puțin bune” în grupurile activate.';

  @override
  String get customImageRequirement =>
      'Pentru a folosi imagini personalizate, aveți nevoie de cel puțin o imagine din categoria „Bune” și 3 imagini din categoria „Mai puțin bune” în grupurile activate.';

  @override
  String get sunnyWeather => 'Bune';

  @override
  String get rainyWeather => 'Mai puțin bune';

  @override
  String get addImages => 'Adăugați imagini';

  @override
  String get imageDeleted => 'Imaginea a fost ștearsă';

  @override
  String get imageDeleteFailed => 'Ștergerea imaginii a eșuat';

  @override
  String get deleteImageTitle => 'Ștergeți imaginea';

  @override
  String get deleteImageMessage =>
      'Doriți să ștergeți această imagine? Această acțiune nu poate fi anulată.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Grupul $groupId – imagini „$weather”';
  }

  @override
  String registeredCount(int count) {
    return 'Înregistrate: $count imagini';
  }

  @override
  String get noImagesRegistered => 'Nicio imagine înregistrată';

  @override
  String get imagePreview => 'Previzualizare imagine';

  @override
  String get close => 'Închidere';

  @override
  String get contactEmailSubject => 'FocusMint - Contact';

  @override
  String get contactEmailBody =>
      'Vă rugăm să ne împărtășiți părerile și întrebările dvs.';

  @override
  String get mixWithBuiltInImages => 'Combină cu imaginile aplicației';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Folosește imaginile tale împreună cu cele ale aplicației';

  @override
  String get supportIntro =>
      'Discută anonim cu dezvoltatorul. Întrebările și sugestiile sunt binevenite. Poți trimite 3 mesaje pe zi. Fiecare răspuns al dezvoltatorului restabilește limita disponibilă la 3.';

  @override
  String get supportReceived =>
      'Mesaj primit. De obicei răspundem în 2–3 zile.';

  @override
  String get supportComposer => 'Scrie un mesaj';

  @override
  String get supportSend => 'Trimite';

  @override
  String get supportRetry => 'Încearcă din nou';

  @override
  String get supportSent => 'Trimis';

  @override
  String get supportUnsent => 'Netrimis · salvat pe acest dispozitiv';

  @override
  String get supportAttach => 'Atașează o imagine';

  @override
  String get supportRemoveImage => 'Elimină imaginea';

  @override
  String get supportImage => 'Atașament';

  @override
  String get supportClear => 'Șterge istoricul';

  @override
  String get supportClearConfirm =>
      'Ștergi această conversație? Vor fi șterse și ciornele netrimise și istoricul de pe server. Limita de mesaje nu se restabilește.';

  @override
  String get supportQuota =>
      'Ai folosit cele 3 mesaje de astăzi. Poți trimite altul mâine sau după un răspuns al dezvoltatorului.';

  @override
  String get supportConnectionError =>
      'Conectarea nu a reușit. Ciornele salvate nu au fost trimise.';

  @override
  String get supportSendError =>
      'Trimiterea nu a reușit. Mesajul este salvat pe acest dispozitiv. Încearcă din nou.';

  @override
  String get supportStorageError => 'Salvarea nu a reușit. Încearcă din nou.';

  @override
  String get supportClearError =>
      'Istoricul nu a putut fi șters. Verifică conexiunea și încearcă din nou.';

  @override
  String get supportImageError =>
      'Imaginea nu a putut fi încărcată. Alege o imagine mai mică de 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Mesaje disponibile astăzi: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Răspunsuri necitite: $count';
  }

  @override
  String get supportGuide => 'Informații';

  @override
  String get supportDeveloper => 'Dezvoltator';

  @override
  String get supportPrivacy => 'Despre datele solicitărilor de asistență';

  @override
  String get breathingTitle => 'Ia o pauză pentru a respira';

  @override
  String get breathingHint =>
      'Urmărește mișcarea lină a plămânilor\nîntr-un ritm confortabil.';

  @override
  String get breathingIn => 'Inspiră încet';

  @override
  String get breathingOut => 'Expiră încet';

  @override
  String get breathingProgress => 'Progresul exercițiului de respirație';

  @override
  String get breathingResultHint => 'Rezultatele vor apărea automat.';

  @override
  String get breathingSkip => 'Mergi la rezultate';
}
