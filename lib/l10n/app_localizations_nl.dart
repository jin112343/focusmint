// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Huidige punten';

  @override
  String goalLabel(int goal) {
    return 'Doel: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Resterend: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Doel bereikt!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'Oefen om het positieve op te merken.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Resterende tijd: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Resterende tijd: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Score: $score punten';
  }

  @override
  String get imagePreparationMessage => 'Afbeeldingen voorbereiden...';

  @override
  String get noStimuliAvailable => 'Geen stimuli beschikbaar';

  @override
  String get invalidGridSize => 'Ongeldige rastergrootte';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Bezig met starten...';

  @override
  String get excellentPerformance => 'Uitstekende prestatie!';

  @override
  String get greatJob => 'Goed gedaan!';

  @override
  String get goodPerformance => 'Goede prestatie';

  @override
  String get keepPracticingFeedback => 'Blijf oefenen';

  @override
  String get takeYourTimeFeedback => 'Neem de tijd';

  @override
  String get happy => 'Blij';

  @override
  String get angry => 'Boos';

  @override
  String get fear => 'Angst';

  @override
  String get sad => 'Verdrietig';

  @override
  String get historyPageTitle => 'Trainingsgeschiedenis';

  @override
  String get dataLoading => 'Gegevens laden...';

  @override
  String get pointsHistory => 'Puntengeschiedenis';

  @override
  String get weekly => 'Wekelijks';

  @override
  String get monthly => 'Maandelijks';

  @override
  String get noDataAvailable => 'Geen gegevens beschikbaar';

  @override
  String get goalAchievementRate => 'Doelbereikingspercentage';

  @override
  String get scoreStatistics => 'Scorestatistieken';

  @override
  String get bestScore => 'Beste score';

  @override
  String get totalScore => 'Totale score';

  @override
  String get trainingTime => 'Trainingstijd';

  @override
  String get totalTrainingTime => 'Totale trainingstijd';

  @override
  String get detailedStatistics => 'Gedetailleerde statistieken';

  @override
  String get averageScorePerMinute => 'Gemiddelde score per minuut';

  @override
  String get pointsToGoal => 'Punten tot het doel';

  @override
  String get goalSetting => 'Doel instellen';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'u';

  @override
  String get pointsUnit => 'punten';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Zo';

  @override
  String get mondayShort => 'Ma';

  @override
  String get tuesdayShort => 'Di';

  @override
  String get wednesdayShort => 'Wo';

  @override
  String get thursdayShort => 'Do';

  @override
  String get fridayShort => 'Vr';

  @override
  String get saturdayShort => 'Za';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get goalPointsSetting => 'Doelpunten instellen';

  @override
  String currentGoalPoints(int points) {
    return 'Huidig doel: $points punten';
  }

  @override
  String get newGoalPointsLabel => 'Nieuwe doelpunten';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'punten';

  @override
  String get saveGoalButton => 'Doel opslaan';

  @override
  String goalSetTo(int points) {
    return 'Doel ingesteld op $points punten';
  }

  @override
  String get enterGoalPoints => 'Voer doelpunten in';

  @override
  String get enterValidNumber => 'Voer een geldig getal in (1 tot 99999999)';

  @override
  String get saveFailed => 'Sommige instellingen konden niet worden opgeslagen';

  @override
  String get emailOpenFailed => 'Kan de e-mailapp niet openen';

  @override
  String get pageOpenFailed => 'Kan de pagina niet openen';

  @override
  String get appInfoSupport => 'App-info en ondersteuning';

  @override
  String get contactUs => 'Contact opnemen';

  @override
  String get contactUsSubtitle => 'Deel je feedback en vragen';

  @override
  String get termsOfService => 'Gebruiksvoorwaarden';

  @override
  String get termsSubtitle => 'Bekijk de gebruiksvoorwaarden van de app';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get privacySubtitle => 'Over de omgang met privacygegevens';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Leer hoe je de app gebruikt';

  @override
  String get dataManagement => 'Gegevensbeheer';

  @override
  String get deleteHistory => 'Geschiedenis verwijderen';

  @override
  String get deleteHistorySubtitle =>
      'Alleen de trainingsgeschiedenis verwijderen (doelpunten blijven behouden)';

  @override
  String get deleteHistoryAndGoal => 'Geschiedenis en doel verwijderen';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Alle geschiedenis en doelpunten verwijderen';

  @override
  String get deleteHistoryConfirmTitle => 'Geschiedenis verwijderen';

  @override
  String get deleteHistoryConfirmMessage =>
      'Weet je zeker dat je alle trainingsgeschiedenis wilt verwijderen?\n\n*Doelpunten blijven behouden';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Geschiedenis en doel verwijderen';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Weet je zeker dat je alle geschiedenis en doelpunten wilt verwijderen?\n\n*Deze actie kan niet ongedaan worden gemaakt';

  @override
  String get cancel => 'Annuleren';

  @override
  String get delete => 'Verwijderen';

  @override
  String get historyDeleted => 'Geschiedenis verwijderd';

  @override
  String get historyAndGoalDeleted => 'Geschiedenis en doel verwijderd';

  @override
  String get historyDeleteFailed => 'Verwijderen van geschiedenis mislukt';

  @override
  String get historyAndGoalDeleteFailed =>
      'Verwijderen van geschiedenis en doel mislukt';

  @override
  String get tutorialDisplayFailed => 'Tutorial kon niet worden weergegeven';

  @override
  String get tips => 'Tips';

  @override
  String get tipsContent =>
      '• Je doel staat in de grafiek op het beginscherm\n• Begin met een klein doel en verhoog het in je eigen tempo\n• Elke juiste keuze levert maximaal 6 punten op';

  @override
  String get backToHome => 'Terug naar start';

  @override
  String get tutorialSkip => 'Overslaan';

  @override
  String get tutorialGoalAndPoints => 'Doel en huidige punten';

  @override
  String get tutorialGoalDescription =>
      'De buitenste cirkel toont je doel, de binnenste cirkel je totale punten. De cirkel vult zich naarmate je je doel nadert.';

  @override
  String get tutorialOneMinuteTraining => 'Training van 1 minuut';

  @override
  String get tutorialTrainingDescription =>
      'Start een spel van 1 minuut. Kies positieve afbeeldingen of goede gewoonten uit 4 opties.';

  @override
  String get tutorialScoreProgress => 'Scoreverloop';

  @override
  String get tutorialScoreDescription =>
      'Bekijk gedetailleerde informatie over je behaalde scores.';

  @override
  String get tutorialSettingsAndData => 'Instellingen en gegevensbeheer';

  @override
  String get tutorialSettingsDescription =>
      'Wijzig doelwaarden, bekijk app-informatie en reset gegevens.';

  @override
  String get appIntroAttentionBiasTitle => 'Over aandachtsbias';

  @override
  String get appIntroAttentionBiasContent =>
      'Bij veel angst zijn we onbewust geneigd om alleen op negatieve dingen te letten.';

  @override
  String get appIntroFocusMintRoleTitle => 'De rol van FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Een kort spel om te oefenen je aandacht op positieve afbeeldingen te richten.';

  @override
  String get appIntroScientificEvidenceTitle => 'Over deze oefening';

  @override
  String get appIntroScientificEvidenceContent =>
      'Oefen met het vinden van positieve afbeeldingen. FocusMint is een hulpmiddel voor zelfzorg, geen medische behandeling. Resultaten verschillen per persoon.';

  @override
  String get appIntroExpectedEffectsTitle => 'Wat je kunt oefenen';

  @override
  String get appIntroEffect1 => 'Positieve afbeeldingen zoeken';

  @override
  String get appIntroEffect2 => 'Een glimlach om je heen opmerken';

  @override
  String get appIntroEffect3 => 'Een korte dagelijkse routine opbouwen';

  @override
  String get appIntroHowToUse => 'Bekijk hoe het werkt';

  @override
  String get pointsEarned => 'Punten verdiend!';

  @override
  String get yourScore => 'Jouw score';

  @override
  String get totalPlayTime => 'Totale speeltijd';

  @override
  String get imageManagement => 'Afbeeldingsbeheer';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Verborgen afbeeldingen: $count/$max';
  }

  @override
  String get unsavedChanges => 'Je hebt niet-opgeslagen wijzigingen';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Je hebt $count niet-opgeslagen wijzigingen in de weergave-instellingen van afbeeldingen.';
  }

  @override
  String get unsavedChangesWarning =>
      'Wijzigingen gaan verloren als je dit scherm nu sluit.';

  @override
  String get discardChanges => 'Wijzigingen negeren';

  @override
  String get saveAndExit => 'Opslaan en sluiten';

  @override
  String settingsSaved(Object count) {
    return '$count instellingen opgeslagen';
  }

  @override
  String get saveError =>
      'Er is een fout opgetreden bij het opslaan van de instellingen';

  @override
  String get imageSettingsUpdated => 'Afbeeldingsinstellingen zijn bijgewerkt';

  @override
  String get allImages => 'Alle';

  @override
  String get positiveImages => 'Positief';

  @override
  String get negativeImages => 'Negatief';

  @override
  String get smileImages => 'Glimlach';

  @override
  String get vegetableImages => 'Voedzame voeding';

  @override
  String get healthImages => 'Beweging en contact';

  @override
  String get sadImages => 'Boosheid, verdriet en zorgen';

  @override
  String get badFoodImages => 'Fastfood en snoep';

  @override
  String get badImages => 'Ongezonde gewoonten';

  @override
  String get imageManagementHint =>
      'Tik om afbeeldingen te tonen of te verbergen. Je kunt maximaal 15 afbeeldingen verbergen.';

  @override
  String get unsaved => 'Niet opgeslagen';

  @override
  String get save => 'Opslaan';

  @override
  String get hiddenImages => 'Verborgen';

  @override
  String get noHiddenImages => 'Geen verborgen afbeeldingen';

  @override
  String get settingsLoadFailed => 'Laden van instellingen mislukt';

  @override
  String imagesAdded(int count) {
    return '$count afbeeldingen toegevoegd';
  }

  @override
  String get imageAddFailed => 'Toevoegen van afbeeldingen mislukt';

  @override
  String get imageSelectionFailed => 'Selecteren van afbeeldingen mislukt';

  @override
  String get settingsChangeFailed => 'Wijzigen van instellingen mislukt';

  @override
  String groupTitle(String name) {
    return 'Groep: $name';
  }

  @override
  String get displayToggle => 'Weergave wisselen';

  @override
  String imageCount(int count) {
    return '$count afbeeldingen';
  }

  @override
  String get noticeTitle => 'Belangrijke opmerkingen';

  @override
  String get notice1 => 'De functie voor eigen afbeeldingen is toegevoegd!';

  @override
  String get notice2 =>
      'Je kunt je eigen afbeeldingen toevoegen via het instellingenscherm';

  @override
  String get notice3 => 'Bekijk het instellingenscherm voor details';

  @override
  String get customImageTitle => 'Eigen afbeeldingen';

  @override
  String get customImageSubtitle =>
      'Voeg je eigen afbeeldingen toe en beheer ze';

  @override
  String get addCustomImages => 'Eigen afbeeldingen toevoegen';

  @override
  String get selectImages => 'Afbeeldingen selecteren';

  @override
  String get unknownImage => 'Onbekende afbeelding';

  @override
  String get customImageSettings => 'Instellingen voor eigen afbeeldingen';

  @override
  String get useCustomImages => 'Eigen afbeeldingen gebruiken';

  @override
  String get useCustomImagesDescription =>
      'Gebruik je eigen afbeeldingen om te oefenen. Schakel hieronder mengen in om ook de ingebouwde afbeeldingen te gebruiken.';

  @override
  String get groupSettings => 'Groepsinstellingen';

  @override
  String get minOneGroupRequired => 'Minstens één groep moet ingeschakeld zijn';

  @override
  String get settingsLoadFailedMessage => 'Laden van instellingen mislukt';

  @override
  String get customImageNotice1 =>
      'Als groepen zijn ingeschakeld, worden afbeeldingen per groep willekeurig weergegeven.';

  @override
  String get customImageNotice2 =>
      'Afbeeldingen die je uploadt en instelt, worden niet gedeeld met ontwikkelaars of derden en worden alleen opgeslagen in het app-gedeelte van je apparaat.';

  @override
  String get customImageNotice3 => 'Hierdoor is offline gebruik mogelijk.';

  @override
  String get customImageNotice4 =>
      'Veel afbeeldingen toevoegen kost opslagruimte. Schakel bij problemen eigen afbeeldingen uit of verwijder ongebruikte afbeeldingen in Instellingen.';

  @override
  String get customImageNotice5 =>
      'Als je de app verwijdert, worden de ingestelde afbeeldingen gewist.';

  @override
  String get customImageRequirementNotMet =>
      'Om eigen afbeeldingen te gebruiken heb je in de ingeschakelde groepen minstens 1 goede afbeelding en 3 niet-goede afbeeldingen nodig.';

  @override
  String get customImageRequirement =>
      'Om eigen afbeeldingen te gebruiken heb je in de ingeschakelde groepen minstens 1 goede afbeelding en 3 niet-goede afbeeldingen nodig.';

  @override
  String get sunnyWeather => 'Goed';

  @override
  String get rainyWeather => 'Niet goed';

  @override
  String get addImages => 'Afbeeldingen toevoegen';

  @override
  String get imageDeleted => 'Afbeelding verwijderd';

  @override
  String get imageDeleteFailed => 'Verwijderen van afbeelding mislukt';

  @override
  String get deleteImageTitle => 'Afbeelding verwijderen';

  @override
  String get deleteImageMessage =>
      'Wil je deze afbeelding verwijderen? Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Groep $groupId – afbeeldingen ‘$weather’';
  }

  @override
  String registeredCount(int count) {
    return 'Geregistreerd: $count afbeeldingen';
  }

  @override
  String get noImagesRegistered => 'Geen afbeeldingen geregistreerd';

  @override
  String get imagePreview => 'Afbeeldingsvoorbeeld';

  @override
  String get close => 'Sluiten';

  @override
  String get contactEmailSubject => 'FocusMint - Contact';

  @override
  String get contactEmailBody => 'Deel je feedback en vragen met ons.';

  @override
  String get mixWithBuiltInImages => 'Mengen met ingebouwde afbeeldingen';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Je eigen en de ingebouwde afbeeldingen samen gebruiken';

  @override
  String get supportIntro =>
      'Chat anoniem met de ontwikkelaar. Vragen en suggesties zijn welkom. Je kunt per dag 3 berichten sturen. Na elk antwoord van de ontwikkelaar kun je weer 3 berichten sturen.';

  @override
  String get supportReceived =>
      'Bericht ontvangen. We antwoorden meestal binnen 2–3 dagen.';

  @override
  String get supportComposer => 'Typ een bericht';

  @override
  String get supportSend => 'Versturen';

  @override
  String get supportRetry => 'Opnieuw proberen';

  @override
  String get supportSent => 'Verstuurd';

  @override
  String get supportUnsent => 'Niet verstuurd · opgeslagen op dit apparaat';

  @override
  String get supportAttach => 'Afbeelding bijvoegen';

  @override
  String get supportRemoveImage => 'Afbeelding verwijderen';

  @override
  String get supportImage => 'Bijlage';

  @override
  String get supportClear => 'Geschiedenis verwijderen';

  @override
  String get supportClearConfirm =>
      'Dit gesprek verwijderen? Niet-verstuurde concepten en de geschiedenis op de server worden ook verwijderd. Je berichtenlimiet wordt niet hersteld.';

  @override
  String get supportQuota =>
      'Je hebt de 3 berichten van vandaag gebruikt. Stuur morgen of na een antwoord van de ontwikkelaar een nieuw bericht.';

  @override
  String get supportConnectionError =>
      'Geen verbinding. Opgeslagen concepten zijn niet verstuurd.';

  @override
  String get supportSendError =>
      'Versturen mislukt. Je bericht is op dit apparaat opgeslagen. Probeer het opnieuw.';

  @override
  String get supportStorageError => 'Opslaan mislukt. Probeer het opnieuw.';

  @override
  String get supportClearError =>
      'De geschiedenis kon niet worden verwijderd. Controleer je verbinding en probeer het opnieuw.';

  @override
  String get supportImageError =>
      'De afbeelding kon niet worden geladen. Kies een afbeelding van minder dan 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Vandaag nog beschikbaar: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Ongelezen antwoorden: $count';
  }

  @override
  String get supportGuide => 'Informatie';

  @override
  String get supportDeveloper => 'Ontwikkelaar';

  @override
  String get supportPrivacy => 'Gegevens bij ondersteuning';

  @override
  String get breathingTitle => 'Neem even een ademhaling';

  @override
  String get breathingHint =>
      'Volg de rustige beweging van de longen\nin een comfortabel tempo.';

  @override
  String get breathingIn => 'Adem rustig in';

  @override
  String get breathingOut => 'Adem rustig uit';

  @override
  String get breathingProgress => 'Voortgang van de ademhaling';

  @override
  String get breathingResultHint => 'Je resultaten verschijnen automatisch.';

  @override
  String get breathingSkip => 'Naar de resultaten';
}
