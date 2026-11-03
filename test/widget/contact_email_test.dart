import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../integration/training_flow_test.dart' show launch;

void main() {
  testWidgets(
    'contact email launches even when a capability query would fail',
    (tester) async {
      const channel = MethodChannel('plugins.flutter.io/url_launcher');
      final calls = <MethodCall>[];
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
        call,
      ) async {
        calls.add(call);
        return call.method == 'launch';
      });
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          null,
        ),
      );
      await launch(tester);
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Contact Us'));
      await tester.tap(find.text('Contact Us'));
      await tester.pumpAndSettle();
      expect(calls.map((call) => call.method), ['launch']);
      final uri = Uri.parse((calls.single.arguments as Map)['url'] as String);
      expect(uri.scheme, 'mailto');
      expect(uri.queryParameters['subject'], 'FocusMint - Contact');
      expect(
        uri.queryParameters['body'],
        'Please share your feedback and questions.',
      );
      expect(tester.takeException(), isNull);
    },
  );
}
