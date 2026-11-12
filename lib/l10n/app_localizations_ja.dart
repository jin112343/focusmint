// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => '現在のポイント';

  @override
  String goalLabel(int goal) {
    return '目標: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return '残り: $remaining';
  }

  @override
  String get goalAchieved => '🎉 目標達成！';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'ポジティブな画像を見つける練習をしましょう。';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return '残り時間: $minutes分$seconds秒';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return '残り時間: $seconds秒';
  }

  @override
  String scoreLabel(String score) {
    return 'スコア: $score ポイント';
  }

  @override
  String get imagePreparationMessage => '画像を準備中...';

  @override
  String get noStimuliAvailable => '刺激が利用できません';

  @override
  String get invalidGridSize => '無効なグリッドサイズ';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'スタート中...';

  @override
  String get excellentPerformance => '素晴らしいパフォーマンス！';

  @override
  String get greatJob => 'よくできました！';

  @override
  String get goodPerformance => '良いパフォーマンス';

  @override
  String get keepPracticingFeedback => '練習を続けてください';

  @override
  String get takeYourTimeFeedback => 'ゆっくり確実に';

  @override
  String get happy => 'Happy';

  @override
  String get angry => 'Angry';

  @override
  String get fear => 'Fear';

  @override
  String get sad => 'Sad';

  @override
  String get historyPageTitle => 'これまでの記録';

  @override
  String get dataLoading => 'データを読み込み中...';

  @override
  String get pointsHistory => 'ポイント獲得履歴';

  @override
  String get weekly => '週ごと';

  @override
  String get monthly => '月ごと';

  @override
  String get noDataAvailable => 'データがありません';

  @override
  String get goalAchievementRate => '目標達成率';

  @override
  String get scoreStatistics => 'スコア統計';

  @override
  String get bestScore => 'ベストスコア';

  @override
  String get totalScore => '総合スコア';

  @override
  String get trainingTime => 'トレーニング時間';

  @override
  String get totalTrainingTime => '累計トレーニング時間';

  @override
  String get detailedStatistics => '詳細統計';

  @override
  String get averageScorePerMinute => '1分あたりの平均スコア';

  @override
  String get pointsToGoal => '目標まで残り';

  @override
  String get goalSetting => '目標設定';

  @override
  String get secondsUnit => '秒';

  @override
  String get minutesUnit => '分';

  @override
  String get hoursUnit => '時間';

  @override
  String get pointsUnit => 'ポイント';

  @override
  String get monthSuffix => '月';

  @override
  String get sundayShort => '日';

  @override
  String get mondayShort => '月';

  @override
  String get tuesdayShort => '火';

  @override
  String get wednesdayShort => '水';

  @override
  String get thursdayShort => '木';

  @override
  String get fridayShort => '金';

  @override
  String get saturdayShort => '土';

  @override
  String get settingsTitle => '設定';

  @override
  String get goalPointsSetting => '目標ポイント設定';

  @override
  String currentGoalPoints(int points) {
    return '現在の目標: $points ポイント';
  }

  @override
  String get newGoalPointsLabel => '新しい目標ポイント';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'ポイント';

  @override
  String get saveGoalButton => '目標を保存';

  @override
  String goalSetTo(int points) {
    return '目標ポイントを$pointsに設定しました';
  }

  @override
  String get enterGoalPoints => '目標ポイントを入力してください';

  @override
  String get enterValidNumber => '正しい数値を入力してください（1から99999999の範囲）';

  @override
  String get saveFailed => '一部の設定の保存に失敗しました';

  @override
  String get emailOpenFailed => 'メールアプリを開けませんでした';

  @override
  String get pageOpenFailed => 'ページを開けませんでした';

  @override
  String get appInfoSupport => 'アプリ情報・サポート';

  @override
  String get contactUs => 'お問い合わせ';

  @override
  String get contactUsSubtitle => 'ご意見・ご質問をお聞かせください';

  @override
  String get termsOfService => '利用規約';

  @override
  String get termsSubtitle => 'アプリの利用規約をご確認ください';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get privacySubtitle => 'プライバシー情報の取り扱いについて';

  @override
  String get tutorialTitle => 'チュートリアル';

  @override
  String get tutorialSubtitle => 'アプリの使い方を確認する';

  @override
  String get dataManagement => 'データ管理';

  @override
  String get deleteHistory => '履歴の削除';

  @override
  String get deleteHistorySubtitle => 'トレーニング履歴のみを削除します（目標ポイントは保持）';

  @override
  String get deleteHistoryAndGoal => '履歴と目標の削除';

  @override
  String get deleteHistoryAndGoalSubtitle => '全ての履歴と目標ポイントを削除します';

  @override
  String get deleteHistoryConfirmTitle => '履歴の削除';

  @override
  String get deleteHistoryConfirmMessage =>
      '本当に全てのトレーニング履歴を削除しますか？\n\n※目標ポイントは保持されます';

  @override
  String get deleteHistoryAndGoalConfirmTitle => '履歴と目標の削除';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      '本当に全ての履歴と目標ポイントを削除しますか？\n\n※この操作は元に戻せません';

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get historyDeleted => '履歴を削除しました';

  @override
  String get historyAndGoalDeleted => '履歴と目標を削除しました';

  @override
  String get historyDeleteFailed => '履歴の削除に失敗しました';

  @override
  String get historyAndGoalDeleteFailed => '履歴と目標の削除に失敗しました';

  @override
  String get tutorialDisplayFailed => 'チュートリアルの表示に失敗しました';

  @override
  String get tips => 'ヒント';

  @override
  String get tipsContent =>
      '• 目標はホーム画面のグラフに表示されます\n• 小さな目標から始め、自分のペースで増やしましょう\n• 正しい選択1回につき、最大6ポイント獲得できます';

  @override
  String get backToHome => 'ホームへ戻る';

  @override
  String get tutorialSkip => 'スキップ';

  @override
  String get tutorialGoalAndPoints => '目標と現在のポイント';

  @override
  String get tutorialGoalDescription => '外側が目標、内側が合計ポイント。目標に近づくほど円が満ちていきます。';

  @override
  String get tutorialOneMinuteTraining => '1分トレーニング';

  @override
  String get tutorialTrainingDescription =>
      '押すと1分間のゲーム開始。4択からポジティブな画像や良い習慣を選びます。';

  @override
  String get tutorialScoreProgress => 'スコアの推移';

  @override
  String get tutorialScoreDescription => 'これまでの獲得スコアの詳細を確認できます。';

  @override
  String get tutorialSettingsAndData => '設定とデータ管理';

  @override
  String get tutorialSettingsDescription => '目標値の変更、アプリ情報やデータリセットができます。';

  @override
  String get appIntroAttentionBiasTitle => '注意バイアスについて';

  @override
  String get appIntroAttentionBiasContent =>
      '不安が強いと、無意識にネガティブなものばかりに目がいきやすくなります。';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMint の役割';

  @override
  String get appIntroFocusMintRoleContent => 'ポジティブな画像へ注意を向ける練習のための、短いゲームです。';

  @override
  String get appIntroScientificEvidenceTitle => 'この練習について';

  @override
  String get appIntroScientificEvidenceContent =>
      'ポジティブな画像を見つける練習です。FocusMintはセルフケアのためのアプリであり、医療行為や治療を提供するものではありません。感じ方には個人差があります。';

  @override
  String get appIntroExpectedEffectsTitle => '練習できること';

  @override
  String get appIntroEffect1 => 'ポジティブな画像を探す';

  @override
  String get appIntroEffect2 => '周囲の笑顔に目を向ける';

  @override
  String get appIntroEffect3 => '毎日の短い習慣をつくる';

  @override
  String get appIntroHowToUse => '使い方を見る';

  @override
  String get pointsEarned => 'ポイント獲得！';

  @override
  String get yourScore => 'あなたのスコア';

  @override
  String get totalPlayTime => '総プレイ時間';

  @override
  String get imageManagement => '画像管理';

  @override
  String hiddenImagesCount(int count, int max) {
    return '非表示画像: $count/$max';
  }

  @override
  String get unsavedChanges => '未保存の変更があります';

  @override
  String unsavedChangesMessage(Object count) {
    return '画像の表示設定に$count件の未保存の変更があります。';
  }

  @override
  String get unsavedChangesWarning => 'このまま画面を閉じると変更が失われます。';

  @override
  String get discardChanges => '変更を破棄';

  @override
  String get saveAndExit => '保存して終了';

  @override
  String settingsSaved(Object count) {
    return '$count件の設定を保存しました';
  }

  @override
  String get saveError => '設定の保存中にエラーが発生しました';

  @override
  String get imageSettingsUpdated => '画像設定が更新されました';

  @override
  String get allImages => '全て';

  @override
  String get positiveImages => 'ポジティブ';

  @override
  String get negativeImages => 'ネガティブ';

  @override
  String get smileImages => '笑顔';

  @override
  String get vegetableImages => '栄養のある食事';

  @override
  String get healthImages => '運動・交流';

  @override
  String get sadImages => '怒り・悲しみなど';

  @override
  String get badFoodImages => 'ジャンク・甘いもの';

  @override
  String get badImages => '負担のある習慣';

  @override
  String get imageManagementHint => 'タップして画像の表示/非表示を切り替えられます。最大15枚まで非表示にできます。';

  @override
  String get unsaved => '未保存';

  @override
  String get save => '保存';

  @override
  String get hiddenImages => '非表示';

  @override
  String get noHiddenImages => '非表示にした画像はありません';

  @override
  String get settingsLoadFailed => '設定の読み込みに失敗しました';

  @override
  String imagesAdded(int count) {
    return '$count枚の画像を追加しました';
  }

  @override
  String get imageAddFailed => '画像の追加に失敗しました';

  @override
  String get imageSelectionFailed => '画像の選択に失敗しました';

  @override
  String get settingsChangeFailed => '設定の変更に失敗しました';

  @override
  String groupTitle(String name) {
    return 'グループ: $name';
  }

  @override
  String get displayToggle => '表示切り替え';

  @override
  String imageCount(int count) {
    return '$count枚';
  }

  @override
  String get noticeTitle => '注意事項';

  @override
  String get notice1 => 'カスタム画像機能を追加しました！';

  @override
  String get notice2 => '設定画面から自分の画像を追加できます';

  @override
  String get notice3 => '詳細は設定画面をご確認ください';

  @override
  String get customImageTitle => 'カスタム画像';

  @override
  String get customImageSubtitle => '自分の画像を追加・管理';

  @override
  String get addCustomImages => 'カスタム画像を追加';

  @override
  String get selectImages => '画像を選択';

  @override
  String get unknownImage => '不明な画像';

  @override
  String get customImageSettings => 'カスタム画像設定';

  @override
  String get useCustomImages => '自分のカスタム画像を使う';

  @override
  String get useCustomImagesDescription =>
      '自分の画像をトレーニングに使用します。下のミックス設定で既存の画像も使用できます。';

  @override
  String get groupSettings => 'グループ別設定';

  @override
  String get minOneGroupRequired => '最低1つのグループは有効にしておく必要があります';

  @override
  String get settingsLoadFailedMessage => '設定の読み込みに失敗しました';

  @override
  String get customImageNotice1 => '各グループでオンの場合はそのグループごとにランダムで表示される。';

  @override
  String get customImageNotice2 =>
      'ユーザーがアップロードしてセットした画像は開発者や第三者に共有されず、端末のアプリ領域にのみ保存される。';

  @override
  String get customImageNotice3 => 'そのためオフラインでも使えます。';

  @override
  String get customImageNotice4 =>
      '画像を多く追加すると端末の保存容量を使います。問題が起きた場合は、設定でカスタム画像をオフにするか、不要な画像を削除してください。';

  @override
  String get customImageNotice5 => 'アプリを消すと、セットされた画像は消去されます。';

  @override
  String get customImageRequirementNotMet =>
      'カスタム画像を使用するには、有効なグループに良い画像1枚以上、よくない画像3枚以上が必要です。';

  @override
  String get customImageRequirement =>
      'カスタム画像を使用するには、有効なグループに良い画像1枚以上、よくない画像3枚以上が必要です。';

  @override
  String get sunnyWeather => '良い';

  @override
  String get rainyWeather => 'よくない';

  @override
  String get addImages => '画像を追加';

  @override
  String get imageDeleted => '画像を削除しました';

  @override
  String get imageDeleteFailed => '画像の削除に失敗しました';

  @override
  String get deleteImageTitle => '画像を削除';

  @override
  String get deleteImageMessage => 'この画像を削除しますか？この操作は元に戻せません。';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'グループ$groupId $weather画像';
  }

  @override
  String registeredCount(int count) {
    return '登録枚数: $count枚';
  }

  @override
  String get noImagesRegistered => '画像が登録されていません';

  @override
  String get imagePreview => '画像プレビュー';

  @override
  String get close => '閉じる';

  @override
  String get contactEmailSubject => 'FocusMint-お問い合わせ';

  @override
  String get contactEmailBody => 'ご意見・お問い合わせをお書きください。';

  @override
  String get mixWithBuiltInImages => '既存の画像とミックス使用';

  @override
  String get mixWithBuiltInImagesDescription => '既存の画像と自分の画像を混ぜて使用します';

  @override
  String get supportIntro =>
      '匿名でやりとりできます。お問い合わせや改善案を気軽にどうぞ。送信は1日3回までです。開発者から返信が届くたびに、送れる回数が3回に戻ります。';

  @override
  String get supportReceived => 'メッセージを受け付けました。確認して、通常2〜3日を目安に返信します。';

  @override
  String get supportComposer => 'メッセージを入力';

  @override
  String get supportSend => '送信';

  @override
  String get supportRetry => '再試行';

  @override
  String get supportSent => '送信済み';

  @override
  String get supportUnsent => '未送信・この端末に保存';

  @override
  String get supportAttach => '画像を添付';

  @override
  String get supportRemoveImage => '画像を外す';

  @override
  String get supportImage => '添付画像';

  @override
  String get supportClear => '履歴を削除';

  @override
  String get supportClearConfirm =>
      'この端末のお問い合わせ履歴を削除しますか？未送信の内容とサーバー上の履歴も削除します。送信できる回数は戻りません。';

  @override
  String get supportQuota => '今日は3回までです。明日、または開発者からの返信後にお送りください。';

  @override
  String get supportConnectionError => '接続できませんでした。保存した内容はまだ送信されていません。';

  @override
  String get supportSendError => '送信できませんでした。内容はこの端末に保存しています。再試行してください。';

  @override
  String get supportStorageError => '保存できませんでした。もう一度お試しください。';

  @override
  String get supportClearError => '履歴を削除できませんでした。接続を確認して再試行してください。';

  @override
  String get supportImageError => '画像を読み込めませんでした。30MB以下の画像をお選びください。';

  @override
  String supportRemaining(int count) {
    return '今日あと$count回';
  }

  @override
  String supportUnread(int count) {
    return '未読の返信 $count件';
  }

  @override
  String get supportGuide => 'ご案内';

  @override
  String get supportDeveloper => '開発者';

  @override
  String get supportPrivacy => 'お問い合わせのデータについて';

  @override
  String get breathingTitle => 'ひと呼吸おきましょう';

  @override
  String get breathingHint => '無理のないペースで、\n肺の動きに合わせて呼吸しましょう。';

  @override
  String get breathingIn => 'ゆっくり吸って';

  @override
  String get breathingOut => 'ゆっくり吐いて';

  @override
  String get breathingProgress => '呼吸ガイドの進行状況';

  @override
  String get breathingResultHint => '終わると自動で結果を表示します';

  @override
  String get breathingSkip => 'スキップして結果へ';
}
