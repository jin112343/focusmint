import 'package:flutter/material.dart';
import 'package:focusmint/constants/app_colors.dart';

class PointEarnedOverlay extends StatefulWidget {
  final double points;
  final bool isCorrect;
  final Duration displayDuration;
  final VoidCallback? onComplete; // 完了時のコールバックを追加

  const PointEarnedOverlay({
    super.key,
    required this.points,
    required this.isCorrect,
    this.displayDuration = const Duration(milliseconds: 500), // 0.5秒に短縮
    this.onComplete,
  });

  @override
  State<PointEarnedOverlay> createState() => _PointEarnedOverlayState();
}

class _PointEarnedOverlayState extends State<PointEarnedOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.displayDuration,
      vsync: this,
    );

    // スケールアニメーション（バウンス効果）
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.bounceOut),
    ));

    // 透明度アニメーション（フェードアウト）
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
    ));

    // アニメーション開始
    _controller.forward();

    // 指定時間後に完了コールバックを呼び出す
    Future.delayed(widget.displayDuration, () {
      if (mounted && widget.onComplete != null) {
        widget.onComplete!();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          color: Colors.white,
          child: Center(
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.isCorrect ? Icons.check_circle : Icons.add_circle,
                      size: 60, // サイズを小さく
                      color: widget.isCorrect ? Colors.green : Colors.orange,
                    ),
                    const SizedBox(height: 16), // 間隔を短く
                    Text(
                      '+${widget.points.toStringAsFixed(2)}', // 小数点第二位まで表示
                      style: const TextStyle(
                        fontSize: 40, // フォントサイズを小さく
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8), // 間隔を短く
                    const Text(
                      'ポイント獲得！',
                      style: TextStyle(
                        fontSize: 16, // フォントサイズを小さく
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}