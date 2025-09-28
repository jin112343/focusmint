import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:focusmint/firebase_options.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/pages/home_page.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/download_tracker_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Firebase初期化（重複実行を防ぐ）
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }

    // 初回ダウンロードのみを追跡
    await DownloadTrackerService.trackFirstLaunch();
  } catch (e) {
    // 初期化エラーの場合でもアプリを起動する
    print('Firebase初期化エラー: $e');
  }

  runApp(const ProviderScope(child: FocusMintApp()));
}

class FocusMintApp extends StatelessWidget {
  const FocusMintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FocusMint',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      theme: AppTheme.lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
