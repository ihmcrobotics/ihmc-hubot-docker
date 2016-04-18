# IHMC Hubot Docker

A Docker container for the IHMC Hubot.

## Usage

### Environment Variables

There are several env variables available based on the plugins that we use. Consult the Dockerfile for more information. There are two variables that start as empty; they are API keys. One for Slack (required variable), and one for Forecast (required if you want weather integration). You will want to pass in these variables via `-e` when you `docker run`. They are `HUBOT_SLACK_TOKEN` and `HUBOT_FORECAST_KEY`.

### Redis Brain

IHMC Hubot uses the default Redis brain. However, the brain is not in the same container. IHMC Hubot expects Redis to be exposed via a [linked container](https://docs.docker.com/engine/userguide/networking/default_network/dockerlinks/) (using the `--link` flag) that is aliased to `brain`.

### Example
An  example of starting up 2 containers:

```bash
# We will assume that the ihmc docker hubot is already on your machine.
# For simplicity, we will refer to the image as ihmc/hubot

$ docker pull redis:3.0 # pull down the redis image
$ docker run --name hubot_brain -d redis:3.0
$ docker run --name hubot --link hubot_brain:brain -e HUBOT_SLACK_TOKEN=your-token -e HUBOT_FORECAST_KEY=your-api-key -d ihmc/hubot
```

Not covered here is how to get Redis to persist stuff beyond the lifetime of its container. You will want to pick a reasonable place to store your redis data (we prefer a network drive) and you'll want to add a `-v /my/network/mount:/data` where `/data` is the pre-defined location for the official redis container to store it's information.
