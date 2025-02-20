# Use an official lightweight image with shell support
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl jq docker.io && \
    curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/ && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the shell script into the container
COPY a.sh /a.sh

RUN sed -i 's/\r$//' /a.sh

# Set execute permissions for the script
RUN chmod +x /a.sh

# Set the default command to execute the script
CMD ["/bin/bash","/a.sh"]
