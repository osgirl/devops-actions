#!/bin/sh

set -e 
if [ -z "$PROJECT_PATH" ]; then
  echo 'A project file was not supplied.'
  exit 1
fi

echo 'ZAP Test Start'
currentmachineip=$(get-ip)
nohup /usr/share/dotnet/dotnet run --configuration Release --project $PROJECT_PATH --urls "http://127.0.0.1:8048" &
docker pull owasp/zap2docker-weekly
wait-on "http://127.0.0.1:8048/swagger/v1/swagger.json" -t 120000
docker run -t owasp/zap2docker-weekly zap-api-scan.py -t http://127.0.0.1:8048/swagger/v1/swagger.json -f openapi -d
echo 'ZAP Test End'