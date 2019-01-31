FROM microsoft/dotnet:sdk

LABEL version="1.0.0"
LABEL maintainer="WEIR"
LABEL com.github.actions.name=".NET Core API ZAP Test"
LABEL com.github.actions.description="GitHub Action to perform ZAP test against dot net core wep api"
LABEL com.github.actions.icon="triange"
LABEL com.github.actions.color="blue"

COPY entrypoint /entrypoint

ENTRYPOINT ["/entrypoint.sh"]
