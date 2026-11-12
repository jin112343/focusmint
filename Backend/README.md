# FocusMint お問い合わせサービス

FocusMint専用のCloudflare Worker・D1・非公開R2です。ぺりぺりの問い合わせ仕様を元に、アプリごとのデータを分離しています。

- 匿名の端末IDとBearer認証。管理者の秘密情報をアプリに埋め込みません。
- 本文2,000 UTF-16単位、JPEG添付250,000バイトまで。画像のEXIF情報を除去します。
- 送信はUTC基準で1日3回。開発者の新しい返信ごとに3回へ戻ります。
- 同じUUIDの再送・履歴削除で送信回数を回復させません。
- 未送信の下書きは端末に保存し、明示的な送信・再試行で送信します。
- 開発者の返信は画面に表示した時だけ既読にします。ホームに未読数を表示します。
- 最後のやりとりから90日経過した履歴を削除します。
- 新しい問い合わせを受信するとsupport@mizoi.appへ本文・画像を含まない通知メールを送ります。
- メールはD1の送信キューと毎分の再試行で処理します。同じ問い合わせUUIDを再受理しても通知を追加しません。通信切断など送信の成否が不明な場合の再試行では、配送側で重複する可能性があります。

管理画面: https://focusmint-support.mizoijin-0201.workers.dev/admin

プライバシーポリシー: https://focusmint-support.mizoijin-0201.workers.dev/support-privacy

## 検証

```sh
npm test
```

SQLiteを搭載したNode.js 22以降を使用します。テストはインメモリDBとメール送信の代替処理を使用し、実際の問い合わせやメールを送信しません。

## 配置

`wrangler.jsonc`のD1・R2はFocusMint専用です。秘密情報はWrangler secretsに設定します。

- `SESSION_SECRET`: 管理画面セッションと送信頻度制限に使用するランダムな秘密文字列。
- `ADMIN_PASSWORD_HASH`: 強固な管理者パスワードのSHA-256ハッシュ。

メールはEmail Routingの送信専用サブドメイン`focusmint-notify.mizoi.app`から、認証済みの固定宛先`support@mizoi.app`だけに送ります。既存のiCloud受信設定は使用を続けます。一般ユーザへのプッシュ通知は実装していません。返信はアプリ内で確認します。

```sh
npx wrangler d1 migrations apply focusmint-support-db --remote
npx wrangler deploy
```

本番管理画面の「通知テスト」は実際にメールを送信します。
