// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Punts actuals';

  @override
  String goalLabel(int goal) {
    return 'Objectiu: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Restants: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Objectiu assolit!';

  @override
  String get startButtonText => 'COMENÇA';

  @override
  String get stressReductionMessage =>
      'Practica parar atenció a les coses positives.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Temps restant: ${minutes}m ${seconds}s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Temps restant: ${seconds}s';
  }

  @override
  String scoreLabel(String score) {
    return 'Puntuació: $score punts';
  }

  @override
  String get imagePreparationMessage => 'S\'estan preparant les imatges...';

  @override
  String get noStimuliAvailable => 'No hi ha estímuls disponibles';

  @override
  String get invalidGridSize => 'La mida de la quadrícula no és vàlida';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'S\'està començant...';

  @override
  String get excellentPerformance => 'Rendiment excel·lent!';

  @override
  String get greatJob => 'Molt bona feina!';

  @override
  String get goodPerformance => 'Bon rendiment';

  @override
  String get keepPracticingFeedback => 'Continua practicant';

  @override
  String get takeYourTimeFeedback => 'Pren-t\'ho amb calma';

  @override
  String get happy => 'Content';

  @override
  String get angry => 'Enfadat';

  @override
  String get fear => 'Por';

  @override
  String get sad => 'Trist';

  @override
  String get historyPageTitle => 'Historial d\'entrenament';

  @override
  String get dataLoading => 'S\'estan carregant les dades...';

  @override
  String get pointsHistory => 'Historial de punts';

  @override
  String get weekly => 'Setmanal';

  @override
  String get monthly => 'Mensual';

  @override
  String get noDataAvailable => 'No hi ha dades disponibles';

  @override
  String get goalAchievementRate => 'Taxa d\'assoliment de l\'objectiu';

  @override
  String get scoreStatistics => 'Estadístiques de puntuació';

  @override
  String get bestScore => 'Millor puntuació';

  @override
  String get totalScore => 'Puntuació total';

  @override
  String get trainingTime => 'Temps d\'entrenament';

  @override
  String get totalTrainingTime => 'Temps total d\'entrenament';

  @override
  String get detailedStatistics => 'Estadístiques detallades';

  @override
  String get averageScorePerMinute => 'Puntuació mitjana per minut';

  @override
  String get pointsToGoal => 'Punts fins a l\'objectiu';

  @override
  String get goalSetting => 'Configuració de l\'objectiu';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'punts';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dg';

  @override
  String get mondayShort => 'Dl';

  @override
  String get tuesdayShort => 'Dt';

  @override
  String get wednesdayShort => 'Dc';

  @override
  String get thursdayShort => 'Dj';

  @override
  String get fridayShort => 'Dv';

  @override
  String get saturdayShort => 'Ds';

  @override
  String get settingsTitle => 'Configuració';

  @override
  String get goalPointsSetting => 'Configuració dels punts objectiu';

  @override
  String currentGoalPoints(int points) {
    return 'Objectiu actual: $points punts';
  }

  @override
  String get newGoalPointsLabel => 'Nous punts objectiu';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'punts';

  @override
  String get saveGoalButton => 'Desa l\'objectiu';

  @override
  String goalSetTo(int points) {
    return 'Objectiu establert en $points punts';
  }

  @override
  String get enterGoalPoints => 'Introdueix els punts objectiu';

  @override
  String get enterValidNumber => 'Introdueix un número vàlid (d\'1 a 99999999)';

  @override
  String get saveFailed => 'No s\'han pogut desar alguns paràmetres';

  @override
  String get emailOpenFailed => 'No s\'ha pogut obrir l\'aplicació de correu';

  @override
  String get pageOpenFailed => 'No s\'ha pogut obrir la pàgina';

  @override
  String get appInfoSupport => 'Informació de l\'aplicació i suport';

  @override
  String get contactUs => 'Contacta amb nosaltres';

  @override
  String get contactUsSubtitle =>
      'Fes-nos arribar els teus comentaris i preguntes';

  @override
  String get termsOfService => 'Condicions del servei';

  @override
  String get termsSubtitle =>
      'Consulta les condicions del servei de l\'aplicació';

  @override
  String get privacyPolicy => 'Política de privadesa';

  @override
  String get privacySubtitle => 'Sobre el tractament de la informació personal';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Aprèn a fer servir l\'aplicació';

  @override
  String get dataManagement => 'Gestió de dades';

  @override
  String get deleteHistory => 'Suprimeix l\'historial';

  @override
  String get deleteHistorySubtitle =>
      'Suprimeix només l\'historial d\'entrenament (els punts objectiu es conserven)';

  @override
  String get deleteHistoryAndGoal => 'Suprimeix l\'historial i l\'objectiu';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Suprimeix tot l\'historial i els punts objectiu';

  @override
  String get deleteHistoryConfirmTitle => 'Suprimeix l\'historial';

  @override
  String get deleteHistoryConfirmMessage =>
      'Segur que vols suprimir tot l\'historial d\'entrenament?\n\n*Els punts objectiu es conservaran';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Suprimeix l\'historial i l\'objectiu';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Segur que vols suprimir tot l\'historial i els punts objectiu?\n\n*Aquesta acció no es pot desfer';

  @override
  String get cancel => 'Cancel·la';

  @override
  String get delete => 'Suprimeix';

  @override
  String get historyDeleted => 'S\'ha suprimit l\'historial';

  @override
  String get historyAndGoalDeleted =>
      'S\'han suprimit l\'historial i l\'objectiu';

  @override
  String get historyDeleteFailed => 'No s\'ha pogut suprimir l\'historial';

  @override
  String get historyAndGoalDeleteFailed =>
      'No s\'han pogut suprimir l\'historial i l\'objectiu';

  @override
  String get tutorialDisplayFailed => 'No s\'ha pogut mostrar el tutorial';

  @override
  String get tips => 'Consells';

  @override
  String get tipsContent =>
      '• L’objectiu apareix al gràfic de la pantalla d’inici\n• Comença amb un objectiu petit i augmenta’l al teu ritme\n• Cada tria correcta dona fins a 6 punts';

  @override
  String get backToHome => 'Torna a l\'inici';

  @override
  String get tutorialSkip => 'Omet';

  @override
  String get tutorialGoalAndPoints => 'Objectiu i punts actuals';

  @override
  String get tutorialGoalDescription =>
      'El cercle exterior mostra l\'objectiu i l\'interior, els punts totals. El cercle s\'omple a mesura que t\'acostes a l\'objectiu.';

  @override
  String get tutorialOneMinuteTraining => 'Entrenament d\'1 minut';

  @override
  String get tutorialTrainingDescription =>
      'Comença un joc d\'1 minut. Tria imatges positives o bons hàbits entre 4 opcions.';

  @override
  String get tutorialScoreProgress => 'Evolució de la puntuació';

  @override
  String get tutorialScoreDescription =>
      'Consulta informació detallada sobre les puntuacions obtingudes.';

  @override
  String get tutorialSettingsAndData => 'Configuració i gestió de dades';

  @override
  String get tutorialSettingsDescription =>
      'Canvia l\'objectiu, consulta la informació de l\'aplicació i restableix les dades.';

  @override
  String get appIntroAttentionBiasTitle => 'Sobre el biaix atencional';

  @override
  String get appIntroAttentionBiasContent =>
      'Quan l\'ansietat és alta, tendim inconscientment a fixar-nos només en les coses negatives.';

  @override
  String get appIntroFocusMintRoleTitle => 'El paper de FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Un joc breu per practicar com dirigir l’atenció cap a imatges positives.';

  @override
  String get appIntroScientificEvidenceTitle => 'Sobre aquest exercici';

  @override
  String get appIntroScientificEvidenceContent =>
      'Practica trobar imatges positives. FocusMint és una eina d’autocura, no un tractament mèdic. Els resultats varien segons la persona.';

  @override
  String get appIntroExpectedEffectsTitle => 'Què pots practicar';

  @override
  String get appIntroEffect1 => 'Buscar imatges positives';

  @override
  String get appIntroEffect2 => 'Fixar-te en els somriures del teu voltant';

  @override
  String get appIntroEffect3 => 'Crear una petita rutina diària';

  @override
  String get appIntroHowToUse => 'Mira com es fa servir';

  @override
  String get pointsEarned => 'Punts guanyats!';

  @override
  String get yourScore => 'La teva puntuació';

  @override
  String get totalPlayTime => 'Temps total de joc';

  @override
  String get imageManagement => 'Gestió d\'imatges';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Imatges ocultes: $count/$max';
  }

  @override
  String get unsavedChanges => 'Tens canvis sense desar';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Tens $count canvis sense desar a la configuració de visualització d\'imatges.';
  }

  @override
  String get unsavedChangesWarning =>
      'Si tanques aquesta pantalla ara, els canvis es perdran.';

  @override
  String get discardChanges => 'Descarta els canvis';

  @override
  String get saveAndExit => 'Desa i surt';

  @override
  String settingsSaved(Object count) {
    return 'S\'han desat $count paràmetres';
  }

  @override
  String get saveError => 'S\'ha produït un error en desar la configuració';

  @override
  String get imageSettingsUpdated =>
      'S\'ha actualitzat la configuració d\'imatges';

  @override
  String get allImages => 'Totes';

  @override
  String get positiveImages => 'Positives';

  @override
  String get negativeImages => 'Negatives';

  @override
  String get smileImages => 'Somriures';

  @override
  String get vegetableImages => 'Aliments nutritius';

  @override
  String get healthImages => 'Moviment i relacions';

  @override
  String get sadImages => 'Ira, tristesa i preocupació';

  @override
  String get badFoodImages => 'Menjar ràpid i dolços';

  @override
  String get badImages => 'Hàbits poc saludables';

  @override
  String get imageManagementHint =>
      'Toca per mostrar o amagar una imatge. Pots amagar fins a 15 imatges.';

  @override
  String get unsaved => 'Sense desar';

  @override
  String get save => 'Desa';

  @override
  String get hiddenImages => 'Ocultes';

  @override
  String get noHiddenImages => 'No hi ha imatges ocultes';

  @override
  String get settingsLoadFailed => 'No s\'ha pogut carregar la configuració';

  @override
  String imagesAdded(int count) {
    return 'S\'han afegit $count imatges';
  }

  @override
  String get imageAddFailed => 'No s\'han pogut afegir les imatges';

  @override
  String get imageSelectionFailed => 'No s\'han pogut seleccionar les imatges';

  @override
  String get settingsChangeFailed => 'No s\'ha pogut canviar la configuració';

  @override
  String groupTitle(String name) {
    return 'Grup: $name';
  }

  @override
  String get displayToggle => 'Mostra/amaga';

  @override
  String imageCount(int count) {
    return '$count imatges';
  }

  @override
  String get noticeTitle => 'Notes importants';

  @override
  String get notice1 => 'S\'ha afegit la funció d\'imatges personalitzades!';

  @override
  String get notice2 =>
      'Pots afegir les teves pròpies imatges des de la pantalla de configuració';

  @override
  String get notice3 =>
      'Consulta la pantalla de configuració per a més detalls';

  @override
  String get customImageTitle => 'Imatges personalitzades';

  @override
  String get customImageSubtitle =>
      'Afegeix i gestiona les teves pròpies imatges';

  @override
  String get addCustomImages => 'Afegeix imatges personalitzades';

  @override
  String get selectImages => 'Selecciona imatges';

  @override
  String get unknownImage => 'Imatge desconeguda';

  @override
  String get customImageSettings => 'Configuració d\'imatges personalitzades';

  @override
  String get useCustomImages => 'Fes servir imatges personalitzades';

  @override
  String get useCustomImagesDescription =>
      'Fes servir les teves imatges per practicar. Activa la barreja de sota per incloure les imatges de l’aplicació.';

  @override
  String get groupSettings => 'Configuració de grups';

  @override
  String get minOneGroupRequired => 'Com a mínim un grup ha d\'estar activat';

  @override
  String get settingsLoadFailedMessage =>
      'No s\'ha pogut carregar la configuració';

  @override
  String get customImageNotice1 =>
      'Quan els grups estan activats, les imatges es mostren aleatòriament per a cada grup.';

  @override
  String get customImageNotice2 =>
      'Les imatges que puges i configures no es comparteixen amb els desenvolupadors ni amb tercers, i es desen només a l\'àrea de l\'aplicació del dispositiu.';

  @override
  String get customImageNotice3 => 'Això permet fer-la servir sense connexió.';

  @override
  String get customImageNotice4 =>
      'Afegir moltes imatges ocupa espai d’emmagatzematge. Si tens problemes, desactiva les imatges pròpies o elimina les que no utilitzes a la configuració.';

  @override
  String get customImageNotice5 =>
      'Quan suprimeixes l\'aplicació, les imatges configurades se suprimeixen.';

  @override
  String get customImageRequirementNotMet =>
      'Per fer servir imatges personalitzades, necessites com a mínim 1 imatge bona i 3 imatges no bones als grups activats.';

  @override
  String get customImageRequirement =>
      'Per fer servir imatges personalitzades, necessites com a mínim 1 imatge bona i 3 imatges no bones als grups activats.';

  @override
  String get sunnyWeather => 'Bones';

  @override
  String get rainyWeather => 'No bones';

  @override
  String get addImages => 'Afegeix imatges';

  @override
  String get imageDeleted => 'S\'ha suprimit la imatge';

  @override
  String get imageDeleteFailed => 'No s\'ha pogut suprimir la imatge';

  @override
  String get deleteImageTitle => 'Suprimeix la imatge';

  @override
  String get deleteImageMessage =>
      'Vols suprimir aquesta imatge? Aquesta acció no es pot desfer.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Imatges $weather del grup $groupId';
  }

  @override
  String registeredCount(int count) {
    return 'Registrades: $count imatges';
  }

  @override
  String get noImagesRegistered => 'No hi ha imatges registrades';

  @override
  String get imagePreview => 'Previsualització de la imatge';

  @override
  String get close => 'Tanca';

  @override
  String get contactEmailSubject => 'FocusMint - Contacte';

  @override
  String get contactEmailBody => 'Escriu-nos els teus comentaris i preguntes.';

  @override
  String get mixWithBuiltInImages => 'Barreja amb les imatges de l’aplicació';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Fes servir les teves imatges i les de l’aplicació juntes';

  @override
  String get supportIntro =>
      'Parla anònimament amb el desenvolupador. Pots enviar preguntes i suggeriments. Tens 3 missatges al dia. Cada resposta del desenvolupador restableix el límit a 3.';

  @override
  String get supportReceived =>
      'Missatge rebut. Normalment responem en 2–3 dies.';

  @override
  String get supportComposer => 'Escriu un missatge';

  @override
  String get supportSend => 'Envia';

  @override
  String get supportRetry => 'Torna-ho a provar';

  @override
  String get supportSent => 'Enviat';

  @override
  String get supportUnsent => 'No enviat · desat en aquest dispositiu';

  @override
  String get supportAttach => 'Adjunta una imatge';

  @override
  String get supportRemoveImage => 'Treu la imatge';

  @override
  String get supportImage => 'Fitxer adjunt';

  @override
  String get supportClear => 'Suprimeix l’historial';

  @override
  String get supportClearConfirm =>
      'Vols suprimir aquesta conversa? També se suprimiran els esborranys no enviats i l’historial del servidor. Això no restableix el límit.';

  @override
  String get supportQuota =>
      'Ja has utilitzat els 3 missatges d’avui. Envia’n un altre demà o després d’una resposta del desenvolupador.';

  @override
  String get supportConnectionError =>
      'No s’ha pogut connectar. Els esborranys desats no s’han enviat.';

  @override
  String get supportSendError =>
      'No s’ha pogut enviar. El missatge està desat en aquest dispositiu. Torna-ho a provar.';

  @override
  String get supportStorageError => 'No s’ha pogut desar. Torna-ho a provar.';

  @override
  String get supportClearError =>
      'No s’ha pogut suprimir l’historial. Comprova la connexió i torna-ho a provar.';

  @override
  String get supportImageError =>
      'No s’ha pogut carregar la imatge. Tria una imatge de menys de 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Missatges disponibles avui: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Respostes sense llegir: $count';
  }

  @override
  String get supportGuide => 'Informació';

  @override
  String get supportDeveloper => 'Desenvolupador';

  @override
  String get supportPrivacy => 'Dades de les consultes';

  @override
  String get breathingTitle => 'Pren-te un respir';

  @override
  String get breathingHint =>
      'Segueix el moviment suau dels pulmons\na un ritme còmode.';

  @override
  String get breathingIn => 'Inspira a poc a poc';

  @override
  String get breathingOut => 'Expira a poc a poc';

  @override
  String get breathingProgress => 'Progrés de la respiració';

  @override
  String get breathingResultHint => 'Els resultats apareixeran automàticament.';

  @override
  String get breathingSkip => 'Ves als resultats';
}
