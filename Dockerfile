FROM ubuntu:focal

# Upgrade and install standard OS packages
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -yq \
        apt-transport-https \
        ca-certificates \
        curl \
        gettext-base \
        git \
        gnupg \
        jq \
        less \
        lsb-release \
        make \
        nano \
        software-properties-common \
        vim \
        wget

# Configure the docker package repository
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list

# Configure the Hashicorp package repository
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

# Install tools from custom package repositories
RUN apt-get update \
    && apt-get install -yq \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        terraform \
        vault \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
