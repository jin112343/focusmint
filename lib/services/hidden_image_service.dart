import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focusmint/constants/placeholder_images.dart';

/// 非表示画像の管理を行うサービス
class HiddenImageService {
  static final HiddenImageService _instance = HiddenImageService._internal();
  factory HiddenImageService() => _instance;
  
  static final Logger _logger = Logger();
  static const String _hiddenImagesKey = 'hidden_images';
  static const int _maxHiddenImages = 15;
  
  HiddenImageService._internal();
  
  /// 非表示に設定された画像のリストを取得
  Future<Set<String>> getHiddenImages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hiddenImagesJson = prefs.getString(_hiddenImagesKey);
      
      _logger.i('getHiddenImages: JSON = $hiddenImagesJson');
      
      if (hiddenImagesJson == null) {
        _logger.i('getHiddenImages: No hidden images found, returning empty set');
        return <String>{};
      }
      
      final List<dynamic> hiddenImagesList = jsonDecode(hiddenImagesJson);
      final result = hiddenImagesList.cast<String>().toSet();
      _logger.i('getHiddenImages: Loaded ${result.length} hidden images: $result');
      return result;
    } catch (e, stackTrace) {
      _logger.e('Failed to get hidden images', error: e, stackTrace: stackTrace);
      return <String>{};
    }
  }
  
  /// 画像を非表示に設定
  Future<bool> hideImage(String imagePath) async {
    try {
      _logger.i('hideImage: Hiding image: $imagePath');
      final hiddenImages = await getHiddenImages();
      
      // 最大15枚の制限をチェック
      if (hiddenImages.length >= _maxHiddenImages) {
        _logger.w('Maximum hidden images limit reached: $_maxHiddenImages');
        return false;
      }
      
      hiddenImages.add(imagePath);
      _logger.i('hideImage: Adding to hidden images: $hiddenImages');
      final result = await _saveHiddenImages(hiddenImages);
      _logger.i('hideImage: Save result: $result');
      return result;
    } catch (e, stackTrace) {
      _logger.e('Failed to hide image', error: e, stackTrace: stackTrace);
      return false;
    }
  }
  
  /// 画像の非表示設定を解除
  Future<bool> showImage(String imagePath) async {
    try {
      final hiddenImages = await getHiddenImages();
      hiddenImages.remove(imagePath);
      return await _saveHiddenImages(hiddenImages);
    } catch (e, stackTrace) {
      _logger.e('Failed to show image', error: e, stackTrace: stackTrace);
      return false;
    }
  }
  
  /// 非表示画像の設定を保存
  Future<bool> _saveHiddenImages(Set<String> hiddenImages) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hiddenImagesJson = jsonEncode(hiddenImages.toList());
      _logger.i('_saveHiddenImages: Saving JSON: $hiddenImagesJson');
      final result = await prefs.setString(_hiddenImagesKey, hiddenImagesJson);
      _logger.i('_saveHiddenImages: Save result: $result');
      return result;
    } catch (e, stackTrace) {
      _logger.e('Failed to save hidden images', error: e, stackTrace: stackTrace);
      return false;
    }
  }
  
  /// 非表示画像の数を取得
  Future<int> getHiddenImageCount() async {
    final hiddenImages = await getHiddenImages();
    return hiddenImages.length;
  }
  
  /// 最大非表示画像数に達しているかチェック
  Future<bool> isMaxHiddenImagesReached() async {
    final count = await getHiddenImageCount();
    return count >= _maxHiddenImages;
  }
  
  /// 画像が非表示に設定されているかチェック
  Future<bool> isImageHidden(String imagePath) async {
    final hiddenImages = await getHiddenImages();
    return hiddenImages.contains(imagePath);
  }
  
  /// 全ての非表示設定をクリア
  Future<bool> clearAllHiddenImages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_hiddenImagesKey);
    } catch (e, stackTrace) {
      _logger.e('Failed to clear hidden images', error: e, stackTrace: stackTrace);
      return false;
    }
  }
  
  /// 利用可能な画像のリストを取得（非表示画像を除外）
  Future<List<String>> getAvailableImages() async {
    try {
      final hiddenImages = await getHiddenImages();
      final allImages = [...PlaceholderImages.positiveImages, ...PlaceholderImages.negativeImages];
      
      return allImages.where((image) => !hiddenImages.contains(image)).toList();
    } catch (e, stackTrace) {
      _logger.e('Failed to get available images', error: e, stackTrace: stackTrace);
      return [...PlaceholderImages.positiveImages, ...PlaceholderImages.negativeImages];
    }
  }
  
  /// Firebaseに非表示画像の統計を送信
  Future<void> sendHiddenImageStats() async {
    try {
      final hiddenImages = await getHiddenImages();
      if (hiddenImages.isEmpty) return;
      
      final firestore = FirebaseFirestore.instance;
      final timestamp = Timestamp.now();
      
      // 非表示画像の統計データを作成
      final statsData = {
        'timestamp': timestamp,
        'hiddenImageCount': hiddenImages.length,
        'hiddenImages': hiddenImages.toList(),
        'deviceInfo': {
          'platform': 'flutter',
          'version': '1.0.0', // 必要に応じて実際のバージョンを取得
        },
      };
      
      // Firestoreに送信
      await firestore.collection('hidden_image_stats').add(statsData);
      
      _logger.i('Hidden image stats sent to Firebase: ${hiddenImages.length} images');
      _logger.i('Hidden images: $hiddenImages');
    } catch (e, stackTrace) {
      _logger.e('Failed to send hidden image stats to Firebase', error: e, stackTrace: stackTrace);
    }
  }
  
  /// 画像の表示状態を切り替え
  Future<bool> toggleImageVisibility(String imagePath) async {
    final isHidden = await isImageHidden(imagePath);
    
    if (isHidden) {
      return await showImage(imagePath);
    } else {
      return await hideImage(imagePath);
    }
  }
}
