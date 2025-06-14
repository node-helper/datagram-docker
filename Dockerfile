# Dockerfile for Datagram CLI with temp directory fix
FROM ubuntu:22.04

# Install wget and other necessary tools
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create application directory and datagram directories
WORKDIR /app
RUN mkdir -p /root/.datagram/tmp \
    && mkdir -p /root/.datagram/itelligent/binaries \
    && mkdir -p /root/.datagram/conference/binaries

# Download and install Datagram CLI
RUN wget https://github.com/Datagram-Group/datagram-cli-release/releases/latest/download/datagram-cli-x86_64-linux -O datagram-cli

# Make it executable
RUN chmod +x datagram-cli

# Set environment to use datagram temp directory
ENV TMPDIR=/root/.datagram/tmp
ENV TMP=/root/.datagram/tmp
ENV TEMP=/root/.datagram/tmp

# Set the entrypoint
ENTRYPOINT ["./datagram-cli"]

# Default command (can be overridden)
CMD ["run", "--", "-key", "YOUR_API_KEY"]
