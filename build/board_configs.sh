#!/bin/bash -e

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

BOARD=$1
DEFCONFIG=""
DTB=""
KERNELIMAGE=""
CHIP=""
UBOOT_DEFCONFIG=""

case ${BOARD} in
	"rk3399-excavator")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3399_defconfig
		DTB_MAINLINE=rk3399-sapphire-excavator.dtb
		DTB=rk3399-sapphire-excavator-linux.dtb
		export ARCH=arm64
		export CROSS_COMPILE=aarch64-linux-gnu-
		CHIP="rk3399"
		;;
	"rock960ab")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3399_defconfig
        #DTB=rock960-model-ab-linux.dtb
        DTB=rk3399-rock960-ab.dtb
		export ARCH=arm64
		export CROSS_COMPILE=aarch64-linux-gnu-
		CHIP="rk3399"
		;;
	"rock960c")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3399_defconfig
		DTB=rock960-model-c-linux.dtb
		export ARCH=arm64
		export CROSS_COMPILE=aarch64-linux-gnu-
		CHIP="rk3399"
		;;
	"ficus")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3399_defconfig
		DTB=ficus-linux.dtb
		export ARCH=arm64
		export CROSS_COMPILE=aarch64-linux-gnu-
		CHIP="rk3399"
		;;
	"rk3399-firefly")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=firefly-rk3399_defconfig
		DTB_MAINLINE=rk3399-firefly.dtb
		DTB=rk3399-firefly-linux.dtb
		export ARCH=arm64
		export CROSS_COMPILE=aarch64-linux-gnu-
		CHIP="rk3399"
		;;
	"rk3328-rock64")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3328_defconfig
		DTB=rk3328-rock64.dtb
		export ARCH=arm64
		export CROSS_COMPILE=aarch64-linux-gnu-
		CHIP="rk3328"
		;;
	"rk3328-evb")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3328_defconfig
		DTB=rk3328-evb.dtb
		export ARCH=arm64
		export CROSS_COMPILE=aarch64-linux-gnu-
		CHIP="rk3328"
		;;
	"rk3288-evb")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3288_defconfig
		DTB=rk3288-evb-act8846.dtb
		CHIP="rk3288"
		;;
	"rk3288-evb-rk808")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=fennec-rk3288_defconfig
		DTB=rk3288-evb-rk808-linux.dtb
		CHIP="rk3288"
		;;
	"rk3288-evb-rk1608")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3288-rk1608_defconfig
		DTB=rk3288-evb-rk1608.dtb
		CHIP="rk3288"
		;;
	"rk3288-firefly")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=firefly-rk3288_defconfig
		DTB=rk3288-firefly.dtb
		CHIP="rk3288"
		;;
	"rk3288-firefly-reload")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=firefly-rk3288_defconfig
		DTB=rk3288-firefly-reload-linux.dtb
		CHIP="rk3288"
		;;
	"rk3288-fennec")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=fennec-rk3288_defconfig
		DTB=rk3288-fennec.dtb
		CHIP="rk3288"
		;;
	"rk3288-miniarm")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=tinker-rk3288_defconfig
		DTB_MAINLINE=rk3288-tinker.dtb
		DTB=rk3288-miniarm.dtb
		CHIP="rk3288"
		;;
	"rk3288-phytec")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=phycore-rk3288_defconfig
		DTB=rk3288-phycore-rdk.dtb
		CHIP="rk3288"
		;;
	"rk3128-fireprime")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3128_defconfig
		DTB=rk3128-fireprime.dtb
		CHIP="rk3128"
		;;
	"rk3229-evb")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=evb-rk3229_defconfig
		DTB=rk3229-evb.dtb
		CHIP="rk322x"
		;;
	"rk3036-kylin")
		DEFCONFIG=rockchip_linux_defconfig
		UBOOT_DEFCONFIG=kylin-rk3036_defconfig
		DTB=rk3036-kylin.dtb
		CHIP="rk3036"
		;;
	*)
		echo "board '${BOARD}' not supported!"
		exit -1
		;;
esac
