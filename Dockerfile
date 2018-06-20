ARG UBUNTU_VERSION=18.04

LABEL maintainer='docker@merxnet.io'

FROM ubuntu:${UBUNTU_VERSION}

ENTRYPOINT [ 'xmrig' ]
CMD [ '-h' ]
