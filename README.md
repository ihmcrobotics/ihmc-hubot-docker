# Rosie Service (IHMC Hubot Docker)

A Docker container for the IHMC Hubot.

## Usage

### Docker Compose

This Dockerfile is meant to be used with the docker-compose.yml contained in this repository. It is composed of the container defined by this Dockerfile and the "Hubot Brain", in this case the default Redis brain. Currently we use `redis:3.0`. You can use this without compose but you'll need to come up with your own strategy for integrating Redis with the container environment if you want to have data persistence.

This setup also assumes the Slack (https://slackhq.com) adapter. It should be easy enough to modify this for other adapters but there are some things e.g. in the entrypoint.sh and Dockerfile that assume Slack.

### Dockerfile/entrypoint.sh

The Dockerfile makes a major assumptions, mainly, that your Hubot is in a Git repo that is publically cloneable. The file itself is fairly simple; it's based on the `node:6.10` docker (current LTS at the time of this writing), it establishes a few environment variables, then it clones your Hubot in to the container at build time (at a specified location). It exposes the default Hubot port, installs the required packages from NPM, and then uses the `entrypoint.sh` as its command.

The entrypoint script exports the `REDIS_URL` and then starts hubot with the Slack adapter. The `REDIS_URL` that gets exported assumes that you use the provided docker compose setup, as it uses the docker-resolvable hostname for the redis container, so you will also need to modify the entrypoint script if you aren't using the default compose setup.

### Environment Variables

At a minimum, `HUBOT_SLACK_TOKEN` should be set inside the container. You may also need to set other environment variables required by Hubot plugins/scripts you may add.

If you are using the docker compose setup, you need to create a file called `env_config` and populate it with the environment variables you wish to set. This file is gitignored so you can safely add it to the project root.

### Redis Brain/Data Persistence

IHMC Hubot uses the default Redis brain. However, the brain is not in the same container. This is managed by docker compose as mentioned above. We make an assumption that there is a sibling directory to this repository clone called `brain-data`, you can see this in the volume mounting info contained in the compose yaml. We also default to using Redis's AOF persistence model, as can be seen by the command used to start the redis container in the compose yaml. For more information on using Redis and Docker and persistence see https://hub.docker.com/_/redis/ and the Redis docs (linked from that site)