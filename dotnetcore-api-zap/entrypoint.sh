#!/bin/sh
set -e 

echo 'File Name'
nohup /zap/dotnetcore/dotnet run --configuration Release --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj &
sh -c "wget https://localhost:5001/swagger/v1/swagger.json"
