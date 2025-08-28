import 'package:flutter/material.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/l10n/app_localizations.dart';

class StimulusGrid extends StatelessWidget {
  final List<ImageStimulus> stimuli;
  final Function(String stimulusId)? onStimulusSelected;
  final double? gridSize;
  final bool showPlaceholders;
  final String? selectedStimulusId; // 選択されたボタンのID
  
  const StimulusGrid({
    super.key,
    required this.stimuli,
    this.onStimulusSelected,
    this.gridSize,
    this.showPlaceholders = true,
    this.selectedStimulusId, // 追加
  });

  @override
  Widget build(BuildContext context) {
    if (stimuli.isEmpty) {
      return Center(
        child: Text(AppLocalizations.of(context)!.noStimuliAvailable),
      );
    }

    final gridLayout = TrainingLayouts.gridLayouts[stimuli.length];
    if (gridLayout == null) {
      return Center(
        child: Text(AppLocalizations.of(context)!.invalidGridSize),
      );
    }

    final columns = gridLayout['columns'] as int;
    final aspectRatio = gridLayout['aspectRatio'] as double;
    
    final effectiveGridSize = gridSize ?? 
        (MediaQuery.of(context).size.width * 0.95);

    return Center(
      child: Container(
        width: effectiveGridSize,
        height: effectiveGridSize,
        padding: const EdgeInsets.all(8),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 1.0,
            ),
            itemCount: stimuli.length,
            itemBuilder: (context, index) {
              return StimulusItem(
                stimulus: stimuli[index],
                onTap: onStimulusSelected != null 
                    ? () => onStimulusSelected!(stimuli[index].id)
                    : null,
                showPlaceholder: showPlaceholders,
                isSelected: selectedStimulusId == stimuli[index].id, // 選択状態を渡す
              );
            },
          ),
        ),
      ),
    );
  }
}

class StimulusItem extends StatefulWidget {
  final ImageStimulus stimulus;
  final VoidCallback? onTap;
  final bool showPlaceholder;
  final bool isSelected; // 選択状態
  
  const StimulusItem({
    super.key,
    required this.stimulus,
    this.onTap,
    this.showPlaceholder = true,
    this.isSelected = false, // 追加
  });

  @override
  State<StimulusItem> createState() => _StimulusItemState();
}

class _StimulusItemState extends State<StimulusItem>
    with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.onTap != null) {
      setState(() => _isPressed = true);
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (_isPressed) {
      setState(() => _isPressed = false);
      _controller.reverse();
      widget.onTap?.call();
    }
  }

  void _handleTapCancel() {
    if (_isPressed) {
      setState(() => _isPressed = false);
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: widget.isSelected 
                      ? Colors.green.withValues(alpha: 0.8)
                      : Colors.grey.withValues(alpha: 0.3),
                  width: widget.isSelected ? 3 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Stack(
                  children: [
                    widget.showPlaceholder
                        ? _buildPlaceholderFace()
                        : _buildImageFace(),
                    // 選択時の半透明緑オーバーレイ
                    if (widget.isSelected)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceholderFace() {
    final isPositive = widget.stimulus.valence == Valence.positive;
    final backgroundColor = isPositive ? Colors.yellow.withValues(alpha: 0.3) : Colors.red.withValues(alpha: 0.3);
    final iconColor = isPositive ? Colors.orange : Colors.red;
    final icon = _getEmotionIcon();

    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: iconColor,
            ),
            const SizedBox(height: 4),
            Text(
              _getEmotionLabel(context),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageFace() {
    return Image.asset(
      widget.stimulus.assetPath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _buildPlaceholderFace();
      },
    );
  }

  IconData _getEmotionIcon() {
    switch (widget.stimulus.emotion) {
      case Emotion.happiness:
        return Icons.sentiment_very_satisfied;
      case Emotion.anger:
        return Icons.sentiment_very_dissatisfied;
      case Emotion.fear:
        return Icons.sentiment_dissatisfied;
      case Emotion.sadness:
        return Icons.sentiment_dissatisfied;
    }
  }

  String _getEmotionLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (widget.stimulus.emotion) {
      case Emotion.happiness:
        return l10n.happy;
      case Emotion.anger:
        return l10n.angry;
      case Emotion.fear:
        return l10n.fear;
      case Emotion.sadness:
        return l10n.sad;
    }
  }
}

class GridPreview extends StatelessWidget {
  final int gridSize;
  final double size;
  
  const GridPreview({
    super.key,
    required this.gridSize,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    final gridLayout = TrainingLayouts.gridLayouts[gridSize];
    if (gridLayout == null) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(AppLocalizations.of(context)!.unknown)),
      );
    }

    final columns = gridLayout['columns'] as int;

    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: gridSize,
        itemBuilder: (context, index) {
          final isTarget = index == 0; // First item is target
          return Container(
            decoration: BoxDecoration(
              color: isTarget 
                  ? Colors.yellow.withValues(alpha: 0.5) 
                  : Colors.red.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Icon(
              isTarget 
                  ? Icons.sentiment_very_satisfied 
                  : Icons.sentiment_very_dissatisfied,
              size: (size / columns) * 0.6,
              color: isTarget ? Colors.orange : Colors.red,
            ),
          );
        },
      ),
    );
  }
}