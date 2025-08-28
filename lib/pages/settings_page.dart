import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/speed_score_service.dart';
import 'package:focusmint/services/database_service.dart';
import 'package:focusmint/pages/web_view_page.dart';
import 'package:focusmint/l10n/app_localizations.dart';
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
      _showErrorMessage(AppLocalizations.of(context)!.enterGoalPoints);
      return;
    }

    final newGoal = int.tryParse(newGoalText);
    if (newGoal == null || newGoal <= 0 || newGoal > 99999999) {
      _showErrorMessage(AppLocalizations.of(context)!.enterValidNumber);
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
            content: Text(AppLocalizations.of(context)!.goalSetTo(newGoal)),
            backgroundColor: AppColors.mintGreen,
          ),
        );
        
        // 自動でホーム画面に遷移
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e, stackTrace) {
      _logger.e('Failed to save goal points', error: e, stackTrace: stackTrace);
      _showErrorMessage(AppLocalizations.of(context)!.saveFailed);
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
        _showErrorMessage(AppLocalizations.of(context)!.emailOpenFailed);
      }
    } catch (e, stackTrace) {
      _logger.e('Failed to launch email', 
          error: e, stackTrace: stackTrace);
      _showErrorMessage(AppLocalizations.of(context)!.emailOpenFailed);
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
      _showErrorMessage(AppLocalizations.of(context)!.pageOpenFailed);
    }
  }

  Future<void> _showDeleteDataDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.deleteDataConfirmTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            AppLocalizations.of(context)!.deleteDataConfirmMessage,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                AppLocalizations.of(context)!.delete,
                style: const TextStyle(
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
          SnackBar(
            content: Text(AppLocalizations.of(context)!.dataDeleted),
            backgroundColor: AppColors.mintGreen,
          ),
        );
      }
    } catch (e, stackTrace) {
      _logger.e('Failed to delete all data', 
          error: e, stackTrace: stackTrace);
      _showErrorMessage(AppLocalizations.of(context)!.dataDeleteFailed);
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
      _showErrorMessage(AppLocalizations.of(context)!.tutorialDisplayFailed);
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
          title: Text(AppLocalizations.of(context)!.settingsTitle),
          backgroundColor: AppColors.mintGreen,
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
                              Text(
                                AppLocalizations.of(context)!.goalPointsSetting,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)!.currentGoalPoints(_currentGoalPoints),
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _goalPointsController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.newGoalPointsLabel,
                              hintText: AppLocalizations.of(context)!.goalPointsHint,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixText: AppLocalizations.of(context)!.pointsUnit2,
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
                              child: Text(
                                AppLocalizations.of(context)!.saveGoalButton,
                                style: const TextStyle(
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
                              Text(
                                AppLocalizations.of(context)!.appInfoSupport,
                                style: const TextStyle(
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
                            title: AppLocalizations.of(context)!.contactUs,
                            subtitle: AppLocalizations.of(context)!.contactUsSubtitle,
                            onTap: _launchEmail,
                          ),
                          
                          const Divider(height: 24),
                          
                          // 利用規約
                          _buildSettingItem(
                            icon: Icons.description_outlined,
                            title: AppLocalizations.of(context)!.termsOfService,
                            subtitle: AppLocalizations.of(context)!.termsSubtitle,
                            onTap: () => _openWebView(
                              'https://jinpost.wordpress.com/2025/08/28/focusmint-%e5%88%a9%e7%94%a8%e8%a6%8f%e7%b4%84/',
                              AppLocalizations.of(context)!.termsOfService,
                            ),
                          ),
                          
                          const Divider(height: 24),
                          
                          // プライバシーポリシー
                          _buildSettingItem(
                            icon: Icons.privacy_tip_outlined,
                            title: AppLocalizations.of(context)!.privacyPolicy,
                            subtitle: AppLocalizations.of(context)!.privacySubtitle,
                            onTap: () => _openWebView(
                              'https://jinpost.wordpress.com/2025/08/28/focusmint-%e3%83%97%e3%83%a9%e3%82%a4%e3%83%90%e3%82%b7%e3%83%bc%e3%83%9d%e3%83%aa%e3%82%b7%e3%83%bc/',
                              AppLocalizations.of(context)!.privacyPolicy,
                            ),
                          ),
                          
                          const Divider(height: 24),
                          
                          // チュートリアル
                          _buildSettingItem(
                            icon: Icons.help_outline,
                            title: AppLocalizations.of(context)!.tutorialTitle,
                            subtitle: AppLocalizations.of(context)!.tutorialSubtitle,
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
                              Text(
                                AppLocalizations.of(context)!.dataManagement,
                                style: const TextStyle(
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
                            title: AppLocalizations.of(context)!.deleteData,
                            subtitle: AppLocalizations.of(context)!.deleteDataSubtitle,
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
                              Text(
                                AppLocalizations.of(context)!.tips,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            AppLocalizations.of(context)!.tipsContent,
                            style: const TextStyle(
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
                      label: Text(
                        AppLocalizations.of(context)!.backToHome,
                        style: const TextStyle(
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