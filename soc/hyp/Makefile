# riscv-hyp-tests (https://github.com/ninolomata/riscv-hyp-tests) for NiCore.
#
#   make HYP_TESTS=<riscv-hyp-tests source tree>
#
# builds build/rvh_test.bin for the simulator in the directory above:
#
#   ../obj_dir/Vnicore build/rvh_test.bin 100000000
#
# LOG_LEVEL=LOG_DETAIL prints every check of a test instead of one line per
# test. TESTS selects the tests to run, in the order given. hfence_test checks
# that a translation stays in the TLB until a fence; the difftest reference
# has no TLB, so leave that test out for a run with DIFFTEST.
HYP_TESTS ?=
CROSS_COMPILE ?= riscv64-unknown-elf-
LOG_LEVEL ?= LOG_INFO
TESTS ?= two_stage_translation second_stage_only_translation \
	m_and_hs_using_vs_access check_xip_regs interrupt_tests \
	virtual_instruction hfence_test wfi_exception_tests tinst_tests

ifeq ($(HYP_TESTS),)
$(error set HYP_TESTS to the riscv-hyp-tests source tree)
endif

BUILD := build
CC := $(CROSS_COMPILE)gcc
OBJCOPY := $(CROSS_COMPILE)objcopy

# norvc.h stands in for the compressed instructions NiCore does not have.
# -O1: the tests read a record that their trap handlers fill in, and from -O2
# on GCC 13 moves such a read before the access that traps when nothing is
# printed in between.
MARCH ?= rv64ima_zicsr
COMPAT ?= -include norvc.h
CFLAGS := -march=$(MARCH) -mabi=lp64 -mcmodel=medany -O1 -ffreestanding \
	-fno-builtin -fno-toplevel-reorder -D LOG_LEVEL=$(LOG_LEVEL) \
	-I$(HYP_TESTS)/inc -I. $(COMPAT) -w

RUNTIME ?= runtime.c
# test_register.c of the suite is replaced by a table of the selected tests
SOURCES := $(addprefix $(HYP_TESTS)/, boot.S handlers.S main.c page_tables.c \
	rvh_test.c interrupt_tests.c translation_tests.c virtual_instruction.c \
	hfence_tests.c wfi_tests.c tinst_tests.c) $(RUNTIME) $(BUILD)/tests.c

all: $(BUILD)/rvh_test.bin

$(BUILD)/tests.c: FORCE
	@mkdir -p $(BUILD)
	@{ echo '#include <rvh_test.h>'; \
	   for t in $(TESTS); do echo "TEST_REGISTER($$t);"; done; } > $@.new
	@cmp -s $@.new $@ || mv $@.new $@

$(BUILD)/linker.ld: $(HYP_TESTS)/linker.ld platform.h
	@mkdir -p $(BUILD)
	$(CC) -E -P -x c -I. $< -o $@

$(BUILD)/rvh_test.elf: $(SOURCES) $(BUILD)/linker.ld norvc.h platform.h
	$(CC) $(CFLAGS) -nostdlib -static -T$(BUILD)/linker.ld $(SOURCES) -o $@

$(BUILD)/rvh_test.bin: $(BUILD)/rvh_test.elf
	$(OBJCOPY) -O binary $< $@

clean:
	rm -rf $(BUILD)

FORCE:

.PHONY: all clean FORCE
