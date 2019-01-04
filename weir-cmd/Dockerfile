FROM weirgroup/build-image

LABEL "version"="1.0.0"
LABEL com.github.actions.name="GitHub Action for Generic Shell Actions"
LABEL com.github.actions.description="Pass it anything to run anything."
LABEL com.github.actions.icon="shield"
LABEL com.github.actions.color="blue"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

