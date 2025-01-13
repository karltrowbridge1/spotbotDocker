# Use Python 3.9 Alpine base image
FROM python:3.9-alpine

#Create the directory where the volume will be mounted
RUN mkdir -p /setup

# Set the working directory inside the container
WORKDIR /app

# Install necessary system dependencies
RUN apk add --no-cache \
    build-base \
    libffi-dev \
    openssl-dev \
    git \
    bash

# Copy the entrypoint script and setup file
COPY . .

# Make the script executable
RUN chmod +x /app/entrypoint.sh

# Expose the Flask app port
EXPOSE 5000

# Set the entrypoint script
ENTRYPOINT ["bash", "/app/entrypoint.sh"]
