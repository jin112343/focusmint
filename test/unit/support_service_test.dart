import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:focusmint/services/support_service.dart';

import '../support/support_fixture.dart';

void main() {
  test('home status does not register or send drafts automatically', () async {
    final f = SupportFixture(), s = f.service();
    addTearDown(s.dispose);
    await s.refresh(statusOnly: true);
    expect(f.identityCalls, 0);
    await s.queue('private question', null);
    await s.refresh();
    expect(f.sends, isEmpty);
    expect(s.messages.single.sent, isFalse);
  });
  test(
    'offline draft survives restart and retries with the same UUID',
    () async {
      final f = SupportFixture(), s = f.service();
      f.failSend = true;
      final id = await s.queue('question', null);
      expect(id, isNotNull);
      expect(await s.retry(id!), isFalse);
      expect(s.messages.single.sent, isFalse);
      s.dispose();
      final restored = SupportService(
        storage: f.storage,
        client: f.client,
        base: Uri.parse('https://focusmint.test'),
      );
      addTearDown(restored.dispose);
      // MockClient.close is harmless; persisted state is independent of the service.
      await restored.initialize();
      expect(restored.messages.single.id, id);
      f.failSend = false;
      expect(await restored.retry(id), isTrue);
      expect(restored.messages.single.sent, isTrue);
      expect(f.sends.map((m) => m['id']), [id, id]);
    },
  );
  test(
    'a success response without matching ACK never labels a draft sent',
    () async {
      final f = SupportFixture(), s = f.service();
      addTearDown(s.dispose);
      f.missingAck = true;
      final id = await s.queue('question', null);
      expect(await s.retry(id!), isFalse);
      expect(s.messages.single.sent, isFalse);
      expect(s.error, 'send');
    },
  );
  test(
    'disk failure preserves the composer by rejecting queue creation',
    () async {
      final f = SupportFixture(), s = f.service();
      addTearDown(s.dispose);
      f.storage.failWrite = true;
      expect(await s.queue('keep this text', null), isNull);
      expect(s.messages, isEmpty);
      expect(f.sends, isEmpty);
    },
  );
  test(
    'developer reply resets allowance and read is acknowledged explicitly',
    () async {
      final f = SupportFixture(), s = f.service();
      addTearDown(s.dispose);
      for (var i = 0; i < 3; i++) {
        final id = await s.queue('message $i', null);
        await s.retry(id!);
      }
      expect(s.remaining, 0);
      f.addReply('bbbbbbbb-bbbb-4bbb-bbbb-bbbbbbbbbbbb', 'Reply');
      await s.refresh();
      expect(s.remaining, 3);
      expect(s.unreadCount, 1);
      expect(f.readCalls, 0);
      f.failRead = true;
      expect(await s.markVisibleRead(f.messages.last['id'] as String), isFalse);
      expect(s.unreadCount, 1);
      f.failRead = false;
      expect(await s.markVisibleRead(f.messages.last['id'] as String), isTrue);
      expect(s.unreadCount, 0);
    },
  );
  test(
    'history deletion preserves server quota and clears local drafts',
    () async {
      final f = SupportFixture(), s = f.service();
      addTearDown(s.dispose);
      final id = await s.queue('delivered', null);
      await s.retry(id!);
      await s.queue('unsent', null);
      expect(await s.clearHistory(), isTrue);
      expect(s.messages, isEmpty);
      expect(s.remaining, 2);
      expect(f.storage.cache!['drafts'], isEmpty);
    },
  );
  test(
    'restored cache without its credential never shows previous owner messages',
    () async {
      final f = SupportFixture(), s = f.service();
      addTearDown(s.dispose);
      f.storage.cache = {
        'owner': 'old-owner',
        'messages': [
          {
            'id': 'old',
            'author': 'developer',
            'body': 'private old reply',
            'createdAt': '2026-01-01',
          },
        ],
        'drafts': [],
        'unreadCount': 2,
        'revision': 50,
      };
      await s.initialize();
      expect(s.messages, isEmpty);
      expect(s.unreadCount, 0);
      await s.refresh();
      expect(f.identityCalls, 1);
      expect(s.revision, 0);
    },
  );
  test(
    'expired identity recovers once while retaining the explicit draft',
    () async {
      final f = SupportFixture(), s = f.service();
      addTearDown(s.dispose);
      await s.refresh();
      f.expired = true;
      final id = await s.queue('question', null);
      expect(await s.retry(id!), isTrue);
      expect(f.identityCalls, 2);
      expect(s.messages.single.sent, isTrue);
    },
  );
  test(
    'attachment preparation preserves aspect ratio and caps bytes',
    () async {
      final source = img.Image(width: 1800, height: 900);
      img.fill(source, color: img.ColorRgb8(50, 120, 90));
      final bytes = await prepareSupportImage(img.encodePng(source));
      expect(bytes, isNotNull);
      expect(bytes!.length, lessThanOrEqualTo(250000));
      final decoded = img.decodeJpg(bytes)!;
      expect(decoded.width, 1280);
      expect(decoded.height, 640);
      expect(decoded.exif.imageIfd.isEmpty, isTrue);
      expect(base64Decode(base64Encode(bytes)), bytes);
    },
  );
}
