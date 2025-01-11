# Use a lightweight Python base image
FROM python:3.10.9

# Install Git for pulling code
RUN apt-get update && apt-get install -y git && apt-get clean

# Set the working directory inside the container
WORKDIR /app

# Copy the entrypoint script
COPY entrypoint.sh .

# Make the script executable
RUN chmod +x entrypoint.sh

# Install dependencies for Flask and bot
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Flask app port
EXPOSE 5000

# Set the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
