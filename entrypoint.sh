#!/bin/bash

# Define the path for the setup file (mounted via a volume)
SETUP_FILE=/app/setup.json

# Verify if the setup file exists
if [ ! -f "$SETUP_FILE" ]; then
  echo "Error: Setup file ($SETUP_FILE) not found!"
  exit 1
fi

# Clone the specified branch or default to 'main'
BRANCH=${GIT_BRANCH:-main}
REPO_URL=${GIT_REPO:-"https://github.com/wildxmxtt/spotbot2.git"}

echo "Cloning branch $BRANCH from $REPO_URL..."
git clone --branch "$BRANCH" "$REPO_URL" repo

# Copy the setup file to the github repo directory
cd repo
echo "Copying setup file into /repo..."
cp "$SETUP_FILE" /app/repo/

# Install dependencies for Flask and bot
pip install --no-cache-dir -r requirements.txt

# Run Flask app for Spotify authentication
echo "Starting Flask app for authentication..."
flask run --host=0.0.0.0 --port=5000 &

# Prompt the user to confirm authentication 
echo "Please authenticate using the Flask app."
read -p "Press Enter once authentication is complete."

echo "Authentication complete! Stopping Flask app..."
pkill -f "flask run"

# Start the Discord bot
echo "Starting Discord bot..."
python3 spotbot.py