

FROM ubuntu:bionic

RUN apt-get update \
    && apt-get install -yq apt-transport-https ca-certificates curl gnupg \
    && echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic edge stable" > /etc/apt/sources.list.d/docker.list \
    && curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | apt-key add -qq - >/dev/null \
    && apt-get update \
    && apt-get install -yq docker-ce-cli git make vim jq wget
