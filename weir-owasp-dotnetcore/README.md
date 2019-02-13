# GitHub Action to run OWASP testing against dotnet core Web API

This Action is for perform OWASP testing against a given dotnet core web API project.

## Configuration

### Secrets

|Secret|Example|Description|Optional|
|---|---|---|---|
|`PROJECT_PATH`|`./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj`|Relative path to your project file.|❌|
|`REPORTS_PATH`|`./results/`|Relative path to store results. Defaults to `./results/`|✅|

### Secrets/Run Options

If any of the options below are not included then the respective option will not be used to run weir-ci-node.

|Secret|Example|Description|Optional|
|---|---|---|---|
|`SLACK_TOKEN`|`xoxb-xxxxxxxxx-xxxx`|Valid Slack token for your workspace.|✅|
|`SLACK_CHANNEL`|`#devops`|Valid Slack channel for your workspace.|✅|
|`ZAP_TARGET_URL`|`http://localhost/`|URL to perform the [Zed Attack Proxy](https://developers.weir/docs/guides/zap-guide.html) `active-scan` on.|✅|
|`RETIRE`|`true`|Use [Retire.js](https://retirejs.github.io/retire.js/) to scan for component vulnerabilities.|✅|
|`JEST`|`true`|Run [Jest](https://jestjs.io/) unit tests on the project.|✅|
|`CYPRESS_KEY`|`XXXXXXXXX`|Run [Cypress](https://cypress.io) E2E tests on the project.|✅|

### Environment variables

|Variable|Example|Description|Optional|
|---|---|---|---|
|`NPM_RUN_CMD`|`start`|The npm run `command` to use to start the project.|❌|

### Project Environment Variables

Since this action launches your project internally, the GitHub Action also requires that you provide any other project dependant environment variables used to run your application.

### Workflow

```javascript
workflow "New Commit" {
  on = "push"
  resolves = ["Run OWASP Test"]
}

action "Run OWASP Test" {
  uses = "weirgroup/devops-actions/weir-owasp-dotnetcore@dotnetcore-api-owasp-testaction"
  secrets = []
  env = {    
  }
}
```
