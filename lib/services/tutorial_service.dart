import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/widgets/app_introduction_widget.dart';
import 'package:focusmint/l10n/app_localizations.dart';

class TutorialService {
  static const String _tutorialCompletedKey = 'tutorial_completed';
  
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
  
  /// ホーム画面のチュートリアルターゲットを作成
  static List<TargetFocus> createHomeTutorialTargets({
    required GlobalKey startButtonKey,
    required GlobalKey statsButtonKey,
    required GlobalKey settingsButtonKey,
    required GlobalKey chartKey,
    required BuildContext context,
    VoidCallback? onNext,
    VoidCallback? onFinish,
  }) {
    final l10n = AppLocalizations.of(context)!;
    return [
      // 1. 円グラフの説明
      TargetFocus(
        identify: "chart",
        keyTarget: chartKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.tutorialGoalAndPoints,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.tutorialGoalDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // 2. STARTボタンの説明
      TargetFocus(
        identify: "start_button",
        keyTarget: startButtonKey,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.tutorialOneMinuteTraining,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.tutorialTrainingDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // 3. 統計ボタンの説明
      TargetFocus(
        identify: "stats_button",
        keyTarget: statsButtonKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.tutorialScoreProgress,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.tutorialScoreDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // 4. 設定ボタンの説明
      TargetFocus(
        identify: "settings_button",
        keyTarget: settingsButtonKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.tutorialSettingsAndData,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.tutorialSettingsDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ];
  }
  
  /// アプリ説明ダイアログを表示してからチュートリアルを開始
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

  /// ホーム画面のチュートリアルを表示
  static void _showHomeTutorial({
    required BuildContext context,
    required List<TargetFocus> targets,
    VoidCallback? onComplete,
  }) {
    final l10n = AppLocalizations.of(context)!;
    TutorialCoachMark? tutorial;
    
    tutorial = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withValues(alpha: 0.8),
      textSkip: l10n.tutorialSkip,
      paddingFocus: 10,
      opacityShadow: 0.8,
      hideSkip: false,
      alignSkip: Alignment.topRight,
      onClickTarget: (target) {
        // ターゲット要素をタップしても次に進む
        tutorial?.next();
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        // ターゲット要素をタップしても次に進む
        tutorial?.next();
      },
      onClickOverlay: (target) {
        // オーバーレイをタップしても次に進む
        tutorial?.next();
      },
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
    
    tutorial.show(context: context);
  }
}