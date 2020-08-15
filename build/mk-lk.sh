#!/bin/bash -e

#
# Build script for Linaro Rock960 ARM64 kernel.
# Raph.K.
#

LOCALPATH=$(pwd)
OUT=${LOCALPATH}/out
EXTLINUXPATH=${LOCALPATH}/build/extlinux
KDIR=linarokernel
BOARD=linarorock960ab

version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }

finish() { 
echo -e "\e[31m MAKE KERNEL IMAGE FAILED.\e[0m"
exit -1 
}
trap finish ERR

[ ! -d ${OUT} ] && mkdir ${OUT}
[ ! -d ${OUT}/${KDIR} ] && mkdir ${OUT}/${KDIR}

# Board configuration for Rock960 Linaro.
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

DEFCONFIG=isp_defconfig
UBOOT_DEFCONFIG=kylin_rk3399_defconfig
DTB=rk3399-rock960.dtb
CHIP="rk3399"

if [ $? -ne 0 ]; then
	exit
fi

echo -e "\e[36m Building kernel for ${BOARD} board! \e[0m"

cd ${LOCALPATH}/${KDIR}
[ ! -e .config ] && echo -e "\e[36m Using ${DEFCONFIG} \e[0m" && make ${DEFCONFIG}

make -j8
cd ${LOCALPATH}

KERNEL_VERSION=$(cat ${LOCALPATH}/${KDIR}/include/config/kernel.release)

if version_gt "${KERNEL_VERSION}" "4.5"; then
	if [ "${DTB_MAINLINE}" ]; then
		DTB=${DTB_MAINLINE}
	fi
fi

echo -e "Generating boot.img ..."

if [ "${ARCH}" == "arm" ]; then
	cp ${LOCALPATH}/${KDIR}/arch/arm/boot/zImage ${OUT}/${KDIR}/
	cp ${LOCALPATH}/${KDIR}/arch/arm/boot/dts/${DTB} ${OUT}/${KDIR}/
else
	cp ${LOCALPATH}/${KDIR}/arch/arm64/boot/Image ${OUT}/${KDIR}/
	cp ${LOCALPATH}/${KDIR}/arch/arm64/boot/dts/rockchip/${DTB} ${OUT}/${KDIR}/
fi

# Change extlinux.conf according board
sed -e "s,fdt .*,fdt /$DTB,g" \
	-i ${EXTLINUXPATH}/${CHIP}.conf

./build/mk-limg.sh -c ${CHIP} -t boot

echo -e "\e[36m Kernel build success! \e[0m"
