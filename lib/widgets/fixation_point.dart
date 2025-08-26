import 'package:flutter/material.dart';

class FixationPoint extends StatefulWidget {
  final double size;
  final Color color;
  final bool animate;
  
  const FixationPoint({
    super.key,
    this.size = 20.0,
    this.color = Colors.black,
    this.animate = true,
  });

  @override
  State<FixationPoint> createState() => _FixationPointState();
}

class _FixationPointState extends State<FixationPoint>
    with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    if (widget.animate) {
      _controller = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
      
      _animation = Tween<double>(
        begin: 0.8,
        end: 1.2,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
      
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    if (widget.animate) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animate) {
      return _buildFixationPoint(1.0);
    }
    
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return _buildFixationPoint(_animation.value);
      },
    );
  }

  Widget _buildFixationPoint(double scale) {
    return Center(
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: widget.size * 0.6,
          ),
        ),
      ),
    );
  }
}