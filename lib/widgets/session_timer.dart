import 'package:flutter/material.dart';

class SessionTimer extends StatelessWidget {
  final int remainingSeconds;
  final double progressPercent;
  final VoidCallback? onTimeUp;
  final bool showProgress;
  
  const SessionTimer({
    super.key,
    required this.remainingSeconds,
    required this.progressPercent,
    this.onTimeUp,
    this.showProgress = true,
  });

  @override
  Widget build(BuildContext context) {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    final timeText = '$minutes:${seconds.toString().padLeft(2, '0')}';
    
    final isLowTime = remainingSeconds <= 60;
    final timeColor = isLowTime ? Colors.red : Colors.black87;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timeText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: timeColor,
              fontFamily: 'monospace',
            ),
          ),
          if (showProgress) ...[
            const SizedBox(height: 8),
            SizedBox(
              width: 120,
              height: 4,
              child: LinearProgressIndicator(
                value: progressPercent,
                backgroundColor: Colors.grey.withValues(alpha: 0.3),
                valueColor: AlwaysStoppedAnimation<Color>(
                  isLowTime ? Colors.red : Colors.blue,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CircularSessionTimer extends StatelessWidget {
  final int remainingSeconds;
  final double progressPercent;
  final double size;
  final bool showDigitalTime;
  
  const CircularSessionTimer({
    super.key,
    required this.remainingSeconds,
    required this.progressPercent,
    this.size = 80.0,
    this.showDigitalTime = true,
  });

  @override
  Widget build(BuildContext context) {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    final timeText = '$minutes:${seconds.toString().padLeft(2, '0')}';
    
    final isLowTime = remainingSeconds <= 60;
    final progressColor = isLowTime ? Colors.red : Colors.blue;
    
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progressPercent,
            strokeWidth: 6,
            backgroundColor: Colors.grey.withValues(alpha: 0.3),
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
          if (showDigitalTime)
            Text(
              timeText,
              style: TextStyle(
                fontSize: size * 0.15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'monospace',
              ),
            ),
        ],
      ),
    );
  }
}