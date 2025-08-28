import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/speed_score_service.dart';
import 'package:focusmint/services/database_service.dart';
import 'package:focusmint/pages/web_view_page.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchEmail() async {
    const String email = 'mizoijin.0201@gmail.com';
    const String subject = 'FocusMint-お問い合わせ';
    const String body = 'ご意見・お問い合わせをお書きください。';
    
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        _showErrorMessage('メールアプリを開けませんでした');
      }
    } catch (e, stackTrace) {
      _logger.e('Failed to launch email', 
          error: e, stackTrace: stackTrace);
      _showErrorMessage('メールアプリを開けませんでした');
    }
  }

  void _openWebView(String url, String title) {
    try {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WebViewPage(
            url: url,
            title: title,
          ),
        ),
      );
    } catch (e, stackTrace) {
      _logger.e('Failed to open WebView', 
          error: e, stackTrace: stackTrace);
      _showErrorMessage('ページを開けませんでした');
    }
  }

  Future<void> _showDeleteDataDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'データ削除',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            '本当に全てのデータを削除しますか？\n\n※目標ポイントは保持されます',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'キャンセル',
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                '削除',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteAllData();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAllData() async {
    try {
      final databaseService = DatabaseService.instance;
      final currentGoal = await _speedScoreService.getGoalPoints();
      
      // データベースのデータを削除
      await databaseService.clearAllData();
      
      // SpeedScoreServiceのデータも削除（目標ポイント以外）
      await _speedScoreService.clearAllDataExceptGoal();
      
      // 目標ポイントを再設定
      await _speedScoreService.setGoalPoints(currentGoal);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('データを削除しました'),
            backgroundColor: AppColors.mintGreen,
          ),
        );
      }
    } catch (e, stackTrace) {
      _logger.e('Failed to delete all data', 
          error: e, stackTrace: stackTrace);
      _showErrorMessage('データ削除に失敗しました');
    }
  }

  /// チュートリアルを表示（ホーム画面に戻ってから）
  void _showTutorial() async {
    try {
      // ホーム画面に戻って結果を受け取る
      final result = Navigator.of(context).pop('show_tutorial');
      
      // 設定ページから戻る際に'show_tutorial'を返すことで、ホーム画面でチュートリアルを表示
    } catch (e, stackTrace) {
      _logger.e('Failed to show tutorial', 
          error: e, stackTrace: stackTrace);
      _showErrorMessage('チュートリアルの表示に失敗しました');
    }
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDestructive 
                    ? Colors.red.shade50 
                    : AppColors.mintGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: isDestructive ? Colors.red : AppColors.mintGreen,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? Colors.red : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
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
            : SingleChildScrollView(
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
                  
                  // アプリ情報・サポートセクション
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
                                Icons.info_outline,
                                color: AppColors.mintGreen,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'アプリ情報・サポート',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          
                          // お問い合わせボタン
                          _buildSettingItem(
                            icon: Icons.email_outlined,
                            title: 'お問い合わせ',
                            subtitle: 'ご意見・ご質問をお聞かせください',
                            onTap: _launchEmail,
                          ),
                          
                          const Divider(height: 24),
                          
                          // 利用規約
                          _buildSettingItem(
                            icon: Icons.description_outlined,
                            title: '利用規約',
                            subtitle: 'アプリの利用規約をご確認ください',
                            onTap: () => _openWebView(
                              'https://jinpost.wordpress.com/2025/08/28/focusmint-%e5%88%a9%e7%94%a8%e8%a6%8f%e7%b4%84/',
                              '利用規約',
                            ),
                          ),
                          
                          const Divider(height: 24),
                          
                          // プライバシーポリシー
                          _buildSettingItem(
                            icon: Icons.privacy_tip_outlined,
                            title: 'プライバシーポリシー',
                            subtitle: 'プライバシー情報の取り扱いについて',
                            onTap: () => _openWebView(
                              'https://jinpost.wordpress.com/2025/08/28/focusmint-%e3%83%97%e3%83%a9%e3%82%a4%e3%83%90%e3%82%b7%e3%83%bc%e3%83%9d%e3%83%aa%e3%82%b7%e3%83%bc/',
                              'プライバシーポリシー',
                            ),
                          ),
                          
                          const Divider(height: 24),
                          
                          // チュートリアル
                          _buildSettingItem(
                            icon: Icons.help_outline,
                            title: 'チュートリアル',
                            subtitle: 'アプリの使い方を確認する',
                            onTap: _showTutorial,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // データ管理セクション
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
                                Icons.storage_outlined,
                                color: Colors.orange,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'データ管理',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          
                          // データ削除ボタン
                          _buildSettingItem(
                            icon: Icons.delete_outline,
                            title: 'データ削除',
                            subtitle: '全ての記録を削除します（目標ポイントは除く）',
                            onTap: _showDeleteDataDialog,
                            isDestructive: true,
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
                  
                  const SizedBox(height: 24),
                  
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