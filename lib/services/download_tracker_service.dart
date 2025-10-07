import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

/// プライバシーに配慮したダウンロード数追跡サービス
/// 個人を特定できない集計データのみを収集
class DownloadTrackerService {
  static final Logger _logger = Logger();
  static const String _firstLaunchKey = 'first_launch_tracked';
  
  // ビルド時に環境変数で指定（デフォルトはfalse = テスト環境）
  static const bool _isProduction = bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );
  
  /// 初回起動時の追跡（プライバシーに配慮）
  /// 本番ビルド（PRODUCTION=true）でのみ送信され、開発・テスト環境では送信されません
  static Future<void> trackFirstLaunch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hasTrackedFirstLaunch = prefs.getBool(_firstLaunchKey) ?? false;

      if (!hasTrackedFirstLaunch) {
        // 本番環境（ストア配布）の場合のみ送信
        if (kReleaseMode && _isProduction) {
          // Firebase初期化チェック
          if (Firebase.apps.isNotEmpty) {
            // 初回起動として記録
            await FirebaseAnalytics.instance.logEvent(
              name: 'app_first_install',
              parameters: {
                'timestamp': DateTime.now().millisecondsSinceEpoch,
                // 個人を特定できない情報のみ
                'platform': 'flutter',
              },
            );
            _logger.i('初回起動を追跡しました（本番環境）');
          } else {
            _logger.w('Firebase未初期化のため、追跡をスキップしました');
          }
        } else {
          if (!kReleaseMode) {
            _logger.i('デバッグモードのため、追跡をスキップしました');
          } else {
            _logger.i('テスト環境のため、追跡をスキップしました（テスター用）');
          }
        }

        // 初回起動を記録済みとしてマーク（Firebase追跡の成否に関わらず）
        await prefs.setBool(_firstLaunchKey, true);
      }
    } catch (e) {
      _logger.e('初回起動の追跡に失敗しました: $e');
    }
  }
  
}
