// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => '当前积分';

  @override
  String goalLabel(int goal) {
    return '目标：$goal';
  }

  @override
  String remainingLabel(int remaining) {
    return '剩余：$remaining';
  }

  @override
  String get goalAchieved => '🎉 目标达成！';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => '练习关注积极的事物。';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return '剩余时间：$minutes分$seconds秒';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return '剩余时间：$seconds秒';
  }

  @override
  String scoreLabel(String score) {
    return '得分：$score 积分';
  }

  @override
  String get imagePreparationMessage => '正在准备图片...';

  @override
  String get noStimuliAvailable => '没有可用的刺激素材';

  @override
  String get invalidGridSize => '无效的网格大小';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => '正在开始...';

  @override
  String get excellentPerformance => '表现出色！';

  @override
  String get greatJob => '做得好！';

  @override
  String get goodPerformance => '表现不错';

  @override
  String get keepPracticingFeedback => '请继续练习';

  @override
  String get takeYourTimeFeedback => '请慢慢来';

  @override
  String get happy => '开心';

  @override
  String get angry => '生气';

  @override
  String get fear => '恐惧';

  @override
  String get sad => '悲伤';

  @override
  String get historyPageTitle => '训练记录';

  @override
  String get dataLoading => '正在加载数据...';

  @override
  String get pointsHistory => '积分获取记录';

  @override
  String get weekly => '每周';

  @override
  String get monthly => '每月';

  @override
  String get noDataAvailable => '暂无数据';

  @override
  String get goalAchievementRate => '目标达成率';

  @override
  String get scoreStatistics => '得分统计';

  @override
  String get bestScore => '最高得分';

  @override
  String get totalScore => '总得分';

  @override
  String get trainingTime => '训练时间';

  @override
  String get totalTrainingTime => '累计训练时间';

  @override
  String get detailedStatistics => '详细统计';

  @override
  String get averageScorePerMinute => '每分钟平均得分';

  @override
  String get pointsToGoal => '距离目标还差';

  @override
  String get goalSetting => '目标设置';

  @override
  String get secondsUnit => '秒';

  @override
  String get minutesUnit => '分';

  @override
  String get hoursUnit => '小时';

  @override
  String get pointsUnit => '积分';

  @override
  String get monthSuffix => '月';

  @override
  String get sundayShort => '日';

  @override
  String get mondayShort => '一';

  @override
  String get tuesdayShort => '二';

  @override
  String get wednesdayShort => '三';

  @override
  String get thursdayShort => '四';

  @override
  String get fridayShort => '五';

  @override
  String get saturdayShort => '六';

  @override
  String get settingsTitle => '设置';

  @override
  String get goalPointsSetting => '目标积分设置';

  @override
  String currentGoalPoints(int points) {
    return '当前目标：$points 积分';
  }

  @override
  String get newGoalPointsLabel => '新的目标积分';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => '积分';

  @override
  String get saveGoalButton => '保存目标';

  @override
  String goalSetTo(int points) {
    return '目标已设为 $points 积分';
  }

  @override
  String get enterGoalPoints => '请输入目标积分';

  @override
  String get enterValidNumber => '请输入有效数字（1 至 99999999）';

  @override
  String get saveFailed => '部分设置保存失败';

  @override
  String get emailOpenFailed => '无法打开邮件应用';

  @override
  String get pageOpenFailed => '无法打开页面';

  @override
  String get appInfoSupport => '应用信息与支持';

  @override
  String get contactUs => '联系我们';

  @override
  String get contactUsSubtitle => '欢迎提出您的意见和问题';

  @override
  String get termsOfService => '服务条款';

  @override
  String get termsSubtitle => '查看应用的服务条款';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get privacySubtitle => '关于隐私信息的处理';

  @override
  String get tutorialTitle => '使用教程';

  @override
  String get tutorialSubtitle => '了解应用的使用方法';

  @override
  String get dataManagement => '数据管理';

  @override
  String get deleteHistory => '删除记录';

  @override
  String get deleteHistorySubtitle => '仅删除训练记录（保留目标积分）';

  @override
  String get deleteHistoryAndGoal => '删除记录与目标';

  @override
  String get deleteHistoryAndGoalSubtitle => '删除所有记录和目标积分';

  @override
  String get deleteHistoryConfirmTitle => '删除记录';

  @override
  String get deleteHistoryConfirmMessage => '确定要删除所有训练记录吗？\n\n※目标积分将被保留';

  @override
  String get deleteHistoryAndGoalConfirmTitle => '删除记录与目标';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      '确定要删除所有记录和目标积分吗？\n\n※此操作无法撤销';

  @override
  String get cancel => '取消';

  @override
  String get delete => '删除';

  @override
  String get historyDeleted => '记录已删除';

  @override
  String get historyAndGoalDeleted => '记录和目标已删除';

  @override
  String get historyDeleteFailed => '删除记录失败';

  @override
  String get historyAndGoalDeleteFailed => '删除记录和目标失败';

  @override
  String get tutorialDisplayFailed => '教程显示失败';

  @override
  String get tips => '小贴士';

  @override
  String get tipsContent =>
      '• 目标会显示在主页图表中\n• 从小目标开始，按自己的节奏逐步提高\n• 每次正确选择最多可获得6分';

  @override
  String get backToHome => '返回主页';

  @override
  String get tutorialSkip => '跳过';

  @override
  String get tutorialGoalAndPoints => '目标与当前积分';

  @override
  String get tutorialGoalDescription => '外圈表示目标，内圈表示总积分。越接近目标，圆环越满。';

  @override
  String get tutorialOneMinuteTraining => '1 分钟训练';

  @override
  String get tutorialTrainingDescription => '开始 1 分钟小游戏。从 4 个选项中选择积极的图片或好习惯。';

  @override
  String get tutorialScoreProgress => '得分变化';

  @override
  String get tutorialScoreDescription => '查看已获得分数的详细信息。';

  @override
  String get tutorialSettingsAndData => '设置与数据管理';

  @override
  String get tutorialSettingsDescription => '可更改目标值、查看应用信息并重置数据。';

  @override
  String get appIntroAttentionBiasTitle => '关于注意偏向';

  @override
  String get appIntroAttentionBiasContent => '焦虑较强时，我们会不自觉地只关注消极的事物。';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMint 的作用';

  @override
  String get appIntroFocusMintRoleContent => '通过简短的游戏，练习将注意力转向积极的图片。';

  @override
  String get appIntroScientificEvidenceTitle => '关于这项练习';

  @override
  String get appIntroScientificEvidenceContent =>
      '练习寻找积极的图片。FocusMint用于日常自我关怀，不提供医疗或治疗服务。每个人的感受和效果可能不同。';

  @override
  String get appIntroExpectedEffectsTitle => '可以练习的内容';

  @override
  String get appIntroEffect1 => '寻找积极的图片';

  @override
  String get appIntroEffect2 => '留意身边的笑容';

  @override
  String get appIntroEffect3 => '建立简短的每日习惯';

  @override
  String get appIntroHowToUse => '查看使用方法';

  @override
  String get pointsEarned => '获得积分！';

  @override
  String get yourScore => '您的得分';

  @override
  String get totalPlayTime => '总游戏时间';

  @override
  String get imageManagement => '图片管理';

  @override
  String hiddenImagesCount(int count, int max) {
    return '已隐藏图片：$count/$max';
  }

  @override
  String get unsavedChanges => '有未保存的更改';

  @override
  String unsavedChangesMessage(Object count) {
    return '图片显示设置中有 $count 项未保存的更改。';
  }

  @override
  String get unsavedChangesWarning => '现在关闭此页面将丢失更改。';

  @override
  String get discardChanges => '放弃更改';

  @override
  String get saveAndExit => '保存并退出';

  @override
  String settingsSaved(Object count) {
    return '已保存 $count 项设置';
  }

  @override
  String get saveError => '保存设置时发生错误';

  @override
  String get imageSettingsUpdated => '图片设置已更新';

  @override
  String get allImages => '全部';

  @override
  String get positiveImages => '积极';

  @override
  String get negativeImages => '消极';

  @override
  String get smileImages => '笑容';

  @override
  String get vegetableImages => '营养食物';

  @override
  String get healthImages => '运动与交流';

  @override
  String get sadImages => '愤怒、悲伤与担忧';

  @override
  String get badFoodImages => '快餐与甜食';

  @override
  String get badImages => '不健康的习惯';

  @override
  String get imageManagementHint => '点按可切换图片的显示/隐藏。最多可隐藏 15 张图片。';

  @override
  String get unsaved => '未保存';

  @override
  String get save => '保存';

  @override
  String get hiddenImages => '已隐藏';

  @override
  String get noHiddenImages => '没有隐藏的图片';

  @override
  String get settingsLoadFailed => '设置加载失败';

  @override
  String imagesAdded(int count) {
    return '已添加 $count 张图片';
  }

  @override
  String get imageAddFailed => '添加图片失败';

  @override
  String get imageSelectionFailed => '选择图片失败';

  @override
  String get settingsChangeFailed => '更改设置失败';

  @override
  String groupTitle(String name) {
    return '分组：$name';
  }

  @override
  String get displayToggle => '显示切换';

  @override
  String imageCount(int count) {
    return '$count 张';
  }

  @override
  String get noticeTitle => '注意事项';

  @override
  String get notice1 => '新增了自定义图片功能！';

  @override
  String get notice2 => '您可以在设置页面添加自己的图片';

  @override
  String get notice3 => '详情请查看设置页面';

  @override
  String get customImageTitle => '自定义图片';

  @override
  String get customImageSubtitle => '添加并管理自己的图片';

  @override
  String get addCustomImages => '添加自定义图片';

  @override
  String get selectImages => '选择图片';

  @override
  String get unknownImage => '未知图片';

  @override
  String get customImageSettings => '自定义图片设置';

  @override
  String get useCustomImages => '使用自定义图片';

  @override
  String get useCustomImagesDescription =>
      '使用自己的图片进行练习。开启下方的混合选项，即可同时使用应用内置图片。';

  @override
  String get groupSettings => '分组设置';

  @override
  String get minOneGroupRequired => '至少需要启用一个分组';

  @override
  String get settingsLoadFailedMessage => '设置加载失败';

  @override
  String get customImageNotice1 => '启用分组后，图片将在各分组内随机显示。';

  @override
  String get customImageNotice2 => '用户上传并设置的图片不会与开发者或第三方共享，仅保存在设备上应用的存储空间内。';

  @override
  String get customImageNotice3 => '因此可以离线使用。';

  @override
  String get customImageNotice4 =>
      '添加大量图片会占用存储空间。如遇问题，请在设置中关闭自定义图片，或删除不再使用的图片。';

  @override
  String get customImageNotice5 => '删除应用时，已设置的图片也会被删除。';

  @override
  String get customImageRequirementNotMet =>
      '要使用自定义图片，已启用的分组中至少需要 1 张“好”图片和 3 张“不好”图片。';

  @override
  String get customImageRequirement =>
      '要使用自定义图片，已启用的分组中至少需要 1 张“好”图片和 3 张“不好”图片。';

  @override
  String get sunnyWeather => '好';

  @override
  String get rainyWeather => '不好';

  @override
  String get addImages => '添加图片';

  @override
  String get imageDeleted => '图片已删除';

  @override
  String get imageDeleteFailed => '删除图片失败';

  @override
  String get deleteImageTitle => '删除图片';

  @override
  String get deleteImageMessage => '确定要删除这张图片吗？此操作无法撤销。';

  @override
  String groupImageTitle(int groupId, String weather) {
    return '分组 $groupId $weather图片';
  }

  @override
  String registeredCount(int count) {
    return '已注册：$count 张';
  }

  @override
  String get noImagesRegistered => '尚未注册图片';

  @override
  String get imagePreview => '图片预览';

  @override
  String get close => '关闭';

  @override
  String get contactEmailSubject => 'FocusMint - 联系我们';

  @override
  String get contactEmailBody => '请写下您的意见或问题。';

  @override
  String get mixWithBuiltInImages => '与内置图片混合使用';

  @override
  String get mixWithBuiltInImagesDescription => '同时使用内置图片和自己的图片';

  @override
  String get supportIntro =>
      '匿名联系开发者，欢迎提出问题或建议。每天可发送3条消息。开发者每次回复后，可发送消息数将恢复为3条。';

  @override
  String get supportReceived => '已收到消息。我们通常会在2至3天内回复。';

  @override
  String get supportComposer => '输入消息';

  @override
  String get supportSend => '发送';

  @override
  String get supportRetry => '重试';

  @override
  String get supportSent => '已发送';

  @override
  String get supportUnsent => '未发送 · 已保存在此设备上';

  @override
  String get supportAttach => '添加图片附件';

  @override
  String get supportRemoveImage => '移除图片';

  @override
  String get supportImage => '附件';

  @override
  String get supportClear => '删除记录';

  @override
  String get supportClearConfirm => '删除这段对话吗？未发送的草稿和服务器上的记录也会删除。此操作不会恢复可发送消息数。';

  @override
  String get supportQuota => '今天的3条消息已用完。请明天或收到开发者回复后再发送。';

  @override
  String get supportConnectionError => '无法连接。已保存的草稿尚未发送。';

  @override
  String get supportSendError => '发送失败。消息已保存在此设备上，请重试。';

  @override
  String get supportStorageError => '保存失败，请重试。';

  @override
  String get supportClearError => '无法删除记录。请检查网络连接后重试。';

  @override
  String get supportImageError => '无法加载图片。请选择小于30 MB的图片。';

  @override
  String supportRemaining(int count) {
    return '今日剩余消息数：$count';
  }

  @override
  String supportUnread(int count) {
    return '未读回复数：$count';
  }

  @override
  String get supportGuide => '说明';

  @override
  String get supportDeveloper => '开发者';

  @override
  String get supportPrivacy => '关于咨询数据';

  @override
  String get breathingTitle => '放慢节奏，呼吸一下';

  @override
  String get breathingHint => '以舒适的节奏，\n跟随肺部的轻柔变化呼吸。';

  @override
  String get breathingIn => '慢慢吸气';

  @override
  String get breathingOut => '慢慢呼气';

  @override
  String get breathingProgress => '呼吸引导进度';

  @override
  String get breathingResultHint => '结束后将自动显示结果。';

  @override
  String get breathingSkip => '跳过并查看结果';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => '目前點數';

  @override
  String goalLabel(int goal) {
    return '目標：$goal';
  }

  @override
  String remainingLabel(int remaining) {
    return '剩餘：$remaining';
  }

  @override
  String get goalAchieved => '🎉 達成目標！';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => '練習留意正向的事物。';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return '剩餘時間：$minutes分$seconds秒';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return '剩餘時間：$seconds秒';
  }

  @override
  String scoreLabel(String score) {
    return '分數：$score 點';
  }

  @override
  String get imagePreparationMessage => '正在準備圖片...';

  @override
  String get noStimuliAvailable => '沒有可用的刺激素材';

  @override
  String get invalidGridSize => '無效的網格大小';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => '正在開始...';

  @override
  String get excellentPerformance => '表現非常出色！';

  @override
  String get greatJob => '做得好！';

  @override
  String get goodPerformance => '表現不錯';

  @override
  String get keepPracticingFeedback => '請繼續練習';

  @override
  String get takeYourTimeFeedback => '請慢慢來';

  @override
  String get happy => '開心';

  @override
  String get angry => '生氣';

  @override
  String get fear => '恐懼';

  @override
  String get sad => '悲傷';

  @override
  String get historyPageTitle => '訓練紀錄';

  @override
  String get dataLoading => '正在載入資料...';

  @override
  String get pointsHistory => '點數獲得紀錄';

  @override
  String get weekly => '每週';

  @override
  String get monthly => '每月';

  @override
  String get noDataAvailable => '沒有資料';

  @override
  String get goalAchievementRate => '目標達成率';

  @override
  String get scoreStatistics => '分數統計';

  @override
  String get bestScore => '最佳分數';

  @override
  String get totalScore => '總分';

  @override
  String get trainingTime => '訓練時間';

  @override
  String get totalTrainingTime => '累計訓練時間';

  @override
  String get detailedStatistics => '詳細統計';

  @override
  String get averageScorePerMinute => '每分鐘平均分數';

  @override
  String get pointsToGoal => '距離目標還差';

  @override
  String get goalSetting => '目標設定';

  @override
  String get secondsUnit => '秒';

  @override
  String get minutesUnit => '分';

  @override
  String get hoursUnit => '小時';

  @override
  String get pointsUnit => '點';

  @override
  String get monthSuffix => '月';

  @override
  String get sundayShort => '日';

  @override
  String get mondayShort => '一';

  @override
  String get tuesdayShort => '二';

  @override
  String get wednesdayShort => '三';

  @override
  String get thursdayShort => '四';

  @override
  String get fridayShort => '五';

  @override
  String get saturdayShort => '六';

  @override
  String get settingsTitle => '設定';

  @override
  String get goalPointsSetting => '目標點數設定';

  @override
  String currentGoalPoints(int points) {
    return '目前目標：$points 點';
  }

  @override
  String get newGoalPointsLabel => '新的目標點數';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => '點';

  @override
  String get saveGoalButton => '儲存目標';

  @override
  String goalSetTo(int points) {
    return '目標已設為 $points 點';
  }

  @override
  String get enterGoalPoints => '請輸入目標點數';

  @override
  String get enterValidNumber => '請輸入有效數字（1 至 99999999）';

  @override
  String get saveFailed => '部分設定儲存失敗';

  @override
  String get emailOpenFailed => '無法開啟郵件 App';

  @override
  String get pageOpenFailed => '無法開啟頁面';

  @override
  String get appInfoSupport => 'App 資訊與支援';

  @override
  String get contactUs => '聯絡我們';

  @override
  String get contactUsSubtitle => '歡迎提供您的意見與問題';

  @override
  String get termsOfService => '服務條款';

  @override
  String get termsSubtitle => '查看 App 的服務條款';

  @override
  String get privacyPolicy => '隱私權政策';

  @override
  String get privacySubtitle => '關於隱私資訊的處理方式';

  @override
  String get tutorialTitle => '教學';

  @override
  String get tutorialSubtitle => '了解 App 的使用方式';

  @override
  String get dataManagement => '資料管理';

  @override
  String get deleteHistory => '刪除紀錄';

  @override
  String get deleteHistorySubtitle => '僅刪除訓練紀錄（保留目標點數）';

  @override
  String get deleteHistoryAndGoal => '刪除紀錄與目標';

  @override
  String get deleteHistoryAndGoalSubtitle => '刪除所有紀錄和目標點數';

  @override
  String get deleteHistoryConfirmTitle => '刪除紀錄';

  @override
  String get deleteHistoryConfirmMessage => '確定要刪除所有訓練紀錄嗎？\n\n※目標點數將會保留';

  @override
  String get deleteHistoryAndGoalConfirmTitle => '刪除紀錄與目標';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      '確定要刪除所有紀錄和目標點數嗎？\n\n※此操作無法復原';

  @override
  String get cancel => '取消';

  @override
  String get delete => '刪除';

  @override
  String get historyDeleted => '已刪除紀錄';

  @override
  String get historyAndGoalDeleted => '已刪除紀錄與目標';

  @override
  String get historyDeleteFailed => '刪除紀錄失敗';

  @override
  String get historyAndGoalDeleteFailed => '刪除紀錄與目標失敗';

  @override
  String get tutorialDisplayFailed => '無法顯示教學';

  @override
  String get tips => '小提示';

  @override
  String get tipsContent =>
      '• 目標會顯示在首頁圖表中\n• 從小目標開始，依自己的步調逐步提高\n• 每次正確選擇最多可獲得6分';

  @override
  String get backToHome => '回到主畫面';

  @override
  String get tutorialSkip => '略過';

  @override
  String get tutorialGoalAndPoints => '目標與目前點數';

  @override
  String get tutorialGoalDescription => '外圈代表目標，內圈代表總點數。越接近目標，圓環就越滿。';

  @override
  String get tutorialOneMinuteTraining => '1 分鐘訓練';

  @override
  String get tutorialTrainingDescription => '開始 1 分鐘的小遊戲。從 4 個選項中選出正向的圖片或好習慣。';

  @override
  String get tutorialScoreProgress => '分數變化';

  @override
  String get tutorialScoreDescription => '查看已獲得分數的詳細資訊。';

  @override
  String get tutorialSettingsAndData => '設定與資料管理';

  @override
  String get tutorialSettingsDescription => '可變更目標值、查看 App 資訊並重設資料。';

  @override
  String get appIntroAttentionBiasTitle => '關於注意力偏誤';

  @override
  String get appIntroAttentionBiasContent => '焦慮較強時，我們會不自覺地只注意負面的事物。';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMint 的角色';

  @override
  String get appIntroFocusMintRoleContent => '透過簡短的遊戲，練習將注意力轉向正向的圖片。';

  @override
  String get appIntroScientificEvidenceTitle => '關於這項練習';

  @override
  String get appIntroScientificEvidenceContent =>
      '練習尋找正向的圖片。FocusMint用於日常自我照顧，不提供醫療或治療服務。每個人的感受和效果可能不同。';

  @override
  String get appIntroExpectedEffectsTitle => '可以練習的內容';

  @override
  String get appIntroEffect1 => '尋找正向的圖片';

  @override
  String get appIntroEffect2 => '留意身邊的笑容';

  @override
  String get appIntroEffect3 => '建立簡短的每日習慣';

  @override
  String get appIntroHowToUse => '查看使用方式';

  @override
  String get pointsEarned => '獲得點數！';

  @override
  String get yourScore => '您的分數';

  @override
  String get totalPlayTime => '總遊玩時間';

  @override
  String get imageManagement => '圖片管理';

  @override
  String hiddenImagesCount(int count, int max) {
    return '已隱藏圖片：$count/$max';
  }

  @override
  String get unsavedChanges => '有尚未儲存的變更';

  @override
  String unsavedChangesMessage(Object count) {
    return '圖片顯示設定中有 $count 項尚未儲存的變更。';
  }

  @override
  String get unsavedChangesWarning => '現在關閉此畫面將會遺失變更。';

  @override
  String get discardChanges => '捨棄變更';

  @override
  String get saveAndExit => '儲存並離開';

  @override
  String settingsSaved(Object count) {
    return '已儲存 $count 項設定';
  }

  @override
  String get saveError => '儲存設定時發生錯誤';

  @override
  String get imageSettingsUpdated => '圖片設定已更新';

  @override
  String get allImages => '全部';

  @override
  String get positiveImages => '正向';

  @override
  String get negativeImages => '負向';

  @override
  String get smileImages => '笑容';

  @override
  String get vegetableImages => '營養食物';

  @override
  String get healthImages => '運動與交流';

  @override
  String get sadImages => '憤怒、悲傷與擔憂';

  @override
  String get badFoodImages => '速食與甜食';

  @override
  String get badImages => '不健康的習慣';

  @override
  String get imageManagementHint => '點一下即可切換圖片的顯示/隱藏。最多可隱藏 15 張圖片。';

  @override
  String get unsaved => '未儲存';

  @override
  String get save => '儲存';

  @override
  String get hiddenImages => '已隱藏';

  @override
  String get noHiddenImages => '沒有隱藏的圖片';

  @override
  String get settingsLoadFailed => '載入設定失敗';

  @override
  String imagesAdded(int count) {
    return '已加入 $count 張圖片';
  }

  @override
  String get imageAddFailed => '加入圖片失敗';

  @override
  String get imageSelectionFailed => '選取圖片失敗';

  @override
  String get settingsChangeFailed => '變更設定失敗';

  @override
  String groupTitle(String name) {
    return '群組：$name';
  }

  @override
  String get displayToggle => '顯示切換';

  @override
  String imageCount(int count) {
    return '$count 張';
  }

  @override
  String get noticeTitle => '注意事項';

  @override
  String get notice1 => '新增了自訂圖片功能！';

  @override
  String get notice2 => '您可以在設定畫面加入自己的圖片';

  @override
  String get notice3 => '詳情請見設定畫面';

  @override
  String get customImageTitle => '自訂圖片';

  @override
  String get customImageSubtitle => '加入並管理自己的圖片';

  @override
  String get addCustomImages => '加入自訂圖片';

  @override
  String get selectImages => '選取圖片';

  @override
  String get unknownImage => '不明的圖片';

  @override
  String get customImageSettings => '自訂圖片設定';

  @override
  String get useCustomImages => '使用自訂圖片';

  @override
  String get useCustomImagesDescription =>
      '使用自己的圖片進行練習。開啟下方的混合選項，即可同時使用應用程式內建圖片。';

  @override
  String get groupSettings => '群組設定';

  @override
  String get minOneGroupRequired => '至少需啟用一個群組';

  @override
  String get settingsLoadFailedMessage => '載入設定失敗';

  @override
  String get customImageNotice1 => '啟用群組後，圖片會在各群組內隨機顯示。';

  @override
  String get customImageNotice2 =>
      '使用者上傳並設定的圖片不會與開發者或第三方分享，僅儲存在裝置上 App 的儲存空間內。';

  @override
  String get customImageNotice3 => '因此可以離線使用。';

  @override
  String get customImageNotice4 => '新增大量圖片會占用儲存空間。如遇問題，請在設定中關閉自訂圖片，或刪除不再使用的圖片。';

  @override
  String get customImageNotice5 => '刪除 App 時，已設定的圖片也會一併刪除。';

  @override
  String get customImageRequirementNotMet =>
      '若要使用自訂圖片，已啟用的群組中至少需要 1 張「好」圖片和 3 張「不好」圖片。';

  @override
  String get customImageRequirement =>
      '若要使用自訂圖片，已啟用的群組中至少需要 1 張「好」圖片和 3 張「不好」圖片。';

  @override
  String get sunnyWeather => '好';

  @override
  String get rainyWeather => '不好';

  @override
  String get addImages => '加入圖片';

  @override
  String get imageDeleted => '已刪除圖片';

  @override
  String get imageDeleteFailed => '刪除圖片失敗';

  @override
  String get deleteImageTitle => '刪除圖片';

  @override
  String get deleteImageMessage => '確定要刪除這張圖片嗎？此操作無法復原。';

  @override
  String groupImageTitle(int groupId, String weather) {
    return '群組 $groupId $weather圖片';
  }

  @override
  String registeredCount(int count) {
    return '已註冊：$count 張';
  }

  @override
  String get noImagesRegistered => '尚未註冊任何圖片';

  @override
  String get imagePreview => '圖片預覽';

  @override
  String get close => '關閉';

  @override
  String get contactEmailSubject => 'FocusMint - 聯絡我們';

  @override
  String get contactEmailBody => '請寫下您的意見或問題。';

  @override
  String get mixWithBuiltInImages => '與內建圖片混合使用';

  @override
  String get mixWithBuiltInImagesDescription => '同時使用內建圖片和自己的圖片';

  @override
  String get supportIntro =>
      '匿名聯絡開發者，歡迎提出問題或建議。每天可傳送3則訊息。開發者每次回覆後，可傳送訊息數將恢復為3則。';

  @override
  String get supportReceived => '已收到訊息。我們通常會在2至3天內回覆。';

  @override
  String get supportComposer => '輸入訊息';

  @override
  String get supportSend => '傳送';

  @override
  String get supportRetry => '重試';

  @override
  String get supportSent => '已傳送';

  @override
  String get supportUnsent => '未傳送 · 已儲存在此裝置上';

  @override
  String get supportAttach => '附加圖片';

  @override
  String get supportRemoveImage => '移除圖片';

  @override
  String get supportImage => '附件';

  @override
  String get supportClear => '刪除紀錄';

  @override
  String get supportClearConfirm =>
      '要刪除這段對話嗎？未傳送的草稿和伺服器上的紀錄也會刪除。此操作不會恢復可傳送訊息數。';

  @override
  String get supportQuota => '今天的3則訊息已用完。請明天或收到開發者回覆後再傳送。';

  @override
  String get supportConnectionError => '無法連線。已儲存的草稿尚未傳送。';

  @override
  String get supportSendError => '傳送失敗。訊息已儲存在此裝置上，請重試。';

  @override
  String get supportStorageError => '儲存失敗，請重試。';

  @override
  String get supportClearError => '無法刪除紀錄。請檢查網路連線後重試。';

  @override
  String get supportImageError => '無法載入圖片。請選擇小於30 MB的圖片。';

  @override
  String supportRemaining(int count) {
    return '今日剩餘訊息數：$count';
  }

  @override
  String supportUnread(int count) {
    return '未讀回覆數：$count';
  }

  @override
  String get supportGuide => '說明';

  @override
  String get supportDeveloper => '開發者';

  @override
  String get supportPrivacy => '關於諮詢資料';

  @override
  String get breathingTitle => '放慢步調，呼吸一下';

  @override
  String get breathingHint => '以舒適的步調，\n跟隨肺部的輕柔變化呼吸。';

  @override
  String get breathingIn => '慢慢吸氣';

  @override
  String get breathingOut => '慢慢吐氣';

  @override
  String get breathingProgress => '呼吸引導進度';

  @override
  String get breathingResultHint => '結束後將自動顯示結果。';

  @override
  String get breathingSkip => '略過並查看結果';
}
