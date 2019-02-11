#!/bin/sh
set -e 

echo 'ZAP Test Start'
get-ip
currentmachineip=$(get-ip)
echo $currentmachineip
nohup /zap/dotnetcore/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj --urls "http://$currentmachineip:8000" &
wait-on "http://$currentmachineip:8000/swagger/v1/swagger.json" -t 120000
echo 'ZAP Test End'

