import 'dart:math';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/constants/training_constants.dart';

class ImageService {
  static final ImageService _instance = ImageService._internal();
  factory ImageService() => _instance;
  
  late final Random _random;
  
  // TODO: 実際の画像に変更する際は、この値をtrueに変更してください
  static const bool useRealImages = false;
  
  ImageService._internal() {
    _random = Random();
  }

  /// よい画像グループ（positive：笑顔・幸せな表情）
  final List<ImageStimulus> _positiveImages = [
    ImageStimulus(
      id: 'happy_001',
      assetPath: '${PlaceholderImages.facesPath}happy_001.png',
      valence: Valence.positive,
      emotion: Emotion.happiness,
    ),
    ImageStimulus(
      id: 'happy_002',
      assetPath: '${PlaceholderImages.facesPath}happy_002.png',
      valence: Valence.positive,
      emotion: Emotion.happiness,
    ),
    ImageStimulus(
      id: 'happy_003',
      assetPath: '${PlaceholderImages.facesPath}happy_003.png',
      valence: Valence.positive,
      emotion: Emotion.happiness,
    ),
    ImageStimulus(
      id: 'happy_004',
      assetPath: '${PlaceholderImages.facesPath}happy_004.png',
      valence: Valence.positive,
      emotion: Emotion.happiness,
    ),
    ImageStimulus(
      id: 'happy_005',
      assetPath: '${PlaceholderImages.facesPath}happy_005.png',
      valence: Valence.positive,
      emotion: Emotion.happiness,
    ),
  ];

  /// よくない画像グループ（negative：怒り・恐怖・悲しみの表情）
  final List<ImageStimulus> _negativeImages = [
    ImageStimulus(
      id: 'angry_001',
      assetPath: '${PlaceholderImages.facesPath}angry_001.png',
      valence: Valence.negative,
      emotion: Emotion.anger,
    ),
    ImageStimulus(
      id: 'angry_002',
      assetPath: '${PlaceholderImages.facesPath}angry_002.png',
      valence: Valence.negative,
      emotion: Emotion.anger,
    ),
    ImageStimulus(
      id: 'fear_001',
      assetPath: '${PlaceholderImages.facesPath}fear_001.png',
      valence: Valence.negative,
      emotion: Emotion.fear,
    ),
    ImageStimulus(
      id: 'fear_002',
      assetPath: '${PlaceholderImages.facesPath}fear_002.png',
      valence: Valence.negative,
      emotion: Emotion.fear,
    ),
    ImageStimulus(
      id: 'sad_001',
      assetPath: '${PlaceholderImages.facesPath}sad_001.png',
      valence: Valence.negative,
      emotion: Emotion.sadness,
    ),
    ImageStimulus(
      id: 'sad_002',
      assetPath: '${PlaceholderImages.facesPath}sad_002.png',
      valence: Valence.negative,
      emotion: Emotion.sadness,
    ),
  ];

  /// ランダムでよくない画像3枚と良い画像1枚を選択して返す
  List<ImageStimulus> getRandomStimuliSet() {
    final List<ImageStimulus> stimuliSet = [];
    
    // よくない画像から3枚をランダム選択
    final negativeShuffled = List<ImageStimulus>.from(_negativeImages);
    negativeShuffled.shuffle(_random);
    stimuliSet.addAll(negativeShuffled.take(3));
    
    // よい画像から1枚をランダム選択
    final positiveShuffled = List<ImageStimulus>.from(_positiveImages);
    positiveShuffled.shuffle(_random);
    stimuliSet.addAll(positiveShuffled.take(1));
    
    // 全体をシャッフルして位置をランダム化
    stimuliSet.shuffle(_random);
    
    return stimuliSet;
  }

  /// 良い画像のリストを取得
  List<ImageStimulus> get positiveImages => List.unmodifiable(_positiveImages);
  
  /// よくない画像のリストを取得
  List<ImageStimulus> get negativeImages => List.unmodifiable(_negativeImages);
  
  /// 全ての画像を取得
  List<ImageStimulus> get allImages => [
    ..._positiveImages,
    ..._negativeImages,
  ];
  
  /// 指定されたIDの画像を取得
  ImageStimulus? getImageById(String id) {
    try {
      return allImages.firstWhere((image) => image.id == id);
    } catch (e) {
      return null;
    }
  }
}