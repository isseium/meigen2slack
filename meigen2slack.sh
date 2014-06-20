#!/bin/sh

# Slack 設定
source ${0%/*}/config.sh

# 名言ファイルの指定
#   名言ファイルのフォーマット（タブ区切り）
#   1列: 名言本文
#   2列: 著者・発言者
# meigenfile=${0%/*}/meigen.list

# 名言ファイルからランダムに一行選択し、フォーマット変更
# total=$(wc -l ${meigenfile} | cut -d' ' -f 1)
# number=$($RANDOM % $total)
# text=$(head -${number} ${meigenfile} | tail -1 | awk -F'	' '{print "\""$1"\"" " by " $2}')
# echo $number $text

json=`curl http://meigen.o-bit.biz/api 2> /dev/null`
body=`echo ${json} | ${0%/*}/jq '.["meigen"]' | sed 's/\r\n//g'`
image=`echo ${json} | ${0%/*}/jq '.["image"]'`
author=`echo ${json} | ${0%/*}/jq '.["author"]' | sed 's/"//g'`
text="${body} by ${author} ${image}"


# Slack に通知 
curl -X POST 'https://slack.com/api/chat.postMessage' -d token=${slack_token} -d text="${text}" -d channel=${slack_notification_channel} -d username=${slack_username} > /dev/null 2>&1
