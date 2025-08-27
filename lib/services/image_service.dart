import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/constants/training_constants.dart';

class ImageService {
  static final ImageService _instance = ImageService._internal();
  factory ImageService() => _instance;
  
  late final Random _random;
  final Map<ImageGroup, List<String>> _positiveImageCache = {};
  final Map<ImageGroup, List<String>> _negativeImageCache = {};
  
  ImageService._internal() {
    _random = Random();
  }

  /// アセットフォルダ内の画像ファイル一覧を取得
  Future<List<String>> _loadImageFilenames(String assetPath) async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = 
          const JsonDecoder().convert(manifestContent) as Map<String, dynamic>;
      
      final imagePaths = manifestMap.keys
          .where((String key) => key.startsWith(assetPath))
          .where((String key) => key.toLowerCase().endsWith('.jpg') || 
                                key.toLowerCase().endsWith('.jpeg') || 
                                key.toLowerCase().endsWith('.png'))
          .toList();
      
      return imagePaths;
    } catch (e) {
      return [];
    }
  }

  /// 指定されたグループの正の画像一覧を取得（キャッシュ付き）
  Future<List<String>> _getPositiveImages(ImageGroup group) async {
    if (_positiveImageCache[group] != null) {
      return _positiveImageCache[group]!;
    }
    
    final images = await _loadImageFilenames(group.positiveFolder);
    _positiveImageCache[group] = images;
    return images;
  }

  /// 指定されたグループの負の画像一覧を取得（キャッシュ付き）
  Future<List<String>> _getNegativeImages(ImageGroup group) async {
    if (_negativeImageCache[group] != null) {
      return _negativeImageCache[group]!;
    }
    
    final images = await _loadImageFilenames(group.negativeFolder);
    _negativeImageCache[group] = images;
    return images;
  }

  /// 指定されたグループでランダムによくない画像3枚と良い画像1枚を選択して返す
  Future<List<ImageStimulus>> getRandomStimuliSet(ImageGroup group) async {
    final List<ImageStimulus> stimuliSet = [];
    
    // 負の画像から3枚をランダム選択
    final negativeImages = await _getNegativeImages(group);
    if (negativeImages.isNotEmpty) {
      final negativeShuffled = List<String>.from(negativeImages);
      negativeShuffled.shuffle(_random);
      final selectedNegative = negativeShuffled.take(3);
      
      for (int i = 0; i < selectedNegative.length; i++) {
        final imagePath = selectedNegative.elementAt(i);
        stimuliSet.add(ImageStimulus(
          id: 'negative_${group.name}_${i + 1}',
          assetPath: imagePath,
          valence: Valence.negative,
          emotion: _getEmotionFromGroup(group, false),
        ));
      }
    }
    
    // 正の画像から1枚をランダム選択
    final positiveImages = await _getPositiveImages(group);
    if (positiveImages.isNotEmpty) {
      final positiveShuffled = List<String>.from(positiveImages);
      positiveShuffled.shuffle(_random);
      final selectedPositive = positiveShuffled.first;
      
      stimuliSet.add(ImageStimulus(
        id: 'positive_${group.name}_1',
        assetPath: selectedPositive,
        valence: Valence.positive,
        emotion: _getEmotionFromGroup(group, true),
      ));
    }
    
    // 全体をシャッフルして位置をランダム化
    stimuliSet.shuffle(_random);
    
    return stimuliSet;
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
}