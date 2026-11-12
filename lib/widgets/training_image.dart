import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:focusmint/constants/training_image_policy.dart';

/// Preserve proportions, crop consistently, and decode only the tile's pixels.
class TrainingImage extends StatelessWidget {
  const TrainingImage({
    super.key,
    required this.path,
    this.isFile = false,
    this.errorBuilder,
  });

  final String path;
  final bool isFile;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = TrainingImagePolicy.decodeWidth(
          constraints.maxWidth,
          MediaQuery.devicePixelRatioOf(context),
        );
        if (isFile) {
          return Image.file(
            File(path),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            cacheWidth: width,
            errorBuilder: errorBuilder,
          );
        }
        return Image.asset(
          TrainingImagePolicy.resolveAssetPath(path),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          cacheWidth: width,
          errorBuilder: errorBuilder,
        );
      },
    );
  }
}
