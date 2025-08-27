enum ImageGroup {
  group1,
  group2,
  group3;
  
  /// 各グループに対応する良い画像フォルダのリスト
  List<String> get goodImageFolders {
    switch (this) {
      case ImageGroup.group1:
        return ['smile'];
      case ImageGroup.group2:
        return ['vegetables'];
      case ImageGroup.group3:
        return ['health'];
    }
  }
  
  /// 各グループに対応する悪い画像フォルダのリスト
  List<String> get badImageFolders {
    switch (this) {
      case ImageGroup.group1:
        return ['sad'];
      case ImageGroup.group2:
        return ['badfood'];
      case ImageGroup.group3:
        return ['bad'];
    }
  }
}