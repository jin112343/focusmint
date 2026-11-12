// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Поточні бали';

  @override
  String goalLabel(int goal) {
    return 'Ціль: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Залишилося: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Ціль досягнуто!';

  @override
  String get startButtonText => 'ПОЧАТИ';

  @override
  String get stressReductionMessage => 'Вчіться помічати позитивне.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Залишилося часу: $minutes хв $seconds с';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Залишилося часу: $seconds с';
  }

  @override
  String scoreLabel(String score) {
    return 'Рахунок: $score балів';
  }

  @override
  String get imagePreparationMessage => 'Підготовка зображень...';

  @override
  String get noStimuliAvailable => 'Немає доступних стимулів';

  @override
  String get invalidGridSize => 'Неприпустимий розмір сітки';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Починаємо...';

  @override
  String get excellentPerformance => 'Чудовий результат!';

  @override
  String get greatJob => 'Чудова робота!';

  @override
  String get goodPerformance => 'Хороший результат';

  @override
  String get keepPracticingFeedback => 'Продовжуйте тренуватися';

  @override
  String get takeYourTimeFeedback => 'Не поспішайте';

  @override
  String get happy => 'Радість';

  @override
  String get angry => 'Злість';

  @override
  String get fear => 'Страх';

  @override
  String get sad => 'Смуток';

  @override
  String get historyPageTitle => 'Історія тренувань';

  @override
  String get dataLoading => 'Завантаження даних...';

  @override
  String get pointsHistory => 'Історія балів';

  @override
  String get weekly => 'Щотижня';

  @override
  String get monthly => 'Щомісяця';

  @override
  String get noDataAvailable => 'Дані відсутні';

  @override
  String get goalAchievementRate => 'Рівень досягнення цілі';

  @override
  String get scoreStatistics => 'Статистика рахунку';

  @override
  String get bestScore => 'Найкращий рахунок';

  @override
  String get totalScore => 'Загальний рахунок';

  @override
  String get trainingTime => 'Час тренування';

  @override
  String get totalTrainingTime => 'Загальний час тренувань';

  @override
  String get detailedStatistics => 'Детальна статистика';

  @override
  String get averageScorePerMinute => 'Середній рахунок за хвилину';

  @override
  String get pointsToGoal => 'Балів до цілі';

  @override
  String get goalSetting => 'Налаштування цілі';

  @override
  String get secondsUnit => 'с';

  @override
  String get minutesUnit => 'хв';

  @override
  String get hoursUnit => 'год';

  @override
  String get pointsUnit => 'балів';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Нд';

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
  String get settingsTitle => 'Налаштування';

  @override
  String get goalPointsSetting => 'Налаштування цільових балів';

  @override
  String currentGoalPoints(int points) {
    return 'Поточна ціль: $points балів';
  }

  @override
  String get newGoalPointsLabel => 'Нові цільові бали';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'балів';

  @override
  String get saveGoalButton => 'Зберегти ціль';

  @override
  String goalSetTo(int points) {
    return 'Ціль встановлено на $points балів';
  }

  @override
  String get enterGoalPoints => 'Введіть цільові бали';

  @override
  String get enterValidNumber => 'Введіть дійсне число (від 1 до 99999999)';

  @override
  String get saveFailed => 'Не вдалося зберегти деякі налаштування';

  @override
  String get emailOpenFailed => 'Не вдалося відкрити поштовий застосунок';

  @override
  String get pageOpenFailed => 'Не вдалося відкрити сторінку';

  @override
  String get appInfoSupport => 'Інформація про застосунок і підтримка';

  @override
  String get contactUs => 'Зв\'яжіться з нами';

  @override
  String get contactUsSubtitle => 'Поділіться відгуками та запитаннями';

  @override
  String get termsOfService => 'Умови використання';

  @override
  String get termsSubtitle => 'Перегляньте умови використання застосунку';

  @override
  String get privacyPolicy => 'Політика конфіденційності';

  @override
  String get privacySubtitle => 'Про обробку конфіденційної інформації';

  @override
  String get tutorialTitle => 'Посібник';

  @override
  String get tutorialSubtitle => 'Дізнайтеся, як користуватися застосунком';

  @override
  String get dataManagement => 'Керування даними';

  @override
  String get deleteHistory => 'Видалити історію';

  @override
  String get deleteHistorySubtitle =>
      'Видалити лише історію тренувань (цільові бали збережуться)';

  @override
  String get deleteHistoryAndGoal => 'Видалити історію та ціль';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Видалити всю історію та цільові бали';

  @override
  String get deleteHistoryConfirmTitle => 'Видалити історію';

  @override
  String get deleteHistoryConfirmMessage =>
      'Ви впевнені, що хочете видалити всю історію тренувань?\n\n*Цільові бали буде збережено';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Видалити історію та ціль';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Ви впевнені, що хочете видалити всю історію та цільові бали?\n\n*Цю дію не можна скасувати';

  @override
  String get cancel => 'Скасувати';

  @override
  String get delete => 'Видалити';

  @override
  String get historyDeleted => 'Історію видалено';

  @override
  String get historyAndGoalDeleted => 'Історію та ціль видалено';

  @override
  String get historyDeleteFailed => 'Не вдалося видалити історію';

  @override
  String get historyAndGoalDeleteFailed =>
      'Не вдалося видалити історію та ціль';

  @override
  String get tutorialDisplayFailed => 'Не вдалося відобразити посібник';

  @override
  String get tips => 'Поради';

  @override
  String get tipsContent =>
      '• Мета відображається на діаграмі головного екрана\n• Почніть із невеликої мети й підвищуйте її у власному темпі\n• Кожен правильний вибір приносить до 6 балів';

  @override
  String get backToHome => 'На головну';

  @override
  String get tutorialSkip => 'Пропустити';

  @override
  String get tutorialGoalAndPoints => 'Ціль і поточні бали';

  @override
  String get tutorialGoalDescription =>
      'Зовнішнє коло показує вашу ціль, внутрішнє — загальні бали. Коло заповнюється в міру наближення до цілі.';

  @override
  String get tutorialOneMinuteTraining => '1-хвилинне тренування';

  @override
  String get tutorialTrainingDescription =>
      'Розпочніть 1-хвилинну гру. Обирайте позитивні зображення або корисні звички з 4 варіантів.';

  @override
  String get tutorialScoreProgress => 'Динаміка рахунку';

  @override
  String get tutorialScoreDescription =>
      'Переглядайте детальну інформацію про отримані бали.';

  @override
  String get tutorialSettingsAndData => 'Налаштування та керування даними';

  @override
  String get tutorialSettingsDescription =>
      'Змінюйте цільові значення, переглядайте інформацію про застосунок і скидайте дані.';

  @override
  String get appIntroAttentionBiasTitle => 'Про упередженість уваги';

  @override
  String get appIntroAttentionBiasContent =>
      'Коли тривожність висока, ми несвідомо схильні зосереджуватися лише на негативному.';

  @override
  String get appIntroFocusMintRoleTitle => 'Роль FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Коротка гра для тренування уваги до позитивних зображень.';

  @override
  String get appIntroScientificEvidenceTitle => 'Про цю вправу';

  @override
  String get appIntroScientificEvidenceContent =>
      'Тренуйтеся знаходити позитивні зображення. FocusMint — інструмент турботи про себе, а не медичне лікування. Результати можуть відрізнятися в різних людей.';

  @override
  String get appIntroExpectedEffectsTitle => 'Що можна практикувати';

  @override
  String get appIntroEffect1 => 'Пошук позитивних зображень';

  @override
  String get appIntroEffect2 => 'Увага до усмішок навколо';

  @override
  String get appIntroEffect3 => 'Коротка щоденна звичка';

  @override
  String get appIntroHowToUse => 'Як користуватися';

  @override
  String get pointsEarned => 'Бали отримано!';

  @override
  String get yourScore => 'Ваш рахунок';

  @override
  String get totalPlayTime => 'Загальний час гри';

  @override
  String get imageManagement => 'Керування зображеннями';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Приховані зображення: $count/$max';
  }

  @override
  String get unsavedChanges => 'У вас є незбережені зміни';

  @override
  String unsavedChangesMessage(Object count) {
    return 'У вас $count незбережених змін у налаштуваннях відображення зображень.';
  }

  @override
  String get unsavedChangesWarning =>
      'Якщо закрити цей екран зараз, зміни буде втрачено.';

  @override
  String get discardChanges => 'Відхилити зміни';

  @override
  String get saveAndExit => 'Зберегти й вийти';

  @override
  String settingsSaved(Object count) {
    return 'Збережено налаштувань: $count';
  }

  @override
  String get saveError => 'Під час збереження налаштувань сталася помилка';

  @override
  String get imageSettingsUpdated => 'Налаштування зображень оновлено';

  @override
  String get allImages => 'Усі';

  @override
  String get positiveImages => 'Позитивні';

  @override
  String get negativeImages => 'Негативні';

  @override
  String get smileImages => 'Усмішка';

  @override
  String get vegetableImages => 'Поживна їжа';

  @override
  String get healthImages => 'Рух і спілкування';

  @override
  String get sadImages => 'Гнів, смуток і занепокоєння';

  @override
  String get badFoodImages => 'Фастфуд і солодощі';

  @override
  String get badImages => 'Нездорові звички';

  @override
  String get imageManagementHint =>
      'Торкніться, щоб показати або приховати зображення. Можна приховати до 15 зображень.';

  @override
  String get unsaved => 'Не збережено';

  @override
  String get save => 'Зберегти';

  @override
  String get hiddenImages => 'Приховані';

  @override
  String get noHiddenImages => 'Немає прихованих зображень';

  @override
  String get settingsLoadFailed => 'Не вдалося завантажити налаштування';

  @override
  String imagesAdded(int count) {
    return 'Додано зображень: $count';
  }

  @override
  String get imageAddFailed => 'Не вдалося додати зображення';

  @override
  String get imageSelectionFailed => 'Не вдалося вибрати зображення';

  @override
  String get settingsChangeFailed => 'Не вдалося змінити налаштування';

  @override
  String groupTitle(String name) {
    return 'Група: $name';
  }

  @override
  String get displayToggle => 'Перемикання відображення';

  @override
  String imageCount(int count) {
    return 'Зображень: $count';
  }

  @override
  String get noticeTitle => 'Важливі примітки';

  @override
  String get notice1 => 'Додано функцію власних зображень!';

  @override
  String get notice2 =>
      'Ви можете додати власні зображення на екрані налаштувань';

  @override
  String get notice3 => 'Докладніше див. на екрані налаштувань';

  @override
  String get customImageTitle => 'Власні зображення';

  @override
  String get customImageSubtitle =>
      'Додавайте власні зображення та керуйте ними';

  @override
  String get addCustomImages => 'Додати власні зображення';

  @override
  String get selectImages => 'Вибрати зображення';

  @override
  String get unknownImage => 'Невідоме зображення';

  @override
  String get customImageSettings => 'Налаштування власних зображень';

  @override
  String get useCustomImages => 'Використовувати власні зображення';

  @override
  String get useCustomImagesDescription =>
      'Використовуйте власні зображення для тренування. Увімкніть змішування нижче, щоб додати зображення застосунку.';

  @override
  String get groupSettings => 'Налаштування груп';

  @override
  String get minOneGroupRequired => 'Принаймні одна група має бути ввімкнена';

  @override
  String get settingsLoadFailedMessage => 'Не вдалося завантажити налаштування';

  @override
  String get customImageNotice1 =>
      'Якщо групи ввімкнено, зображення відображаються випадково для кожної групи.';

  @override
  String get customImageNotice2 =>
      'Зображення, які завантажують і встановлюють користувачі, не передаються розробникам чи третім особам і зберігаються лише в області застосунку на пристрої.';

  @override
  String get customImageNotice3 =>
      'Це дозволяє користуватися застосунком офлайн.';

  @override
  String get customImageNotice4 =>
      'Велика кількість зображень займає пам’ять. Якщо виникнуть проблеми, вимкніть власні зображення або видаліть непотрібні в налаштуваннях.';

  @override
  String get customImageNotice5 =>
      'Після видалення застосунку встановлені зображення буде видалено.';

  @override
  String get customImageRequirementNotMet =>
      'Щоб використовувати власні зображення, потрібно щонайменше 1 хороше зображення та 3 не хороші зображення в увімкнених групах.';

  @override
  String get customImageRequirement =>
      'Щоб використовувати власні зображення, потрібно щонайменше 1 хороше зображення та 3 не хороші зображення в увімкнених групах.';

  @override
  String get sunnyWeather => 'Хороші';

  @override
  String get rainyWeather => 'Не хороші';

  @override
  String get addImages => 'Додати зображення';

  @override
  String get imageDeleted => 'Зображення видалено';

  @override
  String get imageDeleteFailed => 'Не вдалося видалити зображення';

  @override
  String get deleteImageTitle => 'Видалити зображення';

  @override
  String get deleteImageMessage =>
      'Видалити це зображення? Цю дію не можна скасувати.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Група $groupId — $weather зображення';
  }

  @override
  String registeredCount(int count) {
    return 'Зареєстровано: $count зображень';
  }

  @override
  String get noImagesRegistered => 'Зображення не зареєстровано';

  @override
  String get imagePreview => 'Попередній перегляд зображення';

  @override
  String get close => 'Закрити';

  @override
  String get contactEmailSubject => 'FocusMint — Зворотний зв\'язок';

  @override
  String get contactEmailBody =>
      'Поділіться, будь ласка, своїми відгуками та запитаннями.';

  @override
  String get mixWithBuiltInImages => 'Змішувати із зображеннями застосунку';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Використовувати власні зображення разом із зображеннями застосунку';

  @override
  String get supportIntro =>
      'Спілкуйтеся з розробником анонімно. Запитання й пропозиції вітаються. Можна надіслати 3 повідомлення на день. Кожна відповідь розробника відновлює доступну кількість до 3.';

  @override
  String get supportReceived =>
      'Повідомлення отримано. Зазвичай ми відповідаємо протягом 2–3 днів.';

  @override
  String get supportComposer => 'Введіть повідомлення';

  @override
  String get supportSend => 'Надіслати';

  @override
  String get supportRetry => 'Повторити';

  @override
  String get supportSent => 'Надіслано';

  @override
  String get supportUnsent => 'Не надіслано · збережено на цьому пристрої';

  @override
  String get supportAttach => 'Прикріпити зображення';

  @override
  String get supportRemoveImage => 'Прибрати зображення';

  @override
  String get supportImage => 'Вкладення';

  @override
  String get supportClear => 'Видалити історію';

  @override
  String get supportClearConfirm =>
      'Видалити цю розмову? Ненадіслані чернетки та історію на сервері також буде видалено. Ліміт повідомлень не відновиться.';

  @override
  String get supportQuota =>
      'Сьогоднішні 3 повідомлення використано. Надішліть нове завтра або після відповіді розробника.';

  @override
  String get supportConnectionError =>
      'Не вдалося підключитися. Збережені чернетки не надіслано.';

  @override
  String get supportSendError =>
      'Не вдалося надіслати. Повідомлення збережено на цьому пристрої. Спробуйте ще раз.';

  @override
  String get supportStorageError => 'Не вдалося зберегти. Спробуйте ще раз.';

  @override
  String get supportClearError =>
      'Не вдалося видалити історію. Перевірте з’єднання та спробуйте ще раз.';

  @override
  String get supportImageError =>
      'Не вдалося завантажити зображення. Виберіть зображення розміром менше ніж 30 МБ.';

  @override
  String supportRemaining(int count) {
    return 'Залишилося повідомлень сьогодні: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Непрочитані відповіді: $count';
  }

  @override
  String get supportGuide => 'Інформація';

  @override
  String get supportDeveloper => 'Розробник';

  @override
  String get supportPrivacy => 'Про дані звернення';

  @override
  String get breathingTitle => 'Зробіть спокійний вдих';

  @override
  String get breathingHint =>
      'Дихайте відповідно до плавного руху легень\nу зручному для вас темпі.';

  @override
  String get breathingIn => 'Повільно вдихніть';

  @override
  String get breathingOut => 'Повільно видихніть';

  @override
  String get breathingProgress => 'Перебіг дихальної вправи';

  @override
  String get breathingResultHint => 'Результати з’являться автоматично.';

  @override
  String get breathingSkip => 'Перейти до результатів';
}
