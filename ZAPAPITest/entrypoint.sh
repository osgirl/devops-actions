#!/bin/sh


# sh -c "docker run -d -p 8088:80 weircde.azurecr.io/cde-identitymanagement-api:int"
# sh -c "docker pull owasp/zap2docker-weekly"
/usr/share/dotnet/dotnet --help
# sh -c "wget http://localhost:8088/swagger/v1/swagger.json"
# sh -c "docker run -t owasp/zap2docker-weekly zap-api-scan.py -t http://$(ip -f inet -o addr show docker0 | awk '{print $4}' | cut -d '/' -f 1):8088/swagger/v1/swagger.json -f openapi"
