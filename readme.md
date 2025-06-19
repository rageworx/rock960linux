# A customized rk3399 Linux aarch64 collection repository

## Target
* VAMR Rock960 board ( or others too )
	* 96board, Rock960A/B and C ( model C is still testing )
	* Developing Kernel 5.10.66
	* Debian 12, bookworm

## First initializing submodules
* do these sequence at first time,
	```
	$ git submodule init
	$ git submodule update
	```
* it may takes long time.

## Make prebuilts + prepare cross compiler
* Create these directories
    ```
    prebuilts/gcc/linux-x86/aarch64/
    ```
* And download gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu from [here](https://developer.arm.com/downloads/-/gnu-a#panel4a).
* Extrct gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz to `prebuilts/gcc/linux-86/aarch64`.
* Then once you need run this:
    ```
	export PATH=$PATH:$PWD/prebuilts/gcc/linux-x86/aarch64/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin
	```

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
* First time you need to do this for making a file 'linaro-bullesys-alip-${datetime}.tar.gz'.
	```
	$ cd rootfs
	$ ./mk-base-debian.sh
	```
* You can skip above step if have tar.gz file.
* Then create debian bullseye base updates for Rock960 board,
	```
	$ ./mk-rootfs-bullseye.sh
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
* Then should flash system.img to zero address via rkdeveloptool.
