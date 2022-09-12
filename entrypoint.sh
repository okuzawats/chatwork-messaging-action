#!/bin/sh -l

# Chatwork APIを用いてメッセージを投稿する。
# $1: APIキー
# $2: ルームID
# $3: メッセージ
ruby send_message.rb $1 $2 $3
