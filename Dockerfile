FROM debian:bullseye-slim

# Install tools
RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/*

# Download datagram-cli binary
RUN wget https://github.com/Datagram-Group/datagram-cli-release/releases/latest/download/datagram-cli-x86_64-linux \
    && mv datagram-cli-x86_64-linux /usr/local/bin/datagram-cli \
    && chmod +x /usr/local/bin/datagram-cli

# Set working directory to a local, safe place
WORKDIR /app

ENTRYPOINT ["datagram-cli", "run", "--"]
