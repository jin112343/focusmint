// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Jelenlegi pontok';

  @override
  String goalLabel(int goal) {
    return 'Cél: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Hátralévő: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Cél elérve!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage =>
      'Gyakorold a pozitív dolgok észrevételét.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Hátralévő idő: $minutes p $seconds mp';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Hátralévő idő: $seconds mp';
  }

  @override
  String scoreLabel(String score) {
    return 'Pontszám: $score pont';
  }

  @override
  String get imagePreparationMessage => 'Képek előkészítése...';

  @override
  String get noStimuliAvailable => 'Nincsenek elérhető ingerek';

  @override
  String get invalidGridSize => 'Érvénytelen rácsméret';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Indítás...';

  @override
  String get excellentPerformance => 'Kiváló teljesítmény!';

  @override
  String get greatJob => 'Szép munka!';

  @override
  String get goodPerformance => 'Jó teljesítmény';

  @override
  String get keepPracticingFeedback => 'Gyakoroljon tovább';

  @override
  String get takeYourTimeFeedback => 'Ne siessen';

  @override
  String get happy => 'Öröm';

  @override
  String get angry => 'Düh';

  @override
  String get fear => 'Félelem';

  @override
  String get sad => 'Szomorúság';

  @override
  String get historyPageTitle => 'Edzéselőzmények';

  @override
  String get dataLoading => 'Adatok betöltése...';

  @override
  String get pointsHistory => 'Pontelőzmények';

  @override
  String get weekly => 'Heti';

  @override
  String get monthly => 'Havi';

  @override
  String get noDataAvailable => 'Nincs elérhető adat';

  @override
  String get goalAchievementRate => 'Célteljesítési arány';

  @override
  String get scoreStatistics => 'Pontszám-statisztikák';

  @override
  String get bestScore => 'Legjobb pontszám';

  @override
  String get totalScore => 'Összpontszám';

  @override
  String get trainingTime => 'Edzésidő';

  @override
  String get totalTrainingTime => 'Teljes edzésidő';

  @override
  String get detailedStatistics => 'Részletes statisztikák';

  @override
  String get averageScorePerMinute => 'Átlagos pontszám percenként';

  @override
  String get pointsToGoal => 'A célig hátralévő pontok';

  @override
  String get goalSetting => 'Célbeállítás';

  @override
  String get secondsUnit => 'mp';

  @override
  String get minutesUnit => 'p';

  @override
  String get hoursUnit => 'ó';

  @override
  String get pointsUnit => 'pont';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'V';

  @override
  String get mondayShort => 'H';

  @override
  String get tuesdayShort => 'K';

  @override
  String get wednesdayShort => 'Sze';

  @override
  String get thursdayShort => 'Cs';

  @override
  String get fridayShort => 'P';

  @override
  String get saturdayShort => 'Szo';

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get goalPointsSetting => 'Célpontok beállítása';

  @override
  String currentGoalPoints(int points) {
    return 'Jelenlegi cél: $points pont';
  }

  @override
  String get newGoalPointsLabel => 'Új célpontszám';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'pont';

  @override
  String get saveGoalButton => 'Cél mentése';

  @override
  String goalSetTo(int points) {
    return 'Cél beállítva: $points pont';
  }

  @override
  String get enterGoalPoints => 'Kérjük, adja meg a célpontszámot';

  @override
  String get enterValidNumber =>
      'Kérjük, érvényes számot adjon meg (1 és 99999999 között)';

  @override
  String get saveFailed => 'Néhány beállítást nem sikerült menteni';

  @override
  String get emailOpenFailed => 'Nem sikerült megnyitni a levelezőalkalmazást';

  @override
  String get pageOpenFailed => 'Nem sikerült megnyitni az oldalt';

  @override
  String get appInfoSupport => 'Alkalmazásinformációk és támogatás';

  @override
  String get contactUs => 'Kapcsolat';

  @override
  String get contactUsSubtitle => 'Ossza meg velünk véleményét és kérdéseit';

  @override
  String get termsOfService => 'Felhasználási feltételek';

  @override
  String get termsSubtitle =>
      'Tekintse át az alkalmazás felhasználási feltételeit';

  @override
  String get privacyPolicy => 'Adatvédelmi irányelvek';

  @override
  String get privacySubtitle => 'A személyes adatok kezeléséről';

  @override
  String get tutorialTitle => 'Útmutató';

  @override
  String get tutorialSubtitle => 'Ismerje meg az alkalmazás használatát';

  @override
  String get dataManagement => 'Adatkezelés';

  @override
  String get deleteHistory => 'Előzmények törlése';

  @override
  String get deleteHistorySubtitle =>
      'Csak az edzéselőzményeket törli (a célpontok megmaradnak)';

  @override
  String get deleteHistoryAndGoal => 'Előzmények és cél törlése';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Az összes előzményt és a célpontokat is törli';

  @override
  String get deleteHistoryConfirmTitle => 'Előzmények törlése';

  @override
  String get deleteHistoryConfirmMessage =>
      'Biztosan törli az összes edzéselőzményt?\n\n*A célpontok megmaradnak';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Előzmények és cél törlése';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Biztosan törli az összes előzményt és a célpontokat?\n\n*Ez a művelet nem vonható vissza';

  @override
  String get cancel => 'Mégse';

  @override
  String get delete => 'Törlés';

  @override
  String get historyDeleted => 'Előzmények törölve';

  @override
  String get historyAndGoalDeleted => 'Előzmények és cél törölve';

  @override
  String get historyDeleteFailed => 'Az előzmények törlése nem sikerült';

  @override
  String get historyAndGoalDeleteFailed =>
      'Az előzmények és a cél törlése nem sikerült';

  @override
  String get tutorialDisplayFailed => 'Az útmutató megjelenítése nem sikerült';

  @override
  String get tips => 'Tippek';

  @override
  String get tipsContent =>
      '• A célod a kezdőképernyő diagramján jelenik meg\n• Kezdj kis céllal, és emeld a saját tempódban\n• Minden helyes választás legfeljebb 6 pontot ér';

  @override
  String get backToHome => 'Vissza a kezdőképernyőre';

  @override
  String get tutorialSkip => 'Kihagyás';

  @override
  String get tutorialGoalAndPoints => 'Cél és jelenlegi pontok';

  @override
  String get tutorialGoalDescription =>
      'A külső kör a célt, a belső az összpontszámot mutatja. A kör a cél közeledtével telik meg.';

  @override
  String get tutorialOneMinuteTraining => '1 perces edzés';

  @override
  String get tutorialTrainingDescription =>
      'Indítson egy 1 perces játékot. Válasszon pozitív képeket vagy jó szokásokat 4 lehetőség közül.';

  @override
  String get tutorialScoreProgress => 'Pontszám alakulása';

  @override
  String get tutorialScoreDescription =>
      'Tekintse meg a megszerzett pontszámok részletes adatait.';

  @override
  String get tutorialSettingsAndData => 'Beállítások és adatkezelés';

  @override
  String get tutorialSettingsDescription =>
      'Módosíthatja a célértékeket, megtekintheti az alkalmazás adatait, és visszaállíthatja az adatokat.';

  @override
  String get appIntroAttentionBiasTitle => 'A figyelmi torzításról';

  @override
  String get appIntroAttentionBiasContent =>
      'Erős szorongás esetén hajlamosak vagyunk öntudatlanul csak a negatív dolgokra figyelni.';

  @override
  String get appIntroFocusMintRoleTitle => 'A FocusMint szerepe';

  @override
  String get appIntroFocusMintRoleContent =>
      'Rövid játék, amellyel gyakorolhatod, hogyan irányítsd a figyelmedet pozitív képekre.';

  @override
  String get appIntroScientificEvidenceTitle => 'A gyakorlatról';

  @override
  String get appIntroScientificEvidenceContent =>
      'Gyakorold a pozitív képek megtalálását. A FocusMint az önmagadról való gondoskodás eszköze, nem orvosi kezelés. Az eredmények személyenként eltérhetnek.';

  @override
  String get appIntroExpectedEffectsTitle => 'Mit gyakorolhatsz?';

  @override
  String get appIntroEffect1 => 'Pozitív képek keresése';

  @override
  String get appIntroEffect2 => 'A körülötted lévő mosolyok észrevétele';

  @override
  String get appIntroEffect3 => 'Rövid napi szokás kialakítása';

  @override
  String get appIntroHowToUse => 'Használati útmutató megtekintése';

  @override
  String get pointsEarned => 'Pontok megszerezve!';

  @override
  String get yourScore => 'Az Ön pontszáma';

  @override
  String get totalPlayTime => 'Teljes játékidő';

  @override
  String get imageManagement => 'Képkezelés';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Rejtett képek: $count/$max';
  }

  @override
  String get unsavedChanges => 'Nem mentett módosításai vannak';

  @override
  String unsavedChangesMessage(Object count) {
    return '$count nem mentett módosítása van a képmegjelenítési beállításokban.';
  }

  @override
  String get unsavedChangesWarning =>
      'Ha most bezárja ezt a képernyőt, a módosítások elvesznek.';

  @override
  String get discardChanges => 'Módosítások elvetése';

  @override
  String get saveAndExit => 'Mentés és kilépés';

  @override
  String settingsSaved(Object count) {
    return '$count beállítás mentve';
  }

  @override
  String get saveError => 'Hiba történt a beállítások mentése közben';

  @override
  String get imageSettingsUpdated => 'A képbeállítások frissítve';

  @override
  String get allImages => 'Összes';

  @override
  String get positiveImages => 'Pozitív';

  @override
  String get negativeImages => 'Negatív';

  @override
  String get smileImages => 'Mosoly';

  @override
  String get vegetableImages => 'Tápláló ételek';

  @override
  String get healthImages => 'Mozgás és kapcsolatok';

  @override
  String get sadImages => 'Harag, szomorúság és aggodalom';

  @override
  String get badFoodImages => 'Gyorsételek és édességek';

  @override
  String get badImages => 'Egészségtelen szokások';

  @override
  String get imageManagementHint =>
      'Koppintson a kép láthatóságának átkapcsolásához. Legfeljebb 15 képet rejthet el.';

  @override
  String get unsaved => 'Nem mentett';

  @override
  String get save => 'Mentés';

  @override
  String get hiddenImages => 'Rejtett';

  @override
  String get noHiddenImages => 'Nincsenek rejtett képek';

  @override
  String get settingsLoadFailed => 'A beállítások betöltése nem sikerült';

  @override
  String imagesAdded(int count) {
    return '$count kép hozzáadva';
  }

  @override
  String get imageAddFailed => 'A képek hozzáadása nem sikerült';

  @override
  String get imageSelectionFailed => 'A képek kiválasztása nem sikerült';

  @override
  String get settingsChangeFailed => 'A beállítások módosítása nem sikerült';

  @override
  String groupTitle(String name) {
    return 'Csoport: $name';
  }

  @override
  String get displayToggle => 'Megjelenítés átkapcsolása';

  @override
  String imageCount(int count) {
    return '$count kép';
  }

  @override
  String get noticeTitle => 'Fontos tudnivalók';

  @override
  String get notice1 => 'Új funkció: egyéni képek!';

  @override
  String get notice2 => 'Saját képeit a beállítások képernyőn adhatja hozzá';

  @override
  String get notice3 => 'A részleteket a beállítások képernyőn találja';

  @override
  String get customImageTitle => 'Egyéni képek';

  @override
  String get customImageSubtitle => 'Saját képek hozzáadása és kezelése';

  @override
  String get addCustomImages => 'Egyéni képek hozzáadása';

  @override
  String get selectImages => 'Képek kiválasztása';

  @override
  String get unknownImage => 'Ismeretlen kép';

  @override
  String get customImageSettings => 'Egyéni képek beállításai';

  @override
  String get useCustomImages => 'Egyéni képek használata';

  @override
  String get useCustomImagesDescription =>
      'Használd a saját képeidet a gyakorláshoz. Az alkalmazás képeinek bevonásához kapcsold be az alábbi keverési lehetőséget.';

  @override
  String get groupSettings => 'Csoportbeállítások';

  @override
  String get minOneGroupRequired =>
      'Legalább egy csoportnak engedélyezve kell lennie';

  @override
  String get settingsLoadFailedMessage =>
      'A beállítások betöltése nem sikerült';

  @override
  String get customImageNotice1 =>
      'Ha a csoportok engedélyezve vannak, a képek csoportonként véletlenszerűen jelennek meg.';

  @override
  String get customImageNotice2 =>
      'A felhasználók által feltöltött és beállított képek nem kerülnek megosztásra a fejlesztőkkel vagy harmadik felekkel, és csak az eszközön, az alkalmazás területén tárolódnak.';

  @override
  String get customImageNotice3 => 'Így az alkalmazás offline is használható.';

  @override
  String get customImageNotice4 =>
      'Sok kép hozzáadása tárhelyet foglal. Probléma esetén kapcsold ki a saját képeket, vagy töröld a nem használt képeket a beállításokban.';

  @override
  String get customImageNotice5 =>
      'Az alkalmazás törlésekor a beállított képek is törlődnek.';

  @override
  String get customImageRequirementNotMet =>
      'Az egyéni képek használatához az engedélyezett csoportokban legalább 1 jó képre és 3 nem jó képre van szükség.';

  @override
  String get customImageRequirement =>
      'Az egyéni képek használatához az engedélyezett csoportokban legalább 1 jó képre és 3 nem jó képre van szükség.';

  @override
  String get sunnyWeather => 'Jó';

  @override
  String get rainyWeather => 'Nem jó';

  @override
  String get addImages => 'Képek hozzáadása';

  @override
  String get imageDeleted => 'Kép törölve';

  @override
  String get imageDeleteFailed => 'A kép törlése nem sikerült';

  @override
  String get deleteImageTitle => 'Kép törlése';

  @override
  String get deleteImageMessage =>
      'Törli ezt a képet? Ez a művelet nem vonható vissza.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return '$groupId. csoport – $weather képek';
  }

  @override
  String registeredCount(int count) {
    return 'Regisztrálva: $count kép';
  }

  @override
  String get noImagesRegistered => 'Nincsenek regisztrált képek';

  @override
  String get imagePreview => 'Kép előnézete';

  @override
  String get close => 'Bezárás';

  @override
  String get contactEmailSubject => 'FocusMint – Kapcsolatfelvétel';

  @override
  String get contactEmailBody => 'Kérjük, írja meg véleményét és kérdéseit.';

  @override
  String get mixWithBuiltInImages => 'Keverés az alkalmazás képeivel';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Saját képek és az alkalmazás képeinek együttes használata';

  @override
  String get supportIntro =>
      'Írj névtelenül a fejlesztőnek. Kérdéseket és javaslatokat is küldhetsz. Naponta 3 üzenetet küldhetsz. A fejlesztő minden válasza után ismét 3 üzenet áll rendelkezésedre.';

  @override
  String get supportReceived =>
      'Az üzenet megérkezett. Általában 2–3 napon belül válaszolunk.';

  @override
  String get supportComposer => 'Írj üzenetet';

  @override
  String get supportSend => 'Küldés';

  @override
  String get supportRetry => 'Újrapróbálás';

  @override
  String get supportSent => 'Elküldve';

  @override
  String get supportUnsent => 'Nincs elküldve · ezen az eszközön mentve';

  @override
  String get supportAttach => 'Kép csatolása';

  @override
  String get supportRemoveImage => 'Kép eltávolítása';

  @override
  String get supportImage => 'Melléklet';

  @override
  String get supportClear => 'Előzmények törlése';

  @override
  String get supportClearConfirm =>
      'Törlöd ezt a beszélgetést? Az el nem küldött piszkozatok és a szerveren tárolt előzmények is törlődnek. Az üzenetkeret nem áll vissza.';

  @override
  String get supportQuota =>
      'A mai 3 üzenetet már felhasználtad. Holnap vagy a fejlesztő válasza után küldhetsz újra.';

  @override
  String get supportConnectionError =>
      'Nem sikerült csatlakozni. A mentett piszkozatok nem lettek elküldve.';

  @override
  String get supportSendError =>
      'Nem sikerült elküldeni. Az üzenet ezen az eszközön van mentve. Próbáld újra.';

  @override
  String get supportStorageError => 'Nem sikerült menteni. Próbáld újra.';

  @override
  String get supportClearError =>
      'Nem sikerült törölni az előzményeket. Ellenőrizd a kapcsolatot, és próbáld újra.';

  @override
  String get supportImageError =>
      'Nem sikerült betölteni a képet. Válassz 30 MB-nál kisebb képet.';

  @override
  String supportRemaining(int count) {
    return 'Ma még küldhető üzenetek: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Olvasatlan válaszok: $count';
  }

  @override
  String get supportGuide => 'Információ';

  @override
  String get supportDeveloper => 'Fejlesztő';

  @override
  String get supportPrivacy => 'A kapcsolatfelvétel adatairól';

  @override
  String get breathingTitle => 'Vegyél egy nyugodt lélegzetet';

  @override
  String get breathingHint =>
      'Kövesd a tüdő finom mozgását\na számodra kényelmes tempóban.';

  @override
  String get breathingIn => 'Lassan lélegezz be';

  @override
  String get breathingOut => 'Lassan lélegezz ki';

  @override
  String get breathingProgress => 'A légzőgyakorlat állapota';

  @override
  String get breathingResultHint => 'Az eredmények automatikusan megjelennek.';

  @override
  String get breathingSkip => 'Tovább az eredményekhez';
}
