// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Текущие баллы';

  @override
  String goalLabel(int goal) {
    return 'Цель: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Осталось: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Цель достигнута!';

  @override
  String get startButtonText => 'СТАРТ';

  @override
  String get stressReductionMessage => 'Учитесь замечать хорошее.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Осталось: $minutes мин $seconds с';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Осталось: $seconds с';
  }

  @override
  String scoreLabel(String score) {
    return 'Счёт: $score баллов';
  }

  @override
  String get imagePreparationMessage => 'Подготовка изображений...';

  @override
  String get noStimuliAvailable => 'Нет доступных стимулов';

  @override
  String get invalidGridSize => 'Недопустимый размер сетки';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Начинаем...';

  @override
  String get excellentPerformance => 'Отличный результат!';

  @override
  String get greatJob => 'Отличная работа!';

  @override
  String get goodPerformance => 'Хороший результат';

  @override
  String get keepPracticingFeedback => 'Продолжайте тренироваться';

  @override
  String get takeYourTimeFeedback => 'Не торопитесь';

  @override
  String get happy => 'Радость';

  @override
  String get angry => 'Гнев';

  @override
  String get fear => 'Страх';

  @override
  String get sad => 'Грусть';

  @override
  String get historyPageTitle => 'История тренировок';

  @override
  String get dataLoading => 'Загрузка данных...';

  @override
  String get pointsHistory => 'История баллов';

  @override
  String get weekly => 'По неделям';

  @override
  String get monthly => 'По месяцам';

  @override
  String get noDataAvailable => 'Нет данных';

  @override
  String get goalAchievementRate => 'Процент достижения цели';

  @override
  String get scoreStatistics => 'Статистика баллов';

  @override
  String get bestScore => 'Лучший результат';

  @override
  String get totalScore => 'Общий счёт';

  @override
  String get trainingTime => 'Время тренировок';

  @override
  String get totalTrainingTime => 'Общее время тренировок';

  @override
  String get detailedStatistics => 'Подробная статистика';

  @override
  String get averageScorePerMinute => 'Средний счёт в минуту';

  @override
  String get pointsToGoal => 'Баллов до цели';

  @override
  String get goalSetting => 'Настройка цели';

  @override
  String get secondsUnit => 'с';

  @override
  String get minutesUnit => 'мин';

  @override
  String get hoursUnit => 'ч';

  @override
  String get pointsUnit => 'баллов';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Вс';

  @override
  String get mondayShort => 'Пн';

  @override
  String get tuesdayShort => 'Вт';

  @override
  String get wednesdayShort => 'Ср';

  @override
  String get thursdayShort => 'Чт';

  @override
  String get fridayShort => 'Пт';

  @override
  String get saturdayShort => 'Сб';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get goalPointsSetting => 'Целевые баллы';

  @override
  String currentGoalPoints(int points) {
    return 'Текущая цель: $points баллов';
  }

  @override
  String get newGoalPointsLabel => 'Новая цель (баллы)';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'баллов';

  @override
  String get saveGoalButton => 'Сохранить цель';

  @override
  String goalSetTo(int points) {
    return 'Цель установлена: $points баллов';
  }

  @override
  String get enterGoalPoints => 'Введите целевые баллы';

  @override
  String get enterValidNumber => 'Введите корректное число (от 1 до 99999999)';

  @override
  String get saveFailed => 'Не удалось сохранить некоторые настройки';

  @override
  String get emailOpenFailed => 'Не удалось открыть почтовое приложение';

  @override
  String get pageOpenFailed => 'Не удалось открыть страницу';

  @override
  String get appInfoSupport => 'О приложении и поддержка';

  @override
  String get contactUs => 'Связаться с нами';

  @override
  String get contactUsSubtitle => 'Поделитесь отзывами и вопросами';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get termsSubtitle =>
      'Ознакомьтесь с условиями использования приложения';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get privacySubtitle => 'Об обращении с личными данными';

  @override
  String get tutorialTitle => 'Обучение';

  @override
  String get tutorialSubtitle => 'Узнайте, как пользоваться приложением';

  @override
  String get dataManagement => 'Управление данными';

  @override
  String get deleteHistory => 'Удалить историю';

  @override
  String get deleteHistorySubtitle =>
      'Удаляется только история тренировок (целевые баллы сохраняются)';

  @override
  String get deleteHistoryAndGoal => 'Удалить историю и цель';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Удаляются вся история и целевые баллы';

  @override
  String get deleteHistoryConfirmTitle => 'Удалить историю';

  @override
  String get deleteHistoryConfirmMessage =>
      'Вы действительно хотите удалить всю историю тренировок?\n\n*Целевые баллы будут сохранены';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Удалить историю и цель';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Вы действительно хотите удалить всю историю и целевые баллы?\n\n*Это действие нельзя отменить';

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get historyDeleted => 'История удалена';

  @override
  String get historyAndGoalDeleted => 'История и цель удалены';

  @override
  String get historyDeleteFailed => 'Не удалось удалить историю';

  @override
  String get historyAndGoalDeleteFailed => 'Не удалось удалить историю и цель';

  @override
  String get tutorialDisplayFailed => 'Не удалось показать обучение';

  @override
  String get tips => 'Советы';

  @override
  String get tipsContent =>
      '• Цель отображается на диаграмме главного экрана\n• Начните с небольшой цели и повышайте её в своём темпе\n• Каждый правильный выбор приносит до 6 баллов';

  @override
  String get backToHome => 'На главный экран';

  @override
  String get tutorialSkip => 'Пропустить';

  @override
  String get tutorialGoalAndPoints => 'Цель и текущие баллы';

  @override
  String get tutorialGoalDescription =>
      'Внешний круг показывает цель, внутренний — сумму баллов. Круг заполняется по мере приближения к цели.';

  @override
  String get tutorialOneMinuteTraining => 'Тренировка за 1 минуту';

  @override
  String get tutorialTrainingDescription =>
      'Начните игру длительностью 1 минута. Выбирайте позитивные изображения или полезные привычки из 4 вариантов.';

  @override
  String get tutorialScoreProgress => 'Динамика счёта';

  @override
  String get tutorialScoreDescription =>
      'Просматривайте подробную информацию о набранных баллах.';

  @override
  String get tutorialSettingsAndData => 'Настройки и управление данными';

  @override
  String get tutorialSettingsDescription =>
      'Изменяйте цель, просматривайте информацию о приложении и сбрасывайте данные.';

  @override
  String get appIntroAttentionBiasTitle => 'О смещении внимания';

  @override
  String get appIntroAttentionBiasContent =>
      'При сильной тревоге мы неосознанно склонны замечать только негативное.';

  @override
  String get appIntroFocusMintRoleTitle => 'Роль FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Короткая игра для тренировки внимания к позитивным изображениям.';

  @override
  String get appIntroScientificEvidenceTitle => 'Об этом упражнении';

  @override
  String get appIntroScientificEvidenceContent =>
      'Тренируйтесь находить позитивные изображения. FocusMint — инструмент заботы о себе, а не медицинское лечение. Результаты могут отличаться у разных людей.';

  @override
  String get appIntroExpectedEffectsTitle => 'Что можно практиковать';

  @override
  String get appIntroEffect1 => 'Поиск позитивных изображений';

  @override
  String get appIntroEffect2 => 'Внимание к улыбкам вокруг';

  @override
  String get appIntroEffect3 => 'Короткая ежедневная привычка';

  @override
  String get appIntroHowToUse => 'Как пользоваться';

  @override
  String get pointsEarned => 'Баллы получены!';

  @override
  String get yourScore => 'Ваш счёт';

  @override
  String get totalPlayTime => 'Общее время игры';

  @override
  String get imageManagement => 'Управление изображениями';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Скрытые изображения: $count/$max';
  }

  @override
  String get unsavedChanges => 'Есть несохранённые изменения';

  @override
  String unsavedChangesMessage(Object count) {
    return 'У вас $count несохранённых изменений настроек отображения изображений.';
  }

  @override
  String get unsavedChangesWarning =>
      'Если закрыть этот экран сейчас, изменения будут потеряны.';

  @override
  String get discardChanges => 'Отменить изменения';

  @override
  String get saveAndExit => 'Сохранить и выйти';

  @override
  String settingsSaved(Object count) {
    return 'Сохранено настроек: $count';
  }

  @override
  String get saveError => 'При сохранении настроек произошла ошибка';

  @override
  String get imageSettingsUpdated => 'Настройки изображений обновлены';

  @override
  String get allImages => 'Все';

  @override
  String get positiveImages => 'Позитивные';

  @override
  String get negativeImages => 'Негативные';

  @override
  String get smileImages => 'Улыбки';

  @override
  String get vegetableImages => 'Питательная еда';

  @override
  String get healthImages => 'Движение и общение';

  @override
  String get sadImages => 'Злость, грусть и беспокойство';

  @override
  String get badFoodImages => 'Фастфуд и сладости';

  @override
  String get badImages => 'Нездоровые привычки';

  @override
  String get imageManagementHint =>
      'Нажмите, чтобы показать или скрыть изображение. Можно скрыть до 15 изображений.';

  @override
  String get unsaved => 'Не сохранено';

  @override
  String get save => 'Сохранить';

  @override
  String get hiddenImages => 'Скрытые';

  @override
  String get noHiddenImages => 'Нет скрытых изображений';

  @override
  String get settingsLoadFailed => 'Не удалось загрузить настройки';

  @override
  String imagesAdded(int count) {
    return 'Добавлено изображений: $count';
  }

  @override
  String get imageAddFailed => 'Не удалось добавить изображения';

  @override
  String get imageSelectionFailed => 'Не удалось выбрать изображения';

  @override
  String get settingsChangeFailed => 'Не удалось изменить настройки';

  @override
  String groupTitle(String name) {
    return 'Группа: $name';
  }

  @override
  String get displayToggle => 'Показ/скрытие';

  @override
  String imageCount(int count) {
    return 'Изображений: $count';
  }

  @override
  String get noticeTitle => 'Важные примечания';

  @override
  String get notice1 => 'Добавлена функция пользовательских изображений!';

  @override
  String get notice2 =>
      'Вы можете добавить свои изображения на экране настроек';

  @override
  String get notice3 => 'Подробности см. на экране настроек';

  @override
  String get customImageTitle => 'Пользовательские изображения';

  @override
  String get customImageSubtitle =>
      'Добавляйте свои изображения и управляйте ими';

  @override
  String get addCustomImages => 'Добавить свои изображения';

  @override
  String get selectImages => 'Выбрать изображения';

  @override
  String get unknownImage => 'Неизвестное изображение';

  @override
  String get customImageSettings => 'Настройки пользовательских изображений';

  @override
  String get useCustomImages => 'Использовать свои изображения';

  @override
  String get useCustomImagesDescription =>
      'Используйте свои изображения для тренировки. Включите смешивание ниже, чтобы добавить изображения приложения.';

  @override
  String get groupSettings => 'Настройки групп';

  @override
  String get minOneGroupRequired => 'Должна быть включена хотя бы одна группа';

  @override
  String get settingsLoadFailedMessage => 'Не удалось загрузить настройки';

  @override
  String get customImageNotice1 =>
      'Если группы включены, изображения показываются случайным образом для каждой группы.';

  @override
  String get customImageNotice2 =>
      'Загруженные и установленные вами изображения не передаются разработчикам или третьим лицам и хранятся только в области приложения на устройстве.';

  @override
  String get customImageNotice3 =>
      'Благодаря этому приложение можно использовать офлайн.';

  @override
  String get customImageNotice4 =>
      'Большое количество изображений занимает память. При проблемах отключите свои изображения или удалите ненужные в настройках.';

  @override
  String get customImageNotice5 =>
      'При удалении приложения установленные изображения будут удалены.';

  @override
  String get customImageRequirementNotMet =>
      'Чтобы использовать свои изображения, во включённых группах нужно минимум 1 изображение в категории «Хорошие» и 3 изображения в категории «Нехорошие».';

  @override
  String get customImageRequirement =>
      'Чтобы использовать свои изображения, во включённых группах нужно минимум 1 изображение в категории «Хорошие» и 3 изображения в категории «Нехорошие».';

  @override
  String get sunnyWeather => 'Хорошие';

  @override
  String get rainyWeather => 'Нехорошие';

  @override
  String get addImages => 'Добавить изображения';

  @override
  String get imageDeleted => 'Изображение удалено';

  @override
  String get imageDeleteFailed => 'Не удалось удалить изображение';

  @override
  String get deleteImageTitle => 'Удалить изображение';

  @override
  String get deleteImageMessage =>
      'Удалить это изображение? Это действие нельзя отменить.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Группа $groupId — изображения «$weather»';
  }

  @override
  String registeredCount(int count) {
    return 'Добавлено: $count изображений';
  }

  @override
  String get noImagesRegistered => 'Нет добавленных изображений';

  @override
  String get imagePreview => 'Просмотр изображения';

  @override
  String get close => 'Закрыть';

  @override
  String get contactEmailSubject => 'FocusMint - Обратная связь';

  @override
  String get contactEmailBody => 'Пожалуйста, поделитесь отзывами и вопросами.';

  @override
  String get mixWithBuiltInImages => 'Смешивать с изображениями приложения';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Использовать свои изображения вместе с изображениями приложения';

  @override
  String get supportIntro =>
      'Общайтесь с разработчиком анонимно. Вопросы и предложения приветствуются. Можно отправить 3 сообщения в день. Каждый ответ разработчика восстанавливает доступное количество до 3.';

  @override
  String get supportReceived =>
      'Сообщение получено. Обычно мы отвечаем в течение 2–3 дней.';

  @override
  String get supportComposer => 'Введите сообщение';

  @override
  String get supportSend => 'Отправить';

  @override
  String get supportRetry => 'Повторить';

  @override
  String get supportSent => 'Отправлено';

  @override
  String get supportUnsent => 'Не отправлено · сохранено на этом устройстве';

  @override
  String get supportAttach => 'Прикрепить изображение';

  @override
  String get supportRemoveImage => 'Убрать изображение';

  @override
  String get supportImage => 'Вложение';

  @override
  String get supportClear => 'Удалить историю';

  @override
  String get supportClearConfirm =>
      'Удалить этот разговор? Неотправленные черновики и история на сервере также будут удалены. Лимит сообщений не восстановится.';

  @override
  String get supportQuota =>
      'Сегодняшние 3 сообщения использованы. Отправьте новое завтра или после ответа разработчика.';

  @override
  String get supportConnectionError =>
      'Не удалось подключиться. Сохранённые черновики не отправлены.';

  @override
  String get supportSendError =>
      'Не удалось отправить. Сообщение сохранено на этом устройстве. Повторите попытку.';

  @override
  String get supportStorageError => 'Не удалось сохранить. Повторите попытку.';

  @override
  String get supportClearError =>
      'Не удалось удалить историю. Проверьте подключение и повторите попытку.';

  @override
  String get supportImageError =>
      'Не удалось загрузить изображение. Выберите изображение размером менее 30 МБ.';

  @override
  String supportRemaining(int count) {
    return 'Осталось сообщений сегодня: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Непрочитанные ответы: $count';
  }

  @override
  String get supportGuide => 'Информация';

  @override
  String get supportDeveloper => 'Разработчик';

  @override
  String get supportPrivacy => 'О данных обращения';

  @override
  String get breathingTitle => 'Сделайте спокойный вдох';

  @override
  String get breathingHint =>
      'Следуйте плавному движению лёгких\nв комфортном для вас темпе.';

  @override
  String get breathingIn => 'Медленно вдохните';

  @override
  String get breathingOut => 'Медленно выдохните';

  @override
  String get breathingProgress => 'Ход дыхательного упражнения';

  @override
  String get breathingResultHint => 'Результаты появятся автоматически.';

  @override
  String get breathingSkip => 'Перейти к результатам';
}
