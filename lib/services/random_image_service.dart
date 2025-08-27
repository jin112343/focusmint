import 'dart:math';
import 'package:logger/logger.dart';
import '../models/image_group.dart';

class RandomImageService {
  static final Logger _logger = Logger();
  static final Random _random = Random();
  
  /// 良い画像フォルダごとの画像枚数
  static const Map<String, int> _goodImageCounts = {
    'smile': 15,
    'vegetables': 8,
    'health': 8,
  };
  
  /// 悪い画像フォルダごとの画像枚数
  static const Map<String, int> _badImageCounts = {
    'sad': 29,
    'badfood': 13,
    'bad': 6,
  };
  
  /// 3つのグループからランダムに1つを選択
  static ImageGroup selectRandomGroup() {
    final groups = ImageGroup.values;
    final selectedGroup = groups[_random.nextInt(groups.length)];
    
    _logger.i('selectRandomGroup', 
        error: null, 
        stackTrace: null);
    _logger.i('選択されたグループ: ${selectedGroup.name}');
    
    return selectedGroup;
  }
  
  /// 指定されたグループから良い画像1枚と悪い画像3枚をランダム選択
  static List<String> selectImagesForGroup(ImageGroup group) {
    try {
      final selectedImages = <String>[];
      
      // 良い画像を1枚選択
      final goodFolder = group.goodImageFolders.first;
      final goodImageCount = _goodImageCounts[goodFolder]!;
      final goodImageIndex = _random.nextInt(goodImageCount) + 1;
      final goodImagePath = 'assets/images/$goodFolder/${goodImageIndex.toString().padLeft(2, '0')}.jpg';
      selectedImages.add(goodImagePath);
      
      _logger.i('selectImagesForGroup - 良い画像選択', 
          error: null, 
          stackTrace: null);
      _logger.i('選択された良い画像: $goodImagePath');
      
      // 悪い画像を3枚選択
      final badFolder = group.badImageFolders.first;
      final badImageCount = _badImageCounts[badFolder]!;
      final selectedBadIndices = <int>[];
      
      while (selectedBadIndices.length < 3) {
        final badImageIndex = _random.nextInt(badImageCount) + 1;
        if (!selectedBadIndices.contains(badImageIndex)) {
          selectedBadIndices.add(badImageIndex);
          final badImagePath = 'assets/images/$badFolder/${badImageIndex.toString().padLeft(2, '0')}.jpg';
          selectedImages.add(badImagePath);
        }
      }
      
      _logger.i('selectImagesForGroup - 悪い画像選択', 
          error: null, 
          stackTrace: null);
      _logger.i('選択された悪い画像: ${selectedImages.sublist(1)}');
      
      // 画像をシャッフルして表示順をランダムに
      final imagesToShuffle = List<String>.from(selectedImages);
      imagesToShuffle.shuffle(_random);
      
      _logger.i('selectImagesForGroup - 完了', 
          error: null, 
          stackTrace: null);
      _logger.i('最終的な画像リスト: $imagesToShuffle');
      
      return imagesToShuffle;
      
    } catch (e, stackTrace) {
      _logger.e('selectImagesForGroup', 
          error: e, 
          stackTrace: stackTrace);
      _logger.e('グループ: ${group.name}, エラー: $e');
      rethrow;
    }
  }
  
  /// 完全なランダム選択プロセス（グループ選択 + 画像選択）
  static List<String> selectRandomImages() {
    try {
      final selectedGroup = selectRandomGroup();
      final images = selectImagesForGroup(selectedGroup);
      
      _logger.i('selectRandomImages - 完了', 
          error: null, 
          stackTrace: null);
      _logger.i('選択されたグループ: ${selectedGroup.name}, 画像数: ${images.length}');
      
      return images;
      
    } catch (e, stackTrace) {
      _logger.e('selectRandomImages', 
          error: e, 
          stackTrace: stackTrace);
      rethrow;
    }
  }
}