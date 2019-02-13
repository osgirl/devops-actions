#!/bin/sh

set -e 

echo 'ZAP Test Start'
currentmachineip=$(get-ip)
nohup /usr/share/dotnet/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj --urls "http://$currentmachineip:8048" &
docker pull owasp/zap2docker-weekly
wait-on "http://$currentmachineip:8048/swagger/v1/swagger.json" -t 120000
docker run -t owasp/zap2docker-weekly zap-api-scan.py -t http://$currentmachineip:8048/swagger/v1/swagger.json -f openapi
echo 'ZAP Test End'
