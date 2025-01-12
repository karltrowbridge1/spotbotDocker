# spotbotDocker
A containerized testing environment for spotbot.

## Configuration

Ensure all contents are in the `.env` file are filled out.
Example `.env`:

```
GIT_BRANCH=<Branch>
GIT_REPO=https://github.com/wildxmxtt/spotbot2.git
```


Correctly configure `setup.json` in the working directory. The configuration of `setup.json` can be found in the [spotbot2 repository](https://github.com/wildxmxtt/spotbot2).

## Running the Container

Build the image:

`docker build -t spotbot .`

Run the container:

`docker run --rm --env-file .env -p 5000:5000 discord-bot`
