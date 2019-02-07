#!/bin/sh
set -e 

echo 'ZAP Test Start'
get-ip
nohup /zap/dotnetcore/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj --urls "http://$localip:8000" &
localip=get-ip
echo $localip
wait-on "http://$localip:8000/swagger/v1/swagger.json" -t 120000
echo 'ZAP Test End'

