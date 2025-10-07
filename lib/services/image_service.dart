import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/services/hidden_image_service.dart';
import 'package:focusmint/models/custom_image_models.dart';
import 'package:focusmint/repositories/custom_image_repository.dart';
import 'package:logger/logger.dart';

class ImageService {
  static final ImageService _instance = ImageService._internal();
  factory ImageService() => _instance;

  late final Random _random;
  final Map<ImageGroup, List<String>> _positiveImageCache = {};
  final Map<ImageGroup, List<String>> _negativeImageCache = {};
  final HiddenImageService _hiddenImageService = HiddenImageService();
  final CustomImageRepository _customImageRepository = CustomImageRepository.instance;
  final Logger _logger = Logger();

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
      
      _logger.d('_loadImageFilenames: Prefix: $prefix');
      _logger.d('_loadImageFilenames: Found ${imagePaths.length} images: $imagePaths');
      
      return imagePaths;
    } catch (e) {
      _logger.e('_loadImageFilenames: Error', error: e);
      return [];
    }
  }

  /// 指定されたグループの正の画像一覧を取得（キャッシュ付き、非表示画像を除外）
  Future<List<String>> _getPositiveImages(ImageGroup group) async {
    if (_positiveImageCache[group] != null) {
      _logger.d('_getPositiveImages: Using cached images for ${group.name}');
      return _positiveImageCache[group]!;
    }
    
    final prefix = _getPositivePrefix(group);
    final images = await _loadImageFilenames(prefix);
    final hiddenImages = await _hiddenImageService.getHiddenImages();
    _logger.d('_getPositiveImages: Group: ${group.name}, Total images: ${images.length}, Hidden: ${hiddenImages.length}');
    _logger.d('_getPositiveImages: Hidden images: $hiddenImages');
    
    final availableImages = images.where((image) => !hiddenImages.contains(image)).toList();
    _logger.d('_getPositiveImages: Available images after filtering: ${availableImages.length}');
    _logger.d('_getPositiveImages: Available images: $availableImages');
    
    _positiveImageCache[group] = availableImages;
    return availableImages;
  }

  /// 指定されたグループの負の画像一覧を取得（キャッシュ付き、非表示画像を除外）
  Future<List<String>> _getNegativeImages(ImageGroup group) async {
    if (_negativeImageCache[group] != null) {
      _logger.d('_getNegativeImages: Using cached images for ${group.name}');
      return _negativeImageCache[group]!;
    }
    
    final prefix = _getNegativePrefix(group);
    final images = await _loadImageFilenames(prefix);
    final hiddenImages = await _hiddenImageService.getHiddenImages();
    _logger.d('_getNegativeImages: Group: ${group.name}, Total images: ${images.length}, Hidden: ${hiddenImages.length}');
    _logger.d('_getNegativeImages: Hidden images: $hiddenImages');
    
    final availableImages = images.where((image) => !hiddenImages.contains(image)).toList();
    _logger.d('_getNegativeImages: Available images after filtering: ${availableImages.length}');
    _logger.d('_getNegativeImages: Available images: $availableImages');
    
    _negativeImageCache[group] = availableImages;
    return availableImages;
  }


  /// カスタム画像が利用可能かチェック（最低枚数制約を含む）
  Future<bool> _canUseCustomImages() async {
    try {
      final settings = await _customImageRepository.getSettings();
      _logger.d('_canUseCustomImages: settings.useCustomImages = ${settings.useCustomImages}');

      if (!settings.useCustomImages) {
        _logger.d('_canUseCustomImages: useCustomImages is false, returning false');
        return false;
      }

      return settings.canUseCustomImages;
    } catch (e, stackTrace) {
      _logger.e('_canUseCustomImages: Error checking custom images availability',
          error: e, stackTrace: stackTrace);
      return false;
    }
  }

  /// カスタム画像から刺激セットを生成
  Future<List<ImageStimulus>> _getCustomStimuliSet() async {
    final List<ImageStimulus> stimuliSet = [];

    _logger.d('_getCustomStimuliSet: Starting custom stimuli generation');

    try {
      final settings = await _customImageRepository.getSettings();

      // 有効なグループを取得
      final enabledGroups = settings.groups.where((group) => group.enabled).toList();
      _logger.d('_getCustomStimuliSet: Enabled groups: ${enabledGroups.map((g) => g.id).toList()}');

      if (enabledGroups.isEmpty) {
        _logger.w('_getCustomStimuliSet: No enabled groups found');
        return [];
      }

      // グループをランダムに選択
      final selectedGroup = enabledGroups[_random.nextInt(enabledGroups.length)];
      _logger.d('_getCustomStimuliSet: Selected group: ${selectedGroup.id}');

      // 選択されたグループのよくない画像から3枚をランダム選択（負の刺激として使用）
      final groupRainyImages = selectedGroup.imagePaths[WeatherType.rainy] ?? [];
      _logger.d('_getCustomStimuliSet: Group ${selectedGroup.id} not good images: ${groupRainyImages.length}');

      if (groupRainyImages.length >= 3) {
        final rainyShuffled = List<String>.from(groupRainyImages);
        rainyShuffled.shuffle(_random);
        final selectedRainy = rainyShuffled.take(3);

        for (int i = 0; i < selectedRainy.length; i++) {
          final imagePath = selectedRainy.elementAt(i);
          _logger.d('_getCustomStimuliSet: Adding not good image from group ${selectedGroup.id}: $imagePath');
          stimuliSet.add(ImageStimulus(
            id: 'custom_group${selectedGroup.id}_rainy_${i + 1}',
            assetPath: imagePath,
            valence: Valence.negative,
            emotion: Emotion.sadness,
            isCustomImage: true,
          ));
        }
      }

      // 選択されたグループの良い画像から1枚をランダム選択（正の刺激として使用）
      final groupSunnyImages = selectedGroup.imagePaths[WeatherType.sunny] ?? [];
      _logger.d('_getCustomStimuliSet: Group ${selectedGroup.id} good images: ${groupSunnyImages.length}');

      if (groupSunnyImages.isNotEmpty) {
        final sunnyShuffled = List<String>.from(groupSunnyImages);
        sunnyShuffled.shuffle(_random);
        final selectedSunny = sunnyShuffled.first;

        _logger.d('_getCustomStimuliSet: Adding good image from group ${selectedGroup.id}: $selectedSunny');
        stimuliSet.add(ImageStimulus(
          id: 'custom_group${selectedGroup.id}_sunny_1',
          assetPath: selectedSunny,
          valence: Valence.positive,
          emotion: Emotion.happiness,
          isCustomImage: true,
        ));
      }

      // 全体をシャッフルして位置をランダム化
      stimuliSet.shuffle(_random);

      _logger.d('_getCustomStimuliSet: Final custom stimuli count: ${stimuliSet.length}');
      return stimuliSet;
    } catch (e, stackTrace) {
      _logger.e('_getCustomStimuliSet: Error generating custom stimuli set',
          error: e, stackTrace: stackTrace);
      return [];
    }
  }

  /// 指定されたグループでランダムによくない画像3枚と良い画像1枚を選択して返す
  Future<List<ImageStimulus>> getRandomStimuliSet(ImageGroup group) async {
    _logger.d('getRandomStimuliSet: Starting for group ${group.name}');

    // カスタム画像が利用可能かチェック
    final canUseCustomImages = await _canUseCustomImages();
    _logger.d('getRandomStimuliSet: canUseCustomImages = $canUseCustomImages');

    if (canUseCustomImages) {
      _logger.d('getRandomStimuliSet: Using custom images only mode (no asset images)');
      final customStimuli = await _getCustomStimuliSet();
      _logger.d('getRandomStimuliSet: Custom stimuli count: ${customStimuli.length}');
      return customStimuli;
    }

    // 従来のアセット画像を使用
    _logger.d('getRandomStimuliSet: Using asset images');
    final assetStimuli = await _getAssetStimuliSet(group);
    _logger.d('getRandomStimuliSet: Asset stimuli count: ${assetStimuli.length}');
    return assetStimuli;
  }


  /// アセット画像から刺激セットを生成（既存のロジック）
  Future<List<ImageStimulus>> _getAssetStimuliSet(ImageGroup group) async {
    final List<ImageStimulus> stimuliSet = [];

    _logger.d('_getAssetStimuliSet: Starting for group ${group.name}');

    // 負の画像から3枚をランダム選択
    final negativeImages = await _getNegativeImages(group);
    _logger.d('_getAssetStimuliSet: Available negative images: ${negativeImages.length}');

    if (negativeImages.isNotEmpty) {
      final negativeShuffled = List<String>.from(negativeImages);
      negativeShuffled.shuffle(_random);
      final selectedNegative = negativeShuffled.take(3);

      for (int i = 0; i < selectedNegative.length; i++) {
        final imagePath = selectedNegative.elementAt(i);
        _logger.d('_getAssetStimuliSet: Adding negative image: $imagePath');
        stimuliSet.add(ImageStimulus(
          id: 'negative_${group.name}_${i + 1}',
          assetPath: imagePath,
          valence: Valence.negative,
          emotion: _getEmotionFromGroup(group, false),
        ));
      }
    } else {
      _logger.w('_getAssetStimuliSet: WARNING - No negative images available for group ${group.name}');
    }

    // 正の画像から1枚をランダム選択
    final positiveImages = await _getPositiveImages(group);
    _logger.d('_getAssetStimuliSet: Available positive images: ${positiveImages.length}');

    if (positiveImages.isNotEmpty) {
      final positiveShuffled = List<String>.from(positiveImages);
      positiveShuffled.shuffle(_random);
      final selectedPositive = positiveShuffled.first;

      _logger.d('_getAssetStimuliSet: Adding positive image: $selectedPositive');
      stimuliSet.add(ImageStimulus(
        id: 'positive_${group.name}_1',
        assetPath: selectedPositive,
        valence: Valence.positive,
        emotion: _getEmotionFromGroup(group, true),
      ));
    } else {
      _logger.w('_getAssetStimuliSet: WARNING - No positive images available for group ${group.name}');
    }

    // 全体をシャッフルして位置をランダム化
    stimuliSet.shuffle(_random);

    _logger.d('_getAssetStimuliSet: Final stimuli count: ${stimuliSet.length}');
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
    _logger.d('ImageService: Cache cleared, hidden images will be re-evaluated');
  }
}