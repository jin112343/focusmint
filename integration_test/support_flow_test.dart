import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/main.dart';
import 'package:focusmint/pages/contact_page.dart';
import 'package:focusmint/services/support_service.dart';

import '../test/support/support_fixture.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('native secure storage, home link, reply and durable retry', (
    tester,
  ) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('ja')];
    addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);
    // Separate Keychain key and directory; no customer support data or network sends.
    final device = DeviceSupportStorage(namespace: 'support-native-qa');
    final identity = {
      'id': SupportFixture.owner,
      'token': List.filled(64, 'b').join(),
    };
    await device.writeIdentity(identity);
    expect(await device.readIdentity(), identity);
    await device.writeCache({'drafts': [], 'nativeQA': true});
    expect((await device.readCache())!['nativeQA'], true);
    await device.writeIdentity(null);
    expect(await device.readIdentity(), isNull);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tutorial_completed', true);
    final fixture = SupportFixture();
    fixture.storage.identity = {
      'id': SupportFixture.owner,
      'token': List.filled(64, 'a').join(),
    };
    fixture.addReply(
      'bbbbbbbb-bbbb-4bbb-bbbb-bbbbbbbbbbbb',
      'お問い合わせありがとうございます。こちらで確認します。',
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [supportProvider.overrideWith((ref) => fixture.service())],
        child: const FocusMintApp(),
      ),
    );
    await tester.pumpAndSettle();
    expect(fixture.readCalls, 0);
    await tester.tap(find.byKey(const ValueKey('home.contact')));
    await tester.pumpAndSettle();
    expect(find.byType(ContactPage), findsOneWidget);
    expect(fixture.readCalls, 1);
    fixture.failSend = true;
    await tester.enterText(
      find.byKey(const ValueKey('contact.composer')),
      'トレーニング画面について相談したいです。',
    );
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('contact.send')));
    await tester.pumpAndSettle();
    expect(fixture.sends.length, 1);
    fixture.failSend = false;
    await tester.tap(find.widgetWithText(TextButton, '再試行'));
    await tester.pumpAndSettle();
    expect(fixture.sends.length, 2);
    expect(fixture.sends[0]['id'], fixture.sends[1]['id']);
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
  });
}
