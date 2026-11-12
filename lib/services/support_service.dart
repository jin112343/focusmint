import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

final supportProvider = ChangeNotifierProvider<SupportService>(
  (ref) => SupportService(),
);

abstract class SupportStorage {
  Future<Map<String, dynamic>?> readCache();
  Future<void> writeCache(Map<String, dynamic> value);
  Future<Map<String, dynamic>?> readIdentity();
  Future<void> writeIdentity(Map<String, dynamic>? value);
  Future<Uint8List?> readImage(String id);
  Future<void> writeImage(String id, Uint8List value);
  Future<void> clearImages();
}

class DeviceSupportStorage implements SupportStorage {
  final String namespace;
  DeviceSupportStorage({this.namespace = 'support'});
  static const _secure = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );
  Future<Directory> get _folder async {
    final root = await getApplicationSupportDirectory();
    return Directory('${root.path}/$namespace').create(recursive: true);
  }

  @override
  Future<Map<String, dynamic>?> readCache() async {
    final file = File('${(await _folder).path}/conversation.json');
    return await file.exists()
        ? jsonDecode(await file.readAsString()) as Map<String, dynamic>
        : null;
  }

  @override
  Future<void> writeCache(Map<String, dynamic> value) async {
    final path = '${(await _folder).path}/conversation.json';
    await File('$path.tmp').writeAsString(jsonEncode(value), flush: true);
    await File('$path.tmp').rename(path);
  }

  @override
  Future<Map<String, dynamic>?> readIdentity() async {
    final value = await _secure.read(key: 'focusmint.$namespace.identity');
    return value == null ? null : jsonDecode(value) as Map<String, dynamic>;
  }

  @override
  Future<void> writeIdentity(Map<String, dynamic>? value) async {
    if (value == null) {
      await _secure.delete(key: 'focusmint.$namespace.identity');
    } else {
      await _secure.write(
        key: 'focusmint.$namespace.identity',
        value: jsonEncode(value),
      );
    }
  }

  @override
  Future<Uint8List?> readImage(String id) async {
    if (!SupportService.validId(id)) return null;
    final file = File('${(await _folder).path}/$id.jpg');
    return await file.exists() ? file.readAsBytes() : null;
  }

  @override
  Future<void> writeImage(String id, Uint8List value) async {
    if (SupportService.validId(id)) {
      await File('${(await _folder).path}/$id.jpg')
          .writeAsBytes(value, flush: true);
    }
  }

  @override
  Future<void> clearImages() async {
    await for (final file in (await _folder).list()) {
      if (file is File && file.path.endsWith('.jpg')) await file.delete();
    }
  }
}

class SupportMessage {
  final String id, author, body, createdAt;
  final bool hasImage, sent;
  final String? draftImage;
  SupportMessage({
    required this.id,
    required this.author,
    required this.body,
    required this.createdAt,
    this.hasImage = false,
    this.sent = true,
    this.draftImage,
  });
  factory SupportMessage.fromJson(Map<String, dynamic> j) => SupportMessage(
    id: j['id'] as String,
    author: j['author'] as String,
    body: j['body'] as String,
    createdAt: j['createdAt'] as String,
    hasImage: j['hasImage'] == true,
    sent: j['sent'] != false,
    draftImage: j['draftImage'] as String?,
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'author': author,
    'body': body,
    'createdAt': createdAt,
    'hasImage': hasImage,
    'sent': sent,
    if (draftImage != null) 'draftImage': draftImage,
  };
}

class SupportFailure implements Exception {
  final int status;
  final String code;
  SupportFailure(this.status, this.code);
}

class SupportService extends ChangeNotifier {
  static final endpoint = Uri.parse(
    const String.fromEnvironment(
      'SUPPORT_ENDPOINT',
      defaultValue: 'https://focusmint-support.mizoijin-0201.workers.dev',
    ),
  );
  final SupportStorage storage;
  final http.Client client;
  final Uri base;
  Map<String, dynamic>? _identity;
  Future<void>? _loading;
  List<SupportMessage> _remote = [], _drafts = [];
  int revision = -1, unreadCount = 0;
  int _imageEpoch = 0;
  int _remaining = 3;
  String resetAt = '';
  String? lastReadMessageId;
  bool busy = false, _disposed = false;
  String? error;
  final Map<String, Uint8List> images = {};
  SupportService({SupportStorage? storage, http.Client? client, Uri? base})
    : storage = storage ?? DeviceSupportStorage(),
      client = client ?? http.Client(),
      base = base ?? endpoint;
  int get remaining =>
      DateTime.tryParse(resetAt)?.isBefore(DateTime.now().toUtc()) == true
      ? 3
      : _remaining;
  List<SupportMessage> get messages =>
      [..._remote, ..._drafts]
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  static bool validId(String id) => RegExp(
    r'^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$',
    caseSensitive: false,
  ).hasMatch(id);
  static String newId() {
    final bytes = List.generate(16, (_) => Random.secure().nextInt(256));
    bytes[6] = (bytes[6] & 15) | 64;
    bytes[8] = (bytes[8] & 63) | 128;
    final s = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    return '${s.substring(0, 8)}-${s.substring(8, 12)}-${s.substring(12, 16)}-${s.substring(16, 20)}-${s.substring(20)}';
  }

  void _changed() {
    if (!_disposed) notifyListeners();
  }

  Future<void> initialize() => _loading ??= _load().catchError((Object e) {
    _loading = null;
    throw e;
  });
  Future<void> _load() async {
    final cache = await storage.readCache();
    _identity = await storage.readIdentity();
    if (cache != null) {
      _drafts = (cache['drafts'] as List? ?? [])
          .map(
            (m) => SupportMessage.fromJson(Map<String, dynamic>.from(m as Map)),
          )
          .toList();
      // A restored cache must never be attributed to a different installation.
      if (_identity != null && cache['owner'] == _identity!['id']) {
        _remote = (cache['messages'] as List? ?? [])
            .map(
              (m) =>
                  SupportMessage.fromJson(Map<String, dynamic>.from(m as Map)),
            )
            .toList();
        _applyStatus(cache);
      }
    }
    _changed();
  }

  Map<String, dynamic> _cache() => {
    'owner': _identity?['id'],
    'messages': _remote.map((m) => m.toJson()).toList(),
    'drafts': _drafts.map((m) => m.toJson()).toList(),
    'revision': revision,
    'unreadCount': unreadCount,
    'remainingToday': _remaining,
    'resetAt': resetAt,
    'lastReadMessageId': lastReadMessageId,
  };
  Future<void> _save() => storage.writeCache(_cache());
  void _applyStatus(Map<String, dynamic> value) {
    final next = (value['revision'] as num?)?.toInt() ?? 0;
    if (next < revision) return;
    revision = next;
    unreadCount = (value['unreadCount'] as num?)?.toInt() ?? 0;
    _remaining = ((value['remainingToday'] ?? value['remaining'] ?? 3) as num)
        .toInt()
        .clamp(0, 3);
    resetAt = value['resetAt'] as String? ?? '';
    lastReadMessageId = value['lastReadMessageId'] as String?;
  }

  Future<http.Response> _request(
    String path,
    String method, {
    Map<String, dynamic>? body,
    bool auth = true,
    bool recover = true,
  }) async {
    if (auth && _identity == null) {
      final response = await _request(
        '/api/identities',
        'POST',
        auth: false,
        body: {
          'platform': Platform.isIOS ? 'ios' : 'android',
          'language': Platform.localeName,
          'version': const String.fromEnvironment(
            'FLUTTER_BUILD_NAME',
            defaultValue: '1.3.5',
          ),
        },
      );
      final identity = jsonDecode(response.body) as Map<String, dynamic>;
      if (identity['id'] is! String ||
          !RegExp(r'^[a-f0-9]{64}$')
              .hasMatch(identity['token'] as String? ?? '')) {
        throw SupportFailure(503, 'invalid_identity');
      }
      await storage.writeIdentity(identity);
      _identity = identity;
      _imageEpoch++;
      _remote = [];
      images.clear();
      revision = -1;
      unreadCount = 0;
      _remaining = 3;
      resetAt = '';
      lastReadMessageId = null;
      await _save();
    }
    final request = http.Request(method, base.resolve(path));
    request.headers['content-type'] = 'application/json';
    if (auth) {
      request.headers['authorization'] = 'Bearer ${_identity!['token']}';
    }
    if (body != null) request.body = jsonEncode(body);
    final response = await client
        .send(request)
        .then(http.Response.fromStream)
        .timeout(const Duration(seconds: 20));
    if (response.statusCode == 401 && auth && recover) {
      await storage.writeIdentity(null);
      _identity = null;
      return _request(path, method, body: body, recover: false);
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      String code = 'unavailable';
      try {
        code = (jsonDecode(response.body) as Map)['error'] as String? ?? code;
      } catch (_) {}
      throw SupportFailure(response.statusCode, code);
    }
    return response;
  }

  Future<void> _merge(Map<String, dynamic> page) async {
    final incoming = (page['messages'] as List)
        .map(
          (m) => SupportMessage.fromJson(Map<String, dynamic>.from(m as Map)),
        )
        .toList();
    final ids = incoming.map((m) => m.id.toLowerCase()).toSet();
    final acknowledged = _drafts
        .where((m) => ids.contains(m.id.toLowerCase()))
        .toList();
    for (final draft in acknowledged) {
      if (draft.draftImage != null) {
        await storage.writeImage(draft.id, base64Decode(draft.draftImage!));
      }
    }
    _drafts.removeWhere((m) => ids.contains(m.id.toLowerCase()));
    _remote = incoming;
    _applyStatus(page);
    await _save();
    _changed();
  }

  Future<void> refresh({bool statusOnly = false}) async {
    if (busy) return;
    busy = true;
    try {
      await initialize();
      if (statusOnly && _identity == null) return;
      final page = jsonDecode(
        (await _request(
          statusOnly ? '/api/support/status' : '/api/messages',
          'GET',
        )).body,
      ) as Map<String, dynamic>;
      if (statusOnly) {
        _applyStatus(page);
        await _save();
      } else {
        await _merge(page);
      }
      error = null;
    } catch (_) {
      if (!statusOnly) error = 'connection';
    } finally {
      busy = false;
      _changed();
    }
  }

  Future<String?> queue(String body, Uint8List? image) async {
    if (busy) return null;
    busy = true;
    try {
      await initialize();
      final text = body.trim();
      if (remaining == 0 ||
          (text.isEmpty && image == null) ||
          text.length > 2000 ||
          (image?.length ?? 0) > 250000) {
        return null;
      }
      final draft = SupportMessage(
        id: newId(),
        author: 'user',
        body: text,
        createdAt: DateTime.now().toUtc().toIso8601String(),
        hasImage: image != null,
        sent: false,
        draftImage: image == null ? null : base64Encode(image),
      );
      _drafts.add(draft);
      try {
        await _save();
      } catch (_) {
        _drafts.remove(draft);
        rethrow;
      }
      error = null;
      return draft.id;
    } catch (_) {
      error = 'storage';
      return null;
    } finally {
      busy = false;
      _changed();
    }
  }

  Future<bool> retry(String id) async {
    if (busy) return false;
    busy = true;
    error = null;
    _changed();
    try {
      await initialize();
      final draft = _drafts.firstWhere((m) => m.id == id);
      final response = jsonDecode(
        (await _request(
          '/api/messages',
          'POST',
          body: {
            'id': draft.id,
            'body': draft.body,
            if (draft.draftImage != null) 'image': draft.draftImage,
          },
        )).body,
      ) as Map<String, dynamic>;
      if (!(response['messages'] as List).any(
        (m) => (m as Map)['id'].toString().toLowerCase() == id.toLowerCase(),
      )) {
        throw SupportFailure(503, 'missing_ack');
      }
      await _merge(response);
      return true;
    } catch (e) {
      if (e is SupportFailure && e.code == 'daily_quota') {
        _remaining = 0;
        final now = DateTime.now().toUtc();
        resetAt = DateTime.utc(
          now.year,
          now.month,
          now.day + 1,
        ).toIso8601String();
        try {
          await _save();
        } catch (_) {}
      }
      error = 'send';
      return false;
    } finally {
      busy = false;
      _changed();
    }
  }

  Future<void> loadImage(SupportMessage message) async {
    if (images.containsKey(message.id) || !validId(message.id) || busy) return;
    final epoch = _imageEpoch;
    try {
      Uint8List? bytes = message.draftImage == null
          ? await storage.readImage(message.id)
          : base64Decode(message.draftImage!);
      if (bytes == null && message.sent) {
        // Attachment fetches never replace an expired owner or its conversation.
        bytes = (await _request(
          '/api/attachments/${message.id}',
          'GET',
          recover: false,
        )).bodyBytes;
        if (bytes.length > 250000 || epoch != _imageEpoch) return;
        await storage.writeImage(message.id, bytes);
      }
      if (bytes != null && epoch == _imageEpoch) {
        images[message.id] = bytes;
        _changed();
      }
    } catch (_) {}
  }

  Future<bool> markVisibleRead(String id) async {
    if (busy ||
        unreadCount == 0 ||
        !_remote.any((m) => m.id == id && m.author == 'developer')) {
      return false;
    }
    busy = true;
    try {
      _applyStatus(
        jsonDecode(
          (await _request(
            '/api/support/read',
            'POST',
            body: {'throughMessageId': id},
            recover: false,
          )).body,
        ) as Map<String, dynamic>,
      );
      await _save();
      return true;
    } catch (_) {
      return false;
    } finally {
      busy = false;
      _changed();
    }
  }

  Future<bool> clearHistory() async {
    if (busy) return false;
    busy = true;
    _changed();
    try {
      await initialize();
      if (_identity != null) {
        await _merge(
          jsonDecode((await _request('/api/messages', 'DELETE')).body)
              as Map<String, dynamic>,
        );
      }
      _drafts = [];
      _imageEpoch++;
      images.clear();
      await storage.clearImages();
      await _save();
      error = null;
      return true;
    } catch (_) {
      error = 'clear';
      return false;
    } finally {
      busy = false;
      _changed();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    client.close();
    super.dispose();
  }
}

/// Oriented JPEG with no source EXIF/GPS metadata, capped to Periperi's 250 KB.
Future<Uint8List?> prepareSupportImage(Uint8List bytes) =>
    compute(_prepareSupportImage, bytes);
Uint8List? _prepareSupportImage(Uint8List bytes) {
  if (bytes.length > 30000000) return null;
  final decoded = img.decodeImage(bytes);
  if (decoded == null) return null;
  final oriented = img.bakeOrientation(decoded);
  if (oriented.width * oriented.height > 60000000) return null;
  for (final side in [1280, 960, 640]) {
    final scale = min(1.0, side / max(oriented.width, oriented.height));
    final resized = img.copyResize(
      oriented,
      width: max(1, (oriented.width * scale).round()),
      height: max(1, (oriented.height * scale).round()),
    );
    final clean = img.Image(
      width: resized.width,
      height: resized.height,
      numChannels: 3,
    );
    img.fill(clean, color: img.ColorRgb8(255, 255, 255));
    img.compositeImage(clean, resized);
    for (final quality in [75, 55, 35]) {
      final jpeg = img.encodeJpg(clean, quality: quality);
      if (jpeg.length <= 250000) return jpeg;
    }
  }
  return null;
}
