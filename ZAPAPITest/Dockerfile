FROM docker:stable

LABEL "name"="Custom ZAP Action"
LABEL "maintainer"="GitHub Actions <senthilkumar.nh@mail.weir>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="GitHub Action for API Application ZAP testing"
LABEL "com.github.actions.description"="Runs application docker and performs the ZAP test against the application"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

USER root

RUN apk add --no-cache \
    ca-certificates \
    \
    # .NET Core dependencies
    krb5-libs \
    libgcc \
    libintl \
    libssl1.0 \
    libstdc++ \
    tzdata \
    userspace-rcu \
    zlib \
    && apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache \
    lttng-ust

RUN apk add --update nodejs nodejs-npm

RUN npm install -g wait-on
RUN npm install -g get-ip

RUN apk add --update bash && rm -rf /var/cache/apk/*
COPY dotnet-install.sh /dotnet-install.sh
RUN chmod +x /dotnet-install.sh
RUN mkdir /usr/share/dotnet
RUN /dotnet-install.sh --install-dir /usr/share/dotnet

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
