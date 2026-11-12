// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Aktuelle Punkte';

  @override
  String goalLabel(int goal) {
    return 'Ziel: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Verbleibend: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Ziel erreicht!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'Übe, das Positive wahrzunehmen.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Verbleibende Zeit: $minutes Min. $seconds Sek.';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Verbleibende Zeit: $seconds Sek.';
  }

  @override
  String scoreLabel(String score) {
    return 'Punktzahl: $score Punkte';
  }

  @override
  String get imagePreparationMessage => 'Bilder werden vorbereitet...';

  @override
  String get noStimuliAvailable => 'Keine Stimuli verfügbar';

  @override
  String get invalidGridSize => 'Ungültige Rastergröße';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Es geht los...';

  @override
  String get excellentPerformance => 'Hervorragende Leistung!';

  @override
  String get greatJob => 'Gut gemacht!';

  @override
  String get goodPerformance => 'Gute Leistung';

  @override
  String get keepPracticingFeedback => 'Üben Sie weiter';

  @override
  String get takeYourTimeFeedback => 'Lassen Sie sich Zeit';

  @override
  String get happy => 'Freude';

  @override
  String get angry => 'Wut';

  @override
  String get fear => 'Angst';

  @override
  String get sad => 'Trauer';

  @override
  String get historyPageTitle => 'Trainingsverlauf';

  @override
  String get dataLoading => 'Daten werden geladen...';

  @override
  String get pointsHistory => 'Punkteverlauf';

  @override
  String get weekly => 'Wöchentlich';

  @override
  String get monthly => 'Monatlich';

  @override
  String get noDataAvailable => 'Keine Daten verfügbar';

  @override
  String get goalAchievementRate => 'Zielerreichungsquote';

  @override
  String get scoreStatistics => 'Punktestatistik';

  @override
  String get bestScore => 'Beste Punktzahl';

  @override
  String get totalScore => 'Gesamtpunktzahl';

  @override
  String get trainingTime => 'Trainingszeit';

  @override
  String get totalTrainingTime => 'Gesamte Trainingszeit';

  @override
  String get detailedStatistics => 'Detaillierte Statistiken';

  @override
  String get averageScorePerMinute => 'Durchschnittliche Punktzahl pro Minute';

  @override
  String get pointsToGoal => 'Punkte bis zum Ziel';

  @override
  String get goalSetting => 'Zieleinstellung';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'Punkte';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'So';

  @override
  String get mondayShort => 'Mo';

  @override
  String get tuesdayShort => 'Di';

  @override
  String get wednesdayShort => 'Mi';

  @override
  String get thursdayShort => 'Do';

  @override
  String get fridayShort => 'Fr';

  @override
  String get saturdayShort => 'Sa';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get goalPointsSetting => 'Zielpunkte festlegen';

  @override
  String currentGoalPoints(int points) {
    return 'Aktuelles Ziel: $points Punkte';
  }

  @override
  String get newGoalPointsLabel => 'Neue Zielpunkte';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'Punkte';

  @override
  String get saveGoalButton => 'Ziel speichern';

  @override
  String goalSetTo(int points) {
    return 'Ziel auf $points Punkte festgelegt';
  }

  @override
  String get enterGoalPoints => 'Bitte geben Sie Zielpunkte ein';

  @override
  String get enterValidNumber =>
      'Bitte geben Sie eine gültige Zahl ein (1 bis 99999999)';

  @override
  String get saveFailed =>
      'Einige Einstellungen konnten nicht gespeichert werden';

  @override
  String get emailOpenFailed => 'E-Mail-App konnte nicht geöffnet werden';

  @override
  String get pageOpenFailed => 'Seite konnte nicht geöffnet werden';

  @override
  String get appInfoSupport => 'App-Infos & Support';

  @override
  String get contactUs => 'Kontakt';

  @override
  String get contactUsSubtitle =>
      'Teilen Sie uns Ihr Feedback und Ihre Fragen mit';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get termsSubtitle => 'Lesen Sie die Nutzungsbedingungen der App';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get privacySubtitle => 'Zum Umgang mit personenbezogenen Daten';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Erfahren Sie, wie Sie die App verwenden';

  @override
  String get dataManagement => 'Datenverwaltung';

  @override
  String get deleteHistory => 'Verlauf löschen';

  @override
  String get deleteHistorySubtitle =>
      'Nur den Trainingsverlauf löschen (Zielpunkte bleiben erhalten)';

  @override
  String get deleteHistoryAndGoal => 'Verlauf & Ziel löschen';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Gesamten Verlauf und Zielpunkte löschen';

  @override
  String get deleteHistoryConfirmTitle => 'Verlauf löschen';

  @override
  String get deleteHistoryConfirmMessage =>
      'Möchten Sie wirklich den gesamten Trainingsverlauf löschen?\n\n*Die Zielpunkte bleiben erhalten';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Verlauf & Ziel löschen';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Möchten Sie wirklich den gesamten Verlauf und die Zielpunkte löschen?\n\n*Diese Aktion kann nicht rückgängig gemacht werden';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get historyDeleted => 'Verlauf gelöscht';

  @override
  String get historyAndGoalDeleted => 'Verlauf und Ziel gelöscht';

  @override
  String get historyDeleteFailed => 'Verlauf konnte nicht gelöscht werden';

  @override
  String get historyAndGoalDeleteFailed =>
      'Verlauf und Ziel konnten nicht gelöscht werden';

  @override
  String get tutorialDisplayFailed => 'Tutorial konnte nicht angezeigt werden';

  @override
  String get tips => 'Tipps';

  @override
  String get tipsContent =>
      '• Dein Ziel wird im Diagramm auf der Startseite angezeigt\n• Beginne klein und erhöhe dein Ziel in deinem eigenen Tempo\n• Jede richtige Auswahl bringt bis zu 6 Punkte';

  @override
  String get backToHome => 'Zurück zur Startseite';

  @override
  String get tutorialSkip => 'Überspringen';

  @override
  String get tutorialGoalAndPoints => 'Ziel und aktuelle Punkte';

  @override
  String get tutorialGoalDescription =>
      'Der äußere Kreis zeigt Ihr Ziel, der innere Kreis Ihre Gesamtpunkte. Der Kreis füllt sich, je näher Sie Ihrem Ziel kommen.';

  @override
  String get tutorialOneMinuteTraining => '1-Minuten-Training';

  @override
  String get tutorialTrainingDescription =>
      'Starten Sie ein 1-minütiges Spiel. Wählen Sie aus 4 Optionen positive Bilder oder gute Gewohnheiten.';

  @override
  String get tutorialScoreProgress => 'Punkteentwicklung';

  @override
  String get tutorialScoreDescription =>
      'Sehen Sie detaillierte Informationen zu Ihren erzielten Punkten.';

  @override
  String get tutorialSettingsAndData => 'Einstellungen und Datenverwaltung';

  @override
  String get tutorialSettingsDescription =>
      'Ändern Sie Zielwerte, sehen Sie App-Informationen ein und setzen Sie Daten zurück.';

  @override
  String get appIntroAttentionBiasTitle => 'Über den Aufmerksamkeitsbias';

  @override
  String get appIntroAttentionBiasContent =>
      'Bei starker Angst neigen wir unbewusst dazu, nur auf Negatives zu achten.';

  @override
  String get appIntroFocusMintRoleTitle => 'Die Rolle von FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Ein kurzes Spiel, mit dem du übst, deine Aufmerksamkeit auf positive Bilder zu richten.';

  @override
  String get appIntroScientificEvidenceTitle => 'Über diese Übung';

  @override
  String get appIntroScientificEvidenceContent =>
      'Übe, positive Bilder zu finden. FocusMint dient der Selbstfürsorge und ist keine medizinische Behandlung. Die Wirkung kann von Person zu Person unterschiedlich sein.';

  @override
  String get appIntroExpectedEffectsTitle => 'Das kannst du üben';

  @override
  String get appIntroEffect1 => 'Positive Bilder suchen';

  @override
  String get appIntroEffect2 => 'Ein Lächeln in deiner Umgebung wahrnehmen';

  @override
  String get appIntroEffect3 => 'Eine kurze tägliche Routine entwickeln';

  @override
  String get appIntroHowToUse => 'So funktioniert die App';

  @override
  String get pointsEarned => 'Punkte erhalten!';

  @override
  String get yourScore => 'Ihre Punktzahl';

  @override
  String get totalPlayTime => 'Gesamte Spielzeit';

  @override
  String get imageManagement => 'Bildverwaltung';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Ausgeblendete Bilder: $count/$max';
  }

  @override
  String get unsavedChanges => 'Sie haben ungespeicherte Änderungen';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Sie haben $count ungespeicherte Änderungen an den Bildanzeige-Einstellungen.';
  }

  @override
  String get unsavedChangesWarning =>
      'Wenn Sie diesen Bildschirm jetzt schließen, gehen die Änderungen verloren.';

  @override
  String get discardChanges => 'Änderungen verwerfen';

  @override
  String get saveAndExit => 'Speichern und schließen';

  @override
  String settingsSaved(Object count) {
    return '$count Einstellungen gespeichert';
  }

  @override
  String get saveError =>
      'Beim Speichern der Einstellungen ist ein Fehler aufgetreten';

  @override
  String get imageSettingsUpdated =>
      'Die Bildeinstellungen wurden aktualisiert';

  @override
  String get allImages => 'Alle';

  @override
  String get positiveImages => 'Positiv';

  @override
  String get negativeImages => 'Negativ';

  @override
  String get smileImages => 'Lächeln';

  @override
  String get vegetableImages => 'Nährstoffreiche Lebensmittel';

  @override
  String get healthImages => 'Bewegung und Begegnungen';

  @override
  String get sadImages => 'Wut, Traurigkeit und Sorge';

  @override
  String get badFoodImages => 'Fast Food und Süßigkeiten';

  @override
  String get badImages => 'Belastende Gewohnheiten';

  @override
  String get imageManagementHint =>
      'Tippen Sie, um Bilder ein- oder auszublenden. Sie können bis zu 15 Bilder ausblenden.';

  @override
  String get unsaved => 'Nicht gespeichert';

  @override
  String get save => 'Speichern';

  @override
  String get hiddenImages => 'Ausgeblendet';

  @override
  String get noHiddenImages => 'Keine ausgeblendeten Bilder';

  @override
  String get settingsLoadFailed => 'Einstellungen konnten nicht geladen werden';

  @override
  String imagesAdded(int count) {
    return '$count Bilder hinzugefügt';
  }

  @override
  String get imageAddFailed => 'Bilder konnten nicht hinzugefügt werden';

  @override
  String get imageSelectionFailed => 'Bilder konnten nicht ausgewählt werden';

  @override
  String get settingsChangeFailed =>
      'Einstellungen konnten nicht geändert werden';

  @override
  String groupTitle(String name) {
    return 'Gruppe: $name';
  }

  @override
  String get displayToggle => 'Anzeige umschalten';

  @override
  String imageCount(int count) {
    return '$count Bilder';
  }

  @override
  String get noticeTitle => 'Wichtige Hinweise';

  @override
  String get notice1 => 'Die Funktion für eigene Bilder wurde hinzugefügt!';

  @override
  String get notice2 =>
      'Sie können eigene Bilder über den Einstellungsbildschirm hinzufügen';

  @override
  String get notice3 => 'Details finden Sie im Einstellungsbildschirm';

  @override
  String get customImageTitle => 'Eigene Bilder';

  @override
  String get customImageSubtitle => 'Eigene Bilder hinzufügen und verwalten';

  @override
  String get addCustomImages => 'Eigene Bilder hinzufügen';

  @override
  String get selectImages => 'Bilder auswählen';

  @override
  String get unknownImage => 'Unbekanntes Bild';

  @override
  String get customImageSettings => 'Einstellungen für eigene Bilder';

  @override
  String get useCustomImages => 'Eigene Bilder verwenden';

  @override
  String get useCustomImagesDescription =>
      'Verwende eigene Bilder zum Üben. Aktiviere unten die Mischung, um auch integrierte Bilder zu nutzen.';

  @override
  String get groupSettings => 'Gruppeneinstellungen';

  @override
  String get minOneGroupRequired =>
      'Mindestens eine Gruppe muss aktiviert sein';

  @override
  String get settingsLoadFailedMessage =>
      'Einstellungen konnten nicht geladen werden';

  @override
  String get customImageNotice1 =>
      'Wenn Gruppen aktiviert sind, werden die Bilder je Gruppe zufällig angezeigt.';

  @override
  String get customImageNotice2 =>
      'Von Ihnen hochgeladene und festgelegte Bilder werden weder an Entwickler noch an Dritte weitergegeben und nur im App-Bereich des Geräts gespeichert.';

  @override
  String get customImageNotice3 => 'Dadurch ist eine Offline-Nutzung möglich.';

  @override
  String get customImageNotice4 =>
      'Viele Bilder benötigen Speicherplatz. Deaktiviere bei Problemen eigene Bilder oder entferne ungenutzte Bilder in den Einstellungen.';

  @override
  String get customImageNotice5 =>
      'Wenn Sie die App löschen, werden die festgelegten Bilder gelöscht.';

  @override
  String get customImageRequirementNotMet =>
      'Um eigene Bilder zu verwenden, benötigen Sie in den aktivierten Gruppen mindestens 1 Bild „Gut“ und 3 Bilder „Nicht gut“.';

  @override
  String get customImageRequirement =>
      'Um eigene Bilder zu verwenden, benötigen Sie in den aktivierten Gruppen mindestens 1 Bild „Gut“ und 3 Bilder „Nicht gut“.';

  @override
  String get sunnyWeather => 'Gut';

  @override
  String get rainyWeather => 'Nicht gut';

  @override
  String get addImages => 'Bilder hinzufügen';

  @override
  String get imageDeleted => 'Bild gelöscht';

  @override
  String get imageDeleteFailed => 'Bild konnte nicht gelöscht werden';

  @override
  String get deleteImageTitle => 'Bild löschen';

  @override
  String get deleteImageMessage =>
      'Möchten Sie dieses Bild löschen? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Gruppe $groupId – Bilder „$weather“';
  }

  @override
  String registeredCount(int count) {
    return 'Registriert: $count Bilder';
  }

  @override
  String get noImagesRegistered => 'Keine Bilder registriert';

  @override
  String get imagePreview => 'Bildvorschau';

  @override
  String get close => 'Schließen';

  @override
  String get contactEmailSubject => 'FocusMint - Kontakt';

  @override
  String get contactEmailBody =>
      'Bitte teilen Sie uns Ihr Feedback und Ihre Fragen mit.';

  @override
  String get mixWithBuiltInImages => 'Mit integrierten Bildern mischen';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Eigene und integrierte Bilder gemeinsam verwenden';

  @override
  String get supportIntro =>
      'Schreibe dem Entwickler anonym. Fragen und Vorschläge sind willkommen. Du kannst täglich 3 Nachrichten senden. Jede Antwort des Entwicklers setzt dein Kontingent auf 3 zurück.';

  @override
  String get supportReceived =>
      'Nachricht erhalten. Wir antworten in der Regel innerhalb von 2–3 Tagen.';

  @override
  String get supportComposer => 'Nachricht eingeben';

  @override
  String get supportSend => 'Senden';

  @override
  String get supportRetry => 'Erneut versuchen';

  @override
  String get supportSent => 'Gesendet';

  @override
  String get supportUnsent => 'Nicht gesendet · auf diesem Gerät gespeichert';

  @override
  String get supportAttach => 'Bild anhängen';

  @override
  String get supportRemoveImage => 'Bild entfernen';

  @override
  String get supportImage => 'Anhang';

  @override
  String get supportClear => 'Verlauf löschen';

  @override
  String get supportClearConfirm =>
      'Diese Unterhaltung löschen? Nicht gesendete Entwürfe und der Verlauf auf dem Server werden ebenfalls gelöscht. Dein Kontingent wird dadurch nicht zurückgesetzt.';

  @override
  String get supportQuota =>
      'Du hast heute 3 Nachrichten gesendet. Sende morgen oder nach einer Antwort des Entwicklers eine weitere Nachricht.';

  @override
  String get supportConnectionError =>
      'Keine Verbindung möglich. Gespeicherte Entwürfe wurden nicht gesendet.';

  @override
  String get supportSendError =>
      'Senden fehlgeschlagen. Deine Nachricht ist auf diesem Gerät gespeichert. Bitte versuche es erneut.';

  @override
  String get supportStorageError =>
      'Speichern fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get supportClearError =>
      'Der Verlauf konnte nicht gelöscht werden. Prüfe deine Verbindung und versuche es erneut.';

  @override
  String get supportImageError =>
      'Das Bild konnte nicht geladen werden. Wähle ein Bild mit weniger als 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Heute noch verfügbar: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Ungelesene Antworten: $count';
  }

  @override
  String get supportGuide => 'Informationen';

  @override
  String get supportDeveloper => 'Entwickler';

  @override
  String get supportPrivacy => 'Über die Supportdaten';

  @override
  String get breathingTitle => 'Nimm dir einen Atemzug Zeit';

  @override
  String get breathingHint =>
      'Folge der sanften Bewegung der Lunge\nin deinem eigenen Tempo.';

  @override
  String get breathingIn => 'Langsam einatmen';

  @override
  String get breathingOut => 'Langsam ausatmen';

  @override
  String get breathingProgress => 'Fortschritt der Atemübung';

  @override
  String get breathingResultHint => 'Dein Ergebnis wird automatisch angezeigt.';

  @override
  String get breathingSkip => 'Weiter zum Ergebnis';
}
