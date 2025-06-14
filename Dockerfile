# Dockerfile
# Use a minimal base image (e.g., Alpine Linux for small size)
FROM alpine:latest

# Set a working directory inside the container
WORKDIR /app

# Download the datagram-cli executable
# Using ARG for the download URL allows for more flexibility if the URL changes slightly
ARG DATAGRAM_CLI_URL="https://github.com/Datagram-Group/datagram-cli-release/releases/latest/download/datagram-cli-x86_64-linux"
RUN wget -O datagram-cli "$DATAGRAM_CLI_URL"

# Make the executable runnable
RUN chmod +x datagram-cli

# Define a default command to run when the container starts
# This makes it easy to run datagram-cli without specifying the full path every time
ENTRYPOINT ["./datagram-cli"]

# Optionally, you can set a default argument for the ENTRYPOINT
# This can be overridden when you run the container
CMD ["run"]
