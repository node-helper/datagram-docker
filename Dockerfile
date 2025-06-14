# Use a minimal Debian-based image
FROM debian:bullseye-slim

# Install required tools: wget and ca-certificates
RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Download the datagram-cli binary, move it to bin, and make it executable
RUN wget https://github.com/Datagram-Group/datagram-cli-release/releases/latest/download/datagram-cli-x86_64-linux && \
    mv datagram-cli-x86_64-linux /usr/local/bin/datagram-cli && \
    chmod +x /usr/local/bin/datagram-cli

RUN mkdir -p /root/.datagram/tmp

# Set the default command to run the CLI
ENTRYPOINT ["datagram-cli", "run", "--"]
