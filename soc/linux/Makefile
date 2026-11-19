# Builds build/linux.bin, the Linux image for the simulation: OpenSBI with the
# device tree of the simulated system and a minimal kernel as its payload. The
# kernel has KVM and carries init.c as its initramfs, together with a second
# kernel that init starts as a guest.
#
#   make LINUX=<Linux v6.12 source tree> OPENSBI=<OpenSBI v1.3 source tree>
#
# Both kernels are built from a clean Linux tree into build/host and
# build/guest; LINUX_FLAGS takes further arguments for those builds.
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
# $(call kernel,<host or guest>,<targets>)
kernel = $(MAKE) -C $(LINUX) O=$(O)/$(1) ARCH=riscv CROSS_COMPILE=$(CROSS_COMPILE) \
	KBUILD_BUILD_USER=nicore KBUILD_BUILD_HOST=nicore $(LINUX_FLAGS) $(2)
CC = $(CROSS_COMPILE)gcc -march=$(MARCH) -mabi=lp64 -mcmodel=medany -Os -Wall \
	-static -nostdlib -ffreestanding
GUEST_IMAGE = $(O)/guest/arch/riscv/boot/Image
HOST_IMAGE = $(O)/host/arch/riscv/boot/Image

all: $(O)/linux.bin

$(O):
	mkdir -p $@

$(O)/%.dtb: %.dts | $(O)
	dtc -I dts -O dtb -o $@ $<

# ---- the guest: the same init without the part that starts a guest
$(O)/init.guest: init.c | $(O)
	$(CC) -DGUEST -o $@ $<

$(O)/initramfs.guest: $(O)/init.guest
	printf 'dir /dev 0755 0 0\nnod /dev/console 0600 0 0 c 5 1\ndir /proc 0755 0 0\nfile /init %s 0755 0 0\n' $< > $@

$(O)/config.guest: guest.config $(O)/initramfs.guest
	sed 's|@INITRAMFS@|$(O)/initramfs.guest|' $< > $@

$(GUEST_IMAGE): $(O)/config.guest $(O)/init.guest
	KCONFIG_ALLCONFIG=$(O)/config.guest $(call kernel,guest,allnoconfig)
	$(call kernel,guest,Image)

# ---- the host: init, /dev/kvm, the kernel and the device tree of the guest
$(O)/init.host: init.c kvm.c | $(O)
	$(CC) -o $@ $<

$(O)/initramfs.host: $(O)/init.host $(GUEST_IMAGE) $(O)/guest.dtb
	printf 'dir /dev 0755 0 0\nnod /dev/console 0600 0 0 c 5 1\nnod /dev/kvm 0600 0 0 c 10 232\ndir /proc 0755 0 0\nfile /init %s 0755 0 0\nfile /guest.bin %s 0644 0 0\nfile /guest.dtb %s 0644 0 0\n' \
		$(O)/init.host $(GUEST_IMAGE) $(O)/guest.dtb > $@

$(O)/config.host: linux.config $(O)/initramfs.host
	sed 's|@INITRAMFS@|$(O)/initramfs.host|' $< > $@

$(HOST_IMAGE): $(O)/config.host $(O)/init.host $(GUEST_IMAGE) $(O)/guest.dtb
	KCONFIG_ALLCONFIG=$(O)/config.host $(call kernel,host,allnoconfig)
	$(call kernel,host,Image)

# The device tree goes to the top of the first 128 MiB, out of the way of the
# kernel.
$(O)/linux.bin: $(HOST_IMAGE) $(O)/nicore.dtb
	rm -rf $(O)/opensbi/platform/generic/firmware
	$(MAKE) -C $(OPENSBI) O=$(O)/opensbi PLATFORM=generic CROSS_COMPILE=$(CROSS_COMPILE) \
		PLATFORM_RISCV_ISA=$(MARCH) PLATFORM_RISCV_ABI=lp64 \
		FW_FDT_PATH=$(O)/nicore.dtb FW_PAYLOAD_PATH=$(HOST_IMAGE) FW_PAYLOAD_FDT_ADDR=0x87e00000
	cp $(O)/opensbi/platform/generic/firmware/fw_payload.bin $@

clean:
	rm -rf $(O)

.PHONY: all clean
