#!/bin/sh
set -e 

echo 'File Name'
sh -c "dotnet publish ./src/WEIR.CDE.OG.ServiceAPP.API/WEIR.CDE.OG.ServiceAPP.API.csproj -c Release -o ../../app"
sh -c "dotnet ./app/WEIR.CDE.OG.ServiceAPP.API.dll"
