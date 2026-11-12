import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusmint/models/session_summary.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/speed_score_service.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

class ResultPage extends ConsumerStatefulWidget {
  final SessionSummary? sessionSummary;
  final double? currentScore;

  const ResultPage({super.key, this.sessionSummary, this.currentScore});

  @override
  ConsumerState<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends ConsumerState<ResultPage> {
  static final Logger _logger = Logger();

  double _bestScore = 0.0;
  double _totalTimeMinutes = 0.0;
  double _totalScore = 0.0;
  bool _isLoading = true;
  late final SpeedScoreService _speedScoreService;

  @override
  void initState() {
    super.initState();
    _speedScoreService = SpeedScoreService();
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    try {
      final bestScore = await _speedScoreService.getBestScore();
      final totalTimeMinutes = await _speedScoreService.getTotalTimeMinutes();
      final totalScore = await _speedScoreService.getTotalScore();
      if (!mounted) return;

      setState(() {
        _bestScore = bestScore;
        _totalTimeMinutes = totalTimeMinutes;
        _totalScore = totalScore;
        _isLoading = false;
      });

      _logger.i(
        'Statistics loaded: bestScore=$bestScore, totalTime=${totalTimeMinutes.toStringAsFixed(1)}min, totalScore=$totalScore',
      );
    } catch (e, stackTrace) {
      _logger.e('Failed to load statistics', error: e, stackTrace: stackTrace);
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _formatTime(double minutes) {
    final strings = AppLocalizations.of(context)!;
    final seconds = (minutes * 60).round();
    final hours = seconds ~/ 3600;
    final mins = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    return [
      if (hours > 0) '$hours ${strings.hoursUnit}',
      if (mins > 0) '$mins ${strings.minutesUnit}',
      if (secs > 0 || seconds == 0) '$secs ${strings.secondsUnit}',
    ].join(' ');
  }

  @override
  Widget build(BuildContext context) {
    // 今回のスコア（currentScoreまたはsessionSummaryから取得）
    final double currentScore =
        widget.currentScore ?? widget.sessionSummary?.dynamicPoints ?? 0.0;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, bounds) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: bounds.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // メインスコア
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                currentScore.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context)!.yourScore,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 下部情報ブロック
                    if (_isLoading)
                      Column(
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)!.dataLoading,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      )
                    else
                      Column(
                        children: [
                          _buildInfoRow(
                            AppLocalizations.of(context)!.bestScore,
                            _bestScore.toStringAsFixed(2),
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow(
                            AppLocalizations.of(context)!.totalScore,
                            _totalScore.toStringAsFixed(2),
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow(
                            AppLocalizations.of(context)!.totalPlayTime,
                            _formatTime(_totalTimeMinutes),
                          ),
                          const SizedBox(height: 32),
                          // ホームへ戻るボタン
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              },
                              icon: const Icon(Icons.home, color: Colors.white),
                              label: Text(
                                AppLocalizations.of(context)!.backToHome,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 12,
      runSpacing: 4,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
