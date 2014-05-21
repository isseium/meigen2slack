# meigen2slack

タブ区切りの名言を Slack に投稿するシンプルなbotです。

## 使い方

### config.sh の準備

テンプレートファイルがあるのでコピーします
> $ cp config.sh.example config.sh

config.sh の設定をします

> slack_token="xoxp-2221803702-xxxxxxxxxxxxxxxxxx"      # Slack の API Key
> slack_notification_channel="#general"                 # 投稿したいチャンネル
> slack_username="今日の名言"                           # 投稿者名

### 試しに実行してみる

> $ sh meigen2slack.sh

slack に投稿されたことを確認します

### cron 設定

毎朝8時に起動

> 00 08 * * * /bin/sh /home/path/to/meigen2slack.sh


# License
Public Lisence
