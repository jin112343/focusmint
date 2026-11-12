import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/services/support_service.dart';
import 'package:focusmint/pages/web_view_page.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({super.key});
  @override
  ConsumerState<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPage>
    with WidgetsBindingObserver {
  final _text = TextEditingController(), _scroll = ScrollController();
  final _viewport = GlobalKey();
  final Map<String, GlobalKey> _replyKeys = {};
  final Set<String> _imageRequests = {};
  Timer? _timer;
  Uint8List? _attachment;
  bool _picking = false, _blocked = false, _active = true, _reading = false;
  bool _firstLoad = true;
  bool _stickToBottom = true;
  DateTime _nextRead = DateTime.fromMillisecondsSinceEpoch(0);
  late SupportService _service;
  AppLocalizations get l => AppLocalizations.of(context)!;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _service = ref.read(supportProvider);
    _service.addListener(_changed);
    _scroll.addListener(_readVisible);
    _timer = Timer.periodic(const Duration(seconds: 12), (_) {
      if (_canRead) _refresh();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _refresh();
    });
  }

  bool get _canRead =>
      mounted &&
      _active &&
      !_blocked &&
      !_picking &&
      ModalRoute.of(context)?.isCurrent == true;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _active = state == AppLifecycleState.resumed;
    if (_active) _refresh();
  }

  void _changed() {
    if (!mounted) return;
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _loadVisibleImages();
        _readVisible();
      }
    });
  }

  Future<void> _refresh() async {
    final nearBottom =
        !_scroll.hasClients || _scroll.position.extentAfter < 100;
    await _service.refresh();
    if (!mounted) return;
    if (_firstLoad || nearBottom) {
      _firstLoad = false;
      _bottom();
    }
    _loadVisibleImages();
    _readVisible();
  }

  void _bottom() {
    _stickToBottom = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scroll.hasClients) {
        _scroll.jumpTo(_scroll.position.maxScrollExtent);
        _readVisible();
      }
    });
  }

  void _loadVisibleImages() {
    if (_service.busy) return;
    for (final message in _service.messages.where((m) => m.hasImage)) {
      if (_service.images.containsKey(message.id) ||
          !_imageRequests.add(message.id)) {
        continue;
      }
      _service
          .loadImage(message)
          .whenComplete(() => _imageRequests.remove(message.id));
    }
  }

  Future<void> _readVisible() async {
    if (!_canRead ||
        _reading ||
        _service.busy ||
        _service.unreadCount == 0 ||
        DateTime.now().isBefore(_nextRead)) {
      return;
    }
    final viewport = _viewport.currentContext?.findRenderObject();
    if (viewport is! RenderBox || !viewport.hasSize) return;
    final rect = viewport.localToGlobal(Offset.zero) & viewport.size;
    String? candidate;
    for (final message in _service.messages.where(
      (m) => m.author == 'developer',
    )) {
      final box = _replyKeys[message.id]?.currentContext?.findRenderObject();
      if (box is! RenderBox || !box.hasSize || !box.attached) continue;
      final overlap = (box.localToGlobal(Offset.zero) & box.size).intersect(
        rect,
      );
      if (overlap.width > 0 && overlap.height >= min(24, box.size.height)) {
        candidate = message.id;
      }
    }
    if (candidate == null) return;
    final history = _service.messages;
    final readIndex = history.indexWhere(
      (m) => m.id == _service.lastReadMessageId,
    );
    if (history.indexWhere((m) => m.id == candidate) <= readIndex) return;
    _reading = true;
    try {
      if (!await _service.markVisibleRead(candidate)) {
        _nextRead = DateTime.now().add(const Duration(seconds: 10));
      }
    } finally {
      _reading = false;
    }
  }

  Future<void> _pick() async {
    setState(() => _picking = true);
    try {
      final photo = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1280,
        maxHeight: 1280,
        imageQuality: 90,
      );
      if (photo == null) return;
      if (await photo.length() > 30000000) throw const FormatException();
      final prepared = await prepareSupportImage(await photo.readAsBytes());
      if (prepared == null) throw const FormatException();
      if (mounted) setState(() => _attachment = prepared);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.supportImageError)));
      }
    } finally {
      if (mounted) setState(() => _picking = false);
    }
  }

  Future<void> _send() async {
    final id = await _service.queue(_text.text, _attachment);
    if (id == null || !mounted) return;
    _text.clear();
    setState(() => _attachment = null);
    _bottom();
    await _service.retry(id);
    if (mounted) _bottom();
  }

  Future<void> _clear() async {
    _blocked = true;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.supportClear),
        content: Text(l.supportClearConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l.supportClear),
          ),
        ],
      ),
    );
    if (confirm == true) await _service.clearHistory();
    _blocked = false;
    if (mounted) _readVisible();
  }

  Future<void> _preview(Uint8List bytes) async {
    _blocked = true;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text(l.supportImage)),
          body: Center(
            child: InteractiveViewer(
              child: Image.memory(bytes, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
    _blocked = false;
    if (mounted) _readVisible();
  }

  String? get _error => switch (_service.error) {
    'connection' => l.supportConnectionError,
    'send' => l.supportSendError,
    'storage' => l.supportStorageError,
    'clear' => l.supportClearError,
    _ => null,
  };
  @override
  Widget build(BuildContext context) {
    final messages = _service.messages;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.contactUs),
        actions: [
          IconButton(
            tooltip: l.supportRetry,
            onPressed: _service.busy ? null : _refresh,
            icon: const Icon(Icons.refresh),
          ),
          PopupMenuButton<String>(
            tooltip: l.supportClear,
            onOpened: () {
              _blocked = true;
            },
            onCanceled: () {
              _blocked = false;
            },
            onSelected: (_) {
              _blocked = false;
              _clear();
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 'clear',
                enabled: !_service.busy,
                child: Text(l.supportClear),
              ),
            ],
          ),
        ],
      ),
      body: NotificationListener<ScrollMetricsNotification>(
        onNotification: (notification) {
          if (_stickToBottom) _bottom();
          return false;
        },
        child: SafeArea(
          child: Column(
            children: [
              if (_service.busy) const LinearProgressIndicator(minHeight: 2),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is UserScrollNotification &&
                        notification.direction != ScrollDirection.idle) {
                      _stickToBottom = notification.metrics.extentAfter < 24;
                    }
                    _readVisible();
                    return false;
                  },
                  child: ListView.builder(
                    key: _viewport,
                    controller: _scroll,
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _bubble(
                              l.supportIntro,
                              user: false,
                              caption: l.supportGuide,
                            ),
                            TextButton(
                              onPressed: () async {
                                _blocked = true;
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => WebViewPage(
                                      url: _service.base
                                          .resolve('/support-privacy')
                                          .toString(),
                                      title: l.supportPrivacy,
                                    ),
                                  ),
                                );
                                _blocked = false;
                                if (mounted) _readVisible();
                              },
                              child: Text(l.supportPrivacy),
                            ),
                            const SizedBox(height: 12),
                          ],
                        );
                      }
                      final message = messages[index - 1];
                      return KeyedSubtree(
                        key: message.author == 'developer'
                            ? _replyKeys.putIfAbsent(
                                message.id,
                                () => GlobalKey(),
                              )
                            : ValueKey(message.id),
                        child: _message(message),
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border(top: BorderSide(color: Colors.grey.shade200)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_attachment != null)
                      Row(
                        children: [
                          Image.memory(
                            _attachment!,
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                          ),
                          TextButton(
                            onPressed: () => setState(() => _attachment = null),
                            child: Text(l.supportRemoveImage),
                          ),
                        ],
                      ),
                    if (_error != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          _error!,
                          key: const ValueKey('contact.error'),
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          tooltip: l.supportAttach,
                          onPressed: _picking || _service.busy ? null : _pick,
                          icon: const Icon(Icons.add_photo_alternate_outlined),
                        ),
                        Expanded(
                          child: TextField(
                            key: const ValueKey('contact.composer'),
                            controller: _text,
                            minLines: 1,
                            maxLines: 4,
                            onChanged: (_) => setState(() {}),
                            inputFormatters: [
                              TextInputFormatter.withFunction(
                                (oldValue, newValue) =>
                                    newValue.text.length <= 2000
                                    ? newValue
                                    : oldValue,
                              ),
                            ],
                            decoration: InputDecoration(
                              hintText: l.supportComposer,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                        IconButton.filled(
                          key: const ValueKey('contact.send'),
                          tooltip: l.supportSend,
                          onPressed:
                              _picking ||
                                  _service.busy ||
                                  _service.remaining == 0 ||
                                  (_text.text.trim().isEmpty &&
                                      _attachment == null)
                              ? null
                              : _send,
                          icon: _picking
                              ? const SizedBox.square(
                                  dimension: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.send),
                        ),
                      ],
                    ),
                    if (_service.remaining == 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          l.supportQuota,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        l.supportRemaining(_service.remaining),
                        key: const ValueKey('contact.remaining'),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _message(SupportMessage m) {
    final bytes = _service.images[m.id];
    final user = m.author == 'user';
    final body = m.body == 'support.received' ? l.supportReceived : m.body;
    final date = DateTime.tryParse(m.createdAt);
    return _bubble(
      body,
      user: user,
      caption: user
          ? (m.sent ? l.supportSent : l.supportUnsent)
          : (m.author == 'developer' ? l.supportDeveloper : l.supportGuide),
      image: bytes,
      hasImage: m.hasImage,
      date: date,
      retry: !m.sent ? () => _service.retry(m.id) : null,
    );
  }

  Widget _bubble(
    String body, {
    required bool user,
    String? caption,
    Uint8List? image,
    bool hasImage = false,
    DateTime? date,
    VoidCallback? retry,
  }) {
    return Align(
      alignment: user
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            bottom: 16,
            start: user ? 32 : 0,
            end: user ? 0 : 32,
          ),
          child: Column(
            crossAxisAlignment: user
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              if (caption != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    caption,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: user
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (image != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Semantics(
                          label: l.supportImage,
                          button: true,
                          child: InkWell(
                            onTap: () => _preview(image),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 220),
                              child: Image.memory(
                                image,
                                fit: BoxFit.contain,
                                cacheWidth: 640,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (hasImage && image == null)
                      Text(
                        l.supportImage,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    if (body.isNotEmpty) SelectableText(body),
                  ],
                ),
              ),
              if (date != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    _messageDate(date),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              if (retry != null)
                TextButton(
                  onPressed: _service.busy ? null : retry,
                  child: Text(l.supportRetry),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _messageDate(DateTime date) {
    final local = date.toLocal();
    final material = MaterialLocalizations.of(context);
    final day = material.formatShortDate(local);
    final time = material.formatTimeOfDay(
      TimeOfDay.fromDateTime(local),
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
    );
    return '$day $time';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _service.removeListener(_changed);
    _text.dispose();
    _scroll.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
