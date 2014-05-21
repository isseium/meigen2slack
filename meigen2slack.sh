#!/bin/sh

# Slack 設定
source ${0%/*}/config.sh


# 名言ファイルの指定
#   名言ファイルのフォーマット（タブ区切り）
#   1列: 名言本文
#   2列: 著者・発言者
meigenfile=${0%/*}/meigen.list

# 名言ファイルからランダムに一行選択し、フォーマット変更
text=$(head -$(($RANDOM % $(wc -l ${meigenfile} | cut -d' ' -f 1))) ${meigenfile} | tail -1 | awk -F'	' '{print "\""$1"\"" " by " $2}')
echo $text

# Slack に通知 
curl -X POST 'https://slack.com/api/chat.postMessage' -d token=${slack_token} -d text="${text}" -d channel=${slack_notification_channel} -d username=${slack_username} > /dev/null 2>&1
