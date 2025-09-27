import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusmint/constants/app_colors.dart';

/// ダウンロード数表示用のウィジェット
/// 実際の数値はFirebase Analyticsコンソールで確認
class DownloadCounterWidget extends ConsumerWidget {
  const DownloadCounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.mintGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.mintGreen.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.download,
            size: 16,
            color: AppColors.mintGreen,
          ),
          const SizedBox(width: 8),
          Text(
            'ダウンロード数はFirebase Analyticsで確認できます',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.mintGreen,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// アプリ統計表示用のウィジェット
class AppStatsWidget extends ConsumerWidget {
  const AppStatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics,
                  color: AppColors.mintGreen,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'アプリ統計',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mintGreen,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildStatItem(
              '初回ダウンロード',
              'Firebase Analyticsで確認',
              Icons.download,
            ),
            const SizedBox(height: 8),
            _buildStatItem(
              'アクティブユーザー',
              'Firebase Analyticsで確認',
              Icons.people,
            ),
            const SizedBox(height: 8),
            _buildStatItem(
              'セッション数',
              'Firebase Analyticsで確認',
              Icons.timeline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.mintGreen.withOpacity(0.7),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mintGreen,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
