#!/bin/bash

export PATH=/home/alexander/handhelds/armv6/linaro/bin:$PATH
export ARCH=arm
#export CROSS_COMPILE=/home/alexander/handhelds/armv6/codesourcery/bin/arm-none-eabi-

export CROSS_COMPILE=arm-linux-gnueabihf-

U_BOARD=omap4_panda

make clean
make distclean

make ${U_BOARD}_config
make -j8 ${U_BOARD}

./tools/mkimage -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n uboot-tuna-nexus -d u-boot.bin tuna.img

