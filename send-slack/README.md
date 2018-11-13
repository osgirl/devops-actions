# GitHub Action to report deployments to [Slack](https://slack.com)

This GitHub Action utilizes the Slack [Chat Post Message](https://api.slack.com/methods/chat.postMessage) API.

## Configuration

### Secrets (Required)

|Secret|Example|Description|
|---|---|---|
|`SLACK_TOKEN`|`xoxb-xxxxxxxxx-xxxx`|Valid Slack token for your workspace.|
|`SLACK_CHANNEL`|`#devops`|Slack channel you wish to send messages to.|

### Environment variables (Optional)

These options are described in the Slack [Message Attachment](https://api.slack.com/docs/message-attachments) docs.

|Variable|Example|Description|
|---|---|---|
|`SLACK_COLOR`|`good` or `#005EB8`|The color of the message.|
|`SLACK_FOOTER`|`GitHub Action`|The footer text of the message.|
|`SLACK_FOOTER_ICON`|`https://github.com/favicon.ico`|The footer icon of the message.|

### Message text

Include your desired text in the `args` section of the GitHub Action.

### Workflow

```javascript
workflow "New Commit" {
  on = "push"
  resolves = ["Report Commit to Slack"]
}

action "Report Commit to Slack" {
  uses "weirgroup/devops-actions/send-slack@master"
  secrets = ["SLACK_TOKEN", "SLACK_CHANNEL"]
  env = {
    "SLACK_COLOR" = "#005EB8"
    "SLACK_FOOTER" = "Weir GitHub Action"
    "SLACK_FOOTER_ICON" = "https://github.com/favicon.ico"
  }
  args = "Workflow started..."
}
```