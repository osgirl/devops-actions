#!/bin/sh
set -e 

echo 'File Name'
nohup dotnet run --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj > /dev/null 2>&1 &
sh -c "wget http://localhost/swagger/v1/swagger.json"
