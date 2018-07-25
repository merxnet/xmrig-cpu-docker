#!/usr/bin/env bash

CRYPTO=cryptonight
POOL=
WALLET=
CPUS=
MAX_CPU=75

docker run -d \
  --name xmrig-cpu merxnet/xmrig-cpu \
  -k \
  -a ${CRYPTO} \
  -o ${POOL} \
  -u ${WALLET} \
  -t ${CPUS} \
  --max-cpu-usage ${MAX_CPU}
