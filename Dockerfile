ARG UBUNTU_VERSION=18.04
ARG ALPINE_VERSION=3.8


FROM ubuntu:${UBUNTU_VERSION} AS build

ENV VERSION 'v2.10.0'

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install git build-essential cmake libuv1-dev libmicrohttpd-dev libssl-dev

RUN git clone https://github.com/xmrig/xmrig.git
RUN cd xmrig && git checkout ${VERSION} && mkdir build

WORKDIR xmrig/build
ENV CMAKE_OPTS '-DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7 -DWITH_AEON=OFF -DWITH_HTTPD=OFF'
RUN cmake .. ${CMAKE_OPTS} && make


FROM frolvlad/alpine-glibc:alpine-${ALPINE_VERSION}

RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories \
  && apk update \
  && apk add --no-cache libssl1.1

LABEL maintainer='docker@merxnet.io'
COPY --from=build /xmrig/build/xmrig /usr/local/bin/xmrig

ENTRYPOINT ["xmrig"]
