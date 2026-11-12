import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/main.dart';
import 'package:focusmint/pages/home_page.dart';
import 'package:focusmint/pages/training_page.dart';
import 'package:focusmint/pages/settings_page.dart';
import 'package:focusmint/pages/history_page.dart';
import 'package:focusmint/widgets/stimulus_grid.dart';

Future<void> launch(WidgetTester tester, {String language = 'en'}) async {
  SharedPreferences.setMockInitialValues({'tutorial_completed': true});
  tester.binding.platformDispatcher.localesTestValue = [Locale(language)];
  addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);
  await tester.pumpWidget(const ProviderScope(child: FocusMintApp()));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('training fits a narrow phone with English labels', (tester) async {
    tester.view.physicalSize = const Size(375, 667);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await launch(tester);
    await tester.tap(find.text('START'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byType(StimulusGrid), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(4));
    expect(tester.takeException(), isNull);
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
  });

  testWidgets(
    'training starts and can be closed without losing the home route',
    (tester) async {
      await launch(tester);
      await tester.tap(find.text('START'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(TrainingPage), findsOneWidget);
      expect(find.byType(StimulusGrid), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(Image), findsNWidgets(4));
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(TrainingPage), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('settings can be opened and return to home', (tester) async {
    await launch(tester);
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsPage), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('Japanese device locale renders the Japanese home message', (
    tester,
  ) async {
    await launch(tester, language: 'ja');
    expect(find.text('ポジティブな画像を見つける練習をしましょう。'), findsOneWidget);
    expect(find.text('START'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('history opens for a new user with no saved sessions', (
    tester,
  ) async {
    await launch(tester);
    await tester.tap(find.byIcon(Icons.bar_chart));
    await tester.pumpAndSettle();
    expect(find.byType(HistoryPage), findsOneWidget);
    expect(find.text('Training History'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('start action remains enabled and has an accessible text label', (
    tester,
  ) async {
    await launch(tester);
    final button = find.ancestor(
      of: find.text('START'),
      matching: find.byType(ElevatedButton),
    );
    expect(button, findsOneWidget);
    expect(tester.widget<ElevatedButton>(button).onPressed, isNotNull);
    expect(find.byType(Semantics), findsWidgets);
  });
}
