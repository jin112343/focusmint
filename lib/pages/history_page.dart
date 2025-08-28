import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/speed_score_service.dart';
import 'package:logger/logger.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:focusmint/l10n/app_localizations.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  static final Logger _logger = Logger();
  
  double _bestScore = 0.0;
  double _totalTimeMinutes = 0.0;
  double _totalScore = 0.0;
  int _goalPoints = 1000;
  bool _isLoading = true;
  Map<String, int> _weeklyHistory = {};
  Map<String, int> _monthlyHistory = {};
  bool _showWeeklyChart = true; // true: 週ごと表示, false: 月ごと表示
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
      final goalPoints = await _speedScoreService.getGoalPoints();
      final weeklyHistory = await _speedScoreService.getWeeklyHistory();
      final monthlyHistory = await _speedScoreService.getMonthlyHistory();
      
      setState(() {
        _bestScore = bestScore;
        _totalTimeMinutes = totalTimeMinutes;
        _totalScore = totalScore;
        _goalPoints = goalPoints;
        _weeklyHistory = weeklyHistory;
        _monthlyHistory = monthlyHistory;
        _isLoading = false;
      });
      
      _logger.i('History statistics loaded: bestScore=$bestScore, totalTime=${totalTimeMinutes.toStringAsFixed(1)}min, totalScore=$totalScore');
    } catch (e, stackTrace) {
      _logger.e('Failed to load history statistics', error: e, stackTrace: stackTrace);
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _formatTime(double minutes, AppLocalizations l10n) {
    if (minutes < 1) {
      final seconds = (minutes * 60).round();
      return '$seconds${l10n.secondsUnit}';
    } else if (minutes < 60) {
      final mins = minutes.floor();
      final secs = ((minutes - mins) * 60).round();
      return secs > 0 ? '$mins${l10n.minutesUnit} $secs${l10n.secondsUnit}' : '$mins${l10n.minutesUnit}';
    } else {
      final hours = (minutes / 60).floor();
      final mins = (minutes % 60).floor();
      final secs = ((minutes % 1) * 60).round();
      
      String result = '$hours${l10n.hoursUnit}';
      if (mins > 0) result += ' $mins${l10n.minutesUnit}';
      if (secs > 0 && hours == 0) result += ' $secs${l10n.secondsUnit}';
      
      return result;
    }
  }

  double _calculateAchievementRate() {
    if (_goalPoints == 0) return 0.0;
    return (_totalScore / _goalPoints * 100).clamp(0.0, 100.0);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.historyPageTitle,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(
                    l10n.dataLoading,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 目標達成率カード
                  _buildAchievementCard(l10n),
                  const SizedBox(height: 24),
                  
                  // 履歴チャート
                  _buildHistoryChart(l10n),
                  const SizedBox(height: 24),
                  
                  // スコア統計カード
                  _buildScoreStatsCard(l10n),
                  const SizedBox(height: 24),
                  
                  // 時間統計カード
                  _buildTimeStatsCard(l10n),
                  const SizedBox(height: 24),
                  
                  // 詳細統計
                  _buildDetailedStatsCard(l10n),
                ],
              ),
            ),
    );
  }

  Widget _buildHistoryChart(AppLocalizations l10n) {
    final currentData = _showWeeklyChart ? _weeklyHistory : _monthlyHistory;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.pointsHistory,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  _buildChartToggleButton(
                    l10n.weekly,
                    _showWeeklyChart,
                    () => setState(() => _showWeeklyChart = true),
                  ),
                  const SizedBox(width: 8),
                  _buildChartToggleButton(
                    l10n.monthly,
                    !_showWeeklyChart,
                    () => setState(() => _showWeeklyChart = false),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: currentData.isEmpty
                ? Center(
                    child: Text(
                      l10n.noDataAvailable,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: _calculateChartWidth(currentData),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: _calculateMaxY(currentData),
                          barTouchData: BarTouchData(enabled: true),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTitlesWidget: (value, meta) {
                                  return _buildBottomTitle(value.toInt(), currentData);
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: _buildBarGroups(currentData),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartToggleButton(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mintGreen : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  double _calculateMaxY(Map<String, int> data) {
    if (data.isEmpty) return 10.0;
    final maxValue = data.values.reduce((a, b) => a > b ? a : b);
    return (maxValue * 1.2).ceilToDouble();
  }

  double _calculateChartWidth(Map<String, int> data) {
    if (data.isEmpty) return 300.0;
    // 各バーに80pxの幅を割り当て、最小幅を300pxに設定
    final barWidth = 80.0;
    final calculatedWidth = data.length * barWidth;
    return calculatedWidth < 300.0 ? 300.0 : calculatedWidth;
  }

  List<BarChartGroupData> _buildBarGroups(Map<String, int> data) {
    final entries = data.entries.toList();
    return entries.asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value.value;
      
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value.toDouble(),
            color: AppColors.mintGreen,
            width: 20,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildBottomTitle(int index, Map<String, int> data) {
    final entries = data.entries.toList();
    if (index >= entries.length) return const SizedBox.shrink();
    
    final l10n = AppLocalizations.of(context)!;
    final key = entries[index].key;
    String displayText;
    
    if (_showWeeklyChart) {
      // 週表示の場合、曜日を表示
      try {
        final date = DateTime.parse(key);
        final weekdays = [
          l10n.sundayShort,
          l10n.mondayShort,
          l10n.tuesdayShort,
          l10n.wednesdayShort,
          l10n.thursdayShort,
          l10n.fridayShort,
          l10n.saturdayShort,
        ];
        displayText = weekdays[date.weekday % 7];
      } catch (e) {
        // パースエラーの場合は日付の日の部分のみ表示
        final dateParts = key.split('-');
        if (dateParts.length == 3) {
          displayText = dateParts[2];
        } else {
          displayText = key;
        }
      }
    } else {
      // 月表示の場合、月の部分のみ表示（2024-03 -> 03）
      displayText = '${key.split('-').last}${l10n.monthSuffix}';
    }
    
    return Text(
      displayText,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildAchievementCard(AppLocalizations l10n) {
    final achievementRate = _calculateAchievementRate();
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mintGreen,
            AppColors.mintGreen.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.goalAchievementRate,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${achievementRate.toStringAsFixed(1)}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${_totalScore.toStringAsFixed(0)} / $_goalPoints ${l10n.pointsUnit}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: achievementRate / 100,
            backgroundColor: Colors.white30,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildScoreStatsCard(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.scoreStatistics,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  l10n.bestScore,
                  _bestScore.toStringAsFixed(2),
                  Icons.stars,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatItem(
                  l10n.totalScore,
                  _totalScore.toStringAsFixed(0),
                  Icons.score,
                  AppColors.mintGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeStatsCard(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.trainingTime,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildStatItem(
            l10n.totalTrainingTime,
            _formatTime(_totalTimeMinutes, l10n),
            Icons.timer,
            Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedStatsCard(AppLocalizations l10n) {
    final averageScore = _totalTimeMinutes > 0 ? _totalScore / _totalTimeMinutes : 0.0;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.detailedStatistics,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(l10n.averageScorePerMinute, '${averageScore.toStringAsFixed(1)} pt'),
          const SizedBox(height: 12),
          _buildDetailRow(l10n.pointsToGoal, '${(_goalPoints - _totalScore).toStringAsFixed(0)} pt'),
          const SizedBox(height: 12),
          _buildDetailRow(l10n.goalSetting, '$_goalPoints pt'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}