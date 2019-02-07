FROM owasp/zap2docker-weekly:latest

LABEL version="1.0.0"
LABEL maintainer="WEIR"
LABEL com.github.actions.name=".NET Core API ZAP Test"
LABEL com.github.actions.description="GitHub Action to perform ZAP test against dot net core wep api"
LABEL com.github.actions.icon="triange"
LABEL com.github.actions.color="blue"

USER root
COPY dotnet-install.sh /dotnet-install.sh
RUN chmod +x /dotnet-install.sh
RUN /dotnet-install.sh --install-dir /zap/dotnetcore

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y nodejs

RUN apt-get install -y npm
RUN npm install -g wait-on
RUN npm install -g get-ip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

