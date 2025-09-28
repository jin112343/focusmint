import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/services/hidden_image_service.dart';

class ImageService {
  static final ImageService _instance = ImageService._internal();
  factory ImageService() => _instance;
  
  late final Random _random;
  final Map<ImageGroup, List<String>> _positiveImageCache = {};
  final Map<ImageGroup, List<String>> _negativeImageCache = {};
  final HiddenImageService _hiddenImageService = HiddenImageService();
  
  ImageService._internal() {
    _random = Random();
  }

  /// アセットフォルダ内の画像ファイル一覧を取得
  Future<List<String>> _loadImageFilenames(String prefix) async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = 
          const JsonDecoder().convert(manifestContent) as Map<String, dynamic>;
      
      final imagePaths = manifestMap.keys
          .where((String key) => key.startsWith('assets/images/'))
          .where((String key) => key.toLowerCase().endsWith('.jpg') || 
                                key.toLowerCase().endsWith('.jpeg') || 
                                key.toLowerCase().endsWith('.png'))
          .where((String key) => key.contains(prefix))
          .toList();
      
      print('_loadImageFilenames: Prefix: $prefix');
      print('_loadImageFilenames: Found ${imagePaths.length} images: $imagePaths');
      
      return imagePaths;
    } catch (e) {
      print('_loadImageFilenames: Error: $e');
      return [];
    }
  }

  /// 指定されたグループの正の画像一覧を取得（キャッシュ付き、非表示画像を除外）
  Future<List<String>> _getPositiveImages(ImageGroup group) async {
    if (_positiveImageCache[group] != null) {
      print('_getPositiveImages: Using cached images for ${group.name}');
      return _positiveImageCache[group]!;
    }
    
    final prefix = _getPositivePrefix(group);
    final images = await _loadImageFilenames(prefix);
    final hiddenImages = await _hiddenImageService.getHiddenImages();
    print('_getPositiveImages: Group: ${group.name}, Total images: ${images.length}, Hidden: ${hiddenImages.length}');
    print('_getPositiveImages: Hidden images: $hiddenImages');
    
    final availableImages = images.where((image) => !hiddenImages.contains(image)).toList();
    print('_getPositiveImages: Available images after filtering: ${availableImages.length}');
    print('_getPositiveImages: Available images: $availableImages');
    
    _positiveImageCache[group] = availableImages;
    return availableImages;
  }

  /// 指定されたグループの負の画像一覧を取得（キャッシュ付き、非表示画像を除外）
  Future<List<String>> _getNegativeImages(ImageGroup group) async {
    if (_negativeImageCache[group] != null) {
      print('_getNegativeImages: Using cached images for ${group.name}');
      return _negativeImageCache[group]!;
    }
    
    final prefix = _getNegativePrefix(group);
    final images = await _loadImageFilenames(prefix);
    final hiddenImages = await _hiddenImageService.getHiddenImages();
    print('_getNegativeImages: Group: ${group.name}, Total images: ${images.length}, Hidden: ${hiddenImages.length}');
    print('_getNegativeImages: Hidden images: $hiddenImages');
    
    final availableImages = images.where((image) => !hiddenImages.contains(image)).toList();
    print('_getNegativeImages: Available images after filtering: ${availableImages.length}');
    print('_getNegativeImages: Available images: $availableImages');
    
    _negativeImageCache[group] = availableImages;
    return availableImages;
  }

  /// 指定されたグループでランダムによくない画像3枚と良い画像1枚を選択して返す
  Future<List<ImageStimulus>> getRandomStimuliSet(ImageGroup group) async {
    final List<ImageStimulus> stimuliSet = [];
    
    print('getRandomStimuliSet: Starting for group ${group.name}');
    
    // 負の画像から3枚をランダム選択
    final negativeImages = await _getNegativeImages(group);
    print('getRandomStimuliSet: Available negative images: ${negativeImages.length}');
    
    if (negativeImages.isNotEmpty) {
      final negativeShuffled = List<String>.from(negativeImages);
      negativeShuffled.shuffle(_random);
      final selectedNegative = negativeShuffled.take(3);
      
      for (int i = 0; i < selectedNegative.length; i++) {
        final imagePath = selectedNegative.elementAt(i);
        print('getRandomStimuliSet: Adding negative image: $imagePath');
        stimuliSet.add(ImageStimulus(
          id: 'negative_${group.name}_${i + 1}',
          assetPath: imagePath,
          valence: Valence.negative,
          emotion: _getEmotionFromGroup(group, false),
        ));
      }
    } else {
      print('getRandomStimuliSet: WARNING - No negative images available for group ${group.name}');
    }
    
    // 正の画像から1枚をランダム選択
    final positiveImages = await _getPositiveImages(group);
    print('getRandomStimuliSet: Available positive images: ${positiveImages.length}');
    
    if (positiveImages.isNotEmpty) {
      final positiveShuffled = List<String>.from(positiveImages);
      positiveShuffled.shuffle(_random);
      final selectedPositive = positiveShuffled.first;
      
      print('getRandomStimuliSet: Adding positive image: $selectedPositive');
      stimuliSet.add(ImageStimulus(
        id: 'positive_${group.name}_1',
        assetPath: selectedPositive,
        valence: Valence.positive,
        emotion: _getEmotionFromGroup(group, true),
      ));
    } else {
      print('getRandomStimuliSet: WARNING - No positive images available for group ${group.name}');
    }
    
    // 全体をシャッフルして位置をランダム化
    stimuliSet.shuffle(_random);
    
    print('getRandomStimuliSet: Final stimuli count: ${stimuliSet.length}');
    return stimuliSet;
  }
  
  /// 正の画像のプレフィックスを取得
  String _getPositivePrefix(ImageGroup group) {
    switch (group) {
      case ImageGroup.emotions:
        return 'smile';
      case ImageGroup.food:
        return 'vegetables';
      case ImageGroup.health:
        return 'health';
    }
  }
  
  /// 負の画像のプレフィックスを取得
  String _getNegativePrefix(ImageGroup group) {
    switch (group) {
      case ImageGroup.emotions:
        return 'sad';
      case ImageGroup.food:
        return 'badfood';
      case ImageGroup.health:
        return 'bad';
    }
  }
  
  /// グループから適切な感情を取得
  Emotion _getEmotionFromGroup(ImageGroup group, bool isPositive) {
    switch (group) {
      case ImageGroup.emotions:
        return isPositive ? Emotion.happiness : Emotion.sadness;
      case ImageGroup.food:
      case ImageGroup.health:
        return isPositive ? Emotion.happiness : Emotion.anger;
    }
  }
  
  /// ランダムなグループを選択
  ImageGroup getRandomGroup() {
    final groups = ImageGroup.values;
    return groups[_random.nextInt(groups.length)];
  }

  /// キャッシュをクリア
  void clearCache() {
    _positiveImageCache.clear();
    _negativeImageCache.clear();
  }
  
  /// 非表示画像設定が変更された時にキャッシュをクリア
  void refreshCache() {
    clearCache();
    print('ImageService: Cache cleared, hidden images will be re-evaluated');
  }
}