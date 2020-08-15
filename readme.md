# A customized rk3399 debian linux aarch64 collection repository

## Target
* aarch64 debian linux board,
	* 96board, Rock960A/B/C.

## First initializing submodules
* do these sequence at first time,
```
git submodule init
git submodule update
```
* it may takes long time.

## Build u-boot
```
build/mk-uboot.sh rock960ab
```

## Build kernel
```
build/mk-kernel.sh rock960ab
```

## Build rootfs
* First time you need to do this for making a file 'linaro-stretch-alip-${datetime}.tar.gz'.
```
cd rootfs
./mk-base-debian.sh
```
* You can skip above step if have tar.gz file.
* Then create stretch base updates for Rock960 board,
```
./mk-rootfs-stretch-arm64.sh
```
* This sequence extract base tar.gz to binary directory, and copying overlay contents into binary.
* Then final step for this
```
sudo ./mk-image.sh
```
* This step creates linaro-rootfs.img file.
