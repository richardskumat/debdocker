# debdocker

[![pipeline status](https://gitlab.com/richardskumat/debdocker/badges/master/pipeline.svg)](https://gitlab.com/richardskumat/debdocker/commits/master)

I decided to build this image because I've had some python issues due to upstream
docker:stable being an Alpine image while doing molecule tests
on my Ansible roles.

Based on docker:stable, https://github.com/docker-library/docker/.

Compared to docker:stable, this image is only built for amd64 and armv8.

This image serves as a base for qwe1/dind-ansible-molecule to build from.

# Disclaimer

All my personal projects are that, personal, and should not be relied upon.

I will change things at anytime and not keep old files, scripts or docker images around.

## Links to source code and build logs

Gitlab

https://gitlab.com/richardskumat/debdocker

Gitlab pipelines

https://gitlab.com/richardskumat/debdocker/pipelines

Github

https://github.com/richardskumat/debdocker

Dockerhub

https://hub.docker.com/r/qwe1/debdocker