// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Aktuelle point';

  @override
  String goalLabel(int goal) {
    return 'Mål: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Tilbage: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Mål nået!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage =>
      'Øv dig i at lægge mærke til det positive.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Tid tilbage: $minutes min. $seconds sek.';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Tid tilbage: $seconds sek.';
  }

  @override
  String scoreLabel(String score) {
    return 'Resultat: $score point';
  }

  @override
  String get imagePreparationMessage => 'Forbereder billeder...';

  @override
  String get noStimuliAvailable => 'Ingen stimuli tilgængelige';

  @override
  String get invalidGridSize => 'Ugyldig gitterstørrelse';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Starter...';

  @override
  String get excellentPerformance => 'Fremragende præstation!';

  @override
  String get greatJob => 'Godt gået!';

  @override
  String get goodPerformance => 'God præstation';

  @override
  String get keepPracticingFeedback => 'Bliv ved med at øve';

  @override
  String get takeYourTimeFeedback => 'Tag dig god tid';

  @override
  String get happy => 'Glad';

  @override
  String get angry => 'Vred';

  @override
  String get fear => 'Frygt';

  @override
  String get sad => 'Trist';

  @override
  String get historyPageTitle => 'Træningshistorik';

  @override
  String get dataLoading => 'Indlæser data...';

  @override
  String get pointsHistory => 'Pointhistorik';

  @override
  String get weekly => 'Ugentligt';

  @override
  String get monthly => 'Månedligt';

  @override
  String get noDataAvailable => 'Ingen data tilgængelige';

  @override
  String get goalAchievementRate => 'Målopfyldelse';

  @override
  String get scoreStatistics => 'Pointstatistik';

  @override
  String get bestScore => 'Bedste resultat';

  @override
  String get totalScore => 'Samlet resultat';

  @override
  String get trainingTime => 'Træningstid';

  @override
  String get totalTrainingTime => 'Samlet træningstid';

  @override
  String get detailedStatistics => 'Detaljeret statistik';

  @override
  String get averageScorePerMinute => 'Gennemsnitligt resultat pr. minut';

  @override
  String get pointsToGoal => 'Point til målet';

  @override
  String get goalSetting => 'Målindstilling';

  @override
  String get secondsUnit => 'sek.';

  @override
  String get minutesUnit => 'min.';

  @override
  String get hoursUnit => 't.';

  @override
  String get pointsUnit => 'point';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'søn';

  @override
  String get mondayShort => 'man';

  @override
  String get tuesdayShort => 'tir';

  @override
  String get wednesdayShort => 'ons';

  @override
  String get thursdayShort => 'tor';

  @override
  String get fridayShort => 'fre';

  @override
  String get saturdayShort => 'lør';

  @override
  String get settingsTitle => 'Indstillinger';

  @override
  String get goalPointsSetting => 'Indstilling af målpoint';

  @override
  String currentGoalPoints(int points) {
    return 'Nuværende mål: $points point';
  }

  @override
  String get newGoalPointsLabel => 'Nye målpoint';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'point';

  @override
  String get saveGoalButton => 'Gem mål';

  @override
  String goalSetTo(int points) {
    return 'Målet er sat til $points point';
  }

  @override
  String get enterGoalPoints => 'Indtast målpoint';

  @override
  String get enterValidNumber => 'Indtast et gyldigt tal (1 til 99999999)';

  @override
  String get saveFailed => 'Kunne ikke gemme nogle indstillinger';

  @override
  String get emailOpenFailed => 'Kunne ikke åbne mailappen';

  @override
  String get pageOpenFailed => 'Kunne ikke åbne siden';

  @override
  String get appInfoSupport => 'Appinfo og support';

  @override
  String get contactUs => 'Kontakt os';

  @override
  String get contactUsSubtitle => 'Del din feedback og dine spørgsmål';

  @override
  String get termsOfService => 'Servicevilkår';

  @override
  String get termsSubtitle => 'Læs appens servicevilkår';

  @override
  String get privacyPolicy => 'Privatlivspolitik';

  @override
  String get privacySubtitle => 'Om håndtering af personlige oplysninger';

  @override
  String get tutorialTitle => 'Vejledning';

  @override
  String get tutorialSubtitle => 'Lær, hvordan appen bruges';

  @override
  String get dataManagement => 'Datastyring';

  @override
  String get deleteHistory => 'Slet historik';

  @override
  String get deleteHistorySubtitle =>
      'Sletter kun træningshistorikken (målpoint bevares)';

  @override
  String get deleteHistoryAndGoal => 'Slet historik og mål';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Sletter al historik og alle målpoint';

  @override
  String get deleteHistoryConfirmTitle => 'Slet historik';

  @override
  String get deleteHistoryConfirmMessage =>
      'Er du sikker på, at du vil slette al træningshistorik?\n\n*Målpoint bevares';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Slet historik og mål';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Er du sikker på, at du vil slette al historik og alle målpoint?\n\n*Denne handling kan ikke fortrydes';

  @override
  String get cancel => 'Annuller';

  @override
  String get delete => 'Slet';

  @override
  String get historyDeleted => 'Historikken er slettet';

  @override
  String get historyAndGoalDeleted => 'Historik og mål er slettet';

  @override
  String get historyDeleteFailed => 'Kunne ikke slette historikken';

  @override
  String get historyAndGoalDeleteFailed => 'Kunne ikke slette historik og mål';

  @override
  String get tutorialDisplayFailed => 'Kunne ikke vise vejledningen';

  @override
  String get tips => 'Tips';

  @override
  String get tipsContent =>
      '• Dit mål vises i diagrammet på startskærmen\n• Begynd med et lille mål, og øg det i dit eget tempo\n• Hvert rigtigt valg giver op til 6 point';

  @override
  String get backToHome => 'Tilbage til start';

  @override
  String get tutorialSkip => 'Spring over';

  @override
  String get tutorialGoalAndPoints => 'Mål og aktuelle point';

  @override
  String get tutorialGoalDescription =>
      'Den ydre cirkel viser dit mål, den indre viser dine samlede point. Cirklen fyldes, efterhånden som du nærmer dig målet.';

  @override
  String get tutorialOneMinuteTraining => '1-minutstræning';

  @override
  String get tutorialTrainingDescription =>
      'Start et 1-minutsspil. Vælg positive billeder eller gode vaner blandt 4 muligheder.';

  @override
  String get tutorialScoreProgress => 'Pointudvikling';

  @override
  String get tutorialScoreDescription =>
      'Se detaljerede oplysninger om dine optjente point.';

  @override
  String get tutorialSettingsAndData => 'Indstillinger og datastyring';

  @override
  String get tutorialSettingsDescription =>
      'Ændr målværdier, se appoplysninger, og nulstil data.';

  @override
  String get appIntroAttentionBiasTitle => 'Om opmærksomhedsbias';

  @override
  String get appIntroAttentionBiasContent =>
      'Når angsten er stærk, har vi ubevidst en tendens til kun at fokusere på det negative.';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMints rolle';

  @override
  String get appIntroFocusMintRoleContent =>
      'Et kort spil, hvor du øver dig i at rette opmærksomheden mod positive billeder.';

  @override
  String get appIntroScientificEvidenceTitle => 'Om denne øvelse';

  @override
  String get appIntroScientificEvidenceContent =>
      'Øv dig i at finde positive billeder. FocusMint er et redskab til egenomsorg, ikke en medicinsk behandling. Resultater varierer fra person til person.';

  @override
  String get appIntroExpectedEffectsTitle => 'Det kan du øve';

  @override
  String get appIntroEffect1 => 'Lede efter positive billeder';

  @override
  String get appIntroEffect2 => 'Lægge mærke til smil omkring dig';

  @override
  String get appIntroEffect3 => 'Skabe en kort daglig rutine';

  @override
  String get appIntroHowToUse => 'Se, hvordan appen bruges';

  @override
  String get pointsEarned => 'Point optjent!';

  @override
  String get yourScore => 'Dit resultat';

  @override
  String get totalPlayTime => 'Samlet spilletid';

  @override
  String get imageManagement => 'Billedadministration';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Skjulte billeder: $count/$max';
  }

  @override
  String get unsavedChanges => 'Du har ikke-gemte ændringer';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Du har $count ikke-gemte ændringer i billedvisningsindstillingerne.';
  }

  @override
  String get unsavedChangesWarning =>
      'Ændringerne går tabt, hvis du lukker skærmen nu.';

  @override
  String get discardChanges => 'Kassér ændringer';

  @override
  String get saveAndExit => 'Gem og afslut';

  @override
  String settingsSaved(Object count) {
    return '$count indstillinger er gemt';
  }

  @override
  String get saveError => 'Der opstod en fejl under lagring af indstillingerne';

  @override
  String get imageSettingsUpdated => 'Billedindstillingerne er opdateret';

  @override
  String get allImages => 'Alle';

  @override
  String get positiveImages => 'Positive';

  @override
  String get negativeImages => 'Negative';

  @override
  String get smileImages => 'Smil';

  @override
  String get vegetableImages => 'Nærende mad';

  @override
  String get healthImages => 'Bevægelse og samvær';

  @override
  String get sadImages => 'Vrede, tristhed og bekymring';

  @override
  String get badFoodImages => 'Fastfood og slik';

  @override
  String get badImages => 'Usunde vaner';

  @override
  String get imageManagementHint =>
      'Tryk for at vise eller skjule et billede. Du kan skjule op til 15 billeder.';

  @override
  String get unsaved => 'Ikke gemt';

  @override
  String get save => 'Gem';

  @override
  String get hiddenImages => 'Skjulte';

  @override
  String get noHiddenImages => 'Ingen skjulte billeder';

  @override
  String get settingsLoadFailed => 'Kunne ikke indlæse indstillingerne';

  @override
  String imagesAdded(int count) {
    return '$count billeder tilføjet';
  }

  @override
  String get imageAddFailed => 'Kunne ikke tilføje billeder';

  @override
  String get imageSelectionFailed => 'Kunne ikke vælge billeder';

  @override
  String get settingsChangeFailed => 'Kunne ikke ændre indstillingerne';

  @override
  String groupTitle(String name) {
    return 'Gruppe: $name';
  }

  @override
  String get displayToggle => 'Skift visning';

  @override
  String imageCount(int count) {
    return '$count billeder';
  }

  @override
  String get noticeTitle => 'Vigtige bemærkninger';

  @override
  String get notice1 => 'Funktionen til egne billeder er tilføjet!';

  @override
  String get notice2 =>
      'Du kan tilføje dine egne billeder fra indstillingsskærmen';

  @override
  String get notice3 => 'Se indstillingsskærmen for flere detaljer';

  @override
  String get customImageTitle => 'Egne billeder';

  @override
  String get customImageSubtitle => 'Tilføj og administrer dine egne billeder';

  @override
  String get addCustomImages => 'Tilføj egne billeder';

  @override
  String get selectImages => 'Vælg billeder';

  @override
  String get unknownImage => 'Ukendt billede';

  @override
  String get customImageSettings => 'Indstillinger for egne billeder';

  @override
  String get useCustomImages => 'Brug egne billeder';

  @override
  String get useCustomImagesDescription =>
      'Brug dine egne billeder til øvelsen. Slå blanding til nedenfor for også at bruge appens billeder.';

  @override
  String get groupSettings => 'Gruppeindstillinger';

  @override
  String get minOneGroupRequired => 'Mindst én gruppe skal være aktiveret';

  @override
  String get settingsLoadFailedMessage => 'Kunne ikke indlæse indstillingerne';

  @override
  String get customImageNotice1 =>
      'Når grupper er aktiveret, vises billederne tilfældigt for hver gruppe.';

  @override
  String get customImageNotice2 =>
      'Billeder, som brugeren uploader og indstiller, deles ikke med udviklere eller tredjeparter og gemmes kun i appens område på enheden.';

  @override
  String get customImageNotice3 => 'Derfor kan appen bruges offline.';

  @override
  String get customImageNotice4 =>
      'Mange billeder optager lagerplads. Hvis du oplever problemer, kan du slå egne billeder fra eller slette ubrugte billeder i Indstillinger.';

  @override
  String get customImageNotice5 =>
      'Når du sletter appen, slettes de indstillede billeder.';

  @override
  String get customImageRequirementNotMet =>
      'For at bruge egne billeder skal du have mindst 1 godt billede og 3 mindre gode billeder i aktiverede grupper.';

  @override
  String get customImageRequirement =>
      'For at bruge egne billeder skal du have mindst 1 godt billede og 3 mindre gode billeder i aktiverede grupper.';

  @override
  String get sunnyWeather => 'God';

  @override
  String get rainyWeather => 'Mindre god';

  @override
  String get addImages => 'Tilføj billeder';

  @override
  String get imageDeleted => 'Billedet er slettet';

  @override
  String get imageDeleteFailed => 'Kunne ikke slette billedet';

  @override
  String get deleteImageTitle => 'Slet billede';

  @override
  String get deleteImageMessage =>
      'Vil du slette dette billede? Denne handling kan ikke fortrydes.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Gruppe $groupId – $weather billeder';
  }

  @override
  String registeredCount(int count) {
    return 'Registreret: $count billeder';
  }

  @override
  String get noImagesRegistered => 'Ingen billeder registreret';

  @override
  String get imagePreview => 'Billedforhåndsvisning';

  @override
  String get close => 'Luk';

  @override
  String get contactEmailSubject => 'FocusMint – Henvendelse';

  @override
  String get contactEmailBody => 'Del gerne din feedback og dine spørgsmål.';

  @override
  String get mixWithBuiltInImages => 'Bland med appens billeder';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Brug dine egne og appens billeder sammen';

  @override
  String get supportIntro =>
      'Skriv anonymt til udvikleren. Spørgsmål og forslag er velkomne. Du kan sende 3 beskeder om dagen. Hvert svar fra udvikleren giver dig 3 beskeder igen.';

  @override
  String get supportReceived =>
      'Besked modtaget. Vi svarer normalt inden for 2–3 dage.';

  @override
  String get supportComposer => 'Skriv en besked';

  @override
  String get supportSend => 'Send';

  @override
  String get supportRetry => 'Prøv igen';

  @override
  String get supportSent => 'Sendt';

  @override
  String get supportUnsent => 'Ikke sendt · gemt på denne enhed';

  @override
  String get supportAttach => 'Vedhæft billede';

  @override
  String get supportRemoveImage => 'Fjern billede';

  @override
  String get supportImage => 'Vedhæftning';

  @override
  String get supportClear => 'Slet historik';

  @override
  String get supportClearConfirm =>
      'Vil du slette denne samtale? Usendte kladder og historikken på serveren slettes også. Det nulstiller ikke din beskedgrænse.';

  @override
  String get supportQuota =>
      'Du har brugt dagens 3 beskeder. Send en ny i morgen eller efter et svar fra udvikleren.';

  @override
  String get supportConnectionError =>
      'Kunne ikke oprette forbindelse. Gemte kladder er ikke blevet sendt.';

  @override
  String get supportSendError =>
      'Kunne ikke sende. Din besked er gemt på denne enhed. Prøv igen.';

  @override
  String get supportStorageError => 'Kunne ikke gemme. Prøv igen.';

  @override
  String get supportClearError =>
      'Kunne ikke slette historikken. Kontrollér forbindelsen, og prøv igen.';

  @override
  String get supportImageError =>
      'Kunne ikke indlæse billedet. Vælg et billede under 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Beskeder tilbage i dag: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Ulæste svar: $count';
  }

  @override
  String get supportGuide => 'Information';

  @override
  String get supportDeveloper => 'Udvikler';

  @override
  String get supportPrivacy => 'Data ved supporthenvendelser';

  @override
  String get breathingTitle => 'Tag en rolig vejrtrækning';

  @override
  String get breathingHint =>
      'Følg lungernes blide bevægelse\ni et behageligt tempo.';

  @override
  String get breathingIn => 'Træk vejret langsomt ind';

  @override
  String get breathingOut => 'Pust langsomt ud';

  @override
  String get breathingProgress => 'Fremgang i vejrtrækningen';

  @override
  String get breathingResultHint => 'Dine resultater vises automatisk.';

  @override
  String get breathingSkip => 'Gå til resultater';
}
