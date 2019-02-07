#!/bin/sh
set -e 

echo 'ZAP Test Start'
nohup /zap/dotnetcore/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj &
wait-on "https://0.0.0.0:50001/swagger/v1/swagger.json" -t 120000
echo 'ZAP Test End'

