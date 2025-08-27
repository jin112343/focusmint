import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/speed_score_service.dart';
import 'package:logger/logger.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static final Logger _logger = Logger();
  final SpeedScoreService _speedScoreService = SpeedScoreService();
  final TextEditingController _goalPointsController = TextEditingController();
  int _currentGoalPoints = 1000;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCurrentGoal();
  }

  Future<void> _loadCurrentGoal() async {
    try {
      final goalPoints = await _speedScoreService.getGoalPoints();
      setState(() {
        _currentGoalPoints = goalPoints;
        _goalPointsController.text = goalPoints.toString();
        _isLoading = false;
      });
    } catch (e, stackTrace) {
      _logger.e('Failed to load goal points', error: e, stackTrace: stackTrace);
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveGoalPoints() async {
    final newGoalText = _goalPointsController.text.trim();
    if (newGoalText.isEmpty) {
      _showErrorMessage('目標ポイントを入力してください');
      return;
    }

    final newGoal = int.tryParse(newGoalText);
    if (newGoal == null || newGoal <= 0) {
      _showErrorMessage('正しい数値を入力してください（1以上）');
      return;
    }

    try {
      await _speedScoreService.setGoalPoints(newGoal);
      setState(() {
        _currentGoalPoints = newGoal;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('目標ポイントを$newGoalに設定しました'),
            backgroundColor: AppColors.mintGreen,
          ),
        );
        
        // 自動でホーム画面に遷移
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e, stackTrace) {
      _logger.e('Failed to save goal points', error: e, stackTrace: stackTrace);
      _showErrorMessage('保存に失敗しました');
    }
  }

  void _showErrorMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _goalPointsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // テキストフィールド以外をタップした時にフォーカスを外す
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('設定'),
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // 目標ポイント設定セクション
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.flag,
                                color: AppColors.mintGreen,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '目標ポイント設定',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '現在の目標: $_currentGoalPoints ポイント',
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _goalPointsController,
                            decoration: InputDecoration(
                              labelText: '新しい目標ポイント',
                              hintText: '1000',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixText: 'ポイント',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _saveGoalPoints,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mintGreen,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                '目標を保存',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // 使い方のヒント
                  Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lightbulb_outline,
                                color: Colors.orange,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'ヒント',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '• 目標ポイントはホーム画面の円グラフに反映されます\n• 小さな目標から始めて、達成したら徐々に上げていきましょう\n• 1回のセッションで最大6ポイント獲得できます',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // ホームへ戻るボタン
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'ホームへ戻る',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ],
                ),
              ),
      ),
    );
  }
}