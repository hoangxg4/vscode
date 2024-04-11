# Use a base image with the necessary dependencies
FROM ubuntu:22.04

# Update package lists and install required packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    software-properties-common \
    python3 \
    python3-pip \
    nodejs \
    npm

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Create the code-server configuration directory
RUN mkdir -p /root/.config/code-server

# Set the password for code-server
ENV PASSWORD="11042006"
RUN echo "password: $PASSWORD" >> /root/.config/code-server/config.yaml

# Expose the default code-server port
EXPOSE 8080

# Start code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
