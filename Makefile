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

.PHONY: u_boot_h5
u_boot_h5:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_h5_spl32_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" orangepi_pc2_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin

.PHONY: u_boot_h5_prime
u_boot_h5_prime:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_h5_spl32_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" orangepi_prime_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin

.PHONY: u_boot_h5_zeroplus
u_boot_h5_zeroplus:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_h5_spl32_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" orangepi_zeroplus_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin

.PHONY: u_boot_h5_nanopim1plus2
u_boot_h5_nanopim1plus2:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_h5_spl32_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" nanopim1plus2_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin

.PHONY: u_boot_h5_nanopineoplus2
u_boot_h5_nanopineoplus2:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_h5_spl32_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" nanopineoplus2_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin


.PHONY: u_boot_a64
u_boot_a64:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_spl32_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" pine64_plus_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin

.PHONY: u_boot_a64_so
u_boot_a64_so:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_spl32_lpddr3_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" pine64_plus_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin

.PHONY: u_boot_a64_pinebook
u_boot_a64_pinebook:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_spl32_lpddr3_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" pine64_plus_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin

.PHONY: u_boot_a64_opiwin
u_boot_a64_opiwin:
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-" sun50i_spl32_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) arm-linux-gnueabihf-"
	@cp u-boot/spl/sunxi-spl.bin sunxi-spl.bin
	$(MAKE) -C u-boot clean
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-" orangepiwin_defconfig
	$(MAKE) -C u-boot ARCH=arm CROSS_COMPILE="$(ccache) aarch64-linux-gnu-"
	@cp u-boot/u-boot.bin u-boot.bin

.PHONY: orangepipc2
orangepipc2: u_boot_h5
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: orangepiprime
orangepiprime: u_boot_h5_prime
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: orangepizeroplus2-h5
orangepizeroplus2-h5: u_boot_h5_zeroplus
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: nanopineo2
nanopineo2: u_boot_h5
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: nanopim1plus2
nanopim1plus2: u_boot_h5_nanopim1plus2
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: nanopineoplus2
nanopineoplus2: u_boot_h5_nanopineoplus2
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: pine64
pine64: u_boot_a64
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: pine64so
pine64so: u_boot_a64_so
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: pinebook-a64
pinebook-a64: u_boot_a64_pinebook
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: orangepiwin
orangepiwin: u_boot_a64_opiwin
	@u-boot/tools/mkimage -E -f config.its u-boot.itb
	@aarch64-linux-gnu-objcopy --gap-fill=0xff  -j .text -j .rodata -j .data -j .u_boot_list -j .rela.dyn -j .efi_runtime -j .efi_runtime_rel -I binary -O binary --pad-to=32768 --gap-fill=0xff sunxi-spl.bin u-boot-sunxi-with-spl.bin && cat u-boot.itb >> u-boot-sunxi-with-spl.bin

.PHONY: clean
clean:
	[ -f u-boot/Makefile ] && $(MAKE) -C u-boot ARCH=arm clean
	@rm -f sunxi-spl.bin u-boot.bin config.its u-boot-with-dtb.bin u-boot-sunxi-with-spl.bin

.PHONY: pine64_plus_defconfig
pine64_plus_defconfig:
	@cp blobs/sun50i_a64.its config.its

.PHONY: pine64_so_defconfig
pine64_so_defconfig:
	@cp blobs/sun50i_a64.its config.its

.PHONY: pine64_pinebook_defconfig
pine64_pinebook_defconfig:
	@cp blobs/sun50i_a64.its config.its

.PHONY: orangepi_win_defconfig
orangepi_win_defconfig:
	@cp blobs/sun50i_a64_opiwin.its config.its

.PHONY: orangepi_pc2_defconfig
orangepi_pc2_defconfig:
	@cp blobs/sun50i_h5.its config.its

.PHONY: orangepi_prime_defconfig
orangepi_prime_defconfig:
	@cp blobs/sun50i_h5_opiprime.its config.its

.PHONY: orangepi_zeroplus_defconfig
orangepi_zeroplus_defconfig:
	@cp blobs/sun50i_h5_opizeroplus.its config.its

.PHONY: nanopi_neo2_defconfig
nanopi_neo2_defconfig:
	@cp blobs/sun50i_h5.its config.its

.PHONY: nanopim1plus2_defconfig
nanopim1plus2_defconfig:
	@cp blobs/sun50i_h5.its config.its

.PHONY: nanopineoplus2_defconfig
nanopineoplus2_defconfig:
	@cp blobs/sun50i_h5.its config.its
