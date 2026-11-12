// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Punti attuali';

  @override
  String goalLabel(int goal) {
    return 'Obiettivo: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Rimanenti: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Obiettivo raggiunto!';

  @override
  String get startButtonText => 'INIZIA';

  @override
  String get stressReductionMessage =>
      'Esercitati a notare gli aspetti positivi.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Tempo rimanente: ${minutes}m ${seconds}s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Tempo rimanente: ${seconds}s';
  }

  @override
  String scoreLabel(String score) {
    return 'Punteggio: $score punti';
  }

  @override
  String get imagePreparationMessage => 'Preparazione delle immagini...';

  @override
  String get noStimuliAvailable => 'Nessuno stimolo disponibile';

  @override
  String get invalidGridSize => 'Dimensione della griglia non valida';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Avvio in corso...';

  @override
  String get excellentPerformance => 'Prestazione eccellente!';

  @override
  String get greatJob => 'Ottimo lavoro!';

  @override
  String get goodPerformance => 'Buona prestazione';

  @override
  String get keepPracticingFeedback => 'Continua ad allenarti';

  @override
  String get takeYourTimeFeedback => 'Prenditi il tuo tempo';

  @override
  String get happy => 'Felice';

  @override
  String get angry => 'Arrabbiato';

  @override
  String get fear => 'Paura';

  @override
  String get sad => 'Triste';

  @override
  String get historyPageTitle => 'Cronologia degli allenamenti';

  @override
  String get dataLoading => 'Caricamento dei dati...';

  @override
  String get pointsHistory => 'Cronologia punti';

  @override
  String get weekly => 'Settimanale';

  @override
  String get monthly => 'Mensile';

  @override
  String get noDataAvailable => 'Nessun dato disponibile';

  @override
  String get goalAchievementRate => 'Tasso di raggiungimento dell\'obiettivo';

  @override
  String get scoreStatistics => 'Statistiche del punteggio';

  @override
  String get bestScore => 'Miglior punteggio';

  @override
  String get totalScore => 'Punteggio totale';

  @override
  String get trainingTime => 'Tempo di allenamento';

  @override
  String get totalTrainingTime => 'Tempo totale di allenamento';

  @override
  String get detailedStatistics => 'Statistiche dettagliate';

  @override
  String get averageScorePerMinute => 'Punteggio medio al minuto';

  @override
  String get pointsToGoal => 'Punti all\'obiettivo';

  @override
  String get goalSetting => 'Impostazione dell\'obiettivo';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'punti';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dom';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mer';

  @override
  String get thursdayShort => 'Gio';

  @override
  String get fridayShort => 'Ven';

  @override
  String get saturdayShort => 'Sab';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get goalPointsSetting => 'Impostazione punti obiettivo';

  @override
  String currentGoalPoints(int points) {
    return 'Obiettivo attuale: $points punti';
  }

  @override
  String get newGoalPointsLabel => 'Nuovi punti obiettivo';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'punti';

  @override
  String get saveGoalButton => 'Salva obiettivo';

  @override
  String goalSetTo(int points) {
    return 'Obiettivo impostato su $points punti';
  }

  @override
  String get enterGoalPoints => 'Inserisci i punti obiettivo';

  @override
  String get enterValidNumber => 'Inserisci un numero valido (da 1 a 99999999)';

  @override
  String get saveFailed => 'Salvataggio di alcune impostazioni non riuscito';

  @override
  String get emailOpenFailed => 'Impossibile aprire l\'app di posta';

  @override
  String get pageOpenFailed => 'Impossibile aprire la pagina';

  @override
  String get appInfoSupport => 'Info app e supporto';

  @override
  String get contactUs => 'Contattaci';

  @override
  String get contactUsSubtitle => 'Inviaci i tuoi commenti e le tue domande';

  @override
  String get termsOfService => 'Termini di servizio';

  @override
  String get termsSubtitle => 'Consulta i termini di servizio dell\'app';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get privacySubtitle => 'Sul trattamento delle informazioni personali';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Scopri come usare l\'app';

  @override
  String get dataManagement => 'Gestione dei dati';

  @override
  String get deleteHistory => 'Elimina cronologia';

  @override
  String get deleteHistorySubtitle =>
      'Elimina solo la cronologia degli allenamenti (i punti obiettivo vengono conservati)';

  @override
  String get deleteHistoryAndGoal => 'Elimina cronologia e obiettivo';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Elimina tutta la cronologia e i punti obiettivo';

  @override
  String get deleteHistoryConfirmTitle => 'Elimina cronologia';

  @override
  String get deleteHistoryConfirmMessage =>
      'Vuoi davvero eliminare tutta la cronologia degli allenamenti?\n\n*I punti obiettivo verranno conservati';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Elimina cronologia e obiettivo';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Vuoi davvero eliminare tutta la cronologia e i punti obiettivo?\n\n*Questa azione non può essere annullata';

  @override
  String get cancel => 'Annulla';

  @override
  String get delete => 'Elimina';

  @override
  String get historyDeleted => 'Cronologia eliminata';

  @override
  String get historyAndGoalDeleted => 'Cronologia e obiettivo eliminati';

  @override
  String get historyDeleteFailed =>
      'Eliminazione della cronologia non riuscita';

  @override
  String get historyAndGoalDeleteFailed =>
      'Eliminazione della cronologia e dell\'obiettivo non riuscita';

  @override
  String get tutorialDisplayFailed => 'Impossibile mostrare il tutorial';

  @override
  String get tips => 'Suggerimenti';

  @override
  String get tipsContent =>
      '• Il tuo obiettivo appare nel grafico della schermata iniziale\n• Inizia con un piccolo obiettivo e aumentalo al tuo ritmo\n• Ogni scelta corretta vale fino a 6 punti';

  @override
  String get backToHome => 'Torna alla home';

  @override
  String get tutorialSkip => 'Salta';

  @override
  String get tutorialGoalAndPoints => 'Obiettivo e punti attuali';

  @override
  String get tutorialGoalDescription =>
      'Il cerchio esterno mostra l\'obiettivo, quello interno i punti totali. Il cerchio si riempie man mano che ti avvicini all\'obiettivo.';

  @override
  String get tutorialOneMinuteTraining => 'Allenamento di 1 minuto';

  @override
  String get tutorialTrainingDescription =>
      'Avvia un gioco di 1 minuto. Scegli immagini positive o buone abitudini tra 4 opzioni.';

  @override
  String get tutorialScoreProgress => 'Andamento del punteggio';

  @override
  String get tutorialScoreDescription =>
      'Consulta informazioni dettagliate sui punteggi ottenuti.';

  @override
  String get tutorialSettingsAndData => 'Impostazioni e gestione dei dati';

  @override
  String get tutorialSettingsDescription =>
      'Modifica l\'obiettivo, consulta le informazioni sull\'app e reimposta i dati.';

  @override
  String get appIntroAttentionBiasTitle => 'Il bias attentivo';

  @override
  String get appIntroAttentionBiasContent =>
      'Quando l\'ansia è alta, tendiamo inconsciamente a concentrarci solo sulle cose negative.';

  @override
  String get appIntroFocusMintRoleTitle => 'Il ruolo di FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Un breve gioco per esercitarti a rivolgere l’attenzione alle immagini positive.';

  @override
  String get appIntroScientificEvidenceTitle => 'Informazioni sull’esercizio';

  @override
  String get appIntroScientificEvidenceContent =>
      'Esercitati a trovare immagini positive. FocusMint è uno strumento per il benessere personale, non un trattamento medico. I risultati variano da persona a persona.';

  @override
  String get appIntroExpectedEffectsTitle => 'Cosa puoi esercitare';

  @override
  String get appIntroEffect1 => 'Cercare immagini positive';

  @override
  String get appIntroEffect2 => 'Notare i sorrisi intorno a te';

  @override
  String get appIntroEffect3 => 'Creare una breve abitudine quotidiana';

  @override
  String get appIntroHowToUse => 'Scopri come si usa';

  @override
  String get pointsEarned => 'Punti guadagnati!';

  @override
  String get yourScore => 'Il tuo punteggio';

  @override
  String get totalPlayTime => 'Tempo di gioco totale';

  @override
  String get imageManagement => 'Gestione delle immagini';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Immagini nascoste: $count/$max';
  }

  @override
  String get unsavedChanges => 'Ci sono modifiche non salvate';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Hai $count modifiche non salvate alle impostazioni di visualizzazione delle immagini.';
  }

  @override
  String get unsavedChangesWarning =>
      'Se chiudi questa schermata ora, le modifiche andranno perse.';

  @override
  String get discardChanges => 'Ignora modifiche';

  @override
  String get saveAndExit => 'Salva ed esci';

  @override
  String settingsSaved(Object count) {
    return '$count impostazioni salvate';
  }

  @override
  String get saveError =>
      'Si è verificato un errore durante il salvataggio delle impostazioni';

  @override
  String get imageSettingsUpdated =>
      'Le impostazioni delle immagini sono state aggiornate';

  @override
  String get allImages => 'Tutte';

  @override
  String get positiveImages => 'Positive';

  @override
  String get negativeImages => 'Negative';

  @override
  String get smileImages => 'Sorrisi';

  @override
  String get vegetableImages => 'Alimenti nutrienti';

  @override
  String get healthImages => 'Movimento e relazioni';

  @override
  String get sadImages => 'Rabbia, tristezza e preoccupazione';

  @override
  String get badFoodImages => 'Cibo da fast food e dolci';

  @override
  String get badImages => 'Abitudini poco salutari';

  @override
  String get imageManagementHint =>
      'Tocca per mostrare o nascondere un\'immagine. Puoi nascondere fino a 15 immagini.';

  @override
  String get unsaved => 'Non salvato';

  @override
  String get save => 'Salva';

  @override
  String get hiddenImages => 'Nascoste';

  @override
  String get noHiddenImages => 'Nessuna immagine nascosta';

  @override
  String get settingsLoadFailed =>
      'Caricamento delle impostazioni non riuscito';

  @override
  String imagesAdded(int count) {
    return '$count immagini aggiunte';
  }

  @override
  String get imageAddFailed => 'Aggiunta delle immagini non riuscita';

  @override
  String get imageSelectionFailed => 'Selezione delle immagini non riuscita';

  @override
  String get settingsChangeFailed => 'Modifica delle impostazioni non riuscita';

  @override
  String groupTitle(String name) {
    return 'Gruppo: $name';
  }

  @override
  String get displayToggle => 'Mostra/nascondi';

  @override
  String imageCount(int count) {
    return '$count immagini';
  }

  @override
  String get noticeTitle => 'Note importanti';

  @override
  String get notice1 => 'È stata aggiunta la funzione immagini personalizzate!';

  @override
  String get notice2 =>
      'Puoi aggiungere le tue immagini dalla schermata delle impostazioni';

  @override
  String get notice3 =>
      'Consulta la schermata delle impostazioni per i dettagli';

  @override
  String get customImageTitle => 'Immagini personalizzate';

  @override
  String get customImageSubtitle => 'Aggiungi e gestisci le tue immagini';

  @override
  String get addCustomImages => 'Aggiungi immagini personalizzate';

  @override
  String get selectImages => 'Seleziona immagini';

  @override
  String get unknownImage => 'Immagine sconosciuta';

  @override
  String get customImageSettings => 'Impostazioni immagini personalizzate';

  @override
  String get useCustomImages => 'Usa immagini personalizzate';

  @override
  String get useCustomImagesDescription =>
      'Usa le tue immagini per esercitarti. Attiva la combinazione qui sotto per includere quelle dell’app.';

  @override
  String get groupSettings => 'Impostazioni dei gruppi';

  @override
  String get minOneGroupRequired => 'Almeno un gruppo deve essere attivo';

  @override
  String get settingsLoadFailedMessage =>
      'Caricamento delle impostazioni non riuscito';

  @override
  String get customImageNotice1 =>
      'Quando i gruppi sono attivi, le immagini vengono mostrate in modo casuale per ciascun gruppo.';

  @override
  String get customImageNotice2 =>
      'Le immagini caricate e impostate dagli utenti non vengono condivise con gli sviluppatori o terze parti e vengono salvate solo nell\'area dell\'app sul dispositivo.';

  @override
  String get customImageNotice3 => 'Questo consente l\'uso offline.';

  @override
  String get customImageNotice4 =>
      'Aggiungere molte immagini occupa spazio. In caso di problemi, disattiva le immagini personali o elimina quelle inutilizzate nelle impostazioni.';

  @override
  String get customImageNotice5 =>
      'Quando elimini l\'app, le immagini impostate vengono eliminate.';

  @override
  String get customImageRequirementNotMet =>
      'Per usare le immagini personalizzate servono almeno 1 immagine buona e 3 immagini non buone nei gruppi attivi.';

  @override
  String get customImageRequirement =>
      'Per usare le immagini personalizzate servono almeno 1 immagine buona e 3 immagini non buone nei gruppi attivi.';

  @override
  String get sunnyWeather => 'Buone';

  @override
  String get rainyWeather => 'Non buone';

  @override
  String get addImages => 'Aggiungi immagini';

  @override
  String get imageDeleted => 'Immagine eliminata';

  @override
  String get imageDeleteFailed => 'Eliminazione dell\'immagine non riuscita';

  @override
  String get deleteImageTitle => 'Elimina immagine';

  @override
  String get deleteImageMessage =>
      'Vuoi eliminare questa immagine? Questa azione non può essere annullata.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Immagini $weather del gruppo $groupId';
  }

  @override
  String registeredCount(int count) {
    return 'Registrate: $count immagini';
  }

  @override
  String get noImagesRegistered => 'Nessuna immagine registrata';

  @override
  String get imagePreview => 'Anteprima immagine';

  @override
  String get close => 'Chiudi';

  @override
  String get contactEmailSubject => 'FocusMint - Contatto';

  @override
  String get contactEmailBody => 'Scrivi qui i tuoi commenti e le tue domande.';

  @override
  String get mixWithBuiltInImages => 'Combina con le immagini dell’app';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Usa insieme le tue immagini e quelle dell’app';

  @override
  String get supportIntro =>
      'Scrivi in forma anonima allo sviluppatore. Domande e suggerimenti sono benvenuti. Puoi inviare 3 messaggi al giorno. Ogni risposta dello sviluppatore riporta il limite disponibile a 3.';

  @override
  String get supportReceived =>
      'Messaggio ricevuto. Di solito rispondiamo entro 2–3 giorni.';

  @override
  String get supportComposer => 'Scrivi un messaggio';

  @override
  String get supportSend => 'Invia';

  @override
  String get supportRetry => 'Riprova';

  @override
  String get supportSent => 'Inviato';

  @override
  String get supportUnsent => 'Non inviato · salvato su questo dispositivo';

  @override
  String get supportAttach => 'Allega immagine';

  @override
  String get supportRemoveImage => 'Rimuovi immagine';

  @override
  String get supportImage => 'Allegato';

  @override
  String get supportClear => 'Elimina cronologia';

  @override
  String get supportClearConfirm =>
      'Eliminare questa conversazione? Verranno eliminati anche le bozze non inviate e la cronologia sul server. Il limite disponibile non verrà ripristinato.';

  @override
  String get supportQuota =>
      'Hai usato i 3 messaggi di oggi. Puoi scrivere domani o dopo una risposta dello sviluppatore.';

  @override
  String get supportConnectionError =>
      'Connessione non riuscita. Le bozze salvate non sono state inviate.';

  @override
  String get supportSendError =>
      'Invio non riuscito. Il messaggio è salvato su questo dispositivo. Riprova.';

  @override
  String get supportStorageError => 'Salvataggio non riuscito. Riprova.';

  @override
  String get supportClearError =>
      'Impossibile eliminare la cronologia. Controlla la connessione e riprova.';

  @override
  String get supportImageError =>
      'Impossibile caricare l’immagine. Scegli un’immagine inferiore a 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Messaggi disponibili oggi: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Risposte non lette: $count';
  }

  @override
  String get supportGuide => 'Informazioni';

  @override
  String get supportDeveloper => 'Sviluppatore';

  @override
  String get supportPrivacy => 'Informazioni sui dati di contatto';

  @override
  String get breathingTitle => 'Prenditi un respiro';

  @override
  String get breathingHint =>
      'Segui il movimento delicato dei polmoni\na un ritmo confortevole.';

  @override
  String get breathingIn => 'Inspira lentamente';

  @override
  String get breathingOut => 'Espira lentamente';

  @override
  String get breathingProgress => 'Avanzamento della respirazione';

  @override
  String get breathingResultHint => 'I risultati appariranno automaticamente.';

  @override
  String get breathingSkip => 'Vai ai risultati';
}
