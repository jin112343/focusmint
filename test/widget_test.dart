import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/main.dart';

void main() {
  testWidgets('App launches with completed onboarding', (tester) async {
    SharedPreferences.setMockInitialValues({'tutorial_completed': true});
    tester.binding.platformDispatcher.localeTestValue = const Locale('en');
    addTearDown(tester.binding.platformDispatcher.clearLocaleTestValue);
    await tester.pumpWidget(const ProviderScope(child: FocusMintApp()));
    await tester.pumpAndSettle();
    expect(find.text('FOCUS MINT'), findsOneWidget);
    expect(find.text('START'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
