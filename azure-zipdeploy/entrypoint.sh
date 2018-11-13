#!/bin/sh

set -e

echo 'Preparing the Azure ZipDeploy Command...'
if [ -z "$AZURE_LOGIN" ] || [ -z "$AZURE_PASSWORD" ]; then
  echo 'AZURE_LOGIN / AZURE_PASSWORD was not supplied.'
  exit 1
fi

if [ -z "$PROJECT_PATH" ] || [ -z "$AZURE_SCM_URL" ]; then
  echo 'PROJECT_PATH / AZURE_SCM_URL was not supplied.'
  exit 1
fi

echo 'Zipping the site...'
zip -r site.zip $PROJECT_PATH*
zip -rv site.zip .deployment
echo 'Uploading site.zip to the Azure App Service... '
curl -X POST --data-binary @site.zip https://$AZURE_LOGIN:$AZURE_PASSWORD@$AZURE_SCM_URL/api/zipdeploy?async=true
echo 'Completed!'
exit 0