#!/bin/sh
set -e 

echo 'ZAP Test Start'
get-ip
nohup /zap/dotnetcore/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj --urls "http://*:8000" &
localip=get-ip
eco localip
wait-on "http://localhost:8000/swagger/v1/swagger.json" -t 120000
echo 'ZAP Test End'

