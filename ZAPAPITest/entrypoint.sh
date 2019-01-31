#!/bin/sh

sh -c "docker run -d -p 8088:80 weircde.azurecr.io/cde-identitymanagement-api:int"
sh -c "docker pull owasp/zap2docker-weekly"
sh -c "docker run -t owasp/zap2docker-weekly zap-api-scan.py -t http://localhost:8088/swagger/v1/swagger.json -f openapi"
