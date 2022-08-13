# debdocker

[![pipeline status](https://gitlab.com/richardskumat/debdocker/badges/master/pipeline.svg)](https://gitlab.com/richardskumat/debdocker/commits/master)

I decided to build this image because I've had some python issues due to upstream
docker:stable being an Alpine image while doing molecule tests
on my Ansible roles.

Based on docker:stable, https://github.com/docker-library/docker/.

Compared to docker:stable, this image is only built for amd64 and armv8, so it won't
run on armhf.

This image serves as a base for qwe1/dind-ansible-molecule to build from.

I could try to add a Raspbian armhf image with docker installed in it later.

Might use https://hub.docker.com/r/balenalib/rpi-raspbian as Raspbian base image.

## add maybe

https://download.docker.com/linux/raspbian/dists/bullseye/pool/stable/armhf/

look at link above for armv7 docker binaries, which seem to work on rpi2 &rpi 3 for the moment

## Purpose of this image

Serves as a base image for my own use
and for Gitlab CI usage.

## Links to source code and build logs

Gitlab

https://gitlab.com/richardskumat/debdocker

Gitlab pipelines

https://gitlab.com/richardskumat/debdocker/pipelines

Github

https://github.com/richardskumat/debdocker

Dockerhub

https://hub.docker.com/r/qwe1/debdocker