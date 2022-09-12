# Chatwork messaging action

[![send message](https://github.com/okuzawats/chatwork-messaging-action/actions/workflows/example.yml/badge.svg)](https://github.com/okuzawats/chatwork-messaging-action/actions/workflows/example.yml)

Chatwork の Room にメッセージを送信する Action です。

以下の Chatwork API を使用しています。

- https://developer.chatwork.com/reference/post-rooms-room_id-messages

## 使い方

以下のように使用します。

```yml
- uses: okuzawats/chatwork-messaging-action@[コミットハッシュまたはタグを指定します]
  with:
    apiToken: ${{ secrets.API_KEY }} # Chatwork の API キーです。secrets の利用を推奨します。
    roomId: ${{ secrets.ROOM_ID }} # Chatwork の Room ID です。secrets の利用を推奨します。
    title: 'ここにタイトルを書きます。'
    message: 'ここにメッセージを書きます。'
```

ワークフロー構文の書き方は、本リポジトリの `.github/workflows/` 内に格納してある、[example.yml](https://github.com/okuzawats/chatwork-messaging-action/blob/main/.github/workflows/example.yml)も参考にしてください。
