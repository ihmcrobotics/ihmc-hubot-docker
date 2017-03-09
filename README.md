# Rosie Service (IHMC Hubot Docker)

A Docker container for the IHMC Hubot.

## Usage

### Environment Variables

`HUBOT_SLACK_TOKEN` should be set inside the container.

If you are using the docker compose setup, you need to fill out this value in the `env_config` file before starting the service.

Create this file in the project root; it will be gitignored so that the secret doesn't get versioned.

### Redis Brain

IHMC Hubot uses the default Redis brain. However, the brain is not in the same container. This is handled by Docker Compose. Data is mounted in to the brain in the `brain-data` directory.