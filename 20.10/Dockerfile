FROM docker.io/library/docker:20.10-dind as dind
RUN dockerd --version

FROM docker.io/library/debian:bullseye-slim

ENV DOCKER_RELEASE_VERSION 20.10
ENV DOCKER_VERSION 20.10.18

COPY --from=dind /usr/local/bin/. /usr/local/bin

RUN apt-get update && apt-get upgrade -y && \
	apt-get install ca-certificates tar wget --no-install-recommends -y

RUN chmod 0755 /usr/local/bin/docker-entrypoint.sh \
	/usr/local/bin/modprobe && \
	rm -rf /var/lib/apt/lists/* && apt-get clean

# https://github.com/docker-library/docker/pull/166
#   dockerd-entrypoint.sh uses DOCKER_TLS_CERTDIR for auto-generating TLS certificates
#   docker-entrypoint.sh uses DOCKER_TLS_CERTDIR for auto-setting DOCKER_TLS_VERIFY and DOCKER_CERT_PATH
# (For this to work, at least the "client" subdirectory of this path needs to be shared between the client and server containers via a volume, "docker cp", or other means of data sharing.)
ENV DOCKER_TLS_CERTDIR=/certs
# also, ensure the directory pre-exists and has wide enough permissions for "dockerd-entrypoint.sh" to create subdirectories, even when run in "rootless" mode
RUN mkdir /certs /certs/client && chmod 1777 /certs /certs/client
# (doing both /certs and /certs/client so that if Docker does a "copy-up" into a volume defined on /certs/client, it will "do the right thing" by default in a way that still works for rootless users)

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]