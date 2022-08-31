#!/bin/sh -l

# 引数前後の""を除去する
MESSAGE=`echo $3 | sed 's/"//g'`

# Chatwork APIを用いてメッセージを投稿する。
# $1: APIキー
# $2: ルームID
# $3: メッセージ
curl \
    -X POST \
    -H "X-ChatWorkToken: $1" \
    -d "body=$MESSAGE" \
    "https://api.chatwork.com/v2/rooms/$2/messages"
