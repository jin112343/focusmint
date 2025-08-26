enum Valence {
  positive,
  negative,
}

enum Emotion {
  happiness,
  anger,
  fear,
  sadness,
}

class ImageStimulus {
  final String id;
  final String assetPath;
  final Valence valence;
  final Emotion emotion;
  final int arousal;
  
  const ImageStimulus({
    required this.id,
    required this.assetPath,
    required this.valence,
    required this.emotion,
    this.arousal = 3,
  });
  
  bool get isPositive => valence == Valence.positive;
  bool get isTarget => isPositive;
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageStimulus &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ImageStimulus(id: $id, valence: $valence, emotion: $emotion)';
  
  ImageStimulus copyWith({
    String? id,
    String? assetPath,
    Valence? valence,
    Emotion? emotion,
    int? arousal,
  }) {
    return ImageStimulus(
      id: id ?? this.id,
      assetPath: assetPath ?? this.assetPath,
      valence: valence ?? this.valence,
      emotion: emotion ?? this.emotion,
      arousal: arousal ?? this.arousal,
    );
  }
}