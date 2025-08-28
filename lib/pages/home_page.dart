import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusmint/pages/training_page.dart';
import 'package:focusmint/pages/result_page.dart';
import 'package:focusmint/pages/settings_page.dart';
import 'package:focusmint/pages/history_page.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/speed_score_service.dart';
import 'package:focusmint/services/tutorial_service_new.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with WidgetsBindingObserver {
  final SpeedScoreService _speedScoreService = SpeedScoreService();
  double _totalScore = 0.0;
  int _goalPoints = 1000;
  bool _isLoading = true;
  
  // チュートリアル用のキー
  final GlobalKey _startButtonKey = GlobalKey();
  final GlobalKey _statsButtonKey = GlobalKey();
  final GlobalKey _settingsButtonKey = GlobalKey();
  final GlobalKey _chartKey = GlobalKey();
  
  // チュートリアル状態管理
  bool _isTutorialMode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // アプリがフォアグラウンドに戻った際にデータを再読み込み
    if (state == AppLifecycleState.resumed) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    final totalScore = await _speedScoreService.getTotalScore();
    final goalPoints = await _speedScoreService.getGoalPoints();
    setState(() {
      _totalScore = totalScore;
      _goalPoints = goalPoints;
      _isLoading = false;
    });
    
    // データ読み込み完了後にチュートリアルをチェック
    _checkAndShowTutorial();
  }
  
  /// チュートリアルが初回かチェックして表示
  Future<void> _checkAndShowTutorial() async {
    final isCompleted = await TutorialServiceNew.isTutorialCompleted();
    if (!isCompleted && mounted) {
      // 少し遅延させてウィジェットが完全に描画されるまで待つ
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        _showTutorial();
      }
    }
  }
  
  /// チュートリアルを表示
  void _showTutorial() {
    setState(() {
      _isTutorialMode = true;
    });
    
    final targets = TutorialServiceNew.createHomeTutorialTargets(
      startButtonKey: _startButtonKey,
      statsButtonKey: _statsButtonKey,
      settingsButtonKey: _settingsButtonKey,
      chartKey: _chartKey,
    );
    
    TutorialServiceNew.showFullTutorial(
      context: context,
      targets: targets,
      onComplete: () {
        setState(() {
          _isTutorialMode = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('FOCUS MINT'),
        actions: [
          IconButton(
            key: _statsButtonKey,
            icon: const Icon(Icons.bar_chart),
            onPressed: () => _isTutorialMode ? null : _showStatsPage(context, ref),
          ),
          IconButton(
            key: _settingsButtonKey,
            icon: const Icon(Icons.settings),
            onPressed: () => _isTutorialMode ? null : _showSettingsDialog(context),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // メインコンテンツ：円グラフ
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 合計得点円グラフ
                    _isLoading
                        ? const CircularProgressIndicator()
                        : Container(
                            key: _chartKey,
                            child: _buildTotalScoreChart(),
                          ),
                    const SizedBox(height: 60),
                    // STARTボタン
                    SizedBox(
                      key: _startButtonKey,
                      width: 120,
                      height: 120,
                      child: ElevatedButton(
                        onPressed: () => _isTutorialMode ? null : _startTraining(context, ref),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mintGreen,
                          foregroundColor: Colors.white,
                          shape: const CircleBorder(),
                          elevation: 6,
                          shadowColor: AppColors.shadowColor,
                        ),
                        child: const Text(
                          'START',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 下部の説明テキスト（オプション）
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'ストレスを軽減し、気分を向上させます。',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    );
    
    // 設定画面から戻ってきたときの処理
    if (mounted) {
      if (result == 'show_tutorial') {
        // チュートリアル表示の要求があった場合
        await Future.delayed(const Duration(milliseconds: 300));
        if (mounted) {
          _showTutorial();
        }
      } else {
        // 通常の戻り処理：データを再読み込み
        _loadData();
      }
    }
  }

  void _showStatsPage(BuildContext context, WidgetRef ref) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HistoryPage(),
      ),
    );
    // 履歴画面から戻った際にデータを再読み込み
    if (mounted) {
      _loadData();
    }
  }

  void _startTraining(BuildContext context, WidgetRef ref) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TrainingPage(),
      ),
    );
    // トレーニング画面から戻った際にデータを再読み込み
    if (mounted) {
      _loadData();
    }
  }

  Widget _buildTotalScoreChart() {
    final int totalScoreInt = _totalScore.toInt();
    final int remainingScore = _goalPoints - totalScoreInt;
    
    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 円グラフ
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 2,
              centerSpaceRadius: 80,
              sections: [
                PieChartSectionData(
                  color: AppColors.mintGreen,
                  value: totalScoreInt.toDouble(),
                  title: '',
                  radius: 50,
                ),
                if (remainingScore > 0)
                  PieChartSectionData(
                    color: Colors.grey[300]!,
                    value: remainingScore.toDouble(),
                    title: '',
                    radius: 50,
                  ),
              ],
            ),
          ),
          // 中央のテキスト
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$totalScoreInt',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const Text(
                '現在のポイント',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '目標: $_goalPoints',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mintGreen,
                ),
              ),
              if (remainingScore > 0)
                Text(
                  '残り: $remainingScore',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                )
              else
                const Text(
                  '🎉 目標達成！',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}