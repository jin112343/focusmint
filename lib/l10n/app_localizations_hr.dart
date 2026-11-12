// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Trenutačni bodovi';

  @override
  String goalLabel(int goal) {
    return 'Cilj: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Preostalo: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Cilj ostvaren!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage =>
      'Vježbajte primjećivanje pozitivnih stvari.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Preostalo vrijeme: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Preostalo vrijeme: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Rezultat: $score bodova';
  }

  @override
  String get imagePreparationMessage => 'Priprema slika...';

  @override
  String get noStimuliAvailable => 'Nema dostupnih podražaja';

  @override
  String get invalidGridSize => 'Nevažeća veličina mreže';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Počinjemo...';

  @override
  String get excellentPerformance => 'Izvrstan rezultat!';

  @override
  String get greatJob => 'Odlično obavljeno!';

  @override
  String get goodPerformance => 'Dobar rezultat';

  @override
  String get keepPracticingFeedback => 'Nastavite vježbati';

  @override
  String get takeYourTimeFeedback => 'Ne žurite';

  @override
  String get happy => 'Radost';

  @override
  String get angry => 'Ljutnja';

  @override
  String get fear => 'Strah';

  @override
  String get sad => 'Tuga';

  @override
  String get historyPageTitle => 'Povijest treninga';

  @override
  String get dataLoading => 'Učitavanje podataka...';

  @override
  String get pointsHistory => 'Povijest bodova';

  @override
  String get weekly => 'Tjedno';

  @override
  String get monthly => 'Mjesečno';

  @override
  String get noDataAvailable => 'Nema dostupnih podataka';

  @override
  String get goalAchievementRate => 'Stopa ostvarenja cilja';

  @override
  String get scoreStatistics => 'Statistika rezultata';

  @override
  String get bestScore => 'Najbolji rezultat';

  @override
  String get totalScore => 'Ukupni rezultat';

  @override
  String get trainingTime => 'Vrijeme treninga';

  @override
  String get totalTrainingTime => 'Ukupno vrijeme treninga';

  @override
  String get detailedStatistics => 'Detaljna statistika';

  @override
  String get averageScorePerMinute => 'Prosječan rezultat po minuti';

  @override
  String get pointsToGoal => 'Bodovi do cilja';

  @override
  String get goalSetting => 'Postavljanje cilja';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'bodova';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Ned';

  @override
  String get mondayShort => 'Pon';

  @override
  String get tuesdayShort => 'Uto';

  @override
  String get wednesdayShort => 'Sri';

  @override
  String get thursdayShort => 'Čet';

  @override
  String get fridayShort => 'Pet';

  @override
  String get saturdayShort => 'Sub';

  @override
  String get settingsTitle => 'Postavke';

  @override
  String get goalPointsSetting => 'Postavljanje ciljnih bodova';

  @override
  String currentGoalPoints(int points) {
    return 'Trenutačni cilj: $points bodova';
  }

  @override
  String get newGoalPointsLabel => 'Novi ciljni bodovi';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'bodova';

  @override
  String get saveGoalButton => 'Spremi cilj';

  @override
  String goalSetTo(int points) {
    return 'Cilj postavljen na $points bodova';
  }

  @override
  String get enterGoalPoints => 'Unesite ciljne bodove';

  @override
  String get enterValidNumber => 'Unesite valjani broj (od 1 do 99999999)';

  @override
  String get saveFailed => 'Neke postavke nisu se mogle spremiti';

  @override
  String get emailOpenFailed => 'Aplikacija za e-poštu nije se mogla otvoriti';

  @override
  String get pageOpenFailed => 'Stranica se nije mogla otvoriti';

  @override
  String get appInfoSupport => 'Informacije o aplikaciji i podrška';

  @override
  String get contactUs => 'Kontaktirajte nas';

  @override
  String get contactUsSubtitle => 'Podijelite svoje mišljenje i pitanja';

  @override
  String get termsOfService => 'Uvjeti korištenja';

  @override
  String get termsSubtitle => 'Pregledajte uvjete korištenja aplikacije';

  @override
  String get privacyPolicy => 'Pravila privatnosti';

  @override
  String get privacySubtitle => 'O postupanju s osobnim podacima';

  @override
  String get tutorialTitle => 'Vodič';

  @override
  String get tutorialSubtitle => 'Naučite kako koristiti aplikaciju';

  @override
  String get dataManagement => 'Upravljanje podacima';

  @override
  String get deleteHistory => 'Izbriši povijest';

  @override
  String get deleteHistorySubtitle =>
      'Briše samo povijest treninga (ciljni bodovi se zadržavaju)';

  @override
  String get deleteHistoryAndGoal => 'Izbriši povijest i cilj';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Briše svu povijest i ciljne bodove';

  @override
  String get deleteHistoryConfirmTitle => 'Izbriši povijest';

  @override
  String get deleteHistoryConfirmMessage =>
      'Jeste li sigurni da želite izbrisati svu povijest treninga?\n\n*Ciljni bodovi bit će zadržani';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Izbriši povijest i cilj';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Jeste li sigurni da želite izbrisati svu povijest i ciljne bodove?\n\n*Ova se radnja ne može poništiti';

  @override
  String get cancel => 'Odustani';

  @override
  String get delete => 'Izbriši';

  @override
  String get historyDeleted => 'Povijest je izbrisana';

  @override
  String get historyAndGoalDeleted => 'Povijest i cilj su izbrisani';

  @override
  String get historyDeleteFailed => 'Brisanje povijesti nije uspjelo';

  @override
  String get historyAndGoalDeleteFailed =>
      'Brisanje povijesti i cilja nije uspjelo';

  @override
  String get tutorialDisplayFailed => 'Prikaz vodiča nije uspio';

  @override
  String get tips => 'Savjeti';

  @override
  String get tipsContent =>
      '• Vaš se cilj prikazuje na grafikonu početnog zaslona\n• Počnite malim ciljem i povećavajte ga vlastitim tempom\n• Svaki točan odabir donosi do 6 bodova';

  @override
  String get backToHome => 'Natrag na početni zaslon';

  @override
  String get tutorialSkip => 'Preskoči';

  @override
  String get tutorialGoalAndPoints => 'Cilj i trenutačni bodovi';

  @override
  String get tutorialGoalDescription =>
      'Vanjski krug prikazuje vaš cilj, a unutarnji ukupne bodove. Krug se puni kako se približavate cilju.';

  @override
  String get tutorialOneMinuteTraining => 'Trening od 1 minute';

  @override
  String get tutorialTrainingDescription =>
      'Pokrenite igru od 1 minute. Od 4 ponuđene opcije birajte pozitivne slike ili dobre navike.';

  @override
  String get tutorialScoreProgress => 'Kretanje rezultata';

  @override
  String get tutorialScoreDescription =>
      'Pogledajte detaljne informacije o osvojenim rezultatima.';

  @override
  String get tutorialSettingsAndData => 'Postavke i upravljanje podacima';

  @override
  String get tutorialSettingsDescription =>
      'Promijenite ciljne vrijednosti, pregledajte informacije o aplikaciji i poništite podatke.';

  @override
  String get appIntroAttentionBiasTitle => 'O pristranosti pažnje';

  @override
  String get appIntroAttentionBiasContent =>
      'Kad je tjeskoba jaka, nesvjesno se usmjeravamo samo na negativne stvari.';

  @override
  String get appIntroFocusMintRoleTitle => 'Uloga aplikacije FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Kratka igra za vježbanje usmjeravanja pozornosti na pozitivne slike.';

  @override
  String get appIntroScientificEvidenceTitle => 'O ovoj vježbi';

  @override
  String get appIntroScientificEvidenceContent =>
      'Vježbajte pronalaženje pozitivnih slika. FocusMint je alat za brigu o sebi, a ne medicinski tretman. Rezultati se mogu razlikovati od osobe do osobe.';

  @override
  String get appIntroExpectedEffectsTitle => 'Što možete vježbati';

  @override
  String get appIntroEffect1 => 'Traženje pozitivnih slika';

  @override
  String get appIntroEffect2 => 'Primjećivanje osmijeha oko sebe';

  @override
  String get appIntroEffect3 => 'Stvaranje kratke svakodnevne navike';

  @override
  String get appIntroHowToUse => 'Pogledajte upute za korištenje';

  @override
  String get pointsEarned => 'Bodovi osvojeni!';

  @override
  String get yourScore => 'Vaš rezultat';

  @override
  String get totalPlayTime => 'Ukupno vrijeme igranja';

  @override
  String get imageManagement => 'Upravljanje slikama';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Skrivene slike: $count/$max';
  }

  @override
  String get unsavedChanges => 'Imate nespremljene promjene';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Imate $count nespremljenih promjena postavki prikaza slika.';
  }

  @override
  String get unsavedChangesWarning =>
      'Ako sada zatvorite ovaj zaslon, promjene će biti izgubljene.';

  @override
  String get discardChanges => 'Odbaci promjene';

  @override
  String get saveAndExit => 'Spremi i izađi';

  @override
  String settingsSaved(Object count) {
    return 'Spremljeno $count postavki';
  }

  @override
  String get saveError => 'Došlo je do pogreške pri spremanju postavki';

  @override
  String get imageSettingsUpdated => 'Postavke slika su ažurirane';

  @override
  String get allImages => 'Sve';

  @override
  String get positiveImages => 'Pozitivne';

  @override
  String get negativeImages => 'Negativne';

  @override
  String get smileImages => 'Osmijeh';

  @override
  String get vegetableImages => 'Hranjiva hrana';

  @override
  String get healthImages => 'Kretanje i druženje';

  @override
  String get sadImages => 'Ljutnja, tuga i zabrinutost';

  @override
  String get badFoodImages => 'Brza hrana i slatkiši';

  @override
  String get badImages => 'Nezdrave navike';

  @override
  String get imageManagementHint =>
      'Dodirnite za promjenu vidljivosti slike. Možete sakriti do 15 slika.';

  @override
  String get unsaved => 'Nespremljeno';

  @override
  String get save => 'Spremi';

  @override
  String get hiddenImages => 'Skrivene';

  @override
  String get noHiddenImages => 'Nema skrivenih slika';

  @override
  String get settingsLoadFailed => 'Učitavanje postavki nije uspjelo';

  @override
  String imagesAdded(int count) {
    return 'Dodano $count slika';
  }

  @override
  String get imageAddFailed => 'Dodavanje slika nije uspjelo';

  @override
  String get imageSelectionFailed => 'Odabir slika nije uspio';

  @override
  String get settingsChangeFailed => 'Promjena postavki nije uspjela';

  @override
  String groupTitle(String name) {
    return 'Grupa: $name';
  }

  @override
  String get displayToggle => 'Prebacivanje prikaza';

  @override
  String imageCount(int count) {
    return '$count slika';
  }

  @override
  String get noticeTitle => 'Važne napomene';

  @override
  String get notice1 => 'Dodana je značajka prilagođenih slika!';

  @override
  String get notice2 => 'Vlastite slike možete dodati na zaslonu postavki';

  @override
  String get notice3 => 'Pojedinosti potražite na zaslonu postavki';

  @override
  String get customImageTitle => 'Prilagođene slike';

  @override
  String get customImageSubtitle => 'Dodajte i upravljajte vlastitim slikama';

  @override
  String get addCustomImages => 'Dodaj prilagođene slike';

  @override
  String get selectImages => 'Odaberi slike';

  @override
  String get unknownImage => 'Nepoznata slika';

  @override
  String get customImageSettings => 'Postavke prilagođenih slika';

  @override
  String get useCustomImages => 'Koristi prilagođene slike';

  @override
  String get useCustomImagesDescription =>
      'Koristite vlastite slike za vježbu. Uključite kombiniranje u nastavku kako biste dodali i slike iz aplikacije.';

  @override
  String get groupSettings => 'Postavke grupa';

  @override
  String get minOneGroupRequired => 'Barem jedna grupa mora biti omogućena';

  @override
  String get settingsLoadFailedMessage => 'Učitavanje postavki nije uspjelo';

  @override
  String get customImageNotice1 =>
      'Kada su grupe omogućene, slike se za svaku grupu prikazuju nasumično.';

  @override
  String get customImageNotice2 =>
      'Slike koje korisnici prenesu i postave ne dijele se s razvojnim programerima ni trećim stranama te se pohranjuju samo u području aplikacije na uređaju.';

  @override
  String get customImageNotice3 => 'Zato je moguće korištenje i bez interneta.';

  @override
  String get customImageNotice4 =>
      'Dodavanje mnogo slika zauzima prostor za pohranu. Ako imate poteškoća, isključite vlastite slike ili uklonite nekorištene slike u postavkama.';

  @override
  String get customImageNotice5 =>
      'Kada izbrišete aplikaciju, postavljene slike bit će izbrisane.';

  @override
  String get customImageRequirementNotMet =>
      'Za korištenje prilagođenih slika potrebna vam je najmanje 1 dobra slika i 3 ne dobre slike u omogućenim grupama.';

  @override
  String get customImageRequirement =>
      'Za korištenje prilagođenih slika potrebna vam je najmanje 1 dobra slika i 3 ne dobre slike u omogućenim grupama.';

  @override
  String get sunnyWeather => 'Dobro';

  @override
  String get rainyWeather => 'Nije dobro';

  @override
  String get addImages => 'Dodaj slike';

  @override
  String get imageDeleted => 'Slika je izbrisana';

  @override
  String get imageDeleteFailed => 'Brisanje slike nije uspjelo';

  @override
  String get deleteImageTitle => 'Izbriši sliku';

  @override
  String get deleteImageMessage =>
      'Želite li izbrisati ovu sliku? Ova se radnja ne može poništiti.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Grupa $groupId – slike $weather';
  }

  @override
  String registeredCount(int count) {
    return 'Registrirano: $count slika';
  }

  @override
  String get noImagesRegistered => 'Nema registriranih slika';

  @override
  String get imagePreview => 'Pregled slike';

  @override
  String get close => 'Zatvori';

  @override
  String get contactEmailSubject => 'FocusMint – Upit';

  @override
  String get contactEmailBody => 'Napišite nam svoje mišljenje i pitanja.';

  @override
  String get mixWithBuiltInImages => 'Kombiniraj sa slikama aplikacije';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Koristite vlastite slike zajedno sa slikama aplikacije';

  @override
  String get supportIntro =>
      'Pišite razvojnom programeru anonimno. Pitanja i prijedlozi su dobrodošli. Možete poslati 3 poruke dnevno. Svaki odgovor razvojnog programera vraća raspoloživi broj poruka na 3.';

  @override
  String get supportReceived =>
      'Poruka je primljena. Obično odgovaramo u roku od 2–3 dana.';

  @override
  String get supportComposer => 'Napišite poruku';

  @override
  String get supportSend => 'Pošalji';

  @override
  String get supportRetry => 'Pokušaj ponovno';

  @override
  String get supportSent => 'Poslano';

  @override
  String get supportUnsent => 'Nije poslano · spremljeno na ovom uređaju';

  @override
  String get supportAttach => 'Priloži sliku';

  @override
  String get supportRemoveImage => 'Ukloni sliku';

  @override
  String get supportImage => 'Privitak';

  @override
  String get supportClear => 'Izbriši povijest';

  @override
  String get supportClearConfirm =>
      'Želite li izbrisati ovaj razgovor? Izbrisat će se i neposlane skice te povijest na poslužitelju. Ograničenje poruka neće se poništiti.';

  @override
  String get supportQuota =>
      'Iskoristili ste današnje 3 poruke. Novu možete poslati sutra ili nakon odgovora razvojnog programera.';

  @override
  String get supportConnectionError =>
      'Povezivanje nije uspjelo. Spremljene skice nisu poslane.';

  @override
  String get supportSendError =>
      'Slanje nije uspjelo. Poruka je spremljena na ovom uređaju. Pokušajte ponovno.';

  @override
  String get supportStorageError =>
      'Spremanje nije uspjelo. Pokušajte ponovno.';

  @override
  String get supportClearError =>
      'Povijest se nije mogla izbrisati. Provjerite vezu i pokušajte ponovno.';

  @override
  String get supportImageError =>
      'Slika se nije mogla učitati. Odaberite sliku manju od 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Preostale poruke danas: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Nepročitani odgovori: $count';
  }

  @override
  String get supportGuide => 'Informacije';

  @override
  String get supportDeveloper => 'Razvojni programer';

  @override
  String get supportPrivacy => 'O podacima upita za podršku';

  @override
  String get breathingTitle => 'Uzmite trenutak za disanje';

  @override
  String get breathingHint =>
      'Pratite nježno pomicanje pluća\nu tempu koji vam odgovara.';

  @override
  String get breathingIn => 'Polako udahnite';

  @override
  String get breathingOut => 'Polako izdahnite';

  @override
  String get breathingProgress => 'Napredak vježbe disanja';

  @override
  String get breathingResultHint => 'Rezultati će se prikazati automatski.';

  @override
  String get breathingSkip => 'Prijeđi na rezultate';
}
