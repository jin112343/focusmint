import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/pages/result_page.dart';

/// A short, optional pause after a completed game. Training is saved before entry.
class BreathingPage extends StatefulWidget {
  const BreathingPage({super.key, required this.currentScore});

  final double currentScore;
  static const inhaleSeconds = 4;
  static const exhaleSeconds = 6;
  static const rounds = 1;
  static const duration = Duration(
    seconds: (inhaleSeconds + exhaleSeconds) * rounds,
  );

  @override
  State<BreathingPage> createState() => _BreathingPageState();
}

class _BreathingPageState extends State<BreathingPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final AnimationController _controller;
  bool _finishing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: BreathingPage.duration,
      // Reduced motion changes the visual, not the time available to breathe.
      animationBehavior: AnimationBehavior.preserve,
    )..addStatusListener(_onStatus);
    _controller.forward();
  }

  void _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) _showResult();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_finishing) return;
    if (state == AppLifecycleState.resumed) {
      _controller.forward();
    } else {
      // Do not count time that the user cannot see the guide.
      _controller.stop(canceled: false);
    }
  }

  void _showResult() {
    if (!mounted || _finishing) return;
    _finishing = true;
    _controller.stop(canceled: false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => ResultPage(currentScore: widget.currentScore),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.removeStatusListener(_onStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _showResult();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF4FBF9),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, bounds) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: bounds.maxWidth,
                  minHeight: bounds.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 24,
                  ),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      final elapsed =
                          _controller.value * BreathingPage.duration.inSeconds;
                      const cycle =
                          BreathingPage.inhaleSeconds +
                          BreathingPage.exhaleSeconds;
                      final position = elapsed % cycle;
                      final inhaling = position < BreathingPage.inhaleSeconds;
                      final expansion = inhaling
                          ? position / BreathingPage.inhaleSeconds
                          : 1 -
                                (position - BreathingPage.inhaleSeconds) /
                                    BreathingPage.exhaleSeconds;
                      final diameter = math.min(
                        264.0,
                        math.max(120.0, bounds.maxWidth - 72),
                      );
                      final phase = inhaling
                          ? l10n.breathingIn
                          : l10n.breathingOut;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.breathingTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.breathingHint,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 28),
                          Semantics(
                            liveRegion: true,
                            child: Text(
                              phase,
                              key: const ValueKey('breathing-phase'),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mintGreenDark,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ExcludeSemantics(
                            child: SizedBox(
                              width: diameter,
                              height: diameter * 340 / 300,
                              child: RepaintBoundary(
                                child: CustomPaint(
                                  key: const ValueKey('breathing-visual'),
                                  painter: _BreathingLungsPainter(
                                    expansion: reduceMotion
                                        ? 0.5
                                        : Curves.easeInOut.transform(
                                            expansion.clamp(0.0, 1.0),
                                          ),
                                    seconds: reduceMotion ? 0 : elapsed,
                                    inhaling: reduceMotion ? true : inhaling,
                                    reducedMotion: reduceMotion,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: diameter,
                            child: LinearProgressIndicator(
                              value: _controller.value,
                              minHeight: 4,
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.mintGreenDark,
                              backgroundColor: AppColors.mintGreen.withValues(
                                alpha: 0.12,
                              ),
                              semanticsLabel: l10n.breathingProgress,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.breathingResultHint,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: TextButton(
              onPressed: _showResult,
              child: Text(l10n.breathingSkip),
            ),
          ),
        ),
      ),
    );
  }
}

/// A stylized breathing guide, not an anatomical measurement. The chest, lung
/// volume, airway lights and outgoing wisps share a single 4-in / 6-out cycle.
/// Vector drawing avoids extra bitmap assets, filters, and animation tickers.
class _BreathingLungsPainter extends CustomPainter {
  const _BreathingLungsPainter({
    required this.expansion,
    required this.seconds,
    required this.inhaling,
    required this.reducedMotion,
  });

  final double expansion;
  final double seconds;
  final bool inhaling;
  final bool reducedMotion;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 300, size.height / 340);
    const mint = Color(0xFF32BDA6);
    const outline = Color(0xFFB5D5CD);
    final glow = Rect.fromCircle(center: const Offset(150, 226), radius: 113);
    canvas.drawOval(
      glow,
      Paint()
        ..shader = RadialGradient(
          colors: [
            mint.withValues(alpha: 0.08 + expansion * 0.05),
            mint.withValues(alpha: 0),
          ],
        ).createShader(glow),
    );

    final body = Path()
      ..moveTo(127, 122)
      ..cubicTo(111, 106, 105, 93, 105, 74)
      ..cubicTo(105, 40, 120, 22, 150, 22)
      ..cubicTo(178, 22, 194, 39, 192, 63)
      ..lineTo(201, 81)
      ..quadraticBezierTo(204, 88, 193, 89)
      ..lineTo(193, 101)
      ..quadraticBezierTo(192, 115, 177, 114)
      ..lineTo(176, 132)
      ..cubicTo(184, 140, 225, 139, 238, 164)
      ..cubicTo(250, 187, 249, 252, 254, 317)
      ..lineTo(47, 317)
      ..cubicTo(52, 249, 50, 192, 64, 165)
      ..cubicTo(76, 141, 115, 142, 125, 134)
      ..lineTo(127, 122);
    canvas.drawPath(
      body,
      Paint()..color = Colors.white.withValues(alpha: 0.70),
    );
    canvas.drawPath(
      body,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..strokeJoin = StrokeJoin.round
        ..color = outline,
    );

    // A faint chest contour expands gently without moving the head or shoulders.
    final chestWidth = 67 + 6 * expansion;
    final chest = Path()
      ..moveTo(150 - chestWidth, 192)
      ..quadraticBezierTo(150 - chestWidth - 8, 237, 150 - chestWidth + 2, 293)
      ..moveTo(150 + chestWidth, 192)
      ..quadraticBezierTo(150 + chestWidth + 8, 237, 150 + chestWidth - 2, 293);
    canvas.drawPath(
      chest,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.3
        ..color = outline.withValues(alpha: 0.50),
    );

    final airway = Path()
      ..moveTo(192, 85)
      ..lineTo(169, 85)
      ..quadraticBezierTo(150, 85, 150, 105)
      ..lineTo(150, 175);
    canvas.drawPath(
      airway,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 11
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = mint.withValues(alpha: 0.13),
    );
    canvas.drawPath(
      airway,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5.5
        ..strokeCap = StrokeCap.round
        ..color = mint,
    );

    for (final side in [-1.0, 1.0]) {
      canvas.save();
      canvas.translate(150, 178);
      canvas.scale(side, 1);
      canvas.scale(0.80 + 0.20 * expansion, 0.86 + 0.14 * expansion);
      final lung = Path()
        ..moveTo(14, 12)
        ..cubicTo(31, 0, 48, 16, 55, 40)
        ..cubicTo(61, 59, 62, 83, 59, 101)
        ..cubicTo(57, 119, 34, 123, 20, 112)
        ..cubicTo(12, 104, 11, 91, 11, 76)
        ..lineTo(11, 29)
        ..quadraticBezierTo(11, 17, 14, 12);
      final lungBounds = const Rect.fromLTRB(8, 5, 64, 122);
      canvas.drawPath(
        lung,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(
                const Color(0xFFBEECE3),
                const Color(0xFF8CE7D6),
                expansion,
              )!,
              Color.lerp(
                const Color(0xFF7ED0C6),
                const Color(0xFF39BBAA),
                expansion,
              )!,
            ],
          ).createShader(lungBounds),
      );
      canvas.drawPath(
        lung,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = mint.withValues(alpha: 0.75),
      );

      // Branches make the air route readable without filling the lungs with detail.
      final branches = Path()
        ..moveTo(0, -3)
        ..quadraticBezierTo(4, 9, 20, 24)
        ..lineTo(30, 46)
        ..lineTo(31, 82)
        ..moveTo(30, 46)
        ..lineTo(44, 60)
        ..moveTo(31, 67)
        ..lineTo(21, 79);
      canvas.drawPath(
        branches,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round
          ..color = Colors.white.withValues(alpha: 0.54),
      );
      final route = Path()
        ..moveTo(0, -3)
        ..quadraticBezierTo(6, 10, 20, 24)
        ..quadraticBezierTo(31, 42, 31, 83);
      _drawAirLights(canvas, route, 4, 0.11);
      canvas.restore();
    }
    _drawAirLights(canvas, airway, 6, 0);

    // Tiny curved air wisps move towards the nose on inhale and away on exhale.
    if (!reducedMotion) {
      for (var index = 0; index < 3; index++) {
        final travel = (seconds * 0.32 + index / 3) % 1;
        final distance = inhaling ? 1 - travel : travel;
        final x = 199 + distance * 33;
        final y = 84.0 + (index - 1) * 10;
        final opacity = math.sin(travel * math.pi) * 0.48;
        canvas.drawPath(
          Path()
            ..moveTo(x, y)
            ..quadraticBezierTo(x + 5, y - 3, x + 10, y),
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.6
            ..strokeCap = StrokeCap.round
            ..color = mint.withValues(alpha: opacity),
        );
      }
    }

    // The diaphragm follows the same breath and settles gently on the out-breath.
    final diaphragmY = 301 + expansion * 5;
    canvas.drawPath(
      Path()
        ..moveTo(94, diaphragmY)
        ..quadraticBezierTo(
          150,
          diaphragmY - 9 + expansion * 6,
          206,
          diaphragmY,
        ),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round
        ..color = mint.withValues(alpha: 0.32),
    );
    canvas.restore();
  }

  void _drawAirLights(Canvas canvas, Path route, int count, double offset) {
    if (reducedMotion) return;
    final metric = route.computeMetrics().first;
    for (var index = 0; index < count; index++) {
      final travel = (seconds * 0.24 + index / count + offset) % 1;
      final position = inhaling ? travel : 1 - travel;
      final point = metric
          .getTangentForOffset(position * metric.length)!
          .position;
      final fade = math.sin(travel * math.pi).clamp(0.0, 1.0);
      canvas.drawCircle(
        point,
        3.9,
        Paint()..color = Colors.white.withValues(alpha: 0.10 * fade),
      );
      canvas.drawCircle(
        point,
        1.9,
        Paint()..color = Colors.white.withValues(alpha: 0.90 * fade),
      );
    }
  }

  @override
  bool shouldRepaint(_BreathingLungsPainter oldDelegate) =>
      oldDelegate.expansion != expansion ||
      oldDelegate.seconds != seconds ||
      oldDelegate.inhaling != inhaling ||
      oldDelegate.reducedMotion != reducedMotion;
}
