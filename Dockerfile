

FROM docker:20

RUN apk --no-cache add \
	git bash coreutils curl git grep sed sudo findutils jq zip make gettext openssh make \
  && curl https://releases.hashicorp.com/vault/1.7.0-rc1/vault_1.7.0-rc1_linux_amd64.zip --output /tmp/vault.zip \
  && unzip -u -d /usr/bin/ /tmp/vault.zip \
  && rm /tmp/vault.zip
