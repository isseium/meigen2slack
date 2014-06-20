# meigen2slack

タブ区切りの名言を Slack に投稿するシンプルなbotです。

## 使い方

### config.sh の準備

テンプレートファイルがあるのでコピーします
<pre>
$ cp config.sh.example config.sh
</pre>

config.sh の設定をします

<pre>
slack_token="xoxp-2221803702-xxxxxxxxxxxxxxxxxx"      # Slack の API Key
slack_notification_channel="#general"                 # 投稿したいチャンネル
slack_username="今日の名言"                           # 投稿者名
</pre>

### 試しに実行してみる

<pre>
$ sh meigen2slack.sh
</pre>

slack に投稿されたことを確認します

### cron 設定

毎朝8時に起動

<pre>
00 08 * * * /bin/sh /home/path/to/meigen2slack.sh
</pre>

# License
Public Lisence
