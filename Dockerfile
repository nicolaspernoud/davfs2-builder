FROM ubuntu:focal

WORKDIR /work

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y pkg-config libtool libssl-dev wget libxml2-dev gcc make xmlto

ADD ./build/build.sh /build.sh
