FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Datagram-Group/datagram-cli-release/releases/latest/download/datagram-cli-x86_64-linux \
    && mv datagram-cli-x86_64-linux /usr/local/bin/datagram-cli \
    && chmod +x /usr/local/bin/datagram-cli

# Make sure download dir exists
RUN mkdir -p /root/.datagram/tmp

ENTRYPOINT ["datagram-cli", "run", "--"]
