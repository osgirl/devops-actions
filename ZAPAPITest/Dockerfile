FROM docker:stable

LABEL "name"="Custom ZAP Action"
LABEL "maintainer"="GitHub Actions <senthilkumar.nh@mail.weir>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="GitHub Action for API Application ZAP testing"
LABEL "com.github.actions.description"="Runs application docker and performs the ZAP test against the application"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
