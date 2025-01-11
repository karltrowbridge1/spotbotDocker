#!/bin/bash

# Exit after any failed command
set -e

# Clone the specified branch or default to 'main'
BRANCH=${GIT_BRANCH:-main}
REPO_URL=${GIT_REPO:-"https://github.com/wildxmxtt/spotbot2.git"}

echo "Cloning branch $BRANCH from $REPO_URL..."
git clone --branch "$BRANCH" "$REPO_URL" repo
cd repo

# Run Flask app for Spotify authentication
echo "Starting Flask app for authentication..."
flask run

# Wait for Flask app to signal authentication completion
# Needs attention
echo "Waiting for authentication to complete..."
while [ ! -f /tmp/auth_complete ]; do
    sleep 1
done

echo "Authentication complete! Stopping Flask app..."
pkill -f "python3 auth_app/app.py"

# Start the Discord bot
echo "Starting Discord bot..."
python3 bot.py