import 'placeholder_images.dart';

/// Bundled images, custom imports and thumbnail decoding share these bounds.
class TrainingImagePolicy {
  static const maxSide = 512;
  static const importJpegQuality = 88;

  static final _bundledNames = {
    ...PlaceholderImages.positiveImages,
    ...PlaceholderImages.negativeImages,
  };

  /// Keep existing hidden-image preferences after format/content updates.
  /// File paths for user-added images and unrelated assets remain unchanged.
  static String resolveAssetPath(String path) {
    const prefix = 'assets/images/';
    if (!path.startsWith(prefix)) return path;
    final filename = path.substring(prefix.length);
    final webp = filename.replaceFirst(
      RegExp(r'\.(jpe?g|png)$', caseSensitive: false),
      '.webp',
    );
    final replacement = webp.replaceFirst(RegExp(r'\.webp$'), '_v2.webp');
    final current = _bundledNames.contains(webp) ? webp : replacement;
    return _bundledNames.contains(current) ? '$prefix$current' : path;
  }

  static int decodeWidth(double logicalWidth, double pixelRatio) {
    if (!logicalWidth.isFinite || logicalWidth <= 0) return maxSide;
    // Bucket sizes reduce cache churn between similar tile sizes.
    return ((logicalWidth * pixelRatio / 64).ceil() * 64).clamp(64, maxSide);
  }
}
