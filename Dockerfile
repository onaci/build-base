FROM docker:latest

# Upgrade and install standard OS packages
RUN apk update \
    && apk upgrade \
    && apk --no-cache add \
        bash \
        ca-certificates \
        coreutils \
        curl \
        findutils \
        git \
        grep \
        gettext \
        jq \
        less \
        make \
        nano \
        openssh \
        openssl \
        sed \
        sudo \
        zip

# Install Hashicorp Vault CLI
ARG VAULT_VERSION=1.14.4
RUN curl "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" --output /tmp/vault.zip \
  && unzip -u -d /usr/bin/ /tmp/vault.zip \
  && rm /tmp/vault.zip

# Install Hashicorp Terraform CLI
ARG TERRAFORM_VERSION=1.5.5
RUN curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" --output /tmp/terraform.zip \
    && unzip -u -d /usr/bin/ /tmp/terraform.zip \
  && rm /tmp/terraform.zip
