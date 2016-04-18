#!/bin/bash

export REDIS_URL=redis://"$BRAIN_PORT_6379_TCP_ADDR":6379/hubot

${HUBOT_DIR}${HUBOT_EXEC} --adapter slack
