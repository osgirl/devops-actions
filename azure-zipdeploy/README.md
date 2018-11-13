# GitHub Action to Zip Deploy to Azure App Services

This GitHub Action utilizes the Azure [ZipDeploy](https://docs.microsoft.com/en-us/azure/app-service/app-service-deploy-zip) method.

## Configuration

### Secrets (Required)

|Secret|Example|Description|
|---|---|---|
|`AZURE_LOGIN`|`jsmith`|Azure Login.|
|`AZURE_PASSWORD`|`yoursecretpassword`|Azure Password.|

### Environment variables (Required)

|Variable|Example|Description|
|---|---|---|
|`AZURE_SCM_URL`|`my-app-service.scm.azurewebsites.net`|The SCM URL for your Azure App service.|
|`PROJECT_PATH`|`./`|Relative path to your project files.|

### Workflow

```javascript
workflow "Deploy" {
  on = "push"
  resolves = ["Deploy to Azure App Service"]
}

action "Deploy to Azure App Service" {
  uses "weirgroup/devops-actions/azure-zipdeploy@master"
  secrets = ["AZURE_LOGIN", "AZURE_PASSWORD", "AZURE_SCM_URL"]
  env = {
    "PROJECT_PATH" = "./"
  }
}
```