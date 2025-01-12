# Use a lightweight Python base image
FROM python:3.10.9

# Install Git for pulling code
RUN apt-get update && apt-get install -y git && apt-get clean

# Set the working directory inside the container
WORKDIR /app

# Copy the entrypoint script and setup file
COPY entrypoint.sh .
COPY setup.json /app

# Make the script executable
RUN chmod +x entrypoint.sh

# Expose the Flask app port
EXPOSE 5000

# Set the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
