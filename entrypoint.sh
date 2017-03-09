#!/bin/bash

export REDIS_URL=redis://brain:6379/hubot

${HUBOT_DIR}${HUBOT_EXEC} --adapter slack
