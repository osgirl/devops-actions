FROM node:carbon

LABEL "version"="1.0.0"
LABEL com.github.actions.name="GitHub Action for Azure ZipDeploy"
LABEL com.github.actions.description="ZipDeploys code to your Azure App Service"
LABEL com.github.actions.icon="upload-cloud"
LABEL com.github.actions.color="blue"

RUN apt-get update && apt-get install -y zip

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

