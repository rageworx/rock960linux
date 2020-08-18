# A customized rk3399 debian linux aarch64 collection repository

## Target
* aarch64 debian linux board,
	* 96board, Rock960A/B/C.

## First initializing submodules
* do these sequence at first time,
	```
	$ git submodule init
	$ git submodule update
	```
* it may takes long time.

## Build kernel first ( before u-boot )
* Rock960A/B
	```
	$ build/mk-kernel.sh rock960ab
	```
* Rock960C
	```
	$ build/mk-kernel.sh rock960c
	```

## Then build u-boot ( after kernel )
* Rock960A/B
	```
	$ build/mk-uboot.sh rock960ab
	```
* Rock960C
	```
	$ build/mk-uboot.sh rock960c
	```

## Build rootfs
* First time you need to do this for making a file 'linaro-stretch-alip-${datetime}.tar.gz'.
	```
	$ cd rootfs
	$ ./mk-base-debian.sh
	```
* You can skip above step if have tar.gz file.
* Then create stretch base updates for Rock960 board,
	```
	$ ./mk-rootfs-stretch-arm64.sh
	```
* This sequence extract base tar.gz to binary directory, and copying overlay contents into binary.
* Then final step for this
	```
	$ sudo ./mk-image.sh
	```
* This step creates linaro-rootfs.img file.

## Make a complete system image.
* Before do this, check these files exists:
    1. boot.img ( uboot and kernel )
    1. linaro-rootfs.img
* Then do this,
	```
	$ build/mk-image.sh -c rk3399 -t system -r rootfs/linaro-rootfs.img
	```
