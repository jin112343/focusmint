import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/main.dart';
import 'package:focusmint/pages/contact_page.dart';
import 'package:focusmint/services/support_service.dart';

import '../support/support_fixture.dart';

Future<void> launchContactApp(
  WidgetTester tester,
  SupportFixture fixture, {
  String language = 'en',
}) async {
  SharedPreferences.setMockInitialValues({'tutorial_completed': true});
  tester.binding.platformDispatcher.localesTestValue = [Locale(language)];
  addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [supportProvider.overrideWith((ref) => fixture.service())],
      child: const FocusMintApp(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('home bottom link opens chat and failed send remains retryable', (
    tester,
  ) async {
    final f = SupportFixture();
    f.failSend = true;
    await launchContactApp(tester, f);
    await tester.tap(find.byKey(const ValueKey('home.contact')));
    await tester.pumpAndSettle();
    expect(find.byType(ContactPage), findsOneWidget);
    await tester.enterText(
      find.byKey(const ValueKey('contact.composer')),
      'Please help',
    );
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('contact.send')));
    await tester.pumpAndSettle();
    expect(find.text('Unsent · saved on this device'), findsOneWidget);
    expect(find.textContaining('Could not send.'), findsOneWidget);
    expect(f.sends.length, 1);
    f.failSend = false;
    await tester.tap(find.widgetWithText(TextButton, 'Retry'));
    await tester.pumpAndSettle();
    expect(find.text('Sent'), findsOneWidget);
    expect(f.sends[0]['id'], f.sends[1]['id']);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
  testWidgets('settings contact opens the same chat in Japanese', (
    tester,
  ) async {
    await launchContactApp(tester, SupportFixture(), language: 'ja');
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('お問い合わせ'));
    await tester.tap(find.text('お問い合わせ'));
    await tester.pumpAndSettle();
    expect(find.byType(ContactPage), findsOneWidget);
    expect(find.text('今日あと3回'), findsOneWidget);
    expect(find.text('メッセージを入力'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('small screen and keyboard leave the composer usable', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await launchContactApp(tester, SupportFixture());
    await tester.tap(find.byKey(const ValueKey('home.contact')));
    await tester.pumpAndSettle();
    tester.view.viewInsets = const FakeViewPadding(bottom: 260);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const ValueKey('contact.composer')),
      'A message',
    );
    await tester.pump();
    expect(tester.takeException(), isNull);
    await tester.pageBack();
    await tester.pumpAndSettle();
  });
  testWidgets(
    'reply stays unread on home and becomes read only in visible chat',
    (tester) async {
      final f = SupportFixture();
      f.storage.identity = {
        'id': SupportFixture.owner,
        'token': List.filled(64, 'a').join(),
      };
      f.addReply('bbbbbbbb-bbbb-4bbb-bbbb-bbbbbbbbbbbb', 'Hello, we can help.');
      await launchContactApp(tester, f);
      expect(f.readCalls, 0);
      expect(find.text('1'), findsWidgets);
      await tester.tap(find.byKey(const ValueKey('home.contact')));
      await tester.pumpAndSettle();
      expect(f.readCalls, 1);
      expect(find.text('Hello, we can help.'), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();
    },
  );
}
