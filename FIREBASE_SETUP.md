# Firebase Analytics 設定手順

## 概要
プライバシーに配慮したダウンロード数追跡のためのFirebase Analytics設定手順です。

## 1. Firebase プロジェクトの作成

1. [Firebase Console](https://console.firebase.google.com/) にアクセス
2. 「プロジェクトを作成」をクリック
3. プロジェクト名を入力（例：focusmint-analytics）
4. Google Analytics を有効化
5. プロジェクトを作成

## 2. アプリの追加

### Android アプリの追加
1. Firebase Console で「Android アプリを追加」をクリック
2. Android パッケージ名を入力：`com.example.focusmint`
3. `google-services.json` をダウンロード
4. `android/app/` フォルダに配置

### iOS アプリの追加
1. Firebase Console で「iOS アプリを追加」をクリック
2. iOS バンドル ID を入力：`com.example.focusmint`
3. `GoogleService-Info.plist` をダウンロード
4. `ios/Runner/` フォルダに配置

## 3. Firebase 設定ファイルの更新

`firebase_options.dart` ファイルの以下の値を実際の値に置き換えてください：

```dart
// 例：実際の値に置き換え
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'AIzaSyC...', // 実際のAPIキー
  appId: '1:123456789:android:abc123', // 実際のアプリID
  messagingSenderId: '123456789', // 実際の送信者ID
  projectId: 'focusmint-analytics', // 実際のプロジェクトID
  storageBucket: 'focusmint-analytics.appspot.com', // 実際のストレージバケット
);
```

## 4. 依存関係のインストール

```bash
flutter pub get
```

## 5. プライバシー設定

### Firebase Analytics のプライバシー設定
1. Firebase Console で「Analytics」→「設定」に移動
2. 「データ保持」で適切な期間を設定
3. 「データ共有」で必要な設定を確認

### アプリのプライバシーポリシー
以下の情報を収集していることを明記：
- アプリの使用状況（個人を特定できない集計データ）
- 初回起動の追跡
- セッション情報

## 6. データの確認

### Firebase Console での確認
1. Firebase Console で「Analytics」→「イベント」に移動
2. 以下のイベントが表示されることを確認：
   - `app_first_install`：初回ダウンロード
   - `app_launch`：アプリ起動
   - `session_start`：セッション開始
   - `session_end`：セッション終了

### リアルタイムデータの確認
1. Firebase Console で「Analytics」→「リアルタイム」に移動
2. 現在アクティブなユーザー数を確認

## 7. プライバシーに配慮した実装の特徴

- **個人情報の収集なし**：ユーザーを特定できる情報は一切収集しません
- **集計データのみ**：ダウンロード数や使用状況の統計のみを取得
- **匿名化**：Firebase Analytics が自動的にデータを匿名化
- **透明性**：アプリ内でデータ収集について明示

## 8. ストア審査への対応

### App Store (iOS)
- プライバシーポリシーでFirebase Analyticsの使用を明記
- 個人情報を収集しないことを明示

### Google Play Store (Android)
- プライバシーポリシーでFirebase Analyticsの使用を明記
- データの使用目的を明示

## 9. トラブルシューティング

### データが表示されない場合
1. アプリが実際にFirebaseに接続されているか確認
2. デバッグモードでイベントが送信されているか確認
3. Firebase Console の設定が正しいか確認

### デバッグ方法
```dart
// デバッグ用のログを有効化
await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
```

## 10. 注意事項

- 本実装は個人情報を収集しません
- ストアの審査や規約に違反しません
- サービスの向上目的でのみ使用されます
- ユーザーのプライバシーを最大限に尊重します
