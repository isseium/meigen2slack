#!/bin/sh

# Slack 設定
source ${0%/*}/config.sh

# meigen api から取得（meigen api はランダムに 1つ名言を返却する仕様）
json=`curl http://meigen.o-bit.biz/api 2> /dev/null`
body=`echo ${json} | ${0%/*}/jq '.["meigen"]' | sed 's/\r\n//g'`
image=`echo ${json} | ${0%/*}/jq '.["image"]'`
author=`echo ${json} | ${0%/*}/jq '.["author"]' | sed 's/"//g'`
text="${body} by ${author} ${image}"

# Slack に通知 
curl -X POST 'https://slack.com/api/chat.postMessage' -d token=${slack_token} -d text="${text}" -d channel=${slack_notification_channel} -d username=${slack_username} > /dev/null 2>&1
