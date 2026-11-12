// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Nåværende poeng';

  @override
  String goalLabel(int goal) {
    return 'Mål: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Gjenstår: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Mål oppnådd!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'Øv på å legge merke til det positive.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Tid igjen: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Tid igjen: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Resultat: $score poeng';
  }

  @override
  String get imagePreparationMessage => 'Forbereder bilder...';

  @override
  String get noStimuliAvailable => 'Ingen stimuli tilgjengelig';

  @override
  String get invalidGridSize => 'Ugyldig rutenettstørrelse';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Starter...';

  @override
  String get excellentPerformance => 'Fremragende prestasjon!';

  @override
  String get greatJob => 'Godt jobbet!';

  @override
  String get goodPerformance => 'God prestasjon';

  @override
  String get keepPracticingFeedback => 'Fortsett å øve';

  @override
  String get takeYourTimeFeedback => 'Ta deg god tid';

  @override
  String get happy => 'Glad';

  @override
  String get angry => 'Sint';

  @override
  String get fear => 'Frykt';

  @override
  String get sad => 'Trist';

  @override
  String get historyPageTitle => 'Treningshistorikk';

  @override
  String get dataLoading => 'Laster inn data...';

  @override
  String get pointsHistory => 'Poenghistorikk';

  @override
  String get weekly => 'Ukentlig';

  @override
  String get monthly => 'Månedlig';

  @override
  String get noDataAvailable => 'Ingen data tilgjengelig';

  @override
  String get goalAchievementRate => 'Måloppnåelse';

  @override
  String get scoreStatistics => 'Poengstatistikk';

  @override
  String get bestScore => 'Beste resultat';

  @override
  String get totalScore => 'Totalt resultat';

  @override
  String get trainingTime => 'Treningstid';

  @override
  String get totalTrainingTime => 'Total treningstid';

  @override
  String get detailedStatistics => 'Detaljert statistikk';

  @override
  String get averageScorePerMinute => 'Gjennomsnittlig resultat per minutt';

  @override
  String get pointsToGoal => 'Poeng igjen til målet';

  @override
  String get goalSetting => 'Målinnstilling';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 't';

  @override
  String get pointsUnit => 'poeng';

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
  String get settingsTitle => 'Innstillinger';

  @override
  String get goalPointsSetting => 'Innstilling for målpoeng';

  @override
  String currentGoalPoints(int points) {
    return 'Nåværende mål: $points poeng';
  }

  @override
  String get newGoalPointsLabel => 'Nye målpoeng';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'poeng';

  @override
  String get saveGoalButton => 'Lagre mål';

  @override
  String goalSetTo(int points) {
    return 'Målet er satt til $points poeng';
  }

  @override
  String get enterGoalPoints => 'Skriv inn målpoeng';

  @override
  String get enterValidNumber => 'Skriv inn et gyldig tall (1 til 99999999)';

  @override
  String get saveFailed => 'Kunne ikke lagre enkelte innstillinger';

  @override
  String get emailOpenFailed => 'Kunne ikke åpne e-postappen';

  @override
  String get pageOpenFailed => 'Kunne ikke åpne siden';

  @override
  String get appInfoSupport => 'Appinfo og støtte';

  @override
  String get contactUs => 'Kontakt oss';

  @override
  String get contactUsSubtitle => 'Del tilbakemeldinger og spørsmål';

  @override
  String get termsOfService => 'Vilkår for bruk';

  @override
  String get termsSubtitle => 'Les appens vilkår for bruk';

  @override
  String get privacyPolicy => 'Personvernerklæring';

  @override
  String get privacySubtitle => 'Om håndtering av personopplysninger';

  @override
  String get tutorialTitle => 'Veiledning';

  @override
  String get tutorialSubtitle => 'Lær hvordan appen brukes';

  @override
  String get dataManagement => 'Databehandling';

  @override
  String get deleteHistory => 'Slett historikk';

  @override
  String get deleteHistorySubtitle =>
      'Sletter kun treningshistorikken (målpoeng beholdes)';

  @override
  String get deleteHistoryAndGoal => 'Slett historikk og mål';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Sletter all historikk og alle målpoeng';

  @override
  String get deleteHistoryConfirmTitle => 'Slett historikk';

  @override
  String get deleteHistoryConfirmMessage =>
      'Er du sikker på at du vil slette all treningshistorikk?\n\n*Målpoengene beholdes';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Slett historikk og mål';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Er du sikker på at du vil slette all historikk og alle målpoeng?\n\n*Denne handlingen kan ikke angres';

  @override
  String get cancel => 'Avbryt';

  @override
  String get delete => 'Slett';

  @override
  String get historyDeleted => 'Historikken er slettet';

  @override
  String get historyAndGoalDeleted => 'Historikk og mål er slettet';

  @override
  String get historyDeleteFailed => 'Kunne ikke slette historikken';

  @override
  String get historyAndGoalDeleteFailed => 'Kunne ikke slette historikk og mål';

  @override
  String get tutorialDisplayFailed => 'Kunne ikke vise veiledningen';

  @override
  String get tips => 'Tips';

  @override
  String get tipsContent =>
      '• Målet ditt vises i diagrammet på startskjermen\n• Begynn med et lite mål og øk det i ditt eget tempo\n• Hvert riktige valg gir opptil 6 poeng';

  @override
  String get backToHome => 'Tilbake til start';

  @override
  String get tutorialSkip => 'Hopp over';

  @override
  String get tutorialGoalAndPoints => 'Mål og nåværende poeng';

  @override
  String get tutorialGoalDescription =>
      'Den ytre sirkelen viser målet ditt, den indre viser de totale poengene dine. Sirkelen fylles etter hvert som du nærmer deg målet.';

  @override
  String get tutorialOneMinuteTraining => '1-minuttstrening';

  @override
  String get tutorialTrainingDescription =>
      'Start et 1-minuttsspill. Velg positive bilder eller gode vaner blant 4 alternativer.';

  @override
  String get tutorialScoreProgress => 'Poengutvikling';

  @override
  String get tutorialScoreDescription =>
      'Se detaljert informasjon om poengene du har tjent.';

  @override
  String get tutorialSettingsAndData => 'Innstillinger og databehandling';

  @override
  String get tutorialSettingsDescription =>
      'Endre målverdier, se appinformasjon og tilbakestill data.';

  @override
  String get appIntroAttentionBiasTitle => 'Om oppmerksomhetsskjevhet';

  @override
  String get appIntroAttentionBiasContent =>
      'Når uroen er sterk, har vi ubevisst en tendens til bare å fokusere på det negative.';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMints rolle';

  @override
  String get appIntroFocusMintRoleContent =>
      'Et kort spill der du øver på å rette oppmerksomheten mot positive bilder.';

  @override
  String get appIntroScientificEvidenceTitle => 'Om denne øvelsen';

  @override
  String get appIntroScientificEvidenceContent =>
      'Øv på å finne positive bilder. FocusMint er et verktøy for egenomsorg, ikke medisinsk behandling. Resultatene varierer fra person til person.';

  @override
  String get appIntroExpectedEffectsTitle => 'Dette kan du øve på';

  @override
  String get appIntroEffect1 => 'Lete etter positive bilder';

  @override
  String get appIntroEffect2 => 'Legge merke til smil rundt deg';

  @override
  String get appIntroEffect3 => 'Skape en kort daglig rutine';

  @override
  String get appIntroHowToUse => 'Se hvordan appen brukes';

  @override
  String get pointsEarned => 'Poeng opptjent!';

  @override
  String get yourScore => 'Ditt resultat';

  @override
  String get totalPlayTime => 'Total spilletid';

  @override
  String get imageManagement => 'Bildebehandling';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Skjulte bilder: $count/$max';
  }

  @override
  String get unsavedChanges => 'Du har ulagrede endringer';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Du har $count ulagrede endringer i innstillingene for bildevisning.';
  }

  @override
  String get unsavedChangesWarning =>
      'Endringene går tapt hvis du lukker skjermen nå.';

  @override
  String get discardChanges => 'Forkast endringer';

  @override
  String get saveAndExit => 'Lagre og avslutt';

  @override
  String settingsSaved(Object count) {
    return '$count innstillinger er lagret';
  }

  @override
  String get saveError => 'Det oppsto en feil under lagring av innstillingene';

  @override
  String get imageSettingsUpdated => 'Bildeinnstillingene er oppdatert';

  @override
  String get allImages => 'Alle';

  @override
  String get positiveImages => 'Positive';

  @override
  String get negativeImages => 'Negative';

  @override
  String get smileImages => 'Smil';

  @override
  String get vegetableImages => 'Næringsrik mat';

  @override
  String get healthImages => 'Bevegelse og samvær';

  @override
  String get sadImages => 'Sinne, tristhet og bekymring';

  @override
  String get badFoodImages => 'Hurtigmat og søtsaker';

  @override
  String get badImages => 'Usunne vaner';

  @override
  String get imageManagementHint =>
      'Trykk for å vise eller skjule et bilde. Du kan skjule opptil 15 bilder.';

  @override
  String get unsaved => 'Ulagret';

  @override
  String get save => 'Lagre';

  @override
  String get hiddenImages => 'Skjulte';

  @override
  String get noHiddenImages => 'Ingen skjulte bilder';

  @override
  String get settingsLoadFailed => 'Kunne ikke laste inn innstillingene';

  @override
  String imagesAdded(int count) {
    return '$count bilder er lagt til';
  }

  @override
  String get imageAddFailed => 'Kunne ikke legge til bilder';

  @override
  String get imageSelectionFailed => 'Kunne ikke velge bilder';

  @override
  String get settingsChangeFailed => 'Kunne ikke endre innstillingene';

  @override
  String groupTitle(String name) {
    return 'Gruppe: $name';
  }

  @override
  String get displayToggle => 'Bytt visning';

  @override
  String imageCount(int count) {
    return '$count bilder';
  }

  @override
  String get noticeTitle => 'Viktige merknader';

  @override
  String get notice1 => 'Funksjonen for egne bilder er lagt til!';

  @override
  String get notice2 =>
      'Du kan legge til dine egne bilder fra innstillingsskjermen';

  @override
  String get notice3 => 'Se innstillingsskjermen for flere detaljer';

  @override
  String get customImageTitle => 'Egne bilder';

  @override
  String get customImageSubtitle => 'Legg til og administrer dine egne bilder';

  @override
  String get addCustomImages => 'Legg til egne bilder';

  @override
  String get selectImages => 'Velg bilder';

  @override
  String get unknownImage => 'Ukjent bilde';

  @override
  String get customImageSettings => 'Innstillinger for egne bilder';

  @override
  String get useCustomImages => 'Bruk egne bilder';

  @override
  String get useCustomImagesDescription =>
      'Bruk dine egne bilder i øvelsen. Slå på blanding nedenfor for også å bruke appens bilder.';

  @override
  String get groupSettings => 'Gruppeinnstillinger';

  @override
  String get minOneGroupRequired => 'Minst én gruppe må være aktivert';

  @override
  String get settingsLoadFailedMessage => 'Kunne ikke laste inn innstillingene';

  @override
  String get customImageNotice1 =>
      'Når grupper er aktivert, vises bildene tilfeldig for hver gruppe.';

  @override
  String get customImageNotice2 =>
      'Bilder som brukeren laster opp og angir, deles ikke med utviklere eller tredjeparter og lagres kun i appens område på enheten.';

  @override
  String get customImageNotice3 => 'Derfor kan appen brukes uten nett.';

  @override
  String get customImageNotice4 =>
      'Mange bilder tar lagringsplass. Hvis du får problemer, kan du slå av egne bilder eller fjerne ubrukte bilder i Innstillinger.';

  @override
  String get customImageNotice5 =>
      'Når du sletter appen, slettes de angitte bildene.';

  @override
  String get customImageRequirementNotMet =>
      'For å bruke egne bilder trenger du minst 1 godt bilde og 3 mindre gode bilder i aktiverte grupper.';

  @override
  String get customImageRequirement =>
      'For å bruke egne bilder trenger du minst 1 godt bilde og 3 mindre gode bilder i aktiverte grupper.';

  @override
  String get sunnyWeather => 'God';

  @override
  String get rainyWeather => 'Mindre god';

  @override
  String get addImages => 'Legg til bilder';

  @override
  String get imageDeleted => 'Bildet er slettet';

  @override
  String get imageDeleteFailed => 'Kunne ikke slette bildet';

  @override
  String get deleteImageTitle => 'Slett bilde';

  @override
  String get deleteImageMessage =>
      'Vil du slette dette bildet? Denne handlingen kan ikke angres.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Gruppe $groupId – $weather bilder';
  }

  @override
  String registeredCount(int count) {
    return 'Registrert: $count bilder';
  }

  @override
  String get noImagesRegistered => 'Ingen bilder registrert';

  @override
  String get imagePreview => 'Forhåndsvisning av bilde';

  @override
  String get close => 'Lukk';

  @override
  String get contactEmailSubject => 'FocusMint – Henvendelse';

  @override
  String get contactEmailBody => 'Del gjerne tilbakemeldinger og spørsmål.';

  @override
  String get mixWithBuiltInImages => 'Bland med appens bilder';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Bruk dine egne bilder og appens bilder sammen';

  @override
  String get supportIntro =>
      'Skriv anonymt til utvikleren. Spørsmål og forslag er velkomne. Du kan sende 3 meldinger per dag. Hvert svar fra utvikleren gir deg 3 meldinger igjen.';

  @override
  String get supportReceived =>
      'Meldingen er mottatt. Vi svarer vanligvis innen 2–3 dager.';

  @override
  String get supportComposer => 'Skriv en melding';

  @override
  String get supportSend => 'Send';

  @override
  String get supportRetry => 'Prøv igjen';

  @override
  String get supportSent => 'Sendt';

  @override
  String get supportUnsent => 'Ikke sendt · lagret på denne enheten';

  @override
  String get supportAttach => 'Legg ved bilde';

  @override
  String get supportRemoveImage => 'Fjern bilde';

  @override
  String get supportImage => 'Vedlegg';

  @override
  String get supportClear => 'Slett historikk';

  @override
  String get supportClearConfirm =>
      'Vil du slette denne samtalen? Usendte utkast og historikken på serveren slettes også. Dette tilbakestiller ikke meldingsgrensen din.';

  @override
  String get supportQuota =>
      'Du har brukt dagens 3 meldinger. Send en ny i morgen eller etter et svar fra utvikleren.';

  @override
  String get supportConnectionError =>
      'Kunne ikke koble til. Lagrede utkast er ikke sendt.';

  @override
  String get supportSendError =>
      'Kunne ikke sende. Meldingen er lagret på denne enheten. Prøv igjen.';

  @override
  String get supportStorageError => 'Kunne ikke lagre. Prøv igjen.';

  @override
  String get supportClearError =>
      'Kunne ikke slette historikken. Sjekk tilkoblingen og prøv igjen.';

  @override
  String get supportImageError =>
      'Kunne ikke laste inn bildet. Velg et bilde som er mindre enn 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Meldinger igjen i dag: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Uleste svar: $count';
  }

  @override
  String get supportGuide => 'Informasjon';

  @override
  String get supportDeveloper => 'Utvikler';

  @override
  String get supportPrivacy => 'Data ved henvendelser';

  @override
  String get breathingTitle => 'Ta et rolig pust';

  @override
  String get breathingHint =>
      'Følg lungenes rolige bevegelse\ni et behagelig tempo.';

  @override
  String get breathingIn => 'Pust rolig inn';

  @override
  String get breathingOut => 'Pust rolig ut';

  @override
  String get breathingProgress => 'Fremdrift i pusteøvelsen';

  @override
  String get breathingResultHint => 'Resultatene vises automatisk.';

  @override
  String get breathingSkip => 'Gå til resultatene';
}
