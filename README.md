# Kernel Modules for S905X devices

## Install Modules
- clone this repository using git
```sh
git clone git://github.com/lutfailham96/s905x-kernel-modules.git && cd s905x-kernel-modules
```
- install modules, ex: wireguard
```sh
bash module.sh -i wireguard
```
- check modules, ex: wireguard
```sh
bash module.sh -c wireguard
```
- kernel module will installed on system and automatically loaded
