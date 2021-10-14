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
RUN curl https://releases.hashicorp.com/vault/1.8.4/vault_1.8.4_linux_amd64.zip --output /tmp/vault.zip \
  && unzip -u -d /usr/bin/ /tmp/vault.zip \
  && rm /tmp/vault.zip

# Install Hashicorp Terraform CLI
RUN curl https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip --output /tmp/terraform.zip \
    && unzip -u -d /usr/bin/ /tmp/terraform.zip \
  && rm /tmp/terraform.zip
