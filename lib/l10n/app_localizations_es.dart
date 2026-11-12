// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Puntos actuales';

  @override
  String goalLabel(int goal) {
    return 'Objetivo: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Restantes: $remaining';
  }

  @override
  String get goalAchieved => '🎉 ¡Objetivo conseguido!';

  @override
  String get startButtonText => 'EMPEZAR';

  @override
  String get stressReductionMessage =>
      'Practica prestar atención a lo positivo.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Tiempo restante: ${minutes}m ${seconds}s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Tiempo restante: ${seconds}s';
  }

  @override
  String scoreLabel(String score) {
    return 'Puntuación: $score puntos';
  }

  @override
  String get imagePreparationMessage => 'Preparando imágenes...';

  @override
  String get noStimuliAvailable => 'No hay estímulos disponibles';

  @override
  String get invalidGridSize => 'Tamaño de cuadrícula no válido';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Empezando...';

  @override
  String get excellentPerformance => '¡Rendimiento excelente!';

  @override
  String get greatJob => '¡Muy bien hecho!';

  @override
  String get goodPerformance => 'Buen rendimiento';

  @override
  String get keepPracticingFeedback => 'Sigue practicando';

  @override
  String get takeYourTimeFeedback => 'Tómate tu tiempo';

  @override
  String get happy => 'Feliz';

  @override
  String get angry => 'Enfadado';

  @override
  String get fear => 'Miedo';

  @override
  String get sad => 'Triste';

  @override
  String get historyPageTitle => 'Historial de entrenamiento';

  @override
  String get dataLoading => 'Cargando datos...';

  @override
  String get pointsHistory => 'Historial de puntos';

  @override
  String get weekly => 'Semanal';

  @override
  String get monthly => 'Mensual';

  @override
  String get noDataAvailable => 'No hay datos disponibles';

  @override
  String get goalAchievementRate => 'Tasa de consecución del objetivo';

  @override
  String get scoreStatistics => 'Estadísticas de puntuación';

  @override
  String get bestScore => 'Mejor puntuación';

  @override
  String get totalScore => 'Puntuación total';

  @override
  String get trainingTime => 'Tiempo de entrenamiento';

  @override
  String get totalTrainingTime => 'Tiempo total de entrenamiento';

  @override
  String get detailedStatistics => 'Estadísticas detalladas';

  @override
  String get averageScorePerMinute => 'Puntuación media por minuto';

  @override
  String get pointsToGoal => 'Puntos hasta el objetivo';

  @override
  String get goalSetting => 'Ajuste del objetivo';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'puntos';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dom';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mié';

  @override
  String get thursdayShort => 'Jue';

  @override
  String get fridayShort => 'Vie';

  @override
  String get saturdayShort => 'Sáb';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get goalPointsSetting => 'Ajuste de puntos objetivo';

  @override
  String currentGoalPoints(int points) {
    return 'Objetivo actual: $points puntos';
  }

  @override
  String get newGoalPointsLabel => 'Nuevos puntos objetivo';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'puntos';

  @override
  String get saveGoalButton => 'Guardar objetivo';

  @override
  String goalSetTo(int points) {
    return 'Objetivo establecido en $points puntos';
  }

  @override
  String get enterGoalPoints => 'Introduce los puntos objetivo';

  @override
  String get enterValidNumber => 'Introduce un número válido (de 1 a 99999999)';

  @override
  String get saveFailed => 'No se han podido guardar algunos ajustes';

  @override
  String get emailOpenFailed => 'No se ha podido abrir la aplicación de correo';

  @override
  String get pageOpenFailed => 'No se ha podido abrir la página';

  @override
  String get appInfoSupport => 'Información de la aplicación y asistencia';

  @override
  String get contactUs => 'Contacto';

  @override
  String get contactUsSubtitle => 'Cuéntanos tus comentarios y preguntas';

  @override
  String get termsOfService => 'Condiciones del servicio';

  @override
  String get termsSubtitle =>
      'Consulta las condiciones del servicio de la aplicación';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get privacySubtitle =>
      'Sobre el tratamiento de la información personal';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Aprende a usar la aplicación';

  @override
  String get dataManagement => 'Gestión de datos';

  @override
  String get deleteHistory => 'Eliminar historial';

  @override
  String get deleteHistorySubtitle =>
      'Elimina solo el historial de entrenamiento (los puntos objetivo se conservan)';

  @override
  String get deleteHistoryAndGoal => 'Eliminar historial y objetivo';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Elimina todo el historial y los puntos objetivo';

  @override
  String get deleteHistoryConfirmTitle => 'Eliminar historial';

  @override
  String get deleteHistoryConfirmMessage =>
      '¿Seguro que quieres eliminar todo el historial de entrenamiento?\n\n*Los puntos objetivo se conservarán';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Eliminar historial y objetivo';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      '¿Seguro que quieres eliminar todo el historial y los puntos objetivo?\n\n*Esta acción no se puede deshacer';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get historyDeleted => 'Historial eliminado';

  @override
  String get historyAndGoalDeleted => 'Historial y objetivo eliminados';

  @override
  String get historyDeleteFailed => 'No se ha podido eliminar el historial';

  @override
  String get historyAndGoalDeleteFailed =>
      'No se han podido eliminar el historial y el objetivo';

  @override
  String get tutorialDisplayFailed => 'No se ha podido mostrar el tutorial';

  @override
  String get tips => 'Consejos';

  @override
  String get tipsContent =>
      '• Tu objetivo aparece en el gráfico de inicio\n• Empieza con un objetivo pequeño y auméntalo a tu ritmo\n• Cada elección correcta suma hasta 6 puntos';

  @override
  String get backToHome => 'Volver al inicio';

  @override
  String get tutorialSkip => 'Omitir';

  @override
  String get tutorialGoalAndPoints => 'Objetivo y puntos actuales';

  @override
  String get tutorialGoalDescription =>
      'El círculo exterior muestra tu objetivo y el interior, los puntos totales. El círculo se llena a medida que te acercas a tu objetivo.';

  @override
  String get tutorialOneMinuteTraining => 'Entrenamiento de 1 minuto';

  @override
  String get tutorialTrainingDescription =>
      'Inicia un juego de 1 minuto. Elige imágenes positivas o buenos hábitos entre 4 opciones.';

  @override
  String get tutorialScoreProgress => 'Evolución de la puntuación';

  @override
  String get tutorialScoreDescription =>
      'Consulta información detallada sobre las puntuaciones obtenidas.';

  @override
  String get tutorialSettingsAndData => 'Ajustes y gestión de datos';

  @override
  String get tutorialSettingsDescription =>
      'Cambia el objetivo, consulta la información de la aplicación y restablece los datos.';

  @override
  String get appIntroAttentionBiasTitle => 'Sobre el sesgo atencional';

  @override
  String get appIntroAttentionBiasContent =>
      'Cuando la ansiedad es alta, tendemos inconscientemente a fijarnos solo en lo negativo.';

  @override
  String get appIntroFocusMintRoleTitle => 'El papel de FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Un juego breve para practicar cómo dirigir tu atención hacia imágenes positivas.';

  @override
  String get appIntroScientificEvidenceTitle => 'Acerca de este ejercicio';

  @override
  String get appIntroScientificEvidenceContent =>
      'Practica encontrar imágenes positivas. FocusMint es una herramienta de autocuidado, no un tratamiento médico. Los resultados varían de una persona a otra.';

  @override
  String get appIntroExpectedEffectsTitle => 'Qué puedes practicar';

  @override
  String get appIntroEffect1 => 'Buscar imágenes positivas';

  @override
  String get appIntroEffect2 => 'Notar las sonrisas a tu alrededor';

  @override
  String get appIntroEffect3 => 'Crear una breve rutina diaria';

  @override
  String get appIntroHowToUse => 'Ver cómo se usa';

  @override
  String get pointsEarned => '¡Puntos ganados!';

  @override
  String get yourScore => 'Tu puntuación';

  @override
  String get totalPlayTime => 'Tiempo total de juego';

  @override
  String get imageManagement => 'Gestión de imágenes';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Imágenes ocultas: $count/$max';
  }

  @override
  String get unsavedChanges => 'Tienes cambios sin guardar';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Tienes $count cambios sin guardar en los ajustes de visualización de imágenes.';
  }

  @override
  String get unsavedChangesWarning =>
      'Si cierras esta pantalla ahora, los cambios se perderán.';

  @override
  String get discardChanges => 'Descartar cambios';

  @override
  String get saveAndExit => 'Guardar y salir';

  @override
  String settingsSaved(Object count) {
    return 'Se han guardado $count ajustes';
  }

  @override
  String get saveError => 'Se ha producido un error al guardar los ajustes';

  @override
  String get imageSettingsUpdated =>
      'Los ajustes de imágenes se han actualizado';

  @override
  String get allImages => 'Todas';

  @override
  String get positiveImages => 'Positivas';

  @override
  String get negativeImages => 'Negativas';

  @override
  String get smileImages => 'Sonrisas';

  @override
  String get vegetableImages => 'Alimentos nutritivos';

  @override
  String get healthImages => 'Movimiento y relaciones';

  @override
  String get sadImages => 'Ira, tristeza y preocupación';

  @override
  String get badFoodImages => 'Comida rápida y dulces';

  @override
  String get badImages => 'Hábitos perjudiciales';

  @override
  String get imageManagementHint =>
      'Toca para mostrar u ocultar una imagen. Puedes ocultar hasta 15 imágenes.';

  @override
  String get unsaved => 'Sin guardar';

  @override
  String get save => 'Guardar';

  @override
  String get hiddenImages => 'Ocultas';

  @override
  String get noHiddenImages => 'No hay imágenes ocultas';

  @override
  String get settingsLoadFailed => 'No se han podido cargar los ajustes';

  @override
  String imagesAdded(int count) {
    return 'Se han añadido $count imágenes';
  }

  @override
  String get imageAddFailed => 'No se han podido añadir las imágenes';

  @override
  String get imageSelectionFailed =>
      'No se han podido seleccionar las imágenes';

  @override
  String get settingsChangeFailed => 'No se han podido cambiar los ajustes';

  @override
  String groupTitle(String name) {
    return 'Grupo: $name';
  }

  @override
  String get displayToggle => 'Mostrar/ocultar';

  @override
  String imageCount(int count) {
    return '$count imágenes';
  }

  @override
  String get noticeTitle => 'Notas importantes';

  @override
  String get notice1 => '¡Se ha añadido la función de imágenes personalizadas!';

  @override
  String get notice2 =>
      'Puedes añadir tus propias imágenes desde la pantalla de ajustes';

  @override
  String get notice3 => 'Consulta la pantalla de ajustes para más detalles';

  @override
  String get customImageTitle => 'Imágenes personalizadas';

  @override
  String get customImageSubtitle => 'Añade y gestiona tus propias imágenes';

  @override
  String get addCustomImages => 'Añadir imágenes personalizadas';

  @override
  String get selectImages => 'Seleccionar imágenes';

  @override
  String get unknownImage => 'Imagen desconocida';

  @override
  String get customImageSettings => 'Ajustes de imágenes personalizadas';

  @override
  String get useCustomImages => 'Usar imágenes personalizadas';

  @override
  String get useCustomImagesDescription =>
      'Usa tus propias imágenes para practicar. Activa la mezcla de abajo para incluir las imágenes de la aplicación.';

  @override
  String get groupSettings => 'Ajustes de grupos';

  @override
  String get minOneGroupRequired => 'Al menos un grupo debe estar activado';

  @override
  String get settingsLoadFailedMessage => 'No se han podido cargar los ajustes';

  @override
  String get customImageNotice1 =>
      'Cuando los grupos están activados, las imágenes se muestran aleatoriamente para cada grupo.';

  @override
  String get customImageNotice2 =>
      'Las imágenes que subes y configuras no se comparten con los desarrolladores ni con terceros, y se guardan solo en el área de la aplicación en el dispositivo.';

  @override
  String get customImageNotice3 => 'Esto permite su uso sin conexión.';

  @override
  String get customImageNotice4 =>
      'Añadir muchas imágenes ocupa espacio de almacenamiento. Si tienes problemas, desactiva las imágenes propias o elimina las que no uses en Ajustes.';

  @override
  String get customImageNotice5 =>
      'Al eliminar la aplicación, las imágenes configuradas se eliminarán.';

  @override
  String get customImageRequirementNotMet =>
      'Para usar imágenes personalizadas, necesitas al menos 1 imagen buena y 3 imágenes no buenas en los grupos activados.';

  @override
  String get customImageRequirement =>
      'Para usar imágenes personalizadas, necesitas al menos 1 imagen buena y 3 imágenes no buenas en los grupos activados.';

  @override
  String get sunnyWeather => 'Buenas';

  @override
  String get rainyWeather => 'No buenas';

  @override
  String get addImages => 'Añadir imágenes';

  @override
  String get imageDeleted => 'Imagen eliminada';

  @override
  String get imageDeleteFailed => 'No se ha podido eliminar la imagen';

  @override
  String get deleteImageTitle => 'Eliminar imagen';

  @override
  String get deleteImageMessage =>
      '¿Quieres eliminar esta imagen? Esta acción no se puede deshacer.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Imágenes $weather del grupo $groupId';
  }

  @override
  String registeredCount(int count) {
    return 'Registradas: $count imágenes';
  }

  @override
  String get noImagesRegistered => 'No hay imágenes registradas';

  @override
  String get imagePreview => 'Vista previa de la imagen';

  @override
  String get close => 'Cerrar';

  @override
  String get contactEmailSubject => 'FocusMint - Contacto';

  @override
  String get contactEmailBody => 'Escríbenos tus comentarios y preguntas.';

  @override
  String get mixWithBuiltInImages => 'Mezclar con imágenes de la aplicación';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Usar tus imágenes junto con las de la aplicación';

  @override
  String get supportIntro =>
      'Habla de forma anónima con el desarrollador. Puedes enviar preguntas y sugerencias. Tienes 3 mensajes al día. Cada respuesta del desarrollador restablece tu cupo a 3.';

  @override
  String get supportReceived =>
      'Mensaje recibido. Solemos responder en 2–3 días.';

  @override
  String get supportComposer => 'Escribe un mensaje';

  @override
  String get supportSend => 'Enviar';

  @override
  String get supportRetry => 'Reintentar';

  @override
  String get supportSent => 'Enviado';

  @override
  String get supportUnsent => 'Sin enviar · guardado en este dispositivo';

  @override
  String get supportAttach => 'Adjuntar imagen';

  @override
  String get supportRemoveImage => 'Quitar imagen';

  @override
  String get supportImage => 'Archivo adjunto';

  @override
  String get supportClear => 'Eliminar historial';

  @override
  String get supportClearConfirm =>
      '¿Eliminar esta conversación? También se eliminarán los borradores sin enviar y el historial del servidor. Esto no restablece tu cupo.';

  @override
  String get supportQuota =>
      'Ya has usado los 3 mensajes de hoy. Envía otro mañana o después de una respuesta del desarrollador.';

  @override
  String get supportConnectionError =>
      'No se pudo conectar. Los borradores guardados no se han enviado.';

  @override
  String get supportSendError =>
      'No se pudo enviar. Tu mensaje está guardado en este dispositivo. Vuelve a intentarlo.';

  @override
  String get supportStorageError => 'No se pudo guardar. Vuelve a intentarlo.';

  @override
  String get supportClearError =>
      'No se pudo eliminar el historial. Comprueba tu conexión y vuelve a intentarlo.';

  @override
  String get supportImageError =>
      'No se pudo cargar la imagen. Elige una imagen de menos de 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Mensajes disponibles hoy: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Respuestas sin leer: $count';
  }

  @override
  String get supportGuide => 'Información';

  @override
  String get supportDeveloper => 'Desarrollador';

  @override
  String get supportPrivacy => 'Datos de las consultas';

  @override
  String get breathingTitle => 'Tómate un respiro';

  @override
  String get breathingHint =>
      'Sigue el suave movimiento de los pulmones\na un ritmo cómodo.';

  @override
  String get breathingIn => 'Inspira despacio';

  @override
  String get breathingOut => 'Espira despacio';

  @override
  String get breathingProgress => 'Progreso de la respiración';

  @override
  String get breathingResultHint =>
      'Tus resultados aparecerán automáticamente.';

  @override
  String get breathingSkip => 'Ir a los resultados';
}

/// The translations for Spanish Castilian, as used in Mexico (`es_MX`).
class AppLocalizationsEsMx extends AppLocalizationsEs {
  AppLocalizationsEsMx() : super('es_MX');

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Puntos actuales';

  @override
  String goalLabel(int goal) {
    return 'Objetivo: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Restantes: $remaining';
  }

  @override
  String get goalAchieved => '🎉 ¡Objetivo logrado!';

  @override
  String get startButtonText => 'INICIAR';

  @override
  String get stressReductionMessage =>
      'Practica prestar atención a lo positivo.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Tiempo restante: ${minutes}m ${seconds}s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Tiempo restante: ${seconds}s';
  }

  @override
  String scoreLabel(String score) {
    return 'Puntaje: $score puntos';
  }

  @override
  String get imagePreparationMessage => 'Preparando imágenes...';

  @override
  String get noStimuliAvailable => 'No hay estímulos disponibles';

  @override
  String get invalidGridSize => 'Tamaño de cuadrícula no válido';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Comenzando...';

  @override
  String get excellentPerformance => '¡Rendimiento excelente!';

  @override
  String get greatJob => '¡Muy bien hecho!';

  @override
  String get goodPerformance => 'Buen rendimiento';

  @override
  String get keepPracticingFeedback => 'Sigue practicando';

  @override
  String get takeYourTimeFeedback => 'Tómate tu tiempo';

  @override
  String get happy => 'Feliz';

  @override
  String get angry => 'Enojado';

  @override
  String get fear => 'Miedo';

  @override
  String get sad => 'Triste';

  @override
  String get historyPageTitle => 'Historial de entrenamiento';

  @override
  String get dataLoading => 'Cargando datos...';

  @override
  String get pointsHistory => 'Historial de puntos';

  @override
  String get weekly => 'Semanal';

  @override
  String get monthly => 'Mensual';

  @override
  String get noDataAvailable => 'No hay datos disponibles';

  @override
  String get goalAchievementRate => 'Tasa de logro del objetivo';

  @override
  String get scoreStatistics => 'Estadísticas de puntaje';

  @override
  String get bestScore => 'Mejor puntaje';

  @override
  String get totalScore => 'Puntaje total';

  @override
  String get trainingTime => 'Tiempo de entrenamiento';

  @override
  String get totalTrainingTime => 'Tiempo total de entrenamiento';

  @override
  String get detailedStatistics => 'Estadísticas detalladas';

  @override
  String get averageScorePerMinute => 'Puntaje promedio por minuto';

  @override
  String get pointsToGoal => 'Puntos para el objetivo';

  @override
  String get goalSetting => 'Configuración del objetivo';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'puntos';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dom';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mié';

  @override
  String get thursdayShort => 'Jue';

  @override
  String get fridayShort => 'Vie';

  @override
  String get saturdayShort => 'Sáb';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get goalPointsSetting => 'Configuración de puntos objetivo';

  @override
  String currentGoalPoints(int points) {
    return 'Objetivo actual: $points puntos';
  }

  @override
  String get newGoalPointsLabel => 'Nuevos puntos objetivo';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'puntos';

  @override
  String get saveGoalButton => 'Guardar objetivo';

  @override
  String goalSetTo(int points) {
    return 'Objetivo establecido en $points puntos';
  }

  @override
  String get enterGoalPoints => 'Ingresa los puntos objetivo';

  @override
  String get enterValidNumber => 'Ingresa un número válido (de 1 a 99999999)';

  @override
  String get saveFailed => 'No se pudieron guardar algunas configuraciones';

  @override
  String get emailOpenFailed => 'No se pudo abrir la app de correo';

  @override
  String get pageOpenFailed => 'No se pudo abrir la página';

  @override
  String get appInfoSupport => 'Información de la app y soporte';

  @override
  String get contactUs => 'Contáctanos';

  @override
  String get contactUsSubtitle => 'Envíanos tus comentarios y preguntas';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get termsSubtitle => 'Consulta los términos de servicio de la app';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get privacySubtitle => 'Acerca del manejo de la información personal';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Aprende a usar la app';

  @override
  String get dataManagement => 'Administración de datos';

  @override
  String get deleteHistory => 'Borrar historial';

  @override
  String get deleteHistorySubtitle =>
      'Borra solo el historial de entrenamiento (los puntos objetivo se conservan)';

  @override
  String get deleteHistoryAndGoal => 'Borrar historial y objetivo';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Borra todo el historial y los puntos objetivo';

  @override
  String get deleteHistoryConfirmTitle => 'Borrar historial';

  @override
  String get deleteHistoryConfirmMessage =>
      '¿Seguro que quieres borrar todo el historial de entrenamiento?\n\n*Los puntos objetivo se conservarán';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Borrar historial y objetivo';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      '¿Seguro que quieres borrar todo el historial y los puntos objetivo?\n\n*Esta acción no se puede deshacer';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Borrar';

  @override
  String get historyDeleted => 'Historial borrado';

  @override
  String get historyAndGoalDeleted => 'Historial y objetivo borrados';

  @override
  String get historyDeleteFailed => 'No se pudo borrar el historial';

  @override
  String get historyAndGoalDeleteFailed =>
      'No se pudieron borrar el historial y el objetivo';

  @override
  String get tutorialDisplayFailed => 'No se pudo mostrar el tutorial';

  @override
  String get tips => 'Consejos';

  @override
  String get tipsContent =>
      '• Tu objetivo aparece en el gráfico de inicio\n• Empieza con un objetivo pequeño y auméntalo a tu ritmo\n• Cada elección correcta suma hasta 6 puntos';

  @override
  String get backToHome => 'Volver al inicio';

  @override
  String get tutorialSkip => 'Omitir';

  @override
  String get tutorialGoalAndPoints => 'Objetivo y puntos actuales';

  @override
  String get tutorialGoalDescription =>
      'El círculo exterior muestra tu objetivo y el interior, los puntos totales. El círculo se llena a medida que te acercas a tu objetivo.';

  @override
  String get tutorialOneMinuteTraining => 'Entrenamiento de 1 minuto';

  @override
  String get tutorialTrainingDescription =>
      'Inicia un juego de 1 minuto. Elige imágenes positivas o buenos hábitos entre 4 opciones.';

  @override
  String get tutorialScoreProgress => 'Progreso del puntaje';

  @override
  String get tutorialScoreDescription =>
      'Consulta información detallada sobre los puntajes obtenidos.';

  @override
  String get tutorialSettingsAndData =>
      'Configuración y administración de datos';

  @override
  String get tutorialSettingsDescription =>
      'Cambia el objetivo, consulta la información de la app y restablece los datos.';

  @override
  String get appIntroAttentionBiasTitle => 'Acerca del sesgo atencional';

  @override
  String get appIntroAttentionBiasContent =>
      'Cuando la ansiedad es alta, tendemos inconscientemente a fijarnos solo en lo negativo.';

  @override
  String get appIntroFocusMintRoleTitle => 'El papel de FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Un juego breve para practicar cómo dirigir tu atención hacia imágenes positivas.';

  @override
  String get appIntroScientificEvidenceTitle => 'Acerca de este ejercicio';

  @override
  String get appIntroScientificEvidenceContent =>
      'Practica encontrar imágenes positivas. FocusMint es una herramienta de autocuidado, no un tratamiento médico. Los resultados varían de una persona a otra.';

  @override
  String get appIntroExpectedEffectsTitle => 'Qué puedes practicar';

  @override
  String get appIntroEffect1 => 'Buscar imágenes positivas';

  @override
  String get appIntroEffect2 => 'Notar las sonrisas a tu alrededor';

  @override
  String get appIntroEffect3 => 'Crear una breve rutina diaria';

  @override
  String get appIntroHowToUse => 'Ver cómo se usa';

  @override
  String get pointsEarned => '¡Puntos ganados!';

  @override
  String get yourScore => 'Tu puntaje';

  @override
  String get totalPlayTime => 'Tiempo total de juego';

  @override
  String get imageManagement => 'Administración de imágenes';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Imágenes ocultas: $count/$max';
  }

  @override
  String get unsavedChanges => 'Tienes cambios sin guardar';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Tienes $count cambios sin guardar en la configuración de visualización de imágenes.';
  }

  @override
  String get unsavedChangesWarning =>
      'Si cierras esta pantalla ahora, los cambios se perderán.';

  @override
  String get discardChanges => 'Descartar cambios';

  @override
  String get saveAndExit => 'Guardar y salir';

  @override
  String settingsSaved(Object count) {
    return 'Se guardaron $count configuraciones';
  }

  @override
  String get saveError => 'Ocurrió un error al guardar la configuración';

  @override
  String get imageSettingsUpdated =>
      'La configuración de imágenes se actualizó';

  @override
  String get allImages => 'Todas';

  @override
  String get positiveImages => 'Positivas';

  @override
  String get negativeImages => 'Negativas';

  @override
  String get smileImages => 'Sonrisas';

  @override
  String get vegetableImages => 'Alimentos nutritivos';

  @override
  String get healthImages => 'Movimiento y relaciones';

  @override
  String get sadImages => 'Ira, tristeza y preocupación';

  @override
  String get badFoodImages => 'Comida rápida y dulces';

  @override
  String get badImages => 'Hábitos perjudiciales';

  @override
  String get imageManagementHint =>
      'Toca para mostrar u ocultar una imagen. Puedes ocultar hasta 15 imágenes.';

  @override
  String get unsaved => 'Sin guardar';

  @override
  String get save => 'Guardar';

  @override
  String get hiddenImages => 'Ocultas';

  @override
  String get noHiddenImages => 'No hay imágenes ocultas';

  @override
  String get settingsLoadFailed => 'No se pudo cargar la configuración';

  @override
  String imagesAdded(int count) {
    return 'Se agregaron $count imágenes';
  }

  @override
  String get imageAddFailed => 'No se pudieron agregar las imágenes';

  @override
  String get imageSelectionFailed => 'No se pudieron seleccionar las imágenes';

  @override
  String get settingsChangeFailed => 'No se pudo cambiar la configuración';

  @override
  String groupTitle(String name) {
    return 'Grupo: $name';
  }

  @override
  String get displayToggle => 'Mostrar/ocultar';

  @override
  String imageCount(int count) {
    return '$count imágenes';
  }

  @override
  String get noticeTitle => 'Avisos importantes';

  @override
  String get notice1 => '¡Se agregó la función de imágenes personalizadas!';

  @override
  String get notice2 =>
      'Puedes agregar tus propias imágenes desde la pantalla de configuración';

  @override
  String get notice3 =>
      'Consulta la pantalla de configuración para más detalles';

  @override
  String get customImageTitle => 'Imágenes personalizadas';

  @override
  String get customImageSubtitle => 'Agrega y administra tus propias imágenes';

  @override
  String get addCustomImages => 'Agregar imágenes personalizadas';

  @override
  String get selectImages => 'Seleccionar imágenes';

  @override
  String get unknownImage => 'Imagen desconocida';

  @override
  String get customImageSettings => 'Configuración de imágenes personalizadas';

  @override
  String get useCustomImages => 'Usar imágenes personalizadas';

  @override
  String get useCustomImagesDescription =>
      'Usa tus propias imágenes para practicar. Activa la mezcla de abajo para incluir las imágenes de la aplicación.';

  @override
  String get groupSettings => 'Configuración de grupos';

  @override
  String get minOneGroupRequired => 'Al menos un grupo debe estar activado';

  @override
  String get settingsLoadFailedMessage => 'No se pudo cargar la configuración';

  @override
  String get customImageNotice1 =>
      'Cuando los grupos están activados, las imágenes se muestran aleatoriamente para cada grupo.';

  @override
  String get customImageNotice2 =>
      'Las imágenes que subes y configuras no se comparten con los desarrolladores ni con terceros, y se guardan solo en el área de la app en el dispositivo.';

  @override
  String get customImageNotice3 => 'Esto permite su uso sin conexión.';

  @override
  String get customImageNotice4 =>
      'Añadir muchas imágenes ocupa espacio de almacenamiento. Si tienes problemas, desactiva las imágenes propias o elimina las que no uses en Ajustes.';

  @override
  String get customImageNotice5 =>
      'Al eliminar la app, las imágenes configuradas se eliminarán.';

  @override
  String get customImageRequirementNotMet =>
      'Para usar imágenes personalizadas, necesitas al menos 1 imagen buena y 3 imágenes no buenas en los grupos activados.';

  @override
  String get customImageRequirement =>
      'Para usar imágenes personalizadas, necesitas al menos 1 imagen buena y 3 imágenes no buenas en los grupos activados.';

  @override
  String get sunnyWeather => 'Buenas';

  @override
  String get rainyWeather => 'No buenas';

  @override
  String get addImages => 'Agregar imágenes';

  @override
  String get imageDeleted => 'Imagen eliminada';

  @override
  String get imageDeleteFailed => 'No se pudo eliminar la imagen';

  @override
  String get deleteImageTitle => 'Eliminar imagen';

  @override
  String get deleteImageMessage =>
      '¿Quieres eliminar esta imagen? Esta acción no se puede deshacer.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Imágenes $weather del grupo $groupId';
  }

  @override
  String registeredCount(int count) {
    return 'Registradas: $count imágenes';
  }

  @override
  String get noImagesRegistered => 'No hay imágenes registradas';

  @override
  String get imagePreview => 'Vista previa de la imagen';

  @override
  String get close => 'Cerrar';

  @override
  String get contactEmailSubject => 'FocusMint - Contacto';

  @override
  String get contactEmailBody => 'Envíanos tus comentarios y preguntas.';

  @override
  String get mixWithBuiltInImages => 'Mezclar con imágenes de la aplicación';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Usar tus imágenes junto con las de la aplicación';

  @override
  String get supportIntro =>
      'Habla de forma anónima con el desarrollador. Puedes enviar preguntas y sugerencias. Tienes 3 mensajes al día. Cada respuesta del desarrollador restablece tu cupo a 3.';

  @override
  String get supportReceived =>
      'Mensaje recibido. Solemos responder en 2–3 días.';

  @override
  String get supportComposer => 'Escribe un mensaje';

  @override
  String get supportSend => 'Enviar';

  @override
  String get supportRetry => 'Reintentar';

  @override
  String get supportSent => 'Enviado';

  @override
  String get supportUnsent => 'Sin enviar · guardado en este dispositivo';

  @override
  String get supportAttach => 'Adjuntar imagen';

  @override
  String get supportRemoveImage => 'Quitar imagen';

  @override
  String get supportImage => 'Archivo adjunto';

  @override
  String get supportClear => 'Eliminar historial';

  @override
  String get supportClearConfirm =>
      '¿Eliminar esta conversación? También se eliminarán los borradores sin enviar y el historial del servidor. Esto no restablece tu cupo.';

  @override
  String get supportQuota =>
      'Ya has usado los 3 mensajes de hoy. Envía otro mañana o después de una respuesta del desarrollador.';

  @override
  String get supportConnectionError =>
      'No se pudo conectar. Los borradores guardados no se han enviado.';

  @override
  String get supportSendError =>
      'No se pudo enviar. Tu mensaje está guardado en este dispositivo. Vuelve a intentarlo.';

  @override
  String get supportStorageError => 'No se pudo guardar. Vuelve a intentarlo.';

  @override
  String get supportClearError =>
      'No se pudo eliminar el historial. Comprueba tu conexión y vuelve a intentarlo.';

  @override
  String get supportImageError =>
      'No se pudo cargar la imagen. Elige una imagen de menos de 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Mensajes disponibles hoy: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Respuestas sin leer: $count';
  }

  @override
  String get supportGuide => 'Información';

  @override
  String get supportDeveloper => 'Desarrollador';

  @override
  String get supportPrivacy => 'Datos de las consultas';

  @override
  String get breathingTitle => 'Tómate un respiro';

  @override
  String get breathingHint =>
      'Sigue el suave movimiento de los pulmones\na un ritmo cómodo.';

  @override
  String get breathingIn => 'Inspira despacio';

  @override
  String get breathingOut => 'Espira despacio';

  @override
  String get breathingProgress => 'Progreso de la respiración';

  @override
  String get breathingResultHint =>
      'Tus resultados aparecerán automáticamente.';

  @override
  String get breathingSkip => 'Ir a los resultados';
}
