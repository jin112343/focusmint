import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/pages/breathing_page.dart';
import 'package:focusmint/pages/result_page.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'native breathing guide animates and automatically keeps the score',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            locale: const Locale('ja'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ja'), Locale('en')],
            home: const BreathingPage(currentScore: 123.45),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(seconds: 2));
      expect(find.text('ゆっくり吸って'), findsOneWidget);
      if (Platform.isIOS) {
        final directory = await getApplicationDocumentsDirectory();
        final image = await binding.takeScreenshot('breathing-inhale');
        await File('${directory.path}/focusmint-breathing-inhale.png')
            .writeAsBytes(image);
      }
      await tester.pump(const Duration(seconds: 4));
      expect(find.text('ゆっくり吐いて'), findsOneWidget);
      if (Platform.isIOS) {
        final directory = await getApplicationDocumentsDirectory();
        final image = await binding.takeScreenshot('breathing-exhale');
        await File('${directory.path}/focusmint-breathing-exhale.png')
            .writeAsBytes(image);
      }
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(find.byType(ResultPage), findsOneWidget);
      expect(
        tester.widget<ResultPage>(find.byType(ResultPage)).currentScore,
        123.45,
      );
      expect(tester.takeException(), isNull);
    },
  );
}
