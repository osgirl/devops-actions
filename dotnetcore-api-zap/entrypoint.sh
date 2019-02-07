#!/bin/sh
set -e 

echo 'ZAP Test Start'
nohup /zap/dotnetcore/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj --urls "http://*:8000" &
wait-on "http://$(ip -f inet -o addr show docker0 | awk '{print $4}' | cut -d '/' -f 1):8000/swagger/v1/swagger.json" -t 120000
echo 'ZAP Test End'

