// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Nykyiset pisteet';

  @override
  String goalLabel(int goal) {
    return 'Tavoite: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Jäljellä: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Tavoite saavutettu!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage =>
      'Harjoittele myönteisten asioiden huomaamista.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Aikaa jäljellä: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Aikaa jäljellä: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Tulos: $score pistettä';
  }

  @override
  String get imagePreparationMessage => 'Valmistellaan kuvia...';

  @override
  String get noStimuliAvailable => 'Ärsykkeitä ei ole saatavilla';

  @override
  String get invalidGridSize => 'Virheellinen ruudukon koko';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Aloitetaan...';

  @override
  String get excellentPerformance => 'Erinomainen suoritus!';

  @override
  String get greatJob => 'Hienoa työtä!';

  @override
  String get goodPerformance => 'Hyvä suoritus';

  @override
  String get keepPracticingFeedback => 'Jatka harjoittelua';

  @override
  String get takeYourTimeFeedback => 'Etene rauhassa';

  @override
  String get happy => 'Iloinen';

  @override
  String get angry => 'Vihainen';

  @override
  String get fear => 'Pelko';

  @override
  String get sad => 'Surullinen';

  @override
  String get historyPageTitle => 'Harjoitteluhistoria';

  @override
  String get dataLoading => 'Ladataan tietoja...';

  @override
  String get pointsHistory => 'Pistehistoria';

  @override
  String get weekly => 'Viikoittain';

  @override
  String get monthly => 'Kuukausittain';

  @override
  String get noDataAvailable => 'Tietoja ei ole saatavilla';

  @override
  String get goalAchievementRate => 'Tavoitteen saavutusaste';

  @override
  String get scoreStatistics => 'Pistetilastot';

  @override
  String get bestScore => 'Paras tulos';

  @override
  String get totalScore => 'Kokonaistulos';

  @override
  String get trainingTime => 'Harjoitteluaika';

  @override
  String get totalTrainingTime => 'Harjoitteluaika yhteensä';

  @override
  String get detailedStatistics => 'Tarkat tilastot';

  @override
  String get averageScorePerMinute => 'Keskimääräinen tulos minuutissa';

  @override
  String get pointsToGoal => 'Pisteitä tavoitteeseen';

  @override
  String get goalSetting => 'Tavoitteen asetus';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'pistettä';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'su';

  @override
  String get mondayShort => 'ma';

  @override
  String get tuesdayShort => 'ti';

  @override
  String get wednesdayShort => 'ke';

  @override
  String get thursdayShort => 'to';

  @override
  String get fridayShort => 'pe';

  @override
  String get saturdayShort => 'la';

  @override
  String get settingsTitle => 'Asetukset';

  @override
  String get goalPointsSetting => 'Tavoitepisteiden asetus';

  @override
  String currentGoalPoints(int points) {
    return 'Nykyinen tavoite: $points pistettä';
  }

  @override
  String get newGoalPointsLabel => 'Uudet tavoitepisteet';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'pistettä';

  @override
  String get saveGoalButton => 'Tallenna tavoite';

  @override
  String goalSetTo(int points) {
    return 'Tavoitteeksi asetettiin $points pistettä';
  }

  @override
  String get enterGoalPoints => 'Anna tavoitepisteet';

  @override
  String get enterValidNumber => 'Anna kelvollinen luku (1–99999999)';

  @override
  String get saveFailed => 'Joidenkin asetusten tallennus epäonnistui';

  @override
  String get emailOpenFailed => 'Sähköpostisovellusta ei voitu avata';

  @override
  String get pageOpenFailed => 'Sivua ei voitu avata';

  @override
  String get appInfoSupport => 'Sovellustiedot ja tuki';

  @override
  String get contactUs => 'Ota yhteyttä';

  @override
  String get contactUsSubtitle => 'Kerro palautteesi ja kysymyksesi';

  @override
  String get termsOfService => 'Käyttöehdot';

  @override
  String get termsSubtitle => 'Tutustu sovelluksen käyttöehtoihin';

  @override
  String get privacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get privacySubtitle => 'Tietoa yksityisyystietojen käsittelystä';

  @override
  String get tutorialTitle => 'Opastus';

  @override
  String get tutorialSubtitle => 'Opi käyttämään sovellusta';

  @override
  String get dataManagement => 'Tietojen hallinta';

  @override
  String get deleteHistory => 'Poista historia';

  @override
  String get deleteHistorySubtitle =>
      'Poistaa vain harjoitteluhistorian (tavoitepisteet säilyvät)';

  @override
  String get deleteHistoryAndGoal => 'Poista historia ja tavoite';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Poistaa koko historian ja tavoitepisteet';

  @override
  String get deleteHistoryConfirmTitle => 'Poista historia';

  @override
  String get deleteHistoryConfirmMessage =>
      'Haluatko varmasti poistaa koko harjoitteluhistorian?\n\n*Tavoitepisteet säilyvät';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Poista historia ja tavoite';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Haluatko varmasti poistaa koko historian ja tavoitepisteet?\n\n*Tätä toimintoa ei voi kumota';

  @override
  String get cancel => 'Peruuta';

  @override
  String get delete => 'Poista';

  @override
  String get historyDeleted => 'Historia poistettu';

  @override
  String get historyAndGoalDeleted => 'Historia ja tavoite poistettu';

  @override
  String get historyDeleteFailed => 'Historian poistaminen epäonnistui';

  @override
  String get historyAndGoalDeleteFailed =>
      'Historian ja tavoitteen poistaminen epäonnistui';

  @override
  String get tutorialDisplayFailed => 'Opastuksen näyttäminen epäonnistui';

  @override
  String get tips => 'Vinkkejä';

  @override
  String get tipsContent =>
      '• Tavoitteesi näkyy aloitusnäytön kaaviossa\n• Aloita pienestä ja kasvata tavoitetta omaan tahtiisi\n• Jokaisesta oikeasta valinnasta saa enintään 6 pistettä';

  @override
  String get backToHome => 'Takaisin alkuun';

  @override
  String get tutorialSkip => 'Ohita';

  @override
  String get tutorialGoalAndPoints => 'Tavoite ja nykyiset pisteet';

  @override
  String get tutorialGoalDescription =>
      'Ulompi ympyrä näyttää tavoitteesi, sisempi kokonaispisteesi. Ympyrä täyttyy sitä mukaa, kun lähestyt tavoitetta.';

  @override
  String get tutorialOneMinuteTraining => 'Minuutin harjoitus';

  @override
  String get tutorialTrainingDescription =>
      'Aloita minuutin peli. Valitse positiivisia kuvia tai hyviä tapoja neljästä vaihtoehdosta.';

  @override
  String get tutorialScoreProgress => 'Pisteiden kehitys';

  @override
  String get tutorialScoreDescription =>
      'Näet tarkat tiedot ansaitsemistasi pisteistä.';

  @override
  String get tutorialSettingsAndData => 'Asetukset ja tietojen hallinta';

  @override
  String get tutorialSettingsDescription =>
      'Muuta tavoitearvoja, katso sovellustietoja ja nollaa tiedot.';

  @override
  String get appIntroAttentionBiasTitle => 'Tietoa tarkkaavaisuusvinoumasta';

  @override
  String get appIntroAttentionBiasContent =>
      'Kun ahdistus on voimakasta, huomiomme kiinnittyy tiedostamatta helposti vain kielteisiin asioihin.';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMintin rooli';

  @override
  String get appIntroFocusMintRoleContent =>
      'Lyhyt peli, jossa harjoittelet huomion suuntaamista myönteisiin kuviin.';

  @override
  String get appIntroScientificEvidenceTitle => 'Tietoa harjoituksesta';

  @override
  String get appIntroScientificEvidenceContent =>
      'Harjoittele myönteisten kuvien löytämistä. FocusMint on itsehoitoa tukeva harjoitus, ei lääketieteellinen hoito. Tulokset vaihtelevat henkilöittäin.';

  @override
  String get appIntroExpectedEffectsTitle => 'Mitä voit harjoitella';

  @override
  String get appIntroEffect1 => 'Myönteisten kuvien etsiminen';

  @override
  String get appIntroEffect2 => 'Ympärillä olevien hymyjen huomaaminen';

  @override
  String get appIntroEffect3 => 'Lyhyen päivittäisen rutiinin luominen';

  @override
  String get appIntroHowToUse => 'Katso käyttöohjeet';

  @override
  String get pointsEarned => 'Pisteitä ansaittu!';

  @override
  String get yourScore => 'Sinun tuloksesi';

  @override
  String get totalPlayTime => 'Peliaika yhteensä';

  @override
  String get imageManagement => 'Kuvien hallinta';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Piilotetut kuvat: $count/$max';
  }

  @override
  String get unsavedChanges => 'Sinulla on tallentamattomia muutoksia';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Kuvien näyttöasetuksissa on $count tallentamatonta muutosta.';
  }

  @override
  String get unsavedChangesWarning =>
      'Muutokset menetetään, jos suljet näytön nyt.';

  @override
  String get discardChanges => 'Hylkää muutokset';

  @override
  String get saveAndExit => 'Tallenna ja poistu';

  @override
  String settingsSaved(Object count) {
    return '$count asetusta tallennettu';
  }

  @override
  String get saveError => 'Asetusten tallennuksessa tapahtui virhe';

  @override
  String get imageSettingsUpdated => 'Kuva-asetukset on päivitetty';

  @override
  String get allImages => 'Kaikki';

  @override
  String get positiveImages => 'Positiiviset';

  @override
  String get negativeImages => 'Negatiiviset';

  @override
  String get smileImages => 'Hymyt';

  @override
  String get vegetableImages => 'Ravitseva ruoka';

  @override
  String get healthImages => 'Liikunta ja yhdessäolo';

  @override
  String get sadImages => 'Viha, suru ja huoli';

  @override
  String get badFoodImages => 'Pikaruoka ja makeiset';

  @override
  String get badImages => 'Epäterveelliset tavat';

  @override
  String get imageManagementHint =>
      'Näytä tai piilota kuva napauttamalla. Voit piilottaa enintään 15 kuvaa.';

  @override
  String get unsaved => 'Tallentamaton';

  @override
  String get save => 'Tallenna';

  @override
  String get hiddenImages => 'Piilotetut';

  @override
  String get noHiddenImages => 'Ei piilotettuja kuvia';

  @override
  String get settingsLoadFailed => 'Asetusten lataaminen epäonnistui';

  @override
  String imagesAdded(int count) {
    return '$count kuvaa lisätty';
  }

  @override
  String get imageAddFailed => 'Kuvien lisääminen epäonnistui';

  @override
  String get imageSelectionFailed => 'Kuvien valinta epäonnistui';

  @override
  String get settingsChangeFailed => 'Asetusten muuttaminen epäonnistui';

  @override
  String groupTitle(String name) {
    return 'Ryhmä: $name';
  }

  @override
  String get displayToggle => 'Näytön vaihto';

  @override
  String imageCount(int count) {
    return '$count kuvaa';
  }

  @override
  String get noticeTitle => 'Tärkeitä huomautuksia';

  @override
  String get notice1 => 'Omien kuvien toiminto on lisätty!';

  @override
  String get notice2 => 'Voit lisätä omia kuvia asetusnäytöltä';

  @override
  String get notice3 => 'Katso lisätiedot asetusnäytöltä';

  @override
  String get customImageTitle => 'Omat kuvat';

  @override
  String get customImageSubtitle => 'Lisää ja hallitse omia kuviasi';

  @override
  String get addCustomImages => 'Lisää omia kuvia';

  @override
  String get selectImages => 'Valitse kuvat';

  @override
  String get unknownImage => 'Tuntematon kuva';

  @override
  String get customImageSettings => 'Omien kuvien asetukset';

  @override
  String get useCustomImages => 'Käytä omia kuvia';

  @override
  String get useCustomImagesDescription =>
      'Käytä harjoituksessa omia kuviasi. Ota yhdistäminen käyttöön alla, jos haluat käyttää myös sovelluksen kuvia.';

  @override
  String get groupSettings => 'Ryhmäasetukset';

  @override
  String get minOneGroupRequired => 'Vähintään yhden ryhmän on oltava käytössä';

  @override
  String get settingsLoadFailedMessage => 'Asetusten lataaminen epäonnistui';

  @override
  String get customImageNotice1 =>
      'Kun ryhmät ovat käytössä, kuvat näytetään satunnaisesti kussakin ryhmässä.';

  @override
  String get customImageNotice2 =>
      'Käyttäjän lataamia ja asettamia kuvia ei jaeta kehittäjille eikä kolmansille osapuolille, ja ne tallennetaan vain sovelluksen omaan tilaan laitteella.';

  @override
  String get customImageNotice3 =>
      'Siksi sovellusta voi käyttää myös ilman verkkoyhteyttä.';

  @override
  String get customImageNotice4 =>
      'Monien kuvien lisääminen vie tallennustilaa. Jos ongelmia ilmenee, poista omien kuvien käyttö käytöstä tai poista tarpeettomia kuvia asetuksissa.';

  @override
  String get customImageNotice5 =>
      'Kun poistat sovelluksen, asetetut kuvat poistetaan.';

  @override
  String get customImageRequirementNotMet =>
      'Omien kuvien käyttö edellyttää, että käytössä olevissa ryhmissä on vähintään 1 hyvä kuva ja 3 ei niin hyvää kuvaa.';

  @override
  String get customImageRequirement =>
      'Omien kuvien käyttö edellyttää, että käytössä olevissa ryhmissä on vähintään 1 hyvä kuva ja 3 ei niin hyvää kuvaa.';

  @override
  String get sunnyWeather => 'Hyvä';

  @override
  String get rainyWeather => 'Ei niin hyvä';

  @override
  String get addImages => 'Lisää kuvia';

  @override
  String get imageDeleted => 'Kuva poistettu';

  @override
  String get imageDeleteFailed => 'Kuvan poistaminen epäonnistui';

  @override
  String get deleteImageTitle => 'Poista kuva';

  @override
  String get deleteImageMessage =>
      'Haluatko poistaa tämän kuvan? Tätä toimintoa ei voi kumota.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Ryhmä $groupId – kuvat: $weather';
  }

  @override
  String registeredCount(int count) {
    return 'Rekisteröity: $count kuvaa';
  }

  @override
  String get noImagesRegistered => 'Kuvia ei ole rekisteröity';

  @override
  String get imagePreview => 'Kuvan esikatselu';

  @override
  String get close => 'Sulje';

  @override
  String get contactEmailSubject => 'FocusMint – Yhteydenotto';

  @override
  String get contactEmailBody => 'Kerrothan palautteesi ja kysymyksesi.';

  @override
  String get mixWithBuiltInImages => 'Yhdistä sovelluksen kuviin';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Käytä omia kuviasi ja sovelluksen kuvia yhdessä';

  @override
  String get supportIntro =>
      'Keskustele nimettömästi kehittäjän kanssa. Kysymykset ja ehdotukset ovat tervetulleita. Voit lähettää 3 viestiä päivässä. Jokainen kehittäjän vastaus palauttaa kiintiöksi 3 viestiä.';

  @override
  String get supportReceived =>
      'Viesti vastaanotettu. Vastaamme yleensä 2–3 päivän kuluessa.';

  @override
  String get supportComposer => 'Kirjoita viesti';

  @override
  String get supportSend => 'Lähetä';

  @override
  String get supportRetry => 'Yritä uudelleen';

  @override
  String get supportSent => 'Lähetetty';

  @override
  String get supportUnsent => 'Ei lähetetty · tallennettu tälle laitteelle';

  @override
  String get supportAttach => 'Liitä kuva';

  @override
  String get supportRemoveImage => 'Poista kuva';

  @override
  String get supportImage => 'Liite';

  @override
  String get supportClear => 'Poista historia';

  @override
  String get supportClearConfirm =>
      'Poistetaanko tämä keskustelu? Myös lähettämättömät luonnokset ja palvelimen historia poistetaan. Viestikiintiö ei palaudu.';

  @override
  String get supportQuota =>
      'Olet käyttänyt tämän päivän 3 viestiä. Lähetä uusi huomenna tai kehittäjän vastauksen jälkeen.';

  @override
  String get supportConnectionError =>
      'Yhteyttä ei voitu muodostaa. Tallennettuja luonnoksia ei ole lähetetty.';

  @override
  String get supportSendError =>
      'Lähetys epäonnistui. Viestisi on tallennettu tälle laitteelle. Yritä uudelleen.';

  @override
  String get supportStorageError => 'Tallennus epäonnistui. Yritä uudelleen.';

  @override
  String get supportClearError =>
      'Historiaa ei voitu poistaa. Tarkista yhteys ja yritä uudelleen.';

  @override
  String get supportImageError =>
      'Kuvaa ei voitu ladata. Valitse alle 30 Mt:n kuva.';

  @override
  String supportRemaining(int count) {
    return 'Viestejä jäljellä tänään: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Lukemattomat vastaukset: $count';
  }

  @override
  String get supportGuide => 'Tietoja';

  @override
  String get supportDeveloper => 'Kehittäjä';

  @override
  String get supportPrivacy => 'Tukipyyntöjen tiedot';

  @override
  String get breathingTitle => 'Hengähdä hetki';

  @override
  String get breathingHint =>
      'Seuraa keuhkojen rauhallista liikettä\nitsellesi sopivaan tahtiin.';

  @override
  String get breathingIn => 'Hengitä rauhallisesti sisään';

  @override
  String get breathingOut => 'Hengitä rauhallisesti ulos';

  @override
  String get breathingProgress => 'Hengitysharjoituksen eteneminen';

  @override
  String get breathingResultHint => 'Tuloksesi näytetään automaattisesti.';

  @override
  String get breathingSkip => 'Siirry tuloksiin';
}
