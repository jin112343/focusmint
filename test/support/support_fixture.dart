import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:focusmint/services/support_service.dart';

class MemorySupportStorage implements SupportStorage {
  Map<String, dynamic>? cache, identity;
  bool failWrite = false;
  final images = <String, Uint8List>{};
  Map<String, dynamic>? copy(Map<String, dynamic>? value) => value == null
      ? null
      : jsonDecode(jsonEncode(value)) as Map<String, dynamic>;
  @override
  Future<Map<String, dynamic>?> readCache() async => copy(cache);
  @override
  Future<Map<String, dynamic>?> readIdentity() async => copy(identity);
  @override
  Future<void> writeCache(Map<String, dynamic> value) async {
    if (failWrite) throw Exception('disk');
    cache = copy(value);
  }

  @override
  Future<void> writeIdentity(Map<String, dynamic>? value) async {
    identity = copy(value);
  }

  @override
  Future<Uint8List?> readImage(String id) async => images[id];
  @override
  Future<void> writeImage(String id, Uint8List value) async {
    images[id] = value;
  }

  @override
  Future<void> clearImages() async {
    images.clear();
  }
}

class SupportFixture {
  static const owner = 'aaaaaaaa-aaaa-4aaa-aaaa-aaaaaaaaaaaa';
  final storage = MemorySupportStorage();
  final messages = <Map<String, dynamic>>[];
  final sends = <Map<String, dynamic>>[];
  int revision = 0, unread = 0, remaining = 3, identityCalls = 0, readCalls = 0;
  bool failSend = false, missingAck = false, failRead = false, expired = false;
  String? lastRead;
  String get resetAt =>
      DateTime.now().toUtc().add(const Duration(days: 1)).toIso8601String();
  Map<String, dynamic> status() => {
    'revision': revision,
    'unreadCount': unread,
    'remainingToday': remaining,
    'resetAt': resetAt,
    'lastReadMessageId': lastRead,
  };
  Map<String, dynamic> page() => {...status(), 'messages': messages};
  void addReply(String id, String body) {
    messages.add({
      'id': id,
      'author': 'developer',
      'body': body,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'hasImage': false,
    });
    revision++;
    unread++;
    remaining = 3;
  }

  late final client = MockClient((request) async {
    final path = request.url.path;
    http.Response json(Object value, [int code = 200]) => http.Response(
      jsonEncode(value),
      code,
      headers: {'content-type': 'application/json'},
    );
    if (path == '/api/identities') {
      identityCalls++;
      return json({'id': owner, 'token': List.filled(64, 'a').join()}, 201);
    }
    if (expired) {
      expired = false;
      return json({'error': 'unauthorized'}, 401);
    }
    if (path == '/api/support/status') return json(status());
    if (path == '/api/support/read') {
      readCalls++;
      if (failRead) return json({'error': 'unavailable'}, 503);
      unread = 0;
      revision++;
      lastRead =
          (jsonDecode(request.body) as Map)['throughMessageId'] as String;
      return json(status());
    }
    if (path == '/api/messages') {
      if (request.method == 'DELETE') {
        messages.clear();
        unread = 0;
        revision++;
      }
      if (request.method == 'POST') {
        final data = jsonDecode(request.body) as Map<String, dynamic>;
        sends.add(data);
        if (failSend) return json({'error': 'unavailable'}, 503);
        if (remaining == 0) return json({'error': 'daily_quota'}, 429);
        if (!missingAck && !messages.any((m) => m['id'] == data['id'])) {
          messages.add({
            'id': data['id'],
            'author': 'user',
            'body': data['body'],
            'createdAt': DateTime.now().toUtc().toIso8601String(),
            'hasImage': data['image'] != null,
          });
          remaining--;
          revision++;
        }
      }
      return json(page());
    }
    return json({'error': 'not_found'}, 404);
  });
  SupportService service() => SupportService(
    storage: storage,
    client: client,
    base: Uri.parse('https://focusmint.test'),
  );
}
