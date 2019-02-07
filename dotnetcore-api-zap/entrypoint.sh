#!/bin/sh
set -e 

echo 'ZAP Test Start'
nohup /zap/dotnetcore/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj &
wait-on "https://localhost:5001/swagger/v1/swagger.json"
echo 'ZAP Test End'

