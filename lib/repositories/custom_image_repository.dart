import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:image/image.dart' as img;
import '../models/custom_image_models.dart';

class CustomImageRepository {
  static final CustomImageRepository _instance = CustomImageRepository._internal();
  static CustomImageRepository get instance => _instance;

  CustomImageRepository._internal();

  static const String _settingsKey = 'custom_image_settings';
  static const String _customImagesFolderName = 'custom_images';

  final Logger _logger = Logger();

  /// 設定を取得
  Future<CustomImageSettings> getSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final settingsJson = prefs.getString(_settingsKey);

      if (settingsJson == null) {
        final defaultSettings = CustomImageSettings.defaultSettings();
        await _saveSettings(defaultSettings);
        return defaultSettings;
      }

      final settings = CustomImageSettings.fromJson(
        jsonDecode(settingsJson) as Map<String, dynamic>,
      );

      _logger.d('CustomImageRepository.getSettings: 設定を取得しました');
      return settings;
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.getSettings: 設定の取得に失敗しました',
          error: e, stackTrace: stackTrace);
      return CustomImageSettings.defaultSettings();
    }
  }

  /// 設定を保存
  Future<void> saveSettings(CustomImageSettings settings) async {
    await _saveSettings(settings);
  }

  Future<void> _saveSettings(CustomImageSettings settings) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final settingsJson = jsonEncode(settings.toJson());
      await prefs.setString(_settingsKey, settingsJson);

      _logger.d('CustomImageRepository._saveSettings: 設定を保存しました');
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository._saveSettings: 設定の保存に失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// カスタム画像のベースディレクトリを取得
  Future<Directory> _getCustomImagesDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final customImagesDir = Directory('${appDir.path}/$_customImagesFolderName');

    if (!await customImagesDir.exists()) {
      await customImagesDir.create(recursive: true);
      _logger.d('CustomImageRepository._getCustomImagesDirectory: カスタム画像ディレクトリを作成しました');
    }

    return customImagesDir;
  }

  /// グループ×天気別のディレクトリを取得
  Future<Directory> _getGroupWeatherDirectory(int groupId, WeatherType weather) async {
    final baseDir = await _getCustomImagesDirectory();
    final groupWeatherDir = Directory('${baseDir.path}/group_$groupId/${weather.value}');

    if (!await groupWeatherDir.exists()) {
      await groupWeatherDir.create(recursive: true);
      _logger.d('CustomImageRepository._getGroupWeatherDirectory: グループ$groupId/${weather.value}ディレクトリを作成しました');
    }

    return groupWeatherDir;
  }

  /// 画像を250px正方形にトリミングする
  Future<Uint8List> _cropImageToSquare(String sourceImagePath) async {
    try {
      final sourceFile = File(sourceImagePath);
      final bytes = await sourceFile.readAsBytes();

      // 画像をデコード
      final originalImage = img.decodeImage(bytes);
      if (originalImage == null) {
        throw Exception('画像のデコードに失敗しました: $sourceImagePath');
      }

      // 正方形の短辺を決定（元画像の短い方の辺）
      final minDimension = originalImage.width < originalImage.height
          ? originalImage.width
          : originalImage.height;

      // 中央部分を正方形にクロップ
      final centerX = originalImage.width ~/ 2;
      final centerY = originalImage.height ~/ 2;
      final halfSize = minDimension ~/ 2;

      final croppedImage = img.copyCrop(
        originalImage,
        x: centerX - halfSize,
        y: centerY - halfSize,
        width: minDimension,
        height: minDimension,
      );

      // 250pxにリサイズ
      final resizedImage = img.copyResize(
        croppedImage,
        width: 250,
        height: 250,
        interpolation: img.Interpolation.linear,
      );

      // JPEGとしてエンコード（品質90%）
      final processedBytes = img.encodeJpg(resizedImage, quality: 90);

      _logger.d('CustomImageRepository._cropImageToSquare: 画像を250px正方形にトリミングしました');
      return Uint8List.fromList(processedBytes);
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository._cropImageToSquare: 画像のトリミングに失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 画像を追加
  Future<String> addImage(int groupId, WeatherType weather, String sourceImagePath) async {
    try {
      final sourceFile = File(sourceImagePath);
      if (!await sourceFile.exists()) {
        throw Exception('ソース画像ファイルが存在しません: $sourceImagePath');
      }

      final targetDir = await _getGroupWeatherDirectory(groupId, weather);
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg'; // JPEGで保存
      final targetPath = '${targetDir.path}/$fileName';

      // 画像を250px正方形にトリミング
      final processedImageBytes = await _cropImageToSquare(sourceImagePath);

      // トリミング済み画像を保存
      final targetFile = File(targetPath);
      await targetFile.writeAsBytes(processedImageBytes);

      // 設定を更新
      final settings = await getSettings();
      final group = settings.getGroup(groupId);
      if (group != null) {
        final newImagePaths = Map<WeatherType, List<String>>.from(group.imagePaths);
        newImagePaths[weather] = List<String>.from(newImagePaths[weather] ?? [])..add(targetPath);

        final updatedGroup = group.copyWith(imagePaths: newImagePaths);
        await saveSettings(settings.updateGroup(updatedGroup));
      }

      _logger.i('CustomImageRepository.addImage: 画像を追加しました（250px正方形にトリミング済み） - グループ$groupId/${weather.value}: $targetPath');
      return targetPath;
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.addImage: 画像の追加に失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 画像を削除
  Future<void> removeImage(int groupId, WeatherType weather, String imagePath) async {
    try {
      final imageFile = File(imagePath);
      if (await imageFile.exists()) {
        await imageFile.delete();
        _logger.d('CustomImageRepository.removeImage: 画像ファイルを削除しました: $imagePath');
      }

      // 設定を更新
      final settings = await getSettings();
      final group = settings.getGroup(groupId);
      if (group != null) {
        final newImagePaths = Map<WeatherType, List<String>>.from(group.imagePaths);
        newImagePaths[weather] = List<String>.from(newImagePaths[weather] ?? [])
          ..remove(imagePath);

        final updatedGroup = group.copyWith(imagePaths: newImagePaths);
        await saveSettings(settings.updateGroup(updatedGroup));
      }

      _logger.i('CustomImageRepository.removeImage: 画像を削除しました - グループ$groupId/${weather.value}: $imagePath');
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.removeImage: 画像の削除に失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// グループの有効/無効を切り替え（バリデーション付き）
  Future<bool> toggleGroupEnabled(int groupId) async {
    try {
      final settings = await getSettings();
      final group = settings.getGroup(groupId);
      if (group == null) {
        return false;
      }

      // 無効にしようとした場合、他に有効なグループがあるかチェック
      if (group.enabled) {
        final otherEnabledGroups = settings.groups
            .where((g) => g.id != groupId && g.enabled)
            .toList();

        if (otherEnabledGroups.isEmpty) {
          _logger.w('CustomImageRepository.toggleGroupEnabled: 最後の有効グループを無効にしようとしました: グループ$groupId');
          return false; // 最後の有効グループは無効にできない
        }
      }

      final updatedGroup = group.copyWith(enabled: !group.enabled);
      await saveSettings(settings.updateGroup(updatedGroup));

      _logger.i('CustomImageRepository.toggleGroupEnabled: グループ$groupIdの有効状態を切り替えました: ${updatedGroup.enabled}');
      return true;
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.toggleGroupEnabled: グループの有効状態切り替えに失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// カスタム画像の使用有効/無効を切り替え（バリデーション付き）
  Future<bool> toggleUseCustomImages() async {
    try {
      final settings = await getSettings();

      // オンにしようとした場合、条件を満たしているかチェック
      if (!settings.useCustomImages && !settings.canUseCustomImages) {
        _logger.w('CustomImageRepository.toggleUseCustomImages: カスタム画像の条件を満たしていないためオンにできません');
        return false; // 条件を満たしていない場合はオンにできない
      }

      final updatedSettings = settings.copyWith(useCustomImages: !settings.useCustomImages);
      await saveSettings(updatedSettings);

      _logger.i('CustomImageRepository.toggleUseCustomImages: カスタム画像の使用を切り替えました: ${updatedSettings.useCustomImages}');
      return true;
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.toggleUseCustomImages: カスタム画像の使用切り替えに失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// オリジナル画像のみ使用の有効/無効を切り替え（バリデーション付き）
  Future<bool> toggleUseOriginalImagesOnly() async {
    try {
      final settings = await getSettings();

      // オンにしようとした場合、条件を満たしているかチェック
      if (!settings.useOriginalImagesOnly && !settings.canUseCustomImages) {
        _logger.w('CustomImageRepository.toggleUseOriginalImagesOnly: オリジナル画像の条件を満たしていないためオンにできません');
        return false; // 条件を満たしていない場合はオンにできない
      }

      final updatedSettings = settings.copyWith(useOriginalImagesOnly: !settings.useOriginalImagesOnly);
      await saveSettings(updatedSettings);

      _logger.i('CustomImageRepository.toggleUseOriginalImagesOnly: オリジナル画像のみ使用を切り替えました: ${updatedSettings.useOriginalImagesOnly}');
      return true;
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.toggleUseOriginalImagesOnly: オリジナル画像のみ使用切り替えに失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 既存画像とカスタム画像のミックス使用の有効/無効を切り替え（バリデーション付き）
  Future<bool> toggleMixWithOriginalImages() async {
    try {
      final settings = await getSettings();

      // オンにしようとした場合、条件を満たしているかチェック
      if (!settings.mixWithOriginalImages && !settings.canUseCustomImages) {
        _logger.w('CustomImageRepository.toggleMixWithOriginalImages: ミックス使用の条件を満たしていないためオンにできません');
        return false; // 条件を満たしていない場合はオンにできない
      }

      final updatedSettings = settings.copyWith(mixWithOriginalImages: !settings.mixWithOriginalImages);
      await saveSettings(updatedSettings);

      _logger.i('CustomImageRepository.toggleMixWithOriginalImages: ミックス使用を切り替えました: ${updatedSettings.mixWithOriginalImages}');
      return true;
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.toggleMixWithOriginalImages: ミックス使用切り替えに失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 指定グループ・天気の画像パスのリストを取得
  Future<List<String>> getImagePaths(int groupId, WeatherType weather) async {
    try {
      final settings = await getSettings();
      final group = settings.getGroup(groupId);
      if (group == null) return [];

      final imagePaths = group.imagePaths[weather] ?? [];

      // ファイルが実際に存在するもののみを返す
      final existingPaths = <String>[];
      for (final path in imagePaths) {
        final file = File(path);
        if (await file.exists()) {
          existingPaths.add(path);
        }
      }

      // 存在しないファイルがある場合は設定を更新
      if (existingPaths.length != imagePaths.length) {
        final newImagePaths = Map<WeatherType, List<String>>.from(group.imagePaths);
        newImagePaths[weather] = existingPaths;
        final updatedGroup = group.copyWith(imagePaths: newImagePaths);
        await saveSettings(settings.updateGroup(updatedGroup));

        _logger.d('CustomImageRepository.getImagePaths: 存在しない画像パスを削除しました');
      }

      return existingPaths;
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.getImagePaths: 画像パスの取得に失敗しました',
          error: e, stackTrace: stackTrace);
      return [];
    }
  }

  /// 指定グループ・天気の画像枚数を取得
  Future<int> getImageCount(int groupId, WeatherType weather) async {
    final imagePaths = await getImagePaths(groupId, weather);
    return imagePaths.length;
  }

  /// すべてのカスタム画像を削除（データクリア用）
  Future<void> clearAllCustomImages() async {
    try {
      final customImagesDir = await _getCustomImagesDirectory();
      if (await customImagesDir.exists()) {
        await customImagesDir.delete(recursive: true);
        _logger.i('CustomImageRepository.clearAllCustomImages: すべてのカスタム画像を削除しました');
      }

      // 設定もリセット
      await saveSettings(CustomImageSettings.defaultSettings());
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.clearAllCustomImages: カスタム画像のクリアに失敗しました',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 表示用のランダム画像パスを取得（学習・表示システムで使用）
  Future<List<String>> getRandomImagePathsForDisplay(WeatherType weatherType) async {
    try {
      final settings = await getSettings();

      if (!settings.useCustomImages) {
        return []; // カスタム画像を使用しない場合は空のリストを返す
      }

      return settings.getRandomImagePaths(weatherType);
    } catch (e, stackTrace) {
      _logger.e('CustomImageRepository.getRandomImagePathsForDisplay: 表示用画像パスの取得に失敗しました',
          error: e, stackTrace: stackTrace);
      return [];
    }
  }
}