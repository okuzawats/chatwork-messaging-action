#!/bin/bash -l

# Chatwork APIを用いてメッセージを投稿する。
# $1: APIキー
# $2: ルームID
# $3: タイトル
# $4: メッセージ
ruby send_message.rb $1 $2 "$3" "$4"
