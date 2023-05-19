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
RUN curl https://releases.hashicorp.com/vault/1.13.2/vault_1.13.2_linux_amd64.zip --output /tmp/vault.zip \
  && unzip -u -d /usr/bin/ /tmp/vault.zip \
  && rm /tmp/vault.zip

# Install Hashicorp Terraform CLI
RUN curl https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip --output /tmp/terraform.zip \
    && unzip -u -d /usr/bin/ /tmp/terraform.zip \
  && rm /tmp/terraform.zip
