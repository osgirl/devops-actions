#!/bin/sh
set -e 

echo 'ZAP Test Start'
currentmachineip=$(get-ip)
nohup /zap/dotnetcore/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj --urls "http://$currentmachineip:8048" &
wait-on http-get://$currentmachineip:8048/swagger/v1/swagger.json -t 360000
echo 'waiton executed'
zap-api-scan.py -t http://$currentmachineip:8048/swagger/v1/swagger.json -f openapi -d
echo 'ZAP Test End'

