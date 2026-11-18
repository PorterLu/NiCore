VERILATOR = verilator
TOP = Vnicore

all: obj_dir/$(TOP)

obj_dir/Vnicore.mk: sim_main.cpp sram_model.v gpr_ptr.v ../nicore.v
	$(VERILATOR) --cc --exe --public -Wno-fatal -Wno-WIDTHEXPAND -Wno-WIDTHTRUNC \
		--top-module nicore -o $(TOP) sim_main.cpp sram_model.v gpr_ptr.v ../nicore.v

obj_dir/$(TOP): obj_dir/Vnicore.mk sim_main.cpp
	$(MAKE) -C obj_dir -f Vnicore.mk -j 1 || true
	cd obj_dir && rm -rf fixlib && mkdir fixlib && cd fixlib && \
		/usr/bin/ar x ../Vnicore__ALL.a && /usr/bin/ar r ../Vnicore__ALL.a *.o && cd .. && \
	c++ -Wl,-U,__Z15vl_time_stamp64v,-U,__Z13sc_time_stampv,-U,_vlog_startup_routines \
		sim_main.o verilated.o verilated_threads.o Vnicore__ALL.a -pthread -o Vnicore

run: obj_dir/$(TOP)
	./obj_dir/$(TOP) firmware.bin

clean:
	rm -rf obj_dir

.PHONY: run clean
