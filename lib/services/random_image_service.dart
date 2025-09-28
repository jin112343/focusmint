import 'dart:math';
import 'package:logger/logger.dart';
import '../models/image_group.dart';
import 'package:focusmint/services/hidden_image_service.dart';
import 'package:focusmint/services/image_service.dart';

class RandomImageService {
  static final Logger _logger = Logger();
  static final Random _random = Random();
  
  /// 良い画像フォルダごとの画像枚数
  static const Map<String, int> _goodImageCounts = {
    'smile': 20,
    'vegetables': 13,
    'health': 19,
  };

  /// 悪い画像フォルダごとの画像枚数
  static const Map<String, int> _badImageCounts = {
    'sad': 51,
    'badfood': 34,
    'bad': 16,
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
  
  /// 指定されたグループから良い画像1枚と悪い画像3枚をランダム選択（非表示画像を除外）
  static Future<List<String>> selectImagesForGroup(ImageGroup group) async {
    try {
      final hiddenImageService = HiddenImageService();
      final hiddenImages = await hiddenImageService.getHiddenImages();
      final selectedImages = <String>[];
      
      // 良い画像を1枚選択
      final goodFolder = group.goodImageFolders.first;
      final goodImageCount = _goodImageCounts[goodFolder]!;
      final availableGoodImages = <String>[];
      
      // 非表示でない良い画像を収集
      for (int i = 1; i <= goodImageCount; i++) {
        final imagePath = 'assets/images/${goodFolder}_${i.toString().padLeft(2, '0')}.jpg';
        if (!hiddenImages.contains(imagePath)) {
          availableGoodImages.add(imagePath);
        }
      }
      
      if (availableGoodImages.isNotEmpty) {
        final selectedGoodImage = availableGoodImages[_random.nextInt(availableGoodImages.length)];
        selectedImages.add(selectedGoodImage);
        
        _logger.i('selectImagesForGroup - 良い画像選択', 
            error: null, 
            stackTrace: null);
        _logger.i('選択された良い画像: $selectedGoodImage');
      }
      
      // 悪い画像を3枚選択
      final badFolder = group.badImageFolders.first;
      final badImageCount = _badImageCounts[badFolder]!;
      final availableBadImages = <String>[];
      
      // 非表示でない悪い画像を収集
      for (int i = 1; i <= badImageCount; i++) {
        final imagePath = 'assets/images/${badFolder}_${i.toString().padLeft(2, '0')}.jpg';
        if (!hiddenImages.contains(imagePath)) {
          availableBadImages.add(imagePath);
        }
      }
      
      // 利用可能な悪い画像から3枚をランダム選択
      final selectedBadImages = <String>[];
      final availableBadShuffled = List<String>.from(availableBadImages);
      availableBadShuffled.shuffle(_random);
      
      for (int i = 0; i < 3 && i < availableBadShuffled.length; i++) {
        selectedBadImages.add(availableBadShuffled[i]);
      }
      
      selectedImages.addAll(selectedBadImages);
      
      _logger.i('selectImagesForGroup - 悪い画像選択', 
          error: null, 
          stackTrace: null);
      _logger.i('選択された悪い画像: $selectedBadImages');
      
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
  static Future<List<String>> selectRandomImages() async {
    try {
      // ImageServiceのキャッシュをクリアして最新の非表示設定を反映
      ImageService().refreshCache();
      
      final selectedGroup = selectRandomGroup();
      final images = await selectImagesForGroup(selectedGroup);
      
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