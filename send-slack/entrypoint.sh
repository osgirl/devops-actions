#!/bin/sh

set -e

echo 'Preparing the Slack Command...'
if [ -z "$SLACK_TOKEN" ] || [ -z "$SLACK_CHANNEL" ]; then
  echo 'SLACK_TOKEN or SLACK_CHANNEL not supplied.'
  exit 1
fi

if [ -z "$SLACK_COLOR" ]; then
  export SLACK_COLOR="#005EB8"
fi

if [ -z "$SLACK_FOOTER" ]; then
  export SLACK_FOOTER="GitHub Action"
fi

export SLACK_FOOTER="$SLACK_FOOTER - $GITHUB_REF ($GITHUB_SHA) - $GITHUB_REPOSITORY"

if [ -z "$SLACK_FOOTER_ICON" ]; then
  export SLACK_FOOTER_ICON="https://github.com/favicon.ico"
fi

curl -v -X POST -H "Authorization: Bearer $SLACK_TOKEN" \
-H "Content-type: application/json; charset=utf-8" \
--data '{"channel":"'$SLACK_CHANNEL'","text":" ","attachments":[{"footer":"'"$SLACK_FOOTER"'","color":"'$SLACK_COLOR'","footer_icon":"'"$SLACK_FOOTER_ICON"'","text":"'"$*"'"}]}' \
"https://slack.com/api/chat.postMessage"

exit 0