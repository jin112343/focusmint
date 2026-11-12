// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Aktuálne body';

  @override
  String goalLabel(int goal) {
    return 'Cieľ: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Zostáva: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Cieľ dosiahnutý!';

  @override
  String get startButtonText => 'ŠTART';

  @override
  String get stressReductionMessage =>
      'Precvičujte si vnímanie pozitívnych vecí.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Zostávajúci čas: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Zostávajúci čas: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Skóre: $score bodov';
  }

  @override
  String get imagePreparationMessage => 'Pripravujú sa obrázky...';

  @override
  String get noStimuliAvailable => 'Nie sú k dispozícii žiadne podnety';

  @override
  String get invalidGridSize => 'Neplatná veľkosť mriežky';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Začíname...';

  @override
  String get excellentPerformance => 'Vynikajúci výkon!';

  @override
  String get greatJob => 'Skvelá práca!';

  @override
  String get goodPerformance => 'Dobrý výkon';

  @override
  String get keepPracticingFeedback => 'Pokračujte v tréningu';

  @override
  String get takeYourTimeFeedback => 'Nemusíte sa ponáhľať';

  @override
  String get happy => 'Radosť';

  @override
  String get angry => 'Hnev';

  @override
  String get fear => 'Strach';

  @override
  String get sad => 'Smútok';

  @override
  String get historyPageTitle => 'História tréningov';

  @override
  String get dataLoading => 'Načítavajú sa údaje...';

  @override
  String get pointsHistory => 'História bodov';

  @override
  String get weekly => 'Týždenne';

  @override
  String get monthly => 'Mesačne';

  @override
  String get noDataAvailable => 'Žiadne údaje';

  @override
  String get goalAchievementRate => 'Miera dosiahnutia cieľa';

  @override
  String get scoreStatistics => 'Štatistiky skóre';

  @override
  String get bestScore => 'Najlepšie skóre';

  @override
  String get totalScore => 'Celkové skóre';

  @override
  String get trainingTime => 'Čas tréningu';

  @override
  String get totalTrainingTime => 'Celkový čas tréningu';

  @override
  String get detailedStatistics => 'Podrobné štatistiky';

  @override
  String get averageScorePerMinute => 'Priemerné skóre za minútu';

  @override
  String get pointsToGoal => 'Body do cieľa';

  @override
  String get goalSetting => 'Nastavenie cieľa';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'bodov';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Ne';

  @override
  String get mondayShort => 'Po';

  @override
  String get tuesdayShort => 'Ut';

  @override
  String get wednesdayShort => 'St';

  @override
  String get thursdayShort => 'Št';

  @override
  String get fridayShort => 'Pi';

  @override
  String get saturdayShort => 'So';

  @override
  String get settingsTitle => 'Nastavenia';

  @override
  String get goalPointsSetting => 'Nastavenie cieľových bodov';

  @override
  String currentGoalPoints(int points) {
    return 'Aktuálny cieľ: $points bodov';
  }

  @override
  String get newGoalPointsLabel => 'Nové cieľové body';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'bodov';

  @override
  String get saveGoalButton => 'Uložiť cieľ';

  @override
  String goalSetTo(int points) {
    return 'Cieľ nastavený na $points bodov';
  }

  @override
  String get enterGoalPoints => 'Zadajte cieľové body';

  @override
  String get enterValidNumber => 'Zadajte platné číslo (1 až 99999999)';

  @override
  String get saveFailed => 'Niektoré nastavenia sa nepodarilo uložiť';

  @override
  String get emailOpenFailed => 'Nepodarilo sa otvoriť e-mailovú aplikáciu';

  @override
  String get pageOpenFailed => 'Nepodarilo sa otvoriť stránku';

  @override
  String get appInfoSupport => 'Informácie o aplikácii a podpora';

  @override
  String get contactUs => 'Kontaktujte nás';

  @override
  String get contactUsSubtitle => 'Podeľte sa o svoje názory a otázky';

  @override
  String get termsOfService => 'Podmienky používania';

  @override
  String get termsSubtitle => 'Prečítajte si podmienky používania aplikácie';

  @override
  String get privacyPolicy => 'Zásady ochrany osobných údajov';

  @override
  String get privacySubtitle => 'O zaobchádzaní s osobnými údajmi';

  @override
  String get tutorialTitle => 'Návod';

  @override
  String get tutorialSubtitle => 'Naučte sa používať aplikáciu';

  @override
  String get dataManagement => 'Správa údajov';

  @override
  String get deleteHistory => 'Vymazať históriu';

  @override
  String get deleteHistorySubtitle =>
      'Vymaže iba históriu tréningov (cieľové body zostanú zachované)';

  @override
  String get deleteHistoryAndGoal => 'Vymazať históriu a cieľ';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Vymaže celú históriu a cieľové body';

  @override
  String get deleteHistoryConfirmTitle => 'Vymazať históriu';

  @override
  String get deleteHistoryConfirmMessage =>
      'Naozaj chcete vymazať celú históriu tréningov?\n\n*Cieľové body zostanú zachované';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Vymazať históriu a cieľ';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Naozaj chcete vymazať celú históriu a cieľové body?\n\n*Túto akciu nie je možné vrátiť späť';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get delete => 'Vymazať';

  @override
  String get historyDeleted => 'História bola vymazaná';

  @override
  String get historyAndGoalDeleted => 'História a cieľ boli vymazané';

  @override
  String get historyDeleteFailed => 'Vymazanie histórie zlyhalo';

  @override
  String get historyAndGoalDeleteFailed => 'Vymazanie histórie a cieľa zlyhalo';

  @override
  String get tutorialDisplayFailed => 'Zobrazenie návodu zlyhalo';

  @override
  String get tips => 'Tipy';

  @override
  String get tipsContent =>
      '• Váš cieľ sa zobrazuje v grafe na úvodnej obrazovke\n• Začnite malým cieľom a zvyšujte ho vlastným tempom\n• Každá správna voľba prináša až 6 bodov';

  @override
  String get backToHome => 'Späť na domovskú obrazovku';

  @override
  String get tutorialSkip => 'Preskočiť';

  @override
  String get tutorialGoalAndPoints => 'Cieľ a aktuálne body';

  @override
  String get tutorialGoalDescription =>
      'Vonkajší kruh zobrazuje váš cieľ, vnútorný celkové body. Kruh sa zapĺňa, ako sa blížite k cieľu.';

  @override
  String get tutorialOneMinuteTraining => '1-minútový tréning';

  @override
  String get tutorialTrainingDescription =>
      'Spustite 1-minútovú hru. Zo 4 možností vyberajte pozitívne obrázky alebo dobré návyky.';

  @override
  String get tutorialScoreProgress => 'Vývoj skóre';

  @override
  String get tutorialScoreDescription =>
      'Pozrite si podrobné informácie o získanom skóre.';

  @override
  String get tutorialSettingsAndData => 'Nastavenia a správa údajov';

  @override
  String get tutorialSettingsDescription =>
      'Zmeňte cieľové hodnoty, zobrazte informácie o aplikácii a resetujte údaje.';

  @override
  String get appIntroAttentionBiasTitle => 'O skreslení pozornosti';

  @override
  String get appIntroAttentionBiasContent =>
      'Pri silnej úzkosti máme tendenciu nevedome sa sústrediť len na negatívne veci.';

  @override
  String get appIntroFocusMintRoleTitle => 'Úloha aplikácie FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Krátka hra na precvičovanie zamerania pozornosti na pozitívne obrázky.';

  @override
  String get appIntroScientificEvidenceTitle => 'O tomto cvičení';

  @override
  String get appIntroScientificEvidenceContent =>
      'Precvičujte si hľadanie pozitívnych obrázkov. FocusMint je pomôcka na starostlivosť o seba, nie lekárska liečba. Výsledky sa môžu u jednotlivých ľudí líšiť.';

  @override
  String get appIntroExpectedEffectsTitle => 'Čo môžete precvičovať';

  @override
  String get appIntroEffect1 => 'Hľadanie pozitívnych obrázkov';

  @override
  String get appIntroEffect2 => 'Všímanie si úsmevov okolo seba';

  @override
  String get appIntroEffect3 => 'Vytváranie krátkeho každodenného návyku';

  @override
  String get appIntroHowToUse => 'Pozrieť návod na použitie';

  @override
  String get pointsEarned => 'Body získané!';

  @override
  String get yourScore => 'Vaše skóre';

  @override
  String get totalPlayTime => 'Celkový čas hrania';

  @override
  String get imageManagement => 'Správa obrázkov';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Skryté obrázky: $count/$max';
  }

  @override
  String get unsavedChanges => 'Máte neuložené zmeny';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Máte $count neuložených zmien v nastaveniach zobrazenia obrázkov.';
  }

  @override
  String get unsavedChangesWarning =>
      'Ak túto obrazovku teraz zavriete, zmeny sa stratia.';

  @override
  String get discardChanges => 'Zahodiť zmeny';

  @override
  String get saveAndExit => 'Uložiť a ukončiť';

  @override
  String settingsSaved(Object count) {
    return 'Uložených $count nastavení';
  }

  @override
  String get saveError => 'Pri ukladaní nastavení sa vyskytla chyba';

  @override
  String get imageSettingsUpdated => 'Nastavenia obrázkov boli aktualizované';

  @override
  String get allImages => 'Všetky';

  @override
  String get positiveImages => 'Pozitívne';

  @override
  String get negativeImages => 'Negatívne';

  @override
  String get smileImages => 'Úsmev';

  @override
  String get vegetableImages => 'Výživné jedlo';

  @override
  String get healthImages => 'Pohyb a kontakt s ľuďmi';

  @override
  String get sadImages => 'Hnev, smútok a obavy';

  @override
  String get badFoodImages => 'Rýchle občerstvenie a sladkosti';

  @override
  String get badImages => 'Nezdravé návyky';

  @override
  String get imageManagementHint =>
      'Ťuknutím prepnete viditeľnosť obrázka. Skryť môžete až 15 obrázkov.';

  @override
  String get unsaved => 'Neuložené';

  @override
  String get save => 'Uložiť';

  @override
  String get hiddenImages => 'Skryté';

  @override
  String get noHiddenImages => 'Žiadne skryté obrázky';

  @override
  String get settingsLoadFailed => 'Načítanie nastavení zlyhalo';

  @override
  String imagesAdded(int count) {
    return 'Pridaných $count obrázkov';
  }

  @override
  String get imageAddFailed => 'Pridanie obrázkov zlyhalo';

  @override
  String get imageSelectionFailed => 'Výber obrázkov zlyhal';

  @override
  String get settingsChangeFailed => 'Zmena nastavení zlyhala';

  @override
  String groupTitle(String name) {
    return 'Skupina: $name';
  }

  @override
  String get displayToggle => 'Prepnutie zobrazenia';

  @override
  String imageCount(int count) {
    return '$count obrázkov';
  }

  @override
  String get noticeTitle => 'Dôležité upozornenia';

  @override
  String get notice1 => 'Pridali sme funkciu vlastných obrázkov!';

  @override
  String get notice2 => 'Vlastné obrázky môžete pridať na obrazovke nastavení';

  @override
  String get notice3 => 'Podrobnosti nájdete na obrazovke nastavení';

  @override
  String get customImageTitle => 'Vlastné obrázky';

  @override
  String get customImageSubtitle => 'Pridávajte a spravujte vlastné obrázky';

  @override
  String get addCustomImages => 'Pridať vlastné obrázky';

  @override
  String get selectImages => 'Vybrať obrázky';

  @override
  String get unknownImage => 'Neznámy obrázok';

  @override
  String get customImageSettings => 'Nastavenia vlastných obrázkov';

  @override
  String get useCustomImages => 'Používať vlastné obrázky';

  @override
  String get useCustomImagesDescription =>
      'Používajte pri cvičení vlastné obrázky. Zapnutím kombinovania nižšie pridáte aj obrázky z aplikácie.';

  @override
  String get groupSettings => 'Nastavenia skupín';

  @override
  String get minOneGroupRequired => 'Aspoň jedna skupina musí byť povolená';

  @override
  String get settingsLoadFailedMessage => 'Načítanie nastavení zlyhalo';

  @override
  String get customImageNotice1 =>
      'Keď sú skupiny povolené, obrázky sa v každej skupine zobrazujú náhodne.';

  @override
  String get customImageNotice2 =>
      'Obrázky nahrané a nastavené používateľmi sa nezdieľajú s vývojármi ani tretími stranami a ukladajú sa iba v priestore aplikácie na zariadení.';

  @override
  String get customImageNotice3 =>
      'Vďaka tomu je možné aplikáciu používať offline.';

  @override
  String get customImageNotice4 =>
      'Veľké množstvo obrázkov zaberá úložisko. Pri problémoch vypnite vlastné obrázky alebo odstráňte nepoužívané obrázky v nastaveniach.';

  @override
  String get customImageNotice5 =>
      'Po odstránení aplikácie sa nastavené obrázky vymažú.';

  @override
  String get customImageRequirementNotMet =>
      'Na používanie vlastných obrázkov potrebujete v povolených skupinách aspoň 1 dobrý obrázok a 3 nie dobré obrázky.';

  @override
  String get customImageRequirement =>
      'Na používanie vlastných obrázkov potrebujete v povolených skupinách aspoň 1 dobrý obrázok a 3 nie dobré obrázky.';

  @override
  String get sunnyWeather => 'Dobré';

  @override
  String get rainyWeather => 'Nie dobré';

  @override
  String get addImages => 'Pridať obrázky';

  @override
  String get imageDeleted => 'Obrázok bol vymazaný';

  @override
  String get imageDeleteFailed => 'Vymazanie obrázka zlyhalo';

  @override
  String get deleteImageTitle => 'Vymazať obrázok';

  @override
  String get deleteImageMessage =>
      'Chcete tento obrázok vymazať? Túto akciu nie je možné vrátiť späť.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Skupina $groupId – obrázky $weather';
  }

  @override
  String registeredCount(int count) {
    return 'Zaregistrovaných: $count obrázkov';
  }

  @override
  String get noImagesRegistered => 'Nie sú zaregistrované žiadne obrázky';

  @override
  String get imagePreview => 'Náhľad obrázka';

  @override
  String get close => 'Zavrieť';

  @override
  String get contactEmailSubject => 'FocusMint – Kontakt';

  @override
  String get contactEmailBody => 'Napíšte nám svoje názory a otázky.';

  @override
  String get mixWithBuiltInImages => 'Kombinovať s obrázkami aplikácie';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Používať vlastné obrázky spolu s obrázkami aplikácie';

  @override
  String get supportIntro =>
      'Píšte vývojárovi anonymne. Otázky a návrhy sú vítané. Denne môžete poslať 3 správy. Každá odpoveď vývojára obnoví dostupný počet na 3.';

  @override
  String get supportReceived =>
      'Správa bola prijatá. Zvyčajne odpovedáme do 2–3 dní.';

  @override
  String get supportComposer => 'Napíšte správu';

  @override
  String get supportSend => 'Odoslať';

  @override
  String get supportRetry => 'Skúsiť znova';

  @override
  String get supportSent => 'Odoslané';

  @override
  String get supportUnsent => 'Neodoslané · uložené v tomto zariadení';

  @override
  String get supportAttach => 'Priložiť obrázok';

  @override
  String get supportRemoveImage => 'Odobrať obrázok';

  @override
  String get supportImage => 'Príloha';

  @override
  String get supportClear => 'Vymazať históriu';

  @override
  String get supportClearConfirm =>
      'Vymazať túto konverzáciu? Vymažú sa aj neodoslané koncepty a história na serveri. Limit správ sa neobnoví.';

  @override
  String get supportQuota =>
      'Dnešné 3 správy už boli využité. Ďalšiu môžete poslať zajtra alebo po odpovedi vývojára.';

  @override
  String get supportConnectionError =>
      'Nepodarilo sa pripojiť. Uložené koncepty neboli odoslané.';

  @override
  String get supportSendError =>
      'Odoslanie sa nepodarilo. Správa je uložená v tomto zariadení. Skúste to znova.';

  @override
  String get supportStorageError => 'Uloženie sa nepodarilo. Skúste to znova.';

  @override
  String get supportClearError =>
      'Históriu sa nepodarilo vymazať. Skontrolujte pripojenie a skúste to znova.';

  @override
  String get supportImageError =>
      'Obrázok sa nepodarilo načítať. Vyberte obrázok menší ako 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Zostávajúce správy dnes: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Neprečítané odpovede: $count';
  }

  @override
  String get supportGuide => 'Informácie';

  @override
  String get supportDeveloper => 'Vývojár';

  @override
  String get supportPrivacy => 'O údajoch podpory';

  @override
  String get breathingTitle => 'Na chvíľu sa nadýchnite';

  @override
  String get breathingHint =>
      'Sledujte jemný pohyb pľúc\nv tempe, ktoré vám vyhovuje.';

  @override
  String get breathingIn => 'Pomaly sa nadýchnite';

  @override
  String get breathingOut => 'Pomaly vydýchnite';

  @override
  String get breathingProgress => 'Priebeh dychového cvičenia';

  @override
  String get breathingResultHint => 'Výsledky sa zobrazia automaticky.';

  @override
  String get breathingSkip => 'Prejsť na výsledky';
}
