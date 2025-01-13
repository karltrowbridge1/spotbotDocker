# spotbotDocker
A containerized testing environment for spotbot.

## Configuration

Ensure all contents are in the `.env` file are filled out.
Example `.env`:

```
GIT_BRANCH=<Branch>
GIT_REPO=https://github.com/wildxmxtt/spotbot2.git
```


A correctly configured `setup.json` setup file is needed. The configuration of `setup.json` can be found in the [spotbot2 repository](https://github.com/wildxmxtt/spotbot2).

## Running the Container

Build the image:

`docker build -t spotbot2 .`

Run the container:

```bash
docker run --rm -it \
  --env-file .env \
  -v /path/to/local/setup.json:/app/setup.json \
  -p 5000:5000 \
  spotbot2
```
