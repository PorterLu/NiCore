VERILATOR ?= verilator
SBT ?= sbt
# Use the system archiver: a GNU ar found first in PATH on macOS writes
# archives that the macOS linker cannot read.
AR := $(firstword $(wildcard /usr/bin/ar) ar)

SCALA_SRCS := $(shell find ../src/main/scala -name '*.scala')
RTL = build/nicore.v
OBJ ?= obj_dir
SIM = $(OBJ)/Vnicore

VFLAGS = --cc --exe --build -j 0 -O3 --x-assign fast --x-initial fast \
	-Wno-fatal -Wno-WIDTHEXPAND -Wno-WIDTHTRUNC \
	-CFLAGS -O3 -LDFLAGS -ldl -MAKEFLAGS AR=$(AR) \
	--top-module nicore --Mdir $(OBJ) -o Vnicore
# make TRACE=1 OBJ=obj_trace builds a second simulator that can dump
# waveforms (see sim_main.cpp)
ifdef TRACE
VFLAGS += --trace
endif

all: $(SIM)

# Chisel names the top module nicore_myCPU; the testbench expects nicore.
$(RTL): $(SCALA_SRCS)
	cd .. && $(SBT) 'runMain myCPU.Driver --target-dir soc/build'
	sed 's/^module nicore_myCPU(/module nicore(/' build/myCPU.v > $@

$(SIM): sim_main.cpp difftest.h sram_model.v gpr_ptr.v $(RTL)
	$(VERILATOR) $(VFLAGS) sim_main.cpp sram_model.v gpr_ptr.v $(RTL)

run: $(SIM)
	./$(SIM) firmware.bin

# The difftest reference: SUSTemu's own Makefile builds its objects and is
# then asked to link them as a shared library.
SUSTEMU = ../third_party/sustemu
difftest:
	$(MAKE) -C $(SUSTEMU)
	$(MAKE) -C $(SUSTEMU) TARGET=$(abspath $(SUSTEMU))/build/sustemu-difftest.so LD='$(CXX) -shared'

clean:
	rm -rf obj_dir obj_trace build

.PHONY: all run difftest clean
