# debdocker

[![pipeline status](https://gitlab.com/richardskumat/debdocker/badges/master/pipeline.svg)](https://gitlab.com/richardskumat/debdocker/commits/master)

I decided to build this image because I've had some python issues due to upstream
docker:stable being an Alpine image while doing molecule tests
on my Ansible roles.

Based on docker:stable, https://github.com/docker-library/docker/tree/master/19.03.

Compared to docker:stable, this image is only built for x64/amd64, so it won't
run on armhf, aarch64(32 or 64 bit arm).

This image serves as a base for qwe1/dind-ansible-molecule to build from.

## Links to source code and build logs

Gitlab

https://gitlab.com/richardskumat/debdocker

Gitlab pipelines

https://gitlab.com/richardskumat/debdocker/pipelines

Github

https://github.com/richardskumat/debdocker

Travis

https://travis-ci.org/richardskumat/debdocker

Dockerhub

https://hub.docker.com/r/qwe1/debdocker