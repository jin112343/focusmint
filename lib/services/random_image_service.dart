import 'dart:math';

import 'package:logger/logger.dart';

import '../models/image_group.dart';

import 'package:focusmint/services/hidden_image_service.dart';
import 'package:focusmint/constants/placeholder_images.dart';

class RandomImageService {
  static final Logger _logger = Logger();
  static final Random _random = Random();

  static List<String> _availableImages(
    List<String> catalog,
    List<String> folders,
    Set<String> hidden,
  ) => catalog
      .where((name) => folders.any((folder) => name.startsWith('${folder}_')))
      .map((name) => '${PlaceholderImages.facesPath}$name')
      .where((path) => !hidden.contains(path))
      .toList();

  /// 3つのグループからランダムに1つを選択
  static ImageGroup selectRandomGroup() {
    final groups = ImageGroup.values;
    final selectedGroup = groups[_random.nextInt(groups.length)];

    _logger.i('selectRandomGroup', error: null, stackTrace: null);
    _logger.i('選択されたグループ: ${selectedGroup.name}');

    return selectedGroup;
  }

  /// 指定されたグループから良い画像1枚と悪い画像3枚をランダム選択（非表示画像を除外）
  static Future<List<String>> selectImagesForGroup(ImageGroup group) async {
    try {
      final hiddenImageService = HiddenImageService();
      final hiddenImages = await hiddenImageService.getHiddenImages();
      final selectedImages = <String>[];

      // 良い画像を1枚選択
      final availableGoodImages = _availableImages(
        PlaceholderImages.positiveImages,
        group.goodImageFolders,
        hiddenImages,
      );

      if (availableGoodImages.isNotEmpty) {
        final selectedGoodImage =
            availableGoodImages[_random.nextInt(availableGoodImages.length)];
        selectedImages.add(selectedGoodImage);

        _logger.i(
          'selectImagesForGroup - 良い画像選択',
          error: null,
          stackTrace: null,
        );
        _logger.i('選択された良い画像: $selectedGoodImage');
      }

      // 悪い画像を3枚選択
      final availableBadImages = _availableImages(
        PlaceholderImages.negativeImages,
        group.badImageFolders,
        hiddenImages,
      );

      // 利用可能な悪い画像から3枚をランダム選択
      final selectedBadImages = <String>[];
      final availableBadShuffled = List<String>.from(availableBadImages);
      availableBadShuffled.shuffle(_random);

      for (int i = 0; i < 3 && i < availableBadShuffled.length; i++) {
        selectedBadImages.add(availableBadShuffled[i]);
      }

      selectedImages.addAll(selectedBadImages);

      _logger.i('selectImagesForGroup - 悪い画像選択', error: null, stackTrace: null);
      _logger.i('選択された悪い画像: $selectedBadImages');

      // 画像をシャッフルして表示順をランダムに
      final imagesToShuffle = List<String>.from(selectedImages);
      imagesToShuffle.shuffle(_random);

      _logger.i('selectImagesForGroup - 完了', error: null, stackTrace: null);
      _logger.i('最終的な画像リスト: $imagesToShuffle');

      return imagesToShuffle;
    } catch (e, stackTrace) {
      _logger.e('selectImagesForGroup', error: e, stackTrace: stackTrace);
      _logger.e('グループ: ${group.name}, エラー: $e');
      rethrow;
    }
  }

  /// 完全なランダム選択プロセス（グループ選択 + 画像選択）
  static Future<List<String>> selectRandomImages() async {
    try {
      final selectedGroup = selectRandomGroup();
      final images = await selectImagesForGroup(selectedGroup);

      _logger.i('selectRandomImages - 完了', error: null, stackTrace: null);
      _logger.i('選択されたグループ: ${selectedGroup.name}, 画像数: ${images.length}');

      return images;
    } catch (e, stackTrace) {
      _logger.e('selectRandomImages', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
