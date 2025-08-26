import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:focusmint/main.dart';
import 'package:focusmint/l10n/app_localizations.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ABM Training Flow Integration Tests', () {
    testWidgets('Complete training flow from home to results', (WidgetTester tester) async {
      // Launch the app
      await tester.pumpWidget(const ProviderScope(child: FocusMintApp()));
      await tester.pumpAndSettle();

      // Verify we're on the home screen
      expect(find.text('FocusMint'), findsOneWidget);
      expect(find.textContaining('ABM'), findsOneWidget);

      // Tap the start training button
      expect(find.textContaining('スタート'), findsOneWidget);
      await tester.tap(find.textContaining('スタート'));
      await tester.pumpAndSettle();

      // Wait for training to start (should show training screen)
      expect(find.textContaining('トレーニング'), findsOneWidget);
      
      // Wait for session to prepare and show stimulus
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // Since this is integration test and we don't have real images,
      // we'll simulate a few trial interactions by waiting
      // The session service should automatically progress
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // The session will run automatically, so let's wait for completion
      // In a real scenario, this would take 5 minutes, but for testing
      // we can simulate completion
      
      // Note: For real integration testing, you'd need to mock the session
      // to complete quickly or implement test-specific session durations
    });

    testWidgets('Training interruption flow', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: FocusMintApp()));
      await tester.pumpAndSettle();

      // Start training
      await tester.tap(find.textContaining('スタート'));
      await tester.pumpAndSettle();

      // Wait for training to start
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // Try to go back (interrupt training)
      expect(find.byIcon(Icons.close), findsOneWidget);
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Should show interruption dialog
      expect(find.textContaining('中断'), findsOneWidget);
      expect(find.textContaining('続行'), findsOneWidget);

      // Test continue option
      await tester.tap(find.textContaining('続行'));
      await tester.pumpAndSettle();

      // Should be back to training
      expect(find.textContaining('トレーニング'), findsOneWidget);

      // Try to interrupt again
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // This time choose to interrupt
      await tester.tap(find.textContaining('中断'));
      await tester.pumpAndSettle();

      // Should show aborted state or return to home
      expect(find.textContaining('中断'), findsOneWidget);
    });

    testWidgets('Language switching functionality', (WidgetTester tester) async {
      // Test with English locale
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
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
            locale: const Locale('en'),
            home: const FocusMintApp(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should show English text
      expect(find.text('FocusMint'), findsOneWidget);
      expect(find.textContaining('ABM Training'), findsOneWidget);
      expect(find.textContaining('Start'), findsOneWidget);

      // Switch to Japanese locale
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
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
            locale: const Locale('ja'),
            home: const FocusMintApp(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should show Japanese text
      expect(find.text('FocusMint'), findsOneWidget);
      expect(find.textContaining('ABMトレーニング'), findsOneWidget);
      expect(find.textContaining('スタート'), findsOneWidget);
    });

    testWidgets('Session history display', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: FocusMintApp()));
      await tester.pumpAndSettle();

      // Should show "no sessions" message initially
      expect(find.textContaining('過去のセッションはありません'), findsOneWidget);
      expect(find.textContaining('最初のトレーニングセッション'), findsOneWidget);

      // The database would be empty in a fresh test environment
      // In a real integration test, you'd want to pre-populate
      // the database with test data to verify session display
    });

    testWidgets('Accessibility features', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: FocusMintApp()));
      await tester.pumpAndSettle();

      // Test semantic labels and accessibility
      expect(find.byType(Semantics), findsAtLeastNWidgets(1));
      
      // Check that key interactive elements are accessible
      final startButton = find.textContaining('スタート');
      expect(startButton, findsOneWidget);
      
      // Verify the button is semantically correct
      final Finder button = find.ancestor(
        of: startButton,
        matching: find.byType(ElevatedButton),
      );
      expect(button, findsOneWidget);
    });
  });
}