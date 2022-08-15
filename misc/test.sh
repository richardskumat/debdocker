#!/bin/bash
cd /tmp || exit
DOCKER_VERSION=20.10
testfile=/tmp/test.txt
seq 0 1 17 > $testfile
while read -r MINOR_VERSION;do
#for MINOR_VERSION in "((i=1;i<18;i+=1))";do
wget -O docker-${DOCKER_VERSION}.${MINOR_VERSION}.tgz "https://download.docker.com/linux/static/stable/armhf/docker-${DOCKER_VERSION}.${MINOR_VERSION}.tgz"; \
mkdir -p docker-${DOCKER_VERSION}.${MINOR_VERSION}; \
	tar --extract \
		--file docker-${DOCKER_VERSION}.${MINOR_VERSION}.tgz \
		--strip-components 1 \
		--directory docker-${DOCKER_VERSION}.${MINOR_VERSION} \
	; \
	#rm docker-${DOCKER_VERSION}.${MINOR_VERSION}.tgz; \
	\
	./docker-${DOCKER_VERSION}.${MINOR_VERSION}/dockerd --version; \
	./docker-${DOCKER_VERSION}.${MINOR_VERSION}/docker --version; \
    sleep 6;
done < $testfile
