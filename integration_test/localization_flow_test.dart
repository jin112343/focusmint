import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/main.dart';
import 'package:focusmint/pages/breathing_page.dart';
import 'package:focusmint/pages/contact_page.dart';
import 'package:focusmint/pages/home_page.dart';
import 'package:focusmint/pages/result_page.dart';
import 'package:focusmint/services/support_service.dart';

import '../test/support/support_fixture.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  for (final locale in [
    const Locale('ja'),
    const Locale('de'),
    const Locale('ar'),
    const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    const Locale('hi'),
  ]) {
    testWidgets('$locale native localized flow and breathing', (tester) async {
      SharedPreferences.setMockInitialValues({'tutorial_completed': true});
      tester.binding.platformDispatcher.localesTestValue = [locale];
      addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);
      final fixture = SupportFixture();
      fixture.storage.identity = {
        'id': SupportFixture.owner,
        'token': List.filled(64, 'a').join(),
      };
      fixture.addReply(
        'bbbbbbbb-bbbb-4bbb-bbbb-bbbbbbbbbbbb',
        'support.received',
      );
      await tester.pumpWidget(
        ProviderScope(
          key: UniqueKey(),
          overrides: [supportProvider.overrideWith((_) => fixture.service())],
          child: const FocusMintApp(),
        ),
      );
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(HomePage));
      final strings = AppLocalizations.of(context)!;
      expect(strings.localeName, locale.toString());
      expect(find.text(strings.stressReductionMessage), findsOneWidget);
      expect(
        Directionality.of(context),
        locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      );

      Future<void> screenshot(String name) async {
        if (!Platform.isIOS) return;
        final folder = await getApplicationDocumentsDirectory();
        final bytes = await binding.takeScreenshot('${locale}_$name');
        await File('${folder.path}/focusmint-${locale}_$name.png')
            .writeAsBytes(bytes);
      }

      await screenshot('home');
      await tester.tap(find.byKey(const ValueKey('home.contact')));
      await tester.pumpAndSettle();
      expect(find.byType(ContactPage), findsOneWidget);
      expect(find.text(strings.supportReceived), findsOneWidget);
      await screenshot('contact');
      final contactContext = tester.element(find.byType(ContactPage));
      await tester.tap(find.byTooltip(
        MaterialLocalizations.of(contactContext).backButtonTooltip,
      ));
      await tester.pumpAndSettle();
      Navigator.of(tester.element(find.byType(HomePage))).push(
        MaterialPageRoute<void>(
          builder: (_) => const BreathingPage(currentScore: 123.45),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(seconds: 2));
      expect(find.text(strings.breathingIn), findsOneWidget);
      await screenshot('breathing');
      await tester.pump(const Duration(seconds: 4));
      expect(find.text(strings.breathingOut), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(
        tester.widget<ResultPage>(find.byType(ResultPage)).currentScore,
        123.45,
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }
}
