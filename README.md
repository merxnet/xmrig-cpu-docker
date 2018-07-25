# Dockerized XMRig (CPU) Monero miner

[![GitHub Release](https://img.shields.io/github/release/merxnet/xmrig-cpu-docker/all.svg)](https://github.com/merxnet/xmrig-cpu-docker/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date-pre/merxnet/xmrig-cpu-docker.svg)](https://github.com/merxnet/xmrig-cpu-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/merxnet/xmrig-cpu.svg)](https://hub.docker.com/r/merxnet/xmrig-cpu/)

The goal for this code is to create a modular and easy-to-use Docker image of the popular XMRig (CPU) Monero miner. Discover and support the source code [here](https://github.com/xmrig/xmrig). There are also code repositories for "Dockerized" versions of the [NVIDIA GPU](https://github.com/merxnet/xmrig-nvidia-docker) and [AMD GPU](https://github.com/merxnet/xmrig-amd-docker) miners as well.

## Quickstart
The Docker image created by this code is conveniently available on [Docker Hub](https://hub.docker.com/r/merxnet/xmrig-cpu/).
```
docker pull merxnet/xmrig-cpu
```
To get started, all you need is a [wallet](https://getmonero.org/resources/user-guides/create_wallet.html) and a [mining pool](https://monero.org/services/mining-pools/) of your choice, such as [Moria](https://moriaxmr.com/). This information can be provided on the command line at run time:
```
docker run merxnet/xmrig-cpu -o ${POOL} -u ${WALLET}
```
To get the most out of mining, be sure to check out the sections below as well as the documentation at the [source code's GitHub page](https://github.com/xmrig/xmrig#usage).

## Usage
This Docker image can be treated just like the binary -- that is, you can provide any and all command line options directly. For example:
```
docker run -d --name xmrig-cpu merxnet/xmrig-cpu \
  -k \
  -a cryptonight \
  -o us.moriaxmr.com:7777 \
  -u ${WALLET} \
  -t 8 \
  --max-cpu-usage 100 \
  --donate-level 1
```
On the other hand, if using a configuration file is more convenient, you can provide this at runtime to the container at the default location, such as:
```
docker run -d -v my_config.json:/usr/local/bin/config.json:ro merxnet/xmrig-cpu
```
To help create an XMRig config file, use [this](https://config.xmrig.com/) website.

## Host Configuration
For CPU mining, minimal configuration is required for the host machine (i.e., the machine running `dockerd`). To get the most out of each CPU, it is recommended that you enable [hugepages](https://wiki.debian.org/Hugepages) if possible. On most Linux distributions, it's a single command:
```
sysctl -w vm.nr_hugepages=128
```
This, however, is not permanent between reboots. Instead, you can create a `.conf` file in `/etc/sysctl.d/` to ensure hugepages is enabled on every boot. See more information about `sysctl` [here](https://wiki.archlinux.org/index.php/Sysctl).

## Support
Feel free to fork and create pull requests or create issues. Feedback is always welcomed. One can also send donatations to the Monero wallet below.
```
43txUsLN5h3LUKpQFGsFsnRLCpCW7BvT2ZKacsfuqYpUAvt6Po8HseJPwY9ubwXVjySe5SmxVstLfcV8hM8tHg8UTVB14Tk
```
Thank you.
