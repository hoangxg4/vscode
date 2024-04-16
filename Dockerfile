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

# Disable password authentication for code-server
RUN echo "bind-addr: 0.0.0.0:8080" > /root/.config/code-server/config.yaml && \
    echo "auth: none" >> /root/.config/code-server/config.yaml

# Expose the default code-server port
EXPOSE 8080

# Start code-server
CMD ["code-server", "--config", "/root/.config/code-server/config.yaml"]
