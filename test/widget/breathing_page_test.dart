import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/pages/breathing_page.dart';
import 'package:focusmint/pages/result_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> showGuide(
  WidgetTester tester, {
  bool reducedMotion = false,
}) async {
  SharedPreferences.setMockInitialValues({});
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        locale: const Locale('ja'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ja'), Locale('en')],
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(disableAnimations: reducedMotion),
          child: child!,
        ),
        home: const BreathingPage(currentScore: 42.5),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets(
    'inhales for four seconds, exhales for six and completes one breath',
    (tester) async {
      await showGuide(tester);
      expect(find.text('ゆっくり吸って'), findsOneWidget);
      final initial = tester
          .widget<CustomPaint>(find.byKey(const ValueKey('breathing-visual')))
          .painter!;
      await tester.pump(const Duration(seconds: 2));
      final moving = tester
          .widget<CustomPaint>(find.byKey(const ValueKey('breathing-visual')))
          .painter!;
      expect(moving.shouldRepaint(initial), isTrue);
      await tester.pump(const Duration(seconds: 2));
      expect(find.text('ゆっくり吐いて'), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
      expect(find.byType(ResultPage), findsNothing);
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(
        tester.widget<ResultPage>(find.byType(ResultPage)).currentScore,
        42.5,
      );
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('skipping near completion opens results only once', (
    tester,
  ) async {
    await showGuide(tester);
    await tester.pump(const Duration(seconds: 9));
    await tester.tap(find.text('スキップして結果へ'));
    await tester.pumpAndSettle();
    expect(find.byType(ResultPage), findsOneWidget);
    expect(find.byType(BreathingPage), findsNothing);
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(ResultPage), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('background time does not consume breathing rounds', (
    tester,
  ) async {
    await showGuide(tester);
    await tester.pump(const Duration(seconds: 2));
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    await tester.pump(const Duration(seconds: 60));
    expect(find.byType(BreathingPage), findsOneWidget);
    expect(find.text('ゆっくり吸って'), findsOneWidget);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump(const Duration(seconds: 8));
    await tester.pumpAndSettle();
    expect(find.byType(ResultPage), findsOneWidget);
  });

  testWidgets(
    'reduced motion keeps the guide still and preserves the full guide duration',
    (tester) async {
      tester.view.physicalSize = const Size(320, 568);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await showGuide(tester, reducedMotion: true);
      final initial = tester
          .widget<CustomPaint>(find.byKey(const ValueKey('breathing-visual')))
          .painter!;
      await tester.pump(const Duration(seconds: 4));
      final still = tester
          .widget<CustomPaint>(find.byKey(const ValueKey('breathing-visual')))
          .painter!;
      expect(still.shouldRepaint(initial), isFalse);
      expect(find.text('ゆっくり吐いて'), findsOneWidget);
      expect(find.byType(BreathingPage), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );
}
