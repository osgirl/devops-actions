#!/bin/sh

sh -c "docker run -d -p 8088:80 weircde.azurecr.io/cde-identitymanagement-api:int"
sh -c "docker pull owasp/zap2docker-weekly"
currentmachineip=$(get-ip)
echo $currentmachineip
wait-on "http://$currentmachineip:8088/swagger/v1/swagger.json" -t 120000
sh -c "docker run -t owasp/zap2docker-weekly zap-api-scan.py -t http://$currentmachineip:8088/swagger/v1/swagger.json -f openapi"
