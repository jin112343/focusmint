import 'package:flutter/material.dart';
import 'package:focusmint/constants/app_colors.dart';

class CircularProgressWidget extends StatelessWidget {
  final int currentPoints;
  final int maxPoints;
  final double size;
  
  const CircularProgressWidget({
    super.key,
    required this.currentPoints,
    this.maxPoints = 10000,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (currentPoints / maxPoints).clamp(0.0, 1.0);
    
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // 背景の円
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 12,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ),
          // プログレス円
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 12,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.mintGreen),
              strokeCap: StrokeCap.round,
            ),
          ),
          // 中央のポイント表示
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentPoints.toString(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'POINTS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}