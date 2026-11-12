# FocusMint

複数の画像からポジティブな画像を探してタップする、1分間のトレーニングアプリです。セルフケアの練習を目的としており、医療行為や治療を提供するものではありません。

## 現在の機能

- 表情・生活・食べ物のトレーニングと成績・履歴の表示。
- 同梱画像367枚、画像の非表示設定、自分の写真の追加。
- 縦横比を保つ共通の画像表示と、表示寸法に合わせたデコード。
- ホーム最下部・設定画面から利用できる匿名のお問い合わせトーク。本文・画像、再試行、未読表示、履歴削除に対応。
- 問い合わせ受信時に開発者へメール通知。
- トレーニング後に肺と空気の流れを描く呼吸ガイドを表示し、自動で結果へ移行。スキップ・動きを減らす設定に対応。

1.3.5では同梱画像を新しい512×512のWebPへ置き換えました。追加の見直しで子どもの表情、魚・果物・ナッツ、運動・交流などを増やしています。容量と採用内容は[画像の確認・軽量化記録](StoreAssets/image-review/README.md)、問い合わせの仕様は[Backend/README.md](Backend/README.md)、提出状態は[1.3.5の提出記録](StoreAssets/1.3.5/release.md)にあります。

## 開発と検証

検証に使用した環境はFlutter 3.47.8です。

```sh
flutter pub get
flutter run
flutter test
flutter analyze
```

問い合わせサーバーのテストは、Node.js 22以降で`Backend`内から`npm test`を実行します。ネイティブ連携の検証は、起動済みの端末を指定して実行します。

```sh
flutter test integration_test/support_flow_test.dart -d DEVICE_ID
flutter test integration_test/breathing_flow_test.dart -d DEVICE_ID
```

Androidのリリース署名には、リポジトリ外で管理するアップロード用キーストアと`KEYSTORE_PASSWORD`・`KEY_PASSWORD`・`KEY_ALIAS`の環境変数が必要です。iOSにはApp Store配布用の署名設定が必要です。

```sh
flutter build appbundle --release
flutter build ipa --release
```

生成したバイナリ・中間ビルド・署名情報・APIキーはコミットしません。画像の生成元データも配布用WebPとは別に保管します。

## データの扱い

トレーニングの履歴・設定・カスタム画像は端末内に保存します。任意のお問い合わせでは本文・添付画像などを専用のCloudflareバックエンドへ送信します。画像の非表示設定に関する統計はFirestore、アプリの利用統計はFirebase Analyticsを使用します。広告は表示しません。

`PRODUCTION=true`は独自の初回起動イベントを送る条件です。Firebase Analyticsやお問い合わせ全体の通信を停止する設定ではありません。

[FocusMintプライバシーポリシー](https://focusmint-support.mizoijin-0201.workers.dev/support-privacy)
