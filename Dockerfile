FROM golang:1.19-alpine

ARG DOCKER_VERSION=

# Install Docker and Docker Compose
RUN apk --no-cache add \
    bash \
    curl \
    util-linux \
    device-mapper \
    libffi-dev \
    openssl-dev \
    py3-pip \
    python3-dev \
    gcc \
    libc-dev \
    make \
    rust \
    cargo \
    iptables \
    docker \
    docker-cli-buildx \
    docker-cli-compose \
    openssh \
    git && \
    go install golang.org/x/tools/cmd/goimports@latest && \
    rm -rf /root/.cache
    

#RUN curl https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar zx && \
#    mv /docker/* /bin/ && \
#    chmod +x /bin/docker* && \
#    rm -rf /root/.cache

# Include functions to start/stop docker daemon
COPY docker-lib.sh /docker-lib.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
