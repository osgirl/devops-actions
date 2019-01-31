#!/bin/sh
set -e 

echo 'File Name'
sh -c "dotnet publish ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj -c Release -o ../../app"
nohup "dotnet ./app/WEIR.CDE.OG.ServiceAPP.API.dll" &
sh -c "wget http://localhost/swagger/v1/swagger.json"
