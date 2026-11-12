// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Aktuální body';

  @override
  String goalLabel(int goal) {
    return 'Cíl: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Zbývá: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Cíl splněn!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'Procvičujte vnímání pozitivních věcí.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Zbývající čas: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Zbývající čas: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Skóre: $score bodů';
  }

  @override
  String get imagePreparationMessage => 'Příprava obrázků...';

  @override
  String get noStimuliAvailable => 'Nejsou k dispozici žádné podněty';

  @override
  String get invalidGridSize => 'Neplatná velikost mřížky';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Začínáme...';

  @override
  String get excellentPerformance => 'Vynikající výkon!';

  @override
  String get greatJob => 'Skvělá práce!';

  @override
  String get goodPerformance => 'Dobrý výkon';

  @override
  String get keepPracticingFeedback => 'Pokračujte v procvičování';

  @override
  String get takeYourTimeFeedback => 'Nespěchejte';

  @override
  String get happy => 'Radost';

  @override
  String get angry => 'Vztek';

  @override
  String get fear => 'Strach';

  @override
  String get sad => 'Smutek';

  @override
  String get historyPageTitle => 'Historie tréninků';

  @override
  String get dataLoading => 'Načítání dat...';

  @override
  String get pointsHistory => 'Historie bodů';

  @override
  String get weekly => 'Týdně';

  @override
  String get monthly => 'Měsíčně';

  @override
  String get noDataAvailable => 'Žádná data k dispozici';

  @override
  String get goalAchievementRate => 'Míra plnění cíle';

  @override
  String get scoreStatistics => 'Statistiky skóre';

  @override
  String get bestScore => 'Nejlepší skóre';

  @override
  String get totalScore => 'Celkové skóre';

  @override
  String get trainingTime => 'Doba tréninku';

  @override
  String get totalTrainingTime => 'Celková doba tréninku';

  @override
  String get detailedStatistics => 'Podrobné statistiky';

  @override
  String get averageScorePerMinute => 'Průměrné skóre za minutu';

  @override
  String get pointsToGoal => 'Body do cíle';

  @override
  String get goalSetting => 'Nastavení cíle';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'bodů';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'ne';

  @override
  String get mondayShort => 'po';

  @override
  String get tuesdayShort => 'út';

  @override
  String get wednesdayShort => 'st';

  @override
  String get thursdayShort => 'čt';

  @override
  String get fridayShort => 'pá';

  @override
  String get saturdayShort => 'so';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get goalPointsSetting => 'Nastavení cílových bodů';

  @override
  String currentGoalPoints(int points) {
    return 'Aktuální cíl: $points bodů';
  }

  @override
  String get newGoalPointsLabel => 'Nové cílové body';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'bodů';

  @override
  String get saveGoalButton => 'Uložit cíl';

  @override
  String goalSetTo(int points) {
    return 'Cíl byl nastaven na $points bodů';
  }

  @override
  String get enterGoalPoints => 'Zadejte cílové body';

  @override
  String get enterValidNumber => 'Zadejte platné číslo (1 až 99999999)';

  @override
  String get saveFailed => 'Některá nastavení se nepodařilo uložit';

  @override
  String get emailOpenFailed => 'Nepodařilo se otevřít e-mailovou aplikaci';

  @override
  String get pageOpenFailed => 'Nepodařilo se otevřít stránku';

  @override
  String get appInfoSupport => 'Informace o aplikaci a podpora';

  @override
  String get contactUs => 'Kontaktujte nás';

  @override
  String get contactUsSubtitle => 'Podělte se o své názory a dotazy';

  @override
  String get termsOfService => 'Podmínky služby';

  @override
  String get termsSubtitle => 'Přečtěte si podmínky služby aplikace';

  @override
  String get privacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get privacySubtitle => 'O nakládání s osobními údaji';

  @override
  String get tutorialTitle => 'Návod';

  @override
  String get tutorialSubtitle => 'Naučte se aplikaci používat';

  @override
  String get dataManagement => 'Správa dat';

  @override
  String get deleteHistory => 'Smazat historii';

  @override
  String get deleteHistorySubtitle =>
      'Smaže pouze historii tréninků (cílové body zůstanou zachovány)';

  @override
  String get deleteHistoryAndGoal => 'Smazat historii a cíl';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Smaže veškerou historii a cílové body';

  @override
  String get deleteHistoryConfirmTitle => 'Smazat historii';

  @override
  String get deleteHistoryConfirmMessage =>
      'Opravdu chcete smazat veškerou historii tréninků?\n\n*Cílové body zůstanou zachovány';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Smazat historii a cíl';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Opravdu chcete smazat veškerou historii a cílové body?\n\n*Tuto akci nelze vrátit zpět';

  @override
  String get cancel => 'Zrušit';

  @override
  String get delete => 'Smazat';

  @override
  String get historyDeleted => 'Historie byla smazána';

  @override
  String get historyAndGoalDeleted => 'Historie a cíl byly smazány';

  @override
  String get historyDeleteFailed => 'Historii se nepodařilo smazat';

  @override
  String get historyAndGoalDeleteFailed =>
      'Historii a cíl se nepodařilo smazat';

  @override
  String get tutorialDisplayFailed => 'Návod se nepodařilo zobrazit';

  @override
  String get tips => 'Tipy';

  @override
  String get tipsContent =>
      '• Váš cíl se zobrazuje v grafu na úvodní obrazovce\n• Začněte malým cílem a zvyšujte ho vlastním tempem\n• Každá správná volba přináší až 6 bodů';

  @override
  String get backToHome => 'Zpět na domovskou obrazovku';

  @override
  String get tutorialSkip => 'Přeskočit';

  @override
  String get tutorialGoalAndPoints => 'Cíl a aktuální body';

  @override
  String get tutorialGoalDescription =>
      'Vnější kruh ukazuje váš cíl, vnitřní kruh celkové body. Kruh se plní podle toho, jak se blížíte k cíli.';

  @override
  String get tutorialOneMinuteTraining => 'Minutový trénink';

  @override
  String get tutorialTrainingDescription =>
      'Spusťte minutovou hru. Vybírejte pozitivní obrázky nebo dobré návyky ze 4 možností.';

  @override
  String get tutorialScoreProgress => 'Vývoj skóre';

  @override
  String get tutorialScoreDescription =>
      'Zobrazte si podrobné informace o získaném skóre.';

  @override
  String get tutorialSettingsAndData => 'Nastavení a správa dat';

  @override
  String get tutorialSettingsDescription =>
      'Změňte cílové hodnoty, zobrazte informace o aplikaci a resetujte data.';

  @override
  String get appIntroAttentionBiasTitle => 'O zkreslení pozornosti';

  @override
  String get appIntroAttentionBiasContent =>
      'Když je úzkost silná, máme nevědomě sklon soustředit se pouze na negativní věci.';

  @override
  String get appIntroFocusMintRoleTitle => 'Role aplikace FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Krátká hra pro procvičování zaměření pozornosti na pozitivní obrázky.';

  @override
  String get appIntroScientificEvidenceTitle => 'O tomto cvičení';

  @override
  String get appIntroScientificEvidenceContent =>
      'Procvičujte hledání pozitivních obrázků. FocusMint je pomůcka pro péči o sebe, nikoli lékařská léčba. Výsledky se mohou u jednotlivých lidí lišit.';

  @override
  String get appIntroExpectedEffectsTitle => 'Co můžete procvičovat';

  @override
  String get appIntroEffect1 => 'Hledání pozitivních obrázků';

  @override
  String get appIntroEffect2 => 'Všímání si úsměvů kolem sebe';

  @override
  String get appIntroEffect3 => 'Vytváření krátkého každodenního návyku';

  @override
  String get appIntroHowToUse => 'Zobrazit návod k použití';

  @override
  String get pointsEarned => 'Body získány!';

  @override
  String get yourScore => 'Vaše skóre';

  @override
  String get totalPlayTime => 'Celková doba hraní';

  @override
  String get imageManagement => 'Správa obrázků';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Skryté obrázky: $count/$max';
  }

  @override
  String get unsavedChanges => 'Máte neuložené změny';

  @override
  String unsavedChangesMessage(Object count) {
    return 'V nastavení zobrazení obrázků máte $count neuložených změn.';
  }

  @override
  String get unsavedChangesWarning =>
      'Pokud nyní obrazovku zavřete, změny budou ztraceny.';

  @override
  String get discardChanges => 'Zahodit změny';

  @override
  String get saveAndExit => 'Uložit a ukončit';

  @override
  String settingsSaved(Object count) {
    return 'Uloženo nastavení: $count';
  }

  @override
  String get saveError => 'Při ukládání nastavení došlo k chybě';

  @override
  String get imageSettingsUpdated => 'Nastavení obrázků bylo aktualizováno';

  @override
  String get allImages => 'Vše';

  @override
  String get positiveImages => 'Pozitivní';

  @override
  String get negativeImages => 'Negativní';

  @override
  String get smileImages => 'Úsměv';

  @override
  String get vegetableImages => 'Výživné jídlo';

  @override
  String get healthImages => 'Pohyb a kontakt s lidmi';

  @override
  String get sadImages => 'Hněv, smutek a obavy';

  @override
  String get badFoodImages => 'Rychlé občerstvení a sladkosti';

  @override
  String get badImages => 'Nezdravé návyky';

  @override
  String get imageManagementHint =>
      'Klepnutím zobrazíte nebo skryjete obrázek. Skrýt můžete až 15 obrázků.';

  @override
  String get unsaved => 'Neuloženo';

  @override
  String get save => 'Uložit';

  @override
  String get hiddenImages => 'Skryté';

  @override
  String get noHiddenImages => 'Žádné skryté obrázky';

  @override
  String get settingsLoadFailed => 'Nastavení se nepodařilo načíst';

  @override
  String imagesAdded(int count) {
    return 'Přidáno obrázků: $count';
  }

  @override
  String get imageAddFailed => 'Obrázky se nepodařilo přidat';

  @override
  String get imageSelectionFailed => 'Obrázky se nepodařilo vybrat';

  @override
  String get settingsChangeFailed => 'Nastavení se nepodařilo změnit';

  @override
  String groupTitle(String name) {
    return 'Skupina: $name';
  }

  @override
  String get displayToggle => 'Přepnout zobrazení';

  @override
  String imageCount(int count) {
    return 'Obrázků: $count';
  }

  @override
  String get noticeTitle => 'Důležitá upozornění';

  @override
  String get notice1 => 'Byla přidána funkce vlastních obrázků!';

  @override
  String get notice2 => 'Vlastní obrázky můžete přidat na obrazovce nastavení';

  @override
  String get notice3 => 'Podrobnosti najdete na obrazovce nastavení';

  @override
  String get customImageTitle => 'Vlastní obrázky';

  @override
  String get customImageSubtitle => 'Přidávejte a spravujte vlastní obrázky';

  @override
  String get addCustomImages => 'Přidat vlastní obrázky';

  @override
  String get selectImages => 'Vybrat obrázky';

  @override
  String get unknownImage => 'Neznámý obrázek';

  @override
  String get customImageSettings => 'Nastavení vlastních obrázků';

  @override
  String get useCustomImages => 'Používat vlastní obrázky';

  @override
  String get useCustomImagesDescription =>
      'Používejte při cvičení vlastní obrázky. Zapnutím kombinování níže přidáte i obrázky z aplikace.';

  @override
  String get groupSettings => 'Nastavení skupin';

  @override
  String get minOneGroupRequired => 'Alespoň jedna skupina musí být zapnutá';

  @override
  String get settingsLoadFailedMessage => 'Nastavení se nepodařilo načíst';

  @override
  String get customImageNotice1 =>
      'Když jsou skupiny zapnuté, obrázky se v každé skupině zobrazují náhodně.';

  @override
  String get customImageNotice2 =>
      'Obrázky nahrané a nastavené uživatelem se nesdílejí s vývojáři ani třetími stranami a ukládají se pouze do prostoru aplikace v zařízení.';

  @override
  String get customImageNotice3 => 'Díky tomu lze aplikaci používat i offline.';

  @override
  String get customImageNotice4 =>
      'Velké množství obrázků zabírá úložiště. Při potížích vypněte vlastní obrázky nebo odstraňte nepoužívané obrázky v nastavení.';

  @override
  String get customImageNotice5 =>
      'Při smazání aplikace budou nastavené obrázky odstraněny.';

  @override
  String get customImageRequirementNotMet =>
      'K používání vlastních obrázků potřebujete v zapnutých skupinách alespoň 1 dobrý obrázek a 3 méně dobré obrázky.';

  @override
  String get customImageRequirement =>
      'K používání vlastních obrázků potřebujete v zapnutých skupinách alespoň 1 dobrý obrázek a 3 méně dobré obrázky.';

  @override
  String get sunnyWeather => 'Dobré';

  @override
  String get rainyWeather => 'Méně dobré';

  @override
  String get addImages => 'Přidat obrázky';

  @override
  String get imageDeleted => 'Obrázek byl smazán';

  @override
  String get imageDeleteFailed => 'Obrázek se nepodařilo smazat';

  @override
  String get deleteImageTitle => 'Smazat obrázek';

  @override
  String get deleteImageMessage =>
      'Chcete tento obrázek smazat? Tuto akci nelze vrátit zpět.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Skupina $groupId – obrázky: $weather';
  }

  @override
  String registeredCount(int count) {
    return 'Zaregistrováno obrázků: $count';
  }

  @override
  String get noImagesRegistered => 'Nejsou zaregistrovány žádné obrázky';

  @override
  String get imagePreview => 'Náhled obrázku';

  @override
  String get close => 'Zavřít';

  @override
  String get contactEmailSubject => 'FocusMint – Kontakt';

  @override
  String get contactEmailBody => 'Napište nám prosím své názory a dotazy.';

  @override
  String get mixWithBuiltInImages => 'Kombinovat s obrázky aplikace';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Používat vlastní obrázky společně s obrázky aplikace';

  @override
  String get supportIntro =>
      'Pište vývojáři anonymně. Dotazy a návrhy jsou vítány. Denně můžete poslat 3 zprávy. Každá odpověď vývojáře obnoví dostupný počet na 3.';

  @override
  String get supportReceived =>
      'Zpráva byla přijata. Obvykle odpovídáme do 2–3 dnů.';

  @override
  String get supportComposer => 'Napište zprávu';

  @override
  String get supportSend => 'Odeslat';

  @override
  String get supportRetry => 'Zkusit znovu';

  @override
  String get supportSent => 'Odesláno';

  @override
  String get supportUnsent => 'Neodesláno · uloženo v tomto zařízení';

  @override
  String get supportAttach => 'Přiložit obrázek';

  @override
  String get supportRemoveImage => 'Odebrat obrázek';

  @override
  String get supportImage => 'Příloha';

  @override
  String get supportClear => 'Smazat historii';

  @override
  String get supportClearConfirm =>
      'Smazat tuto konverzaci? Smažou se i neodeslané koncepty a historie na serveru. Limit zpráv se neobnoví.';

  @override
  String get supportQuota =>
      'Dnešní 3 zprávy už byly využity. Další můžete poslat zítra nebo po odpovědi vývojáře.';

  @override
  String get supportConnectionError =>
      'Nepodařilo se připojit. Uložené koncepty nebyly odeslány.';

  @override
  String get supportSendError =>
      'Odeslání se nezdařilo. Zpráva je uložená v tomto zařízení. Zkuste to znovu.';

  @override
  String get supportStorageError => 'Uložení se nezdařilo. Zkuste to znovu.';

  @override
  String get supportClearError =>
      'Historii se nepodařilo smazat. Zkontrolujte připojení a zkuste to znovu.';

  @override
  String get supportImageError =>
      'Obrázek se nepodařilo načíst. Vyberte obrázek menší než 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Zbývající zprávy dnes: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Nepřečtené odpovědi: $count';
  }

  @override
  String get supportGuide => 'Informace';

  @override
  String get supportDeveloper => 'Vývojář';

  @override
  String get supportPrivacy => 'O údajích podpory';

  @override
  String get breathingTitle => 'Na chvíli se nadechněte';

  @override
  String get breathingHint =>
      'Sledujte jemný pohyb plic\nv tempu, které vám vyhovuje.';

  @override
  String get breathingIn => 'Pomalu se nadechněte';

  @override
  String get breathingOut => 'Pomalu vydechněte';

  @override
  String get breathingProgress => 'Průběh dechového cvičení';

  @override
  String get breathingResultHint => 'Výsledky se zobrazí automaticky.';

  @override
  String get breathingSkip => 'Přejít na výsledky';
}
