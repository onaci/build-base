# `onaci/build-base:ubuntu`

This Docker image is used to provide a 'build environment' base image for use in automated build and deployment pipelines.

It is an Ubuntu base image with several preinstalled utilities including:

- git
- [envsubst](http://manpages.ubuntu.com/manpages/trusty/man1/envsubst.1.html)
- [Docker Engine](https://docs.docker.com/engine/install/ubuntu/)
- [Hashicorp Vault CLI](https://learn.hashicorp.com/collections/vault/getting-started)
- [Hashicorp Terraform CLI](https://learn.hashicorp.com/collections/terraform/cli)

The installed Docker Engine makes this a Docker-In-Docker image, so please be aware of the [limitations of that configuration](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)
