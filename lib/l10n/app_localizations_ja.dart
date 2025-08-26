// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'FocusMint';

  @override
  String get abmTraining => 'ABMトレーニング';

  @override
  String get welcomeMessage =>
      '注意バイアス修正（ABM）のポジティブ検索トレーニングへようこそ！\n5分間の集中トレーニングでポジティブ刺激への注意力を鍛えましょう。';

  @override
  String get startTraining => 'トレーニング開始';

  @override
  String get startTrainingDescription => '5分間のトレーニングセッションを開始します';

  @override
  String get startButton => 'スタート';

  @override
  String get aboutTraining => 'トレーニングについて';

  @override
  String get sessionTime => 'セッション時間';

  @override
  String get sessionDuration => '5分間';

  @override
  String get trialCount => '試行数';

  @override
  String get trialRange => '120-160回';

  @override
  String get difficultyAdjustment => '難易度調整';

  @override
  String get difficultyMethod => '自動調整（1-up/2-down）';

  @override
  String get scoreEvaluation => 'スコア評価';

  @override
  String get bisScore => 'BIS（Balanced Integration Score）';

  @override
  String get noRecentSessions => '過去のセッションはありません';

  @override
  String get startFirstSession => '最初のトレーニングセッションを始めてみましょう！';

  @override
  String get recentSessions => '過去のセッション';

  @override
  String moreSessionsCount(int count) {
    return '他$count件のセッション';
  }

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String daysAgo(int days) {
    return '$days日前';
  }

  @override
  String get trialUnit => '試行';

  @override
  String get dataLoadError => 'データの読み込みに失敗しました';

  @override
  String get training => 'トレーニング';

  @override
  String trialCountLabel(int count) {
    return '試行: $count';
  }

  @override
  String difficultyLabel(String level) {
    return '難易度: $level';
  }

  @override
  String recentAccuracyLabel(String accuracy) {
    return '最近の正答率: $accuracy%';
  }

  @override
  String get preparingSession => 'セッションを準備中...';

  @override
  String get trainingStart => 'トレーニング開始';

  @override
  String get findSmileyInstruction => '笑顔を素早く見つけてタップしてください';

  @override
  String get sessionComplete => 'セッション完了！';

  @override
  String get showingResults => '結果を表示しています...';

  @override
  String get sessionAborted => 'セッションが中断されました';

  @override
  String get canStartNewSession => 'いつでも新しいセッションを開始できます';

  @override
  String get returnHome => 'ホームに戻る';

  @override
  String get trainingInterruption => 'トレーニング中断';

  @override
  String get interruptionMessage => 'トレーニングを中断しますか？\n進行状況は保存されません。';

  @override
  String get continueButton => '続行';

  @override
  String get interruptButton => '中断';

  @override
  String get sessionResults => 'セッション結果';

  @override
  String get sessionScore => 'セッションスコア';

  @override
  String bisScoreLabel(String score) {
    return 'BISスコア: $score';
  }

  @override
  String get performanceStats => 'パフォーマンス統計';

  @override
  String get accuracy => '正答率';

  @override
  String get trials => '試行数';

  @override
  String get reactionTime => '反応時間';

  @override
  String get consecutiveCorrect => '連続正答';

  @override
  String get sessionDetails => 'セッション詳細';

  @override
  String get startTime => '開始時刻';

  @override
  String get endTime => '終了時刻';

  @override
  String get sessionDurationLabel => 'セッション時間';

  @override
  String get minutesUnit => '分';

  @override
  String get avgReactionTime => '平均反応時間';

  @override
  String get iesScore => 'IESスコア';

  @override
  String get difficultyBreakdown => '難易度別試行数';

  @override
  String get easy => 'Easy';

  @override
  String get medium => 'Medium';

  @override
  String get hard => 'Hard';

  @override
  String get trialsSuffix => '試行';

  @override
  String get startNewSession => '新しいセッションを開始';

  @override
  String get goHome => 'ホームに戻る';

  @override
  String get excellentResult => '素晴らしい結果です！';

  @override
  String get goodJob => 'よくできました！';

  @override
  String get keepPracticing => '練習を続けましょう';

  @override
  String get takeYourTime => 'ゆっくり確実に';

  @override
  String get noStimuliAvailable => '刺激が利用できません';

  @override
  String get invalidGridSize => '無効なグリッドサイズ';

  @override
  String get happy => 'Happy';

  @override
  String get angry => 'Angry';

  @override
  String get fear => 'Fear';

  @override
  String get sad => 'Sad';

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
}
