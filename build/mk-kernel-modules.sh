#!/bin/bash -e

LOCALPATH=$(pwd)
OUT=${LOCALPATH}/out
EXTLINUXPATH=${LOCALPATH}/build/extlinux
BOARD=$1

version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }

finish() {
	echo -e "\e[31m MAKE KERNEL MODULES FAILED.\e[0m"
	exit -1
}
trap finish ERR

if [ $# != 1 ]; then
	BOARD=rk3288-evb
fi

[ ! -d ${OUT} ] && mkdir ${OUT}
[ ! -d ${OUT}/kernel ] && mkdir ${OUT}/kernel

source $LOCALPATH/build/board_configs.sh $BOARD

if [ $? -ne 0 ]; then
	exit
fi

echo -e "\e[36m Building kernel modules for ${BOARD} board! \e[0m"

cd ${LOCALPATH}/kernel
[ ! -e .config ] && echo -e "\e[36m Using ${DEFCONFIG} \e[0m" && make ${DEFCONFIG}

make  modules -j4

MODS_DIR=ko
if [ ! -e $MODS_DIR ];then
    mkdir -p $MODS_DIR
else
    rm -rf $MODS_DIR
fi

echo -e "\e[36m Installing kernel modules for ${BOARD} board! \e[0m"
make INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=$MODS_DIR modules_install

cd ${LOCALPATH}

echo -e "\e[36m Kernel build success! \e[0m"
