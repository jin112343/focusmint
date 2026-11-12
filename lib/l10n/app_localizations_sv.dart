// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Aktuella poäng';

  @override
  String goalLabel(int goal) {
    return 'Mål: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Återstår: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Mål uppnått!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage =>
      'Öva på att lägga märke till det positiva.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Tid kvar: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Tid kvar: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Resultat: $score poäng';
  }

  @override
  String get imagePreparationMessage => 'Förbereder bilder...';

  @override
  String get noStimuliAvailable => 'Inga stimuli tillgängliga';

  @override
  String get invalidGridSize => 'Ogiltig rutnätsstorlek';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Startar...';

  @override
  String get excellentPerformance => 'Utmärkt prestation!';

  @override
  String get greatJob => 'Bra jobbat!';

  @override
  String get goodPerformance => 'Bra prestation';

  @override
  String get keepPracticingFeedback => 'Fortsätt öva';

  @override
  String get takeYourTimeFeedback => 'Ta den tid du behöver';

  @override
  String get happy => 'Glad';

  @override
  String get angry => 'Arg';

  @override
  String get fear => 'Rädsla';

  @override
  String get sad => 'Ledsen';

  @override
  String get historyPageTitle => 'Träningshistorik';

  @override
  String get dataLoading => 'Läser in data...';

  @override
  String get pointsHistory => 'Poänghistorik';

  @override
  String get weekly => 'Veckovis';

  @override
  String get monthly => 'Månadsvis';

  @override
  String get noDataAvailable => 'Ingen data tillgänglig';

  @override
  String get goalAchievementRate => 'Måluppfyllelse';

  @override
  String get scoreStatistics => 'Poängstatistik';

  @override
  String get bestScore => 'Bästa resultat';

  @override
  String get totalScore => 'Totalt resultat';

  @override
  String get trainingTime => 'Träningstid';

  @override
  String get totalTrainingTime => 'Total träningstid';

  @override
  String get detailedStatistics => 'Detaljerad statistik';

  @override
  String get averageScorePerMinute => 'Genomsnittligt resultat per minut';

  @override
  String get pointsToGoal => 'Poäng kvar till målet';

  @override
  String get goalSetting => 'Målinställning';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'poäng';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'sön';

  @override
  String get mondayShort => 'mån';

  @override
  String get tuesdayShort => 'tis';

  @override
  String get wednesdayShort => 'ons';

  @override
  String get thursdayShort => 'tors';

  @override
  String get fridayShort => 'fre';

  @override
  String get saturdayShort => 'lör';

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get goalPointsSetting => 'Inställning av målpoäng';

  @override
  String currentGoalPoints(int points) {
    return 'Nuvarande mål: $points poäng';
  }

  @override
  String get newGoalPointsLabel => 'Nya målpoäng';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'poäng';

  @override
  String get saveGoalButton => 'Spara mål';

  @override
  String goalSetTo(int points) {
    return 'Målet är satt till $points poäng';
  }

  @override
  String get enterGoalPoints => 'Ange målpoäng';

  @override
  String get enterValidNumber => 'Ange ett giltigt tal (1 till 99999999)';

  @override
  String get saveFailed => 'Det gick inte att spara vissa inställningar';

  @override
  String get emailOpenFailed => 'Det gick inte att öppna e-postappen';

  @override
  String get pageOpenFailed => 'Det gick inte att öppna sidan';

  @override
  String get appInfoSupport => 'Appinfo och support';

  @override
  String get contactUs => 'Kontakta oss';

  @override
  String get contactUsSubtitle => 'Dela dina synpunkter och frågor';

  @override
  String get termsOfService => 'Användarvillkor';

  @override
  String get termsSubtitle => 'Läs appens användarvillkor';

  @override
  String get privacyPolicy => 'Integritetspolicy';

  @override
  String get privacySubtitle => 'Om hantering av integritetsuppgifter';

  @override
  String get tutorialTitle => 'Handledning';

  @override
  String get tutorialSubtitle => 'Lär dig hur appen används';

  @override
  String get dataManagement => 'Datahantering';

  @override
  String get deleteHistory => 'Radera historik';

  @override
  String get deleteHistorySubtitle =>
      'Raderar endast träningshistoriken (målpoängen behålls)';

  @override
  String get deleteHistoryAndGoal => 'Radera historik och mål';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Raderar all historik och alla målpoäng';

  @override
  String get deleteHistoryConfirmTitle => 'Radera historik';

  @override
  String get deleteHistoryConfirmMessage =>
      'Vill du verkligen radera all träningshistorik?\n\n*Målpoängen behålls';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Radera historik och mål';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Vill du verkligen radera all historik och alla målpoäng?\n\n*Den här åtgärden kan inte ångras';

  @override
  String get cancel => 'Avbryt';

  @override
  String get delete => 'Radera';

  @override
  String get historyDeleted => 'Historiken har raderats';

  @override
  String get historyAndGoalDeleted => 'Historik och mål har raderats';

  @override
  String get historyDeleteFailed => 'Det gick inte att radera historiken';

  @override
  String get historyAndGoalDeleteFailed =>
      'Det gick inte att radera historik och mål';

  @override
  String get tutorialDisplayFailed => 'Det gick inte att visa handledningen';

  @override
  String get tips => 'Tips';

  @override
  String get tipsContent =>
      '• Ditt mål visas i diagrammet på startskärmen\n• Börja med ett litet mål och öka det i din egen takt\n• Varje rätt val ger upp till 6 poäng';

  @override
  String get backToHome => 'Tillbaka till start';

  @override
  String get tutorialSkip => 'Hoppa över';

  @override
  String get tutorialGoalAndPoints => 'Mål och aktuella poäng';

  @override
  String get tutorialGoalDescription =>
      'Den yttre cirkeln visar ditt mål, den inre visar dina totala poäng. Cirkeln fylls i takt med att du närmar dig målet.';

  @override
  String get tutorialOneMinuteTraining => '1-minutsträning';

  @override
  String get tutorialTrainingDescription =>
      'Starta ett 1-minutsspel. Välj positiva bilder eller goda vanor bland 4 alternativ.';

  @override
  String get tutorialScoreProgress => 'Poängutveckling';

  @override
  String get tutorialScoreDescription =>
      'Se detaljerad information om dina intjänade poäng.';

  @override
  String get tutorialSettingsAndData => 'Inställningar och datahantering';

  @override
  String get tutorialSettingsDescription =>
      'Ändra målvärden, visa appinformation och återställ data.';

  @override
  String get appIntroAttentionBiasTitle => 'Om uppmärksamhetsbias';

  @override
  String get appIntroAttentionBiasContent =>
      'När oron är stark tenderar vi omedvetet att bara fokusera på det negativa.';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMints roll';

  @override
  String get appIntroFocusMintRoleContent =>
      'Ett kort spel där du övar på att rikta uppmärksamheten mot positiva bilder.';

  @override
  String get appIntroScientificEvidenceTitle => 'Om den här övningen';

  @override
  String get appIntroScientificEvidenceContent =>
      'Öva på att hitta positiva bilder. FocusMint är ett verktyg för egenvård, inte en medicinsk behandling. Resultaten varierar mellan olika personer.';

  @override
  String get appIntroExpectedEffectsTitle => 'Det här kan du öva på';

  @override
  String get appIntroEffect1 => 'Leta efter positiva bilder';

  @override
  String get appIntroEffect2 => 'Lägga märke till leenden omkring dig';

  @override
  String get appIntroEffect3 => 'Skapa en kort daglig rutin';

  @override
  String get appIntroHowToUse => 'Se hur appen används';

  @override
  String get pointsEarned => 'Poäng intjänade!';

  @override
  String get yourScore => 'Ditt resultat';

  @override
  String get totalPlayTime => 'Total speltid';

  @override
  String get imageManagement => 'Bildhantering';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Dolda bilder: $count/$max';
  }

  @override
  String get unsavedChanges => 'Du har osparade ändringar';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Du har $count osparade ändringar i bildvisningsinställningarna.';
  }

  @override
  String get unsavedChangesWarning =>
      'Ändringarna går förlorade om du stänger skärmen nu.';

  @override
  String get discardChanges => 'Ignorera ändringar';

  @override
  String get saveAndExit => 'Spara och avsluta';

  @override
  String settingsSaved(Object count) {
    return '$count inställningar har sparats';
  }

  @override
  String get saveError => 'Ett fel uppstod när inställningarna sparades';

  @override
  String get imageSettingsUpdated => 'Bildinställningarna har uppdaterats';

  @override
  String get allImages => 'Alla';

  @override
  String get positiveImages => 'Positiva';

  @override
  String get negativeImages => 'Negativa';

  @override
  String get smileImages => 'Leenden';

  @override
  String get vegetableImages => 'Näringsrik mat';

  @override
  String get healthImages => 'Rörelse och gemenskap';

  @override
  String get sadImages => 'Ilska, sorg och oro';

  @override
  String get badFoodImages => 'Snabbmat och sötsaker';

  @override
  String get badImages => 'Ohälsosamma vanor';

  @override
  String get imageManagementHint =>
      'Tryck för att visa eller dölja en bild. Du kan dölja upp till 15 bilder.';

  @override
  String get unsaved => 'Osparad';

  @override
  String get save => 'Spara';

  @override
  String get hiddenImages => 'Dolda';

  @override
  String get noHiddenImages => 'Inga dolda bilder';

  @override
  String get settingsLoadFailed => 'Det gick inte att läsa in inställningarna';

  @override
  String imagesAdded(int count) {
    return '$count bilder har lagts till';
  }

  @override
  String get imageAddFailed => 'Det gick inte att lägga till bilder';

  @override
  String get imageSelectionFailed => 'Det gick inte att välja bilder';

  @override
  String get settingsChangeFailed => 'Det gick inte att ändra inställningarna';

  @override
  String groupTitle(String name) {
    return 'Grupp: $name';
  }

  @override
  String get displayToggle => 'Växla visning';

  @override
  String imageCount(int count) {
    return '$count bilder';
  }

  @override
  String get noticeTitle => 'Viktig information';

  @override
  String get notice1 => 'Funktionen för egna bilder har lagts till!';

  @override
  String get notice2 =>
      'Du kan lägga till egna bilder från inställningsskärmen';

  @override
  String get notice3 => 'Se inställningsskärmen för mer information';

  @override
  String get customImageTitle => 'Egna bilder';

  @override
  String get customImageSubtitle => 'Lägg till och hantera egna bilder';

  @override
  String get addCustomImages => 'Lägg till egna bilder';

  @override
  String get selectImages => 'Välj bilder';

  @override
  String get unknownImage => 'Okänd bild';

  @override
  String get customImageSettings => 'Inställningar för egna bilder';

  @override
  String get useCustomImages => 'Använd egna bilder';

  @override
  String get useCustomImagesDescription =>
      'Använd dina egna bilder i övningen. Aktivera blandning nedan för att även använda appens bilder.';

  @override
  String get groupSettings => 'Gruppinställningar';

  @override
  String get minOneGroupRequired => 'Minst en grupp måste vara aktiverad';

  @override
  String get settingsLoadFailedMessage =>
      'Det gick inte att läsa in inställningarna';

  @override
  String get customImageNotice1 =>
      'När grupper är aktiverade visas bilderna slumpmässigt för varje grupp.';

  @override
  String get customImageNotice2 =>
      'Bilder som användaren laddar upp och ställer in delas inte med utvecklare eller tredje part och lagras endast i appens område på enheten.';

  @override
  String get customImageNotice3 => 'Därför kan appen användas offline.';

  @override
  String get customImageNotice4 =>
      'Många bilder tar lagringsutrymme. Om du får problem kan du stänga av egna bilder eller ta bort oanvända bilder i Inställningar.';

  @override
  String get customImageNotice5 =>
      'När du tar bort appen raderas de inställda bilderna.';

  @override
  String get customImageRequirementNotMet =>
      'För att använda egna bilder behöver du minst 1 bra bild och 3 mindre bra bilder i aktiverade grupper.';

  @override
  String get customImageRequirement =>
      'För att använda egna bilder behöver du minst 1 bra bild och 3 mindre bra bilder i aktiverade grupper.';

  @override
  String get sunnyWeather => 'Bra';

  @override
  String get rainyWeather => 'Mindre bra';

  @override
  String get addImages => 'Lägg till bilder';

  @override
  String get imageDeleted => 'Bilden har raderats';

  @override
  String get imageDeleteFailed => 'Det gick inte att radera bilden';

  @override
  String get deleteImageTitle => 'Radera bild';

  @override
  String get deleteImageMessage =>
      'Vill du radera den här bilden? Den här åtgärden kan inte ångras.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Grupp $groupId – $weather bilder';
  }

  @override
  String registeredCount(int count) {
    return 'Registrerade: $count bilder';
  }

  @override
  String get noImagesRegistered => 'Inga bilder registrerade';

  @override
  String get imagePreview => 'Förhandsgranskning av bild';

  @override
  String get close => 'Stäng';

  @override
  String get contactEmailSubject => 'FocusMint – Kontakt';

  @override
  String get contactEmailBody => 'Dela gärna dina synpunkter och frågor.';

  @override
  String get mixWithBuiltInImages => 'Blanda med appens bilder';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Använd dina egna bilder och appens bilder tillsammans';

  @override
  String get supportIntro =>
      'Skriv anonymt till utvecklaren. Frågor och förslag är välkomna. Du kan skicka 3 meddelanden per dag. Varje svar från utvecklaren ger dig 3 nya meddelanden.';

  @override
  String get supportReceived =>
      'Meddelandet har tagits emot. Vi svarar vanligtvis inom 2–3 dagar.';

  @override
  String get supportComposer => 'Skriv ett meddelande';

  @override
  String get supportSend => 'Skicka';

  @override
  String get supportRetry => 'Försök igen';

  @override
  String get supportSent => 'Skickat';

  @override
  String get supportUnsent => 'Inte skickat · sparat på den här enheten';

  @override
  String get supportAttach => 'Bifoga bild';

  @override
  String get supportRemoveImage => 'Ta bort bild';

  @override
  String get supportImage => 'Bilaga';

  @override
  String get supportClear => 'Radera historik';

  @override
  String get supportClearConfirm =>
      'Vill du radera den här konversationen? Även oskickade utkast och historiken på servern raderas. Din meddelandegräns återställs inte.';

  @override
  String get supportQuota =>
      'Du har använt dagens 3 meddelanden. Skicka ett nytt i morgon eller efter ett svar från utvecklaren.';

  @override
  String get supportConnectionError =>
      'Kunde inte ansluta. Sparade utkast har inte skickats.';

  @override
  String get supportSendError =>
      'Kunde inte skicka. Ditt meddelande är sparat på den här enheten. Försök igen.';

  @override
  String get supportStorageError => 'Kunde inte spara. Försök igen.';

  @override
  String get supportClearError =>
      'Kunde inte radera historiken. Kontrollera anslutningen och försök igen.';

  @override
  String get supportImageError =>
      'Kunde inte läsa in bilden. Välj en bild som är mindre än 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Meddelanden kvar i dag: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Olästa svar: $count';
  }

  @override
  String get supportGuide => 'Information';

  @override
  String get supportDeveloper => 'Utvecklare';

  @override
  String get supportPrivacy => 'Uppgifter i supportärenden';

  @override
  String get breathingTitle => 'Ta ett lugnt andetag';

  @override
  String get breathingHint =>
      'Följ lungornas mjuka rörelse\ni en behaglig takt.';

  @override
  String get breathingIn => 'Andas in långsamt';

  @override
  String get breathingOut => 'Andas ut långsamt';

  @override
  String get breathingProgress => 'Andningsövningens förlopp';

  @override
  String get breathingResultHint => 'Dina resultat visas automatiskt.';

  @override
  String get breathingSkip => 'Gå till resultat';
}
