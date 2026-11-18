VERILATOR = verilator
TOP = Vysyx_22041812

# note: --build is not used on macOS because ar may produce a misaligned
# archive; we compile and link the generated C++ manually below
all: obj_dir/$(TOP)

obj_dir/Vysyx_22041812.mk: sim_main.cpp sram_model.v gpr_ptr.v ../ysyx_22041812.v
	$(VERILATOR) --cc --exe -Wno-fatal -Wno-WIDTHEXPAND -Wno-WIDTHTRUNC \
		--public --top-module ysyx_22041812 -o $(TOP) sim_main.cpp sram_model.v gpr_ptr.v ../ysyx_22041812.v

obj_dir/$(TOP): obj_dir/Vysyx_22041812.mk sim_main.cpp
	$(MAKE) -C obj_dir -f Vysyx_22041812.mk -j 1 || true
	cd obj_dir && rm -rf fixlib && mkdir fixlib && cd fixlib && \
		/usr/bin/ar x ../Vysyx_22041812__ALL.a && /usr/bin/ar r ../Vysyx_22041812__ALL.a *.o && cd .. && \
	c++ -Wl,-U,__Z15vl_time_stamp64v,-U,__Z13sc_time_stampv,-U,_vlog_startup_routines \
		sim_main.o verilated.o verilated_threads.o Vysyx_22041812__ALL.a -pthread -o Vysyx_22041812

run: obj_dir/$(TOP)
	./obj_dir/$(TOP) firmware.bin

clean:
	rm -rf obj_dir

.PHONY: run clean
