#!/bin/sh

set -e

echo 'Preparing the Slack Command...'
if [ -z "$SLACK_TOKEN" ] || [ -z "$SLACK_CHANNEL" ]; then
  echo 'SLACK_TOKEN or SLACK_CHANNEL not supplied.'
  exit 1
fi

curl -X POST -H 'Authorization: Bearer $SLACK_TOKEN' \
-H 'Content-type: application/json' \
--data '{"channel":"$SLACK_CHANNEL","text":"$*"}' \
https://slack.com/api/chat.postMessage

exit 0
