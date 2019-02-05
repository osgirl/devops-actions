#!/bin/sh
set -e 

echo 'File Name'
sh -c  "dotnet run --project ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj" && exit
sh -c "wget http://localhost/swagger/v1/swagger.json"
