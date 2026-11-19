# Builds build/linux.bin, the Linux image for the simulation: OpenSBI with the
# device tree of the simulated system and a minimal kernel as its payload. The
# kernel carries init.c as its initramfs.
#
#   make LINUX=<Linux v6.12 source tree> OPENSBI=<OpenSBI v1.3 source tree>
#
# The kernel is configured and built inside the Linux tree; LINUX_FLAGS takes
# further arguments for that build.
#
# A native build on macOS needs GNU make and GNU sed first in PATH, and
#   LINUX_FLAGS="LD=ld.lld NM=llvm-nm HOSTCFLAGS='-I<dir> -I<linux>/include/uapi ...'"
# where <dir> holds an elf.h and a byteswap.h for the host tools; the uuid_t
# typedef in scripts/mod/file2alias.c must be renamed, macOS defines that name.
LINUX ?= $(error set LINUX to a Linux source tree)
OPENSBI ?= $(error set OPENSBI to an OpenSBI source tree)
CROSS_COMPILE ?= riscv64-unknown-elf-
LINUX_FLAGS ?=

MARCH = rv64ima_zicsr_zifencei
O := $(abspath build)
IMAGE = $(LINUX)/arch/riscv/boot/Image
KERNEL_MAKE = $(MAKE) -C $(LINUX) ARCH=riscv CROSS_COMPILE=$(CROSS_COMPILE) $(LINUX_FLAGS)

all: $(O)/linux.bin

$(O):
	mkdir -p $@

$(O)/init: init.c | $(O)
	$(CROSS_COMPILE)gcc -march=$(MARCH) -mabi=lp64 -mcmodel=medany -Os -Wall \
		-static -nostdlib -ffreestanding -o $@ $<

$(O)/initramfs.list: $(O)/init
	printf 'dir /dev 0755 0 0\nnod /dev/console 0600 0 0 c 5 1\ndir /proc 0755 0 0\nfile /init %s 0755 0 0\n' $< > $@

$(O)/linux.config: linux.config $(O)/initramfs.list
	sed 's|@INITRAMFS@|$(O)/initramfs.list|' $< > $@

$(IMAGE): $(O)/linux.config $(O)/init
	KCONFIG_ALLCONFIG=$(O)/linux.config $(KERNEL_MAKE) allnoconfig
	$(KERNEL_MAKE) Image

$(O)/nicore.dtb: nicore.dts | $(O)
	dtc -I dts -O dtb -o $@ $<

# The device tree goes to the top of the RAM, out of the way of the kernel.
$(O)/linux.bin: $(IMAGE) $(O)/nicore.dtb
	rm -rf $(O)/opensbi/platform/generic/firmware
	$(MAKE) -C $(OPENSBI) O=$(O)/opensbi PLATFORM=generic CROSS_COMPILE=$(CROSS_COMPILE) \
		PLATFORM_RISCV_ISA=$(MARCH) PLATFORM_RISCV_ABI=lp64 \
		FW_FDT_PATH=$(O)/nicore.dtb FW_PAYLOAD_PATH=$(IMAGE) FW_PAYLOAD_FDT_ADDR=0x87e00000
	cp $(O)/opensbi/platform/generic/firmware/fw_payload.bin $@

clean:
	rm -rf $(O)

.PHONY: all clean
