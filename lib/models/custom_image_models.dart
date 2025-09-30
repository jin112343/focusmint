/// 天気の種別
enum WeatherType {
  sunny('sunny'),
  rainy('rainy');

  const WeatherType(this.value);
  final String value;
}

/// カスタム画像のグループ
class CustomImageGroup {
  final int id;
  final bool enabled;
  final Map<WeatherType, List<String>> imagePaths;

  const CustomImageGroup({
    required this.id,
    required this.enabled,
    required this.imagePaths,
  });

  CustomImageGroup copyWith({
    int? id,
    bool? enabled,
    Map<WeatherType, List<String>>? imagePaths,
  }) {
    return CustomImageGroup(
      id: id ?? this.id,
      enabled: enabled ?? this.enabled,
      imagePaths: imagePaths ?? this.imagePaths,
    );
  }

  /// 指定された天気の画像枚数を取得
  int getImageCount(WeatherType weather) {
    return imagePaths[weather]?.length ?? 0;
  }

  /// すべての画像枚数を取得
  int get totalImageCount {
    return imagePaths.values.fold(0, (sum, paths) => sum + paths.length);
  }

  /// カスタム画像を使用するための条件を満たしているかチェック
  /// 良い画像1枚以上、よくない画像3枚以上が必要
  bool get hasValidImageCount {
    final sunnyCount = getImageCount(WeatherType.sunny);
    final rainyCount = getImageCount(WeatherType.rainy);
    return sunnyCount >= 1 && rainyCount >= 3;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'enabled': enabled,
      'imagePaths': imagePaths.map(
        (weather, paths) => MapEntry(weather.value, paths),
      ),
    };
  }

  factory CustomImageGroup.fromJson(Map<String, dynamic> json) {
    final Map<WeatherType, List<String>> imagePaths = {};

    if (json['imagePaths'] != null) {
      final Map<String, dynamic> imagePathsJson = json['imagePaths'] as Map<String, dynamic>;
      for (final weatherType in WeatherType.values) {
        final paths = imagePathsJson[weatherType.value];
        if (paths != null) {
          imagePaths[weatherType] = List<String>.from(paths as List);
        } else {
          imagePaths[weatherType] = [];
        }
      }
    }

    final int groupId = json['id'] as int;
    return CustomImageGroup(
      id: groupId,
      enabled: json['enabled'] as bool? ?? (groupId == 1), // グループ1のみ初期状態でON
      imagePaths: imagePaths,
    );
  }

  /// 空のグループを作成
  factory CustomImageGroup.empty(int id) {
    return CustomImageGroup(
      id: id,
      enabled: id == 1, // グループ1のみ初期状態でON、他はOFF
      imagePaths: {
        for (final weather in WeatherType.values) weather: <String>[],
      },
    );
  }
}

/// カスタム画像の設定
class CustomImageSettings {
  final bool useCustomImages;
  final bool useOriginalImagesOnly;
  final List<CustomImageGroup> groups;

  const CustomImageSettings({
    required this.useCustomImages,
    required this.useOriginalImagesOnly,
    required this.groups,
  });

  CustomImageSettings copyWith({
    bool? useCustomImages,
    bool? useOriginalImagesOnly,
    List<CustomImageGroup>? groups,
  }) {
    return CustomImageSettings(
      useCustomImages: useCustomImages ?? this.useCustomImages,
      useOriginalImagesOnly: useOriginalImagesOnly ?? this.useOriginalImagesOnly,
      groups: groups ?? this.groups,
    );
  }

  /// グループIDでグループを取得
  CustomImageGroup? getGroup(int id) {
    try {
      return groups.firstWhere((group) => group.id == id);
    } catch (e) {
      return null;
    }
  }

  /// グループを更新
  CustomImageSettings updateGroup(CustomImageGroup updatedGroup) {
    final newGroups = groups.map((group) {
      return group.id == updatedGroup.id ? updatedGroup : group;
    }).toList();

    return copyWith(groups: newGroups);
  }

  Map<String, dynamic> toJson() {
    return {
      'useCustomImages': useCustomImages,
      'useOriginalImagesOnly': useOriginalImagesOnly,
      'groups': groups.map((group) => group.toJson()).toList(),
    };
  }

  factory CustomImageSettings.fromJson(Map<String, dynamic> json) {
    final groupsList = json['groups'] as List<dynamic>? ?? [];
    final groups = groupsList
        .map((groupJson) => CustomImageGroup.fromJson(groupJson as Map<String, dynamic>))
        .toList();

    return CustomImageSettings(
      useCustomImages: json['useCustomImages'] as bool? ?? false,
      useOriginalImagesOnly: json['useOriginalImagesOnly'] as bool? ?? false,
      groups: groups,
    );
  }

  /// デフォルトの設定を作成
  factory CustomImageSettings.defaultSettings() {
    return CustomImageSettings(
      useCustomImages: false,
      useOriginalImagesOnly: false,
      groups: [
        CustomImageGroup.empty(1),
        CustomImageGroup.empty(2),
        CustomImageGroup.empty(3),
      ],
    );
  }

  /// 有効なグループの画像パスをランダムで取得
  List<String> getRandomImagePaths(WeatherType weatherType) {
    final availableGroups = groups.where((group) =>
        group.enabled && group.getImageCount(weatherType) > 0).toList();

    if (availableGroups.isEmpty) return [];

    final allPaths = <String>[];
    for (final group in availableGroups) {
      allPaths.addAll(group.imagePaths[weatherType] ?? []);
    }

    return allPaths;
  }

  /// カスタム画像を使用可能かチェック
  /// 有効なグループの中に条件を満たすものがあるかどうか
  bool get canUseCustomImages {
    return groups.any((group) => group.enabled && group.hasValidImageCount);
  }
}