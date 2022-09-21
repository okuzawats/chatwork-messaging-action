# Chatwork messaging action

[![send message](https://github.com/okuzawats/chatwork-messaging-action/actions/workflows/example.yml/badge.svg)](https://github.com/okuzawats/chatwork-messaging-action/actions/workflows/example.yml)

Chatwork の Room にメッセージを送信する Action です。

以下の Chatwork API を使用しています。

- https://developer.chatwork.com/reference/post-rooms-room_id-messages

## 使い方

以下のように使用します。

```yml
- uses: okuzawats/chatwork-messaging-action@v1.0 # またはコミットハッシュを使用してください。
    apiToken: ${{ secrets.API_KEY }} # Chatwork の API キーです。secrets の利用を推奨します。
    roomId: ${{ secrets.ROOM_ID }} # Chatwork の Room ID です。secrets の利用を推奨します。
    message: 'ここにメッセージを書きます。'
```

ワークフロー構文の書き方は、本リポジトリの `.github/workflows/` 内に格納してある、[example.yml](https://github.com/okuzawats/chatwork-messaging-action/blob/main/.github/workflows/example.yml)も参考にしてください。

## Chatwork の使い方

### API トークン

[Chatwork API へようこそ！](https://developer.chatwork.com/docs)から「API の利用申請」を行い、発行された ID です。この ID を用いて投稿されたチャットは、この ID を発行したユーザーのチャットとして扱われます。

### ルーム ID

- チャットの説明 > グループチャットの設定 > チャット情報 > 画面下部のルーム ID

または

- Web 版でチャットルームを開いた時、URL に含まれる `rid` 以下の数字

です。

### メッセージ記法

Chatwork のメッセージ記法については、以下を参照してください。

- [メッセージ記法について](https://developer.chatwork.com/docs/message-notation)

## バグ報告

本リポジトリに Issue を作成してください。どのような状況で、どのようなバグが発生したのかを教えてください 🙇
