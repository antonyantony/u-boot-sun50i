# This program is licensed "as is" without any
# warranty of any kind, whether express or implied.

# Simple Makefile to create Pine64 u-boot in Armbian build script compatible way
# Made by makefile noob, so no facepalms please

VERSION= 1
PATCHLEVEL= 0
SUBLEVEL= 0
EXTRAVERSION= -armbian

SHELL := bash

# pass ccache to submodules make
ccache := $(findstring ccache,$(CROSS_COMPILE))

DTS := $(wildcard blobs/*.dts)
DTB := $(patsubst blobs/%.dts, %.dtb, $(DTS))

.PHONY: all
all: make_image

.PHONY: u_boot_h5
u_boot_h5:
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_h5_spl32_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" orangepi_pc2_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"

.PHONY: arm_trusted_firmware
arm_trusted_firmware:
	$(MAKE) -C arm-trusted-firmware PLAT=sun50iw1p1 DEBUG=1 CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" bl31

%.dtb: blobs/%.dts
	dtc -I dts -O dtb -o $@ $<

.PHONY: make_image
make_image: u_boot_h5 arm_trusted_firmware $(DTB)
	@dtc -I dts -O dtb -o dt.dtb dt.dts
	@cp arm-trusted-firmware/build/sun50iw1p1/debug/bl31.bin u-boot/bl31.bin
	@u-boot/tools/mkimage -E -f u-boot/sun50i_h5.its sun50i_h5.itb

.PHONY: clean
clean:
	[ -f u-boot-h5/Makefile ] && $(MAKE) -C u-boot-h5 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- clean
	[ -f arm-trusted-firmware/Makefile ] && $(MAKE) -C arm-trusted-firmware PLAT=sun50iw1p1 distclean
	@rm -f sunxi-spl.bin u-boot-with-dtb.bin dt.dts dt.dtb $(DTB)

.PHONY: pine64_plus_defconfig
pine64_plus_defconfig:
	@cp blobs/pine64-plus.dts dt.dts

.PHONY: pine64_defconfig
pine64_defconfig:
	@cp blobs/pine64.dts dt.dts

.PHONY: orangepi_pc2_defconfig
orangepi_pc2_defconfig:
	@cp blobs/orangepi_pc2.dts dt.dts
