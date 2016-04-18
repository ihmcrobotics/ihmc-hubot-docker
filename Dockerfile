#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ L          __/
#        \    \        __/
#          \____\______/
#
#  -- DOCKERFILE --
#
# IHMC Hubot

FROM node:5.10
MAINTAINER Doug Stephen <dstephen@ihmc.us>

ENV INITRD No

ENV HUBOT_DIR="/opt/ihmc-hubot/"
ENV HUBOT_EXEC="bin/hubot"
ENV HUBOT_PORT 5555

ENV HUBOT_LOG_LEVEL="debug"
ENV HUBOT_USER=hubot
ENV HUBOT_FORECAST_ROOM='weather'
ENV HUBOT_LATITUDE='30.416796'
ENV HUBOT_LONGITUDE='-87.213280'
ENV HUBOT_FORECAST_UNITS=us

ENV HUBOT_FORECAST_KEY=""
ENV HUBOT_SLACK_TOKEN=""

ENV PORT ${HUBOT_PORT}

EXPOSE ${HUBOT_PORT}

RUN git clone --depth=1 ***REMOVED*** ${HUBOT_DIR}

WORKDIR ${HUBOT_DIR}

RUN npm install

COPY "entrypoint.sh" "/entrypoint.sh"

CMD ["/bin/bash", "-c", "/entrypoint.sh"]
