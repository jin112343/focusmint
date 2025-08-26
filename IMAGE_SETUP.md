# 画像設定ガイド

## 実際の画像に変更する手順

現在は絵文字で表示していますが、実際の画像に変更する場合は以下の手順に従ってください。

### 1. 画像ファイルの準備

`assets/images/faces/`フォルダに以下の画像ファイルを配置してください：

#### 良い画像（positive/幸せな表情）
- `happy_001.png`
- `happy_002.png`
- `happy_003.png`
- `happy_004.png`
- `happy_005.png`

#### 悪い画像（negative/ネガティブな表情）
- `angry_001.png`
- `angry_002.png`
- `fear_001.png`
- `fear_002.png`
- `sad_001.png`
- `sad_002.png`

### 2. pubspec.yamlの更新

`pubspec.yaml`の`flutter`セクションに以下を追加：

```yaml
flutter:
  assets:
    - assets/images/faces/
```

### 3. コードの設定変更

`lib/services/image_service.dart`の13行目を変更：

```dart
// 変更前
static const bool useRealImages = false;

// 変更後
static const bool useRealImages = true;
```

### 4. 画像サイズ推奨仕様

- 形式: PNG
- サイズ: 200x200px (推奨)
- 背景: 透明または白
- 人物の表情がはっきりと識別できるもの

### 5. 動作確認

アプリを再起動して、画像が正しく表示されることを確認してください。
画像が見つからない場合は、自動的に絵文字表示にフォールバックします。

## トラブルシューティング

### 画像が表示されない場合
1. ファイルパスが正しいか確認
2. `pubspec.yaml`の assets 設定が正しいか確認
3. `flutter clean && flutter pub get` を実行
4. アプリを再起動

### 画像を追加/変更したい場合
`lib/services/image_service.dart`の`_positiveImages`または`_negativeImages`リストを編集してください。