import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/widgets/app_introduction_widget.dart';
import 'package:logger/logger.dart';

class TutorialServiceNew {
  static const String _tutorialCompletedKey = 'tutorial_completed';
  static final Logger _logger = Logger();
  
  /// チュートリアルが完了済みかチェック
  static Future<bool> isTutorialCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_tutorialCompletedKey) ?? false;
  }
  
  /// チュートリアル完了をマーク
  static Future<void> markTutorialCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_tutorialCompletedKey, true);
  }
  
  /// チュートリアルのリセット（開発・デバッグ用）
  static Future<void> resetTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tutorialCompletedKey);
  }
  
  /// ホーム画面のチュートリアルターゲットを作成（改良版）
  static List<TargetFocus> createHomeTutorialTargets({
    required GlobalKey startButtonKey,
    required GlobalKey statsButtonKey,
    required GlobalKey settingsButtonKey,
    required GlobalKey chartKey,
  }) {
    _logger.d('Tutorial: Creating targets with keys - chart: $chartKey, start: $startButtonKey, stats: $statsButtonKey, settings: $settingsButtonKey');
    return [
      // 1. 円グラフの説明
      TargetFocus(
        identify: "chart",
        keyTarget: chartKey,
        shape: ShapeLightFocus.Circle,
        radius: 15,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📊 目標と現在のポイント',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '外側が目標、内側が合計ポイント。目標に近づくほど円が満ちていきます。',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      // 2. STARTボタンの説明
      TargetFocus(
        identify: "start_button",
        keyTarget: startButtonKey,
        shape: ShapeLightFocus.Circle,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🎯 1分トレーニング',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '押すと1分間のゲーム開始。4択からポジティブな画像や良い習慣を選びます。',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      // 3. 統計ボタンの説明
      TargetFocus(
        identify: "stats_button",
        keyTarget: statsButtonKey,
        shape: ShapeLightFocus.Circle,
        radius: 8, // AppBarボタン用により小さい半径を設定
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📈 スコアの推移',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'これまでの獲得スコアの詳細を確認できます。',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      // 4. 設定ボタンの説明
      TargetFocus(
        identify: "settings_button",
        keyTarget: settingsButtonKey,
        shape: ShapeLightFocus.Circle,
        radius: 8, // AppBarボタン用により小さい半径を設定
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '⚙️ 設定とデータ管理',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '目標値の変更、アプリ情報やデータリセットができます。',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ];
  }
  
  /// アプリ説明ダイアログを表示してからチュートリアルを開始（改良版）
  static void showFullTutorial({
    required BuildContext context,
    required List<TargetFocus> targets,
    VoidCallback? onComplete,
  }) {
    AppIntroductionDialog.show(
      context,
      () => _showHomeTutorial(
        context: context,
        targets: targets,
        onComplete: onComplete,
      ),
    );
  }

  /// ホーム画面のチュートリアルを表示（改良版）
  static void _showHomeTutorial({
    required BuildContext context,
    required List<TargetFocus> targets,
    VoidCallback? onComplete,
  }) {
    late TutorialCoachMark tutorialCoachMark;
    
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black,
      textSkip: "スキップ",
      paddingFocus: 10,
      opacityShadow: 0.75,
      hideSkip: false,
      alignSkip: Alignment.bottomRight,
      // 実際のボタンタップを誘導する設定
      onClickTarget: (target) {
        _logger.d('Tutorial: Target clicked - ${target.identify}');
        // ターゲット要素（実際のボタン）がクリックされた場合のみ次に進む
        // これにより実際のボタンをタップするように誘導
        tutorialCoachMark.next();
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        _logger.d('Tutorial: Target with position clicked - ${target.identify}');
        // 実際のボタンがタップされた場合に次に進む
        tutorialCoachMark.next();
      },
      // onClickOverlay は無効化し、各TargetFocusのenableOverlayTabに任せる
      // onClickOverlay: (target) {
      //   _logger.d('Tutorial: Overlay clicked - ${target.identify}');
      //   tutorialCoachMark.next();
      // },
      onFinish: () {
        markTutorialCompleted();
        onComplete?.call();
      },
      onSkip: () {
        markTutorialCompleted();
        onComplete?.call();
        return true;
      },
    );
    
    tutorialCoachMark.show(context: context);
  }
}