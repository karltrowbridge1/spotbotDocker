# Use Python 3.9 Alpine base image
FROM python:3.9-alpine

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
COPY entrypoint.sh .
COPY setup.json /app

# Make the script executable
RUN chmod +x entrypoint.sh

# Expose the Flask app port
EXPOSE 5000

# Set the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
