import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

/// プライバシーに配慮したダウンロード数追跡サービス
/// 個人を特定できない集計データのみを収集
class DownloadTrackerService {
  static final Logger _logger = Logger();
  static const String _firstLaunchKey = 'first_launch_tracked';
  
  /// 初回起動時の追跡（プライバシーに配慮）
  static Future<void> trackFirstLaunch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hasTrackedFirstLaunch = prefs.getBool(_firstLaunchKey) ?? false;
      
      if (!hasTrackedFirstLaunch) {
        // 初回起動として記録
        await FirebaseAnalytics.instance.logEvent(
          name: 'app_first_install',
          parameters: {
            'timestamp': DateTime.now().millisecondsSinceEpoch,
            // 個人を特定できない情報のみ
            'platform': 'flutter',
          },
        );
        
        // 初回起動を記録済みとしてマーク
        await prefs.setBool(_firstLaunchKey, true);
        
        _logger.i('初回起動を追跡しました');
      }
    } catch (e) {
      _logger.e('初回起動の追跡に失敗しました: $e');
    }
  }
  
  /// アプリ起動回数の追跡（プライバシーに配慮）
  static Future<void> trackAppLaunch() async {
    try {
      await FirebaseAnalytics.instance.logEvent(
        name: 'app_launch',
        parameters: {
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        },
      );
      
      _logger.i('アプリ起動を追跡しました');
    } catch (e) {
      _logger.e('アプリ起動の追跡に失敗しました: $e');
    }
  }
  
  /// セッション開始の追跡
  static Future<void> trackSessionStart() async {
    try {
      await FirebaseAnalytics.instance.logEvent(
        name: 'session_start',
        parameters: {
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        },
      );
      
      _logger.i('セッション開始を追跡しました');
    } catch (e) {
      _logger.e('セッション開始の追跡に失敗しました: $e');
    }
  }
  
  /// セッション終了の追跡
  static Future<void> trackSessionEnd() async {
    try {
      await FirebaseAnalytics.instance.logEvent(
        name: 'session_end',
        parameters: {
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        },
      );
      
      _logger.i('セッション終了を追跡しました');
    } catch (e) {
      _logger.e('セッション終了の追跡に失敗しました: $e');
    }
  }
}
