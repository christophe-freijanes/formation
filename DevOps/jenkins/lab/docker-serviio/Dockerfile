FROM ubuntu:20.04
LABEL maintainer="cfreijanes"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=2.2.1

LABEL org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.name="DLNA Serviio Container" \
	org.label-schema.description="DLNA Serviio Container" \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.version=$VERSION \
	org.label-schema.schema-version="1.0" 

ARG FFMPEG_VERSION=4.3.2
ARG JASPER_VERSION=2.0.14

ENV JAVA_HOME="/usr"
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl ffmpeg net-tools software-properties-common openjdk-8-jre default-jre  dcraw wget && \
	curl -s http://download.serviio.org/releases/serviio-${VERSION}-linux.tar.gz | tar zxvf - -C . && \
	mkdir -p /opt/serviio && \
	mkdir -p /media/serviio && \
	mv ./serviio-${VERSION}/* /opt/serviio && \
	chmod +x /opt/serviio/bin/serviio.sh && \
	mkdir -p /opt/serviio/log && \
	touch /opt/serviio/log/serviio.log

VOLUME ["/opt/serviio/config", "/opt/serviio/library",  "/opt/serviio/log", "/opt/serviio/plugins", "/media/serviio"]

EXPOSE 1900/udp
EXPOSE 8895/tcp
# HTTP/1.1 /console /rest
EXPOSE 23423/tcp
# HTTPS/1.1 /console /rest
EXPOSE 23523/tcp
# HTTP/1.1 /cds /mediabrowser
EXPOSE 23424/tcp
# HTTPS/1.1 /cds /mediabrowser
EXPOSE 23524/tcp

HEALTHCHECK --start-period=5m CMD wget --quiet --tries=1 -O /dev/null --server-response --timeout=5 http://127.0.0.1:23423/console/ || exit 1

WORKDIR /opt/serviio

CMD tail -f /opt/serviio/log/serviio.log & /opt/serviio/bin/serviio.sh
