// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Points actuels';

  @override
  String goalLabel(int goal) {
    return 'Objectif : $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Restant : $remaining';
  }

  @override
  String get goalAchieved => '🎉 Objectif atteint !';

  @override
  String get startButtonText => 'DÉMARRER';

  @override
  String get stressReductionMessage => 'Entraînez-vous à remarquer le positif.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Temps restant : $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Temps restant : $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Score : $score points';
  }

  @override
  String get imagePreparationMessage => 'Préparation des images...';

  @override
  String get noStimuliAvailable => 'Aucun stimulus disponible';

  @override
  String get invalidGridSize => 'Taille de grille non valide';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Démarrage...';

  @override
  String get excellentPerformance => 'Performance excellente !';

  @override
  String get greatJob => 'Bravo !';

  @override
  String get goodPerformance => 'Bonne performance';

  @override
  String get keepPracticingFeedback => 'Continuez à vous entraîner';

  @override
  String get takeYourTimeFeedback => 'Prenez votre temps';

  @override
  String get happy => 'Joie';

  @override
  String get angry => 'Colère';

  @override
  String get fear => 'Peur';

  @override
  String get sad => 'Tristesse';

  @override
  String get historyPageTitle => 'Historique d’entraînement';

  @override
  String get dataLoading => 'Chargement des données...';

  @override
  String get pointsHistory => 'Historique des points';

  @override
  String get weekly => 'Semaine';

  @override
  String get monthly => 'Mois';

  @override
  String get noDataAvailable => 'Aucune donnée disponible';

  @override
  String get goalAchievementRate => 'Taux d’atteinte de l’objectif';

  @override
  String get scoreStatistics => 'Statistiques de score';

  @override
  String get bestScore => 'Meilleur score';

  @override
  String get totalScore => 'Score total';

  @override
  String get trainingTime => 'Temps d’entraînement';

  @override
  String get totalTrainingTime => 'Temps d’entraînement total';

  @override
  String get detailedStatistics => 'Statistiques détaillées';

  @override
  String get averageScorePerMinute => 'Score moyen par minute';

  @override
  String get pointsToGoal => 'Points restants avant l’objectif';

  @override
  String get goalSetting => 'Définition de l’objectif';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'points';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dim';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mer';

  @override
  String get thursdayShort => 'Jeu';

  @override
  String get fridayShort => 'Ven';

  @override
  String get saturdayShort => 'Sam';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get goalPointsSetting => 'Objectif de points';

  @override
  String currentGoalPoints(int points) {
    return 'Objectif actuel : $points points';
  }

  @override
  String get newGoalPointsLabel => 'Nouvel objectif de points';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'points';

  @override
  String get saveGoalButton => 'Enregistrer l’objectif';

  @override
  String goalSetTo(int points) {
    return 'Objectif défini à $points points';
  }

  @override
  String get enterGoalPoints => 'Veuillez saisir un objectif de points';

  @override
  String get enterValidNumber =>
      'Veuillez saisir un nombre valide (entre 1 et 99999999)';

  @override
  String get saveFailed => 'Échec de l’enregistrement de certains paramètres';

  @override
  String get emailOpenFailed => 'Impossible d’ouvrir l’application e-mail';

  @override
  String get pageOpenFailed => 'Impossible d’ouvrir la page';

  @override
  String get appInfoSupport => 'Informations et assistance';

  @override
  String get contactUs => 'Nous contacter';

  @override
  String get contactUsSubtitle => 'Partagez vos commentaires et vos questions';

  @override
  String get termsOfService => 'Conditions d’utilisation';

  @override
  String get termsSubtitle =>
      'Consultez les conditions d’utilisation de l’application';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get privacySubtitle =>
      'À propos du traitement des données personnelles';

  @override
  String get tutorialTitle => 'Tutoriel';

  @override
  String get tutorialSubtitle => 'Apprenez à utiliser l’application';

  @override
  String get dataManagement => 'Gestion des données';

  @override
  String get deleteHistory => 'Supprimer l’historique';

  @override
  String get deleteHistorySubtitle =>
      'Supprime uniquement l’historique d’entraînement (l’objectif de points est conservé)';

  @override
  String get deleteHistoryAndGoal => 'Supprimer l’historique et l’objectif';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Supprime tout l’historique et l’objectif de points';

  @override
  String get deleteHistoryConfirmTitle => 'Supprimer l’historique';

  @override
  String get deleteHistoryConfirmMessage =>
      'Voulez-vous vraiment supprimer tout l’historique d’entraînement ?\n\n*L’objectif de points sera conservé';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Supprimer l’historique et l’objectif';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Voulez-vous vraiment supprimer tout l’historique et l’objectif de points ?\n\n*Cette action est irréversible';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get historyDeleted => 'Historique supprimé';

  @override
  String get historyAndGoalDeleted => 'Historique et objectif supprimés';

  @override
  String get historyDeleteFailed => 'Échec de la suppression de l’historique';

  @override
  String get historyAndGoalDeleteFailed =>
      'Échec de la suppression de l’historique et de l’objectif';

  @override
  String get tutorialDisplayFailed => 'Échec de l’affichage du tutoriel';

  @override
  String get tips => 'Astuces';

  @override
  String get tipsContent =>
      '• Votre objectif apparaît dans le graphique de l’accueil\n• Commencez modestement et augmentez votre objectif à votre rythme\n• Chaque bonne réponse rapporte jusqu’à 6 points';

  @override
  String get backToHome => 'Retour à l’accueil';

  @override
  String get tutorialSkip => 'Passer';

  @override
  String get tutorialGoalAndPoints => 'Objectif et points actuels';

  @override
  String get tutorialGoalDescription =>
      'Le cercle extérieur représente votre objectif, le cercle intérieur vos points cumulés. Le cercle se remplit à mesure que vous approchez de votre objectif.';

  @override
  String get tutorialOneMinuteTraining => 'Entraînement d’une minute';

  @override
  String get tutorialTrainingDescription =>
      'Lancez une partie d’une minute. Choisissez des images positives ou de bonnes habitudes parmi 4 options.';

  @override
  String get tutorialScoreProgress => 'Évolution du score';

  @override
  String get tutorialScoreDescription =>
      'Consultez le détail des scores que vous avez obtenus.';

  @override
  String get tutorialSettingsAndData => 'Paramètres et gestion des données';

  @override
  String get tutorialSettingsDescription =>
      'Modifiez votre objectif, consultez les informations de l’application et réinitialisez les données.';

  @override
  String get appIntroAttentionBiasTitle => 'À propos du biais attentionnel';

  @override
  String get appIntroAttentionBiasContent =>
      'Lorsque l’anxiété est forte, nous avons inconsciemment tendance à ne remarquer que les choses négatives.';

  @override
  String get appIntroFocusMintRoleTitle => 'Le rôle de FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Un jeu court pour vous exercer à orienter votre attention vers des images positives.';

  @override
  String get appIntroScientificEvidenceTitle => 'À propos de cet exercice';

  @override
  String get appIntroScientificEvidenceContent =>
      'Exercez-vous à trouver des images positives. FocusMint est un outil de bien-être personnel, pas un traitement médical. Les effets varient selon les personnes.';

  @override
  String get appIntroExpectedEffectsTitle => 'Ce que vous pouvez pratiquer';

  @override
  String get appIntroEffect1 => 'Chercher des images positives';

  @override
  String get appIntroEffect2 => 'Remarquer les sourires autour de vous';

  @override
  String get appIntroEffect3 => 'Créer une courte routine quotidienne';

  @override
  String get appIntroHowToUse => 'Voir le mode d’emploi';

  @override
  String get pointsEarned => 'Points gagnés !';

  @override
  String get yourScore => 'Votre score';

  @override
  String get totalPlayTime => 'Temps de jeu total';

  @override
  String get imageManagement => 'Gestion des images';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Images masquées : $count/$max';
  }

  @override
  String get unsavedChanges => 'Modifications non enregistrées';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Vous avez $count modifications non enregistrées des paramètres d’affichage des images.';
  }

  @override
  String get unsavedChangesWarning =>
      'Les modifications seront perdues si vous fermez cet écran maintenant.';

  @override
  String get discardChanges => 'Abandonner les modifications';

  @override
  String get saveAndExit => 'Enregistrer et quitter';

  @override
  String settingsSaved(Object count) {
    return '$count paramètres enregistrés';
  }

  @override
  String get saveError =>
      'Une erreur est survenue lors de l’enregistrement des paramètres';

  @override
  String get imageSettingsUpdated =>
      'Les paramètres d’image ont été mis à jour';

  @override
  String get allImages => 'Toutes';

  @override
  String get positiveImages => 'Positives';

  @override
  String get negativeImages => 'Négatives';

  @override
  String get smileImages => 'Sourires';

  @override
  String get vegetableImages => 'Aliments nourrissants';

  @override
  String get healthImages => 'Mouvement et échanges';

  @override
  String get sadImages => 'Colère, tristesse et inquiétude';

  @override
  String get badFoodImages => 'Restauration rapide et sucreries';

  @override
  String get badImages => 'Habitudes éprouvantes';

  @override
  String get imageManagementHint =>
      'Touchez une image pour l’afficher ou la masquer. Vous pouvez masquer jusqu’à 15 images.';

  @override
  String get unsaved => 'Non enregistré';

  @override
  String get save => 'Enregistrer';

  @override
  String get hiddenImages => 'Masquées';

  @override
  String get noHiddenImages => 'Aucune image masquée';

  @override
  String get settingsLoadFailed => 'Échec du chargement des paramètres';

  @override
  String imagesAdded(int count) {
    return '$count images ajoutées';
  }

  @override
  String get imageAddFailed => 'Échec de l’ajout des images';

  @override
  String get imageSelectionFailed => 'Échec de la sélection des images';

  @override
  String get settingsChangeFailed => 'Échec de la modification des paramètres';

  @override
  String groupTitle(String name) {
    return 'Groupe : $name';
  }

  @override
  String get displayToggle => 'Afficher/Masquer';

  @override
  String imageCount(int count) {
    return '$count images';
  }

  @override
  String get noticeTitle => 'Remarques importantes';

  @override
  String get notice1 =>
      'La fonctionnalité d’images personnalisées a été ajoutée !';

  @override
  String get notice2 =>
      'Vous pouvez ajouter vos propres images depuis l’écran des paramètres';

  @override
  String get notice3 => 'Consultez l’écran des paramètres pour plus de détails';

  @override
  String get customImageTitle => 'Images personnalisées';

  @override
  String get customImageSubtitle => 'Ajoutez et gérez vos propres images';

  @override
  String get addCustomImages => 'Ajouter des images personnalisées';

  @override
  String get selectImages => 'Sélectionner des images';

  @override
  String get unknownImage => 'Image inconnue';

  @override
  String get customImageSettings => 'Paramètres des images personnalisées';

  @override
  String get useCustomImages => 'Utiliser des images personnalisées';

  @override
  String get useCustomImagesDescription =>
      'Utilisez vos propres images pour vous entraîner. Activez le mélange ci-dessous pour inclure les images intégrées.';

  @override
  String get groupSettings => 'Paramètres des groupes';

  @override
  String get minOneGroupRequired => 'Au moins un groupe doit être activé';

  @override
  String get settingsLoadFailedMessage => 'Échec du chargement des paramètres';

  @override
  String get customImageNotice1 =>
      'Lorsque des groupes sont activés, les images s’affichent de manière aléatoire pour chaque groupe.';

  @override
  String get customImageNotice2 =>
      'Les images ajoutées et configurées par l’utilisateur ne sont partagées ni avec les développeurs ni avec des tiers ; elles sont stockées uniquement dans l’espace de l’application sur l’appareil.';

  @override
  String get customImageNotice3 => 'Cela permet une utilisation hors ligne.';

  @override
  String get customImageNotice4 =>
      'Ajouter de nombreuses images utilise de l’espace de stockage. En cas de problème, désactivez les images personnelles ou supprimez les images inutilisées dans les réglages.';

  @override
  String get customImageNotice5 =>
      'Si vous supprimez l’application, les images configurées seront supprimées.';

  @override
  String get customImageRequirementNotMet =>
      'Pour utiliser des images personnalisées, il faut au moins 1 image « Bien » et 3 images « Pas bien » dans les groupes activés.';

  @override
  String get customImageRequirement =>
      'Pour utiliser des images personnalisées, il faut au moins 1 image « Bien » et 3 images « Pas bien » dans les groupes activés.';

  @override
  String get sunnyWeather => 'Bien';

  @override
  String get rainyWeather => 'Pas bien';

  @override
  String get addImages => 'Ajouter des images';

  @override
  String get imageDeleted => 'Image supprimée';

  @override
  String get imageDeleteFailed => 'Échec de la suppression de l’image';

  @override
  String get deleteImageTitle => 'Supprimer l’image';

  @override
  String get deleteImageMessage =>
      'Voulez-vous supprimer cette image ? Cette action est irréversible.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Groupe $groupId – Images « $weather »';
  }

  @override
  String registeredCount(int count) {
    return 'Enregistrées : $count images';
  }

  @override
  String get noImagesRegistered => 'Aucune image enregistrée';

  @override
  String get imagePreview => 'Aperçu de l’image';

  @override
  String get close => 'Fermer';

  @override
  String get contactEmailSubject => 'FocusMint - Contact';

  @override
  String get contactEmailBody => 'Partagez vos commentaires et vos questions.';

  @override
  String get mixWithBuiltInImages => 'Mélanger avec les images intégrées';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Utiliser à la fois vos images et celles de l’application';

  @override
  String get supportIntro =>
      'Échangez anonymement avec le développeur. Questions et suggestions sont les bienvenues. Vous pouvez envoyer 3 messages par jour. Chaque réponse du développeur rétablit votre quota à 3.';

  @override
  String get supportReceived =>
      'Message reçu. Nous répondons généralement sous 2 à 3 jours.';

  @override
  String get supportComposer => 'Écrivez un message';

  @override
  String get supportSend => 'Envoyer';

  @override
  String get supportRetry => 'Réessayer';

  @override
  String get supportSent => 'Envoyé';

  @override
  String get supportUnsent => 'Non envoyé · enregistré sur cet appareil';

  @override
  String get supportAttach => 'Joindre une image';

  @override
  String get supportRemoveImage => 'Retirer l’image';

  @override
  String get supportImage => 'Pièce jointe';

  @override
  String get supportClear => 'Supprimer l’historique';

  @override
  String get supportClearConfirm =>
      'Supprimer cette conversation ? Les brouillons non envoyés et l’historique sur le serveur seront aussi supprimés. Votre quota ne sera pas réinitialisé.';

  @override
  String get supportQuota =>
      'Vous avez utilisé les 3 messages d’aujourd’hui. Envoyez-en un autre demain ou après une réponse du développeur.';

  @override
  String get supportConnectionError =>
      'Connexion impossible. Les brouillons enregistrés n’ont pas été envoyés.';

  @override
  String get supportSendError =>
      'Envoi impossible. Votre message est enregistré sur cet appareil. Réessayez.';

  @override
  String get supportStorageError => 'Enregistrement impossible. Réessayez.';

  @override
  String get supportClearError =>
      'Impossible de supprimer l’historique. Vérifiez votre connexion et réessayez.';

  @override
  String get supportImageError =>
      'Impossible de charger l’image. Choisissez une image de moins de 30 Mo.';

  @override
  String supportRemaining(int count) {
    return 'Messages restants aujourd’hui : $count';
  }

  @override
  String supportUnread(int count) {
    return 'Réponses non lues : $count';
  }

  @override
  String get supportGuide => 'Informations';

  @override
  String get supportDeveloper => 'Développeur';

  @override
  String get supportPrivacy => 'Données de l’assistance';

  @override
  String get breathingTitle => 'Prenez le temps de respirer';

  @override
  String get breathingHint =>
      'Suivez le mouvement doux des poumons\nà un rythme confortable.';

  @override
  String get breathingIn => 'Inspirez doucement';

  @override
  String get breathingOut => 'Expirez doucement';

  @override
  String get breathingProgress => 'Progression de la respiration';

  @override
  String get breathingResultHint =>
      'Vos résultats s’afficheront automatiquement.';

  @override
  String get breathingSkip => 'Passer aux résultats';
}

/// The translations for French, as used in Canada (`fr_CA`).
class AppLocalizationsFrCa extends AppLocalizationsFr {
  AppLocalizationsFrCa() : super('fr_CA');

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Points actuels';

  @override
  String goalLabel(int goal) {
    return 'Objectif : $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Restant : $remaining';
  }

  @override
  String get goalAchieved => '🎉 Objectif atteint!';

  @override
  String get startButtonText => 'DÉMARRER';

  @override
  String get stressReductionMessage => 'Entraînez-vous à remarquer le positif.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Temps restant : $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Temps restant : $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Score : $score points';
  }

  @override
  String get imagePreparationMessage => 'Préparation des images...';

  @override
  String get noStimuliAvailable => 'Aucun stimulus disponible';

  @override
  String get invalidGridSize => 'Taille de grille non valide';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Démarrage...';

  @override
  String get excellentPerformance => 'Performance excellente!';

  @override
  String get greatJob => 'Bravo!';

  @override
  String get goodPerformance => 'Bonne performance';

  @override
  String get keepPracticingFeedback => 'Continuez à vous entraîner';

  @override
  String get takeYourTimeFeedback => 'Prenez votre temps';

  @override
  String get happy => 'Joie';

  @override
  String get angry => 'Colère';

  @override
  String get fear => 'Peur';

  @override
  String get sad => 'Tristesse';

  @override
  String get historyPageTitle => 'Historique d’entraînement';

  @override
  String get dataLoading => 'Chargement des données...';

  @override
  String get pointsHistory => 'Historique des points';

  @override
  String get weekly => 'Semaine';

  @override
  String get monthly => 'Mois';

  @override
  String get noDataAvailable => 'Aucune donnée disponible';

  @override
  String get goalAchievementRate => 'Taux d’atteinte de l’objectif';

  @override
  String get scoreStatistics => 'Statistiques de score';

  @override
  String get bestScore => 'Meilleur score';

  @override
  String get totalScore => 'Score total';

  @override
  String get trainingTime => 'Temps d’entraînement';

  @override
  String get totalTrainingTime => 'Temps d’entraînement total';

  @override
  String get detailedStatistics => 'Statistiques détaillées';

  @override
  String get averageScorePerMinute => 'Score moyen par minute';

  @override
  String get pointsToGoal => 'Points restants avant l’objectif';

  @override
  String get goalSetting => 'Définition de l’objectif';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'points';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dim';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mer';

  @override
  String get thursdayShort => 'Jeu';

  @override
  String get fridayShort => 'Ven';

  @override
  String get saturdayShort => 'Sam';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get goalPointsSetting => 'Objectif de points';

  @override
  String currentGoalPoints(int points) {
    return 'Objectif actuel : $points points';
  }

  @override
  String get newGoalPointsLabel => 'Nouvel objectif de points';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'points';

  @override
  String get saveGoalButton => 'Enregistrer l’objectif';

  @override
  String goalSetTo(int points) {
    return 'Objectif défini à $points points';
  }

  @override
  String get enterGoalPoints => 'Veuillez saisir un objectif de points';

  @override
  String get enterValidNumber =>
      'Veuillez saisir un nombre valide (entre 1 et 99999999)';

  @override
  String get saveFailed => 'Échec de l’enregistrement de certains paramètres';

  @override
  String get emailOpenFailed => 'Impossible d’ouvrir l’application de courriel';

  @override
  String get pageOpenFailed => 'Impossible d’ouvrir la page';

  @override
  String get appInfoSupport => 'Informations et assistance';

  @override
  String get contactUs => 'Nous joindre';

  @override
  String get contactUsSubtitle => 'Partagez vos commentaires et vos questions';

  @override
  String get termsOfService => 'Conditions d’utilisation';

  @override
  String get termsSubtitle =>
      'Consultez les conditions d’utilisation de l’application';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get privacySubtitle =>
      'À propos du traitement des données personnelles';

  @override
  String get tutorialTitle => 'Tutoriel';

  @override
  String get tutorialSubtitle => 'Apprenez à utiliser l’application';

  @override
  String get dataManagement => 'Gestion des données';

  @override
  String get deleteHistory => 'Supprimer l’historique';

  @override
  String get deleteHistorySubtitle =>
      'Supprime uniquement l’historique d’entraînement (l’objectif de points est conservé)';

  @override
  String get deleteHistoryAndGoal => 'Supprimer l’historique et l’objectif';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Supprime tout l’historique et l’objectif de points';

  @override
  String get deleteHistoryConfirmTitle => 'Supprimer l’historique';

  @override
  String get deleteHistoryConfirmMessage =>
      'Voulez-vous vraiment supprimer tout l’historique d’entraînement?\n\n*L’objectif de points sera conservé';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Supprimer l’historique et l’objectif';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Voulez-vous vraiment supprimer tout l’historique et l’objectif de points?\n\n*Cette action est irréversible';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get historyDeleted => 'Historique supprimé';

  @override
  String get historyAndGoalDeleted => 'Historique et objectif supprimés';

  @override
  String get historyDeleteFailed => 'Échec de la suppression de l’historique';

  @override
  String get historyAndGoalDeleteFailed =>
      'Échec de la suppression de l’historique et de l’objectif';

  @override
  String get tutorialDisplayFailed => 'Échec de l’affichage du tutoriel';

  @override
  String get tips => 'Astuces';

  @override
  String get tipsContent =>
      '• Votre objectif apparaît dans le graphique de l’accueil\n• Commencez modestement et augmentez votre objectif à votre rythme\n• Chaque bonne réponse rapporte jusqu’à 6 points';

  @override
  String get backToHome => 'Retour à l’accueil';

  @override
  String get tutorialSkip => 'Passer';

  @override
  String get tutorialGoalAndPoints => 'Objectif et points actuels';

  @override
  String get tutorialGoalDescription =>
      'Le cercle extérieur représente votre objectif, le cercle intérieur vos points cumulés. Le cercle se remplit à mesure que vous approchez de votre objectif.';

  @override
  String get tutorialOneMinuteTraining => 'Entraînement d’une minute';

  @override
  String get tutorialTrainingDescription =>
      'Lancez une partie d’une minute. Choisissez des images positives ou de bonnes habitudes parmi 4 options.';

  @override
  String get tutorialScoreProgress => 'Évolution du score';

  @override
  String get tutorialScoreDescription =>
      'Consultez le détail des scores que vous avez obtenus.';

  @override
  String get tutorialSettingsAndData => 'Paramètres et gestion des données';

  @override
  String get tutorialSettingsDescription =>
      'Modifiez votre objectif, consultez les informations de l’application et réinitialisez les données.';

  @override
  String get appIntroAttentionBiasTitle => 'À propos du biais attentionnel';

  @override
  String get appIntroAttentionBiasContent =>
      'Lorsque l’anxiété est forte, nous avons inconsciemment tendance à ne remarquer que les choses négatives.';

  @override
  String get appIntroFocusMintRoleTitle => 'Le rôle de FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Un jeu court pour vous exercer à orienter votre attention vers des images positives.';

  @override
  String get appIntroScientificEvidenceTitle => 'À propos de cet exercice';

  @override
  String get appIntroScientificEvidenceContent =>
      'Exercez-vous à trouver des images positives. FocusMint est un outil de bien-être personnel, pas un traitement médical. Les effets varient selon les personnes.';

  @override
  String get appIntroExpectedEffectsTitle => 'Ce que vous pouvez pratiquer';

  @override
  String get appIntroEffect1 => 'Chercher des images positives';

  @override
  String get appIntroEffect2 => 'Remarquer les sourires autour de vous';

  @override
  String get appIntroEffect3 => 'Créer une courte routine quotidienne';

  @override
  String get appIntroHowToUse => 'Voir le mode d’emploi';

  @override
  String get pointsEarned => 'Points gagnés!';

  @override
  String get yourScore => 'Votre score';

  @override
  String get totalPlayTime => 'Temps de jeu total';

  @override
  String get imageManagement => 'Gestion des images';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Images masquées : $count/$max';
  }

  @override
  String get unsavedChanges => 'Modifications non enregistrées';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Vous avez $count modifications non enregistrées des paramètres d’affichage des images.';
  }

  @override
  String get unsavedChangesWarning =>
      'Les modifications seront perdues si vous fermez cet écran maintenant.';

  @override
  String get discardChanges => 'Abandonner les modifications';

  @override
  String get saveAndExit => 'Enregistrer et quitter';

  @override
  String settingsSaved(Object count) {
    return '$count paramètres enregistrés';
  }

  @override
  String get saveError =>
      'Une erreur est survenue lors de l’enregistrement des paramètres';

  @override
  String get imageSettingsUpdated =>
      'Les paramètres d’image ont été mis à jour';

  @override
  String get allImages => 'Toutes';

  @override
  String get positiveImages => 'Positives';

  @override
  String get negativeImages => 'Négatives';

  @override
  String get smileImages => 'Sourires';

  @override
  String get vegetableImages => 'Aliments nourrissants';

  @override
  String get healthImages => 'Mouvement et échanges';

  @override
  String get sadImages => 'Colère, tristesse et inquiétude';

  @override
  String get badFoodImages => 'Restauration rapide et sucreries';

  @override
  String get badImages => 'Habitudes éprouvantes';

  @override
  String get imageManagementHint =>
      'Touchez une image pour l’afficher ou la masquer. Vous pouvez masquer jusqu’à 15 images.';

  @override
  String get unsaved => 'Non enregistré';

  @override
  String get save => 'Enregistrer';

  @override
  String get hiddenImages => 'Masquées';

  @override
  String get noHiddenImages => 'Aucune image masquée';

  @override
  String get settingsLoadFailed => 'Échec du chargement des paramètres';

  @override
  String imagesAdded(int count) {
    return '$count images ajoutées';
  }

  @override
  String get imageAddFailed => 'Échec de l’ajout des images';

  @override
  String get imageSelectionFailed => 'Échec de la sélection des images';

  @override
  String get settingsChangeFailed => 'Échec de la modification des paramètres';

  @override
  String groupTitle(String name) {
    return 'Groupe : $name';
  }

  @override
  String get displayToggle => 'Afficher/Masquer';

  @override
  String imageCount(int count) {
    return '$count images';
  }

  @override
  String get noticeTitle => 'Remarques importantes';

  @override
  String get notice1 =>
      'La fonctionnalité d’images personnalisées a été ajoutée!';

  @override
  String get notice2 =>
      'Vous pouvez ajouter vos propres images depuis l’écran des paramètres';

  @override
  String get notice3 => 'Consultez l’écran des paramètres pour plus de détails';

  @override
  String get customImageTitle => 'Images personnalisées';

  @override
  String get customImageSubtitle => 'Ajoutez et gérez vos propres images';

  @override
  String get addCustomImages => 'Ajouter des images personnalisées';

  @override
  String get selectImages => 'Sélectionner des images';

  @override
  String get unknownImage => 'Image inconnue';

  @override
  String get customImageSettings => 'Paramètres des images personnalisées';

  @override
  String get useCustomImages => 'Utiliser des images personnalisées';

  @override
  String get useCustomImagesDescription =>
      'Utilisez vos propres images pour vous entraîner. Activez le mélange ci-dessous pour inclure les images intégrées.';

  @override
  String get groupSettings => 'Paramètres des groupes';

  @override
  String get minOneGroupRequired => 'Au moins un groupe doit être activé';

  @override
  String get settingsLoadFailedMessage => 'Échec du chargement des paramètres';

  @override
  String get customImageNotice1 =>
      'Lorsque des groupes sont activés, les images s’affichent de manière aléatoire pour chaque groupe.';

  @override
  String get customImageNotice2 =>
      'Les images ajoutées et configurées par l’utilisateur ne sont partagées ni avec les développeurs ni avec des tiers ; elles sont stockées uniquement dans l’espace de l’application sur l’appareil.';

  @override
  String get customImageNotice3 => 'Cela permet une utilisation hors ligne.';

  @override
  String get customImageNotice4 =>
      'Ajouter de nombreuses images utilise de l’espace de stockage. En cas de problème, désactivez les images personnelles ou supprimez les images inutilisées dans les réglages.';

  @override
  String get customImageNotice5 =>
      'Si vous supprimez l’application, les images configurées seront supprimées.';

  @override
  String get customImageRequirementNotMet =>
      'Pour utiliser des images personnalisées, il faut au moins 1 image « Bien » et 3 images « Pas bien » dans les groupes activés.';

  @override
  String get customImageRequirement =>
      'Pour utiliser des images personnalisées, il faut au moins 1 image « Bien » et 3 images « Pas bien » dans les groupes activés.';

  @override
  String get sunnyWeather => 'Bien';

  @override
  String get rainyWeather => 'Pas bien';

  @override
  String get addImages => 'Ajouter des images';

  @override
  String get imageDeleted => 'Image supprimée';

  @override
  String get imageDeleteFailed => 'Échec de la suppression de l’image';

  @override
  String get deleteImageTitle => 'Supprimer l’image';

  @override
  String get deleteImageMessage =>
      'Voulez-vous supprimer cette image? Cette action est irréversible.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Groupe $groupId – Images « $weather »';
  }

  @override
  String registeredCount(int count) {
    return 'Enregistrées : $count images';
  }

  @override
  String get noImagesRegistered => 'Aucune image enregistrée';

  @override
  String get imagePreview => 'Aperçu de l’image';

  @override
  String get close => 'Fermer';

  @override
  String get contactEmailSubject => 'FocusMint - Nous joindre';

  @override
  String get contactEmailBody => 'Partagez vos commentaires et vos questions.';

  @override
  String get mixWithBuiltInImages => 'Mélanger avec les images intégrées';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Utiliser à la fois vos images et celles de l’application';

  @override
  String get supportIntro =>
      'Échangez anonymement avec le développeur. Questions et suggestions sont les bienvenues. Vous pouvez envoyer 3 messages par jour. Chaque réponse du développeur rétablit votre quota à 3.';

  @override
  String get supportReceived =>
      'Message reçu. Nous répondons généralement sous 2 à 3 jours.';

  @override
  String get supportComposer => 'Écrivez un message';

  @override
  String get supportSend => 'Envoyer';

  @override
  String get supportRetry => 'Réessayer';

  @override
  String get supportSent => 'Envoyé';

  @override
  String get supportUnsent => 'Non envoyé · enregistré sur cet appareil';

  @override
  String get supportAttach => 'Joindre une image';

  @override
  String get supportRemoveImage => 'Retirer l’image';

  @override
  String get supportImage => 'Pièce jointe';

  @override
  String get supportClear => 'Supprimer l’historique';

  @override
  String get supportClearConfirm =>
      'Supprimer cette conversation ? Les brouillons non envoyés et l’historique sur le serveur seront aussi supprimés. Votre quota ne sera pas réinitialisé.';

  @override
  String get supportQuota =>
      'Vous avez utilisé les 3 messages d’aujourd’hui. Envoyez-en un autre demain ou après une réponse du développeur.';

  @override
  String get supportConnectionError =>
      'Connexion impossible. Les brouillons enregistrés n’ont pas été envoyés.';

  @override
  String get supportSendError =>
      'Envoi impossible. Votre message est enregistré sur cet appareil. Réessayez.';

  @override
  String get supportStorageError => 'Enregistrement impossible. Réessayez.';

  @override
  String get supportClearError =>
      'Impossible de supprimer l’historique. Vérifiez votre connexion et réessayez.';

  @override
  String get supportImageError =>
      'Impossible de charger l’image. Choisissez une image de moins de 30 Mo.';

  @override
  String supportRemaining(int count) {
    return 'Messages restants aujourd’hui : $count';
  }

  @override
  String supportUnread(int count) {
    return 'Réponses non lues : $count';
  }

  @override
  String get supportGuide => 'Informations';

  @override
  String get supportDeveloper => 'Développeur';

  @override
  String get supportPrivacy => 'Données de l’assistance';

  @override
  String get breathingTitle => 'Prenez le temps de respirer';

  @override
  String get breathingHint =>
      'Suivez le mouvement doux des poumons\nà un rythme confortable.';

  @override
  String get breathingIn => 'Inspirez doucement';

  @override
  String get breathingOut => 'Expirez doucement';

  @override
  String get breathingProgress => 'Progression de la respiration';

  @override
  String get breathingResultHint =>
      'Vos résultats s’afficheront automatiquement.';

  @override
  String get breathingSkip => 'Passer aux résultats';
}
