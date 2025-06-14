# Dockerfile for Datagram CLI
FROM ubuntu:22.04

# Install wget and other necessary tools
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash datagram

# Create application directory
RUN mkdir -p /app && chown datagram:datagram /app

# Switch to non-root user
USER datagram
WORKDIR /app

# Download and install Datagram CLI
RUN wget https://github.com/Datagram-Group/datagram-cli-release/releases/latest/download/datagram-cli-x86_64-linux -O datagram-cli

# Make it executable
RUN chmod +x datagram-cli

# Set the entrypoint
ENTRYPOINT ["./datagram-cli"]

# Default command (can be overridden)
CMD ["run", "--", "-key", "YOUR_API_KEY"]
