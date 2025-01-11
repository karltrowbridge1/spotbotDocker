# spotbotDocker
A containerized testing environment for spotbot.

## Running the code

Ensure all contents are in the `.env` file and you have placed the correctly configured `setup.json` in the working directory.

Build the image:

`docker build -t spotbot .`

Run the container:

`docker run --rm --env-file .env -p 5000:5000 discord-bot`
