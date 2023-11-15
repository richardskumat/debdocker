FROM docker.io/library/docker:24.0-dind as dind

FROM docker.io/library/debian:bookworm-slim

ENV DOCKER_RELEASE_VERSION 24.0
ENV DOCKER_VERSION 24.0.7

COPY --from=dind /usr/local/bin/. /usr/local/bin
COPY --from=docker.io/docker/buildx-bin:v0.11 /buildx /usr/libexec/docker/cli-plugins/docker-buildx

RUN apt-get update && apt-get upgrade -y && \
	apt-get install ca-certificates tar wget git --no-install-recommends -y

RUN chmod 0755 /usr/local/bin/docker-entrypoint.sh \
	/usr/local/bin/modprobe \
	/usr/libexec/docker/cli-plugins/docker-buildx && \
	mkdir -p /usr/local/lib/docker/cli-plugins && \
	ln -s /usr/local/bin/buildx /usr/local/lib/docker/cli-plugins/docker-buildx \
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