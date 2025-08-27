import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusmint/pages/training_page.dart';
import 'package:focusmint/pages/result_page.dart';
import 'package:focusmint/pages/settings_page.dart';
import 'package:focusmint/pages/history_page.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/speed_score_service.dart';
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
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => _showSettingsDialog(context),
        ),
        title: const Text('MOOD MINT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () => _showStatsPage(context, ref),
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
                        : _buildTotalScoreChart(),
                    const SizedBox(height: 60),
                    // STARTボタン
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ElevatedButton(
                        onPressed: () => _startTraining(context, ref),
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
                'Reduce stress and boost your mood.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // 5 mins per day
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.timer,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  '1 min per day',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
    
    // 設定画面から戻ってきたときにデータを再読み込み
    if (result != null || mounted) {
      _loadData();
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
                'CURRENT POINTS',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Goal: $_goalPoints',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mintGreen,
                ),
              ),
              if (remainingScore > 0)
                Text(
                  'Remaining: $remainingScore',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                )
              else
                const Text(
                  '🎉 Goal Achieved!',
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