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
  String get stressReductionMessage => 'ストレスを軽減し、気分を向上させます。';

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
  String get saveFailed => '保存に失敗しました';

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
  String get deleteData => 'データ削除';

  @override
  String get deleteDataSubtitle => '全ての記録を削除します（目標ポイントは除く）';

  @override
  String get deleteDataConfirmTitle => 'データ削除';

  @override
  String get deleteDataConfirmMessage => '本当に全てのデータを削除しますか？\n\n※目標ポイントは保持されます';

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get dataDeleted => 'データを削除しました';

  @override
  String get dataDeleteFailed => 'データ削除に失敗しました';

  @override
  String get tutorialDisplayFailed => 'チュートリアルの表示に失敗しました';

  @override
  String get tips => 'ヒント';

  @override
  String get tipsContent =>
      '• 目標ポイントはホーム画面の円グラフに反映されます\n• 小さな目標から始めて、達成したら徐々に上げていきましょう\n• 1回のセッションで最大6ポイント獲得できます';

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
  String get appIntroFocusMintRoleContent =>
      'ポジティブな画像を選ぶ練習で、自然と良いほうに注意を向けられるようになります。';

  @override
  String get appIntroScientificEvidenceTitle => '科学的根拠';

  @override
  String get appIntroScientificEvidenceContent =>
      '25分のトレーニングで不安・ストレスが大きく減少することが研究で確認されています。\n\n（例：Amir et al., 2009 Journal of Abnormal Psychology / Hakamata et al., 2010 Psychological Bulletin）';

  @override
  String get appIntroExpectedEffectsTitle => '期待できる効果';

  @override
  String get appIntroEffect1 => '不安や緊張の軽減';

  @override
  String get appIntroEffect2 => '周囲の笑顔に気づきやすくなる';

  @override
  String get appIntroEffect3 => '人付き合いが楽になる';

  @override
  String get appIntroHowToUse => '使い方を見る';

  @override
  String get pointsEarned => 'ポイント獲得！';

  @override
  String get yourScore => 'あなたのスコア';

  @override
  String get totalPlayTime => '総プレイ時間';
}
