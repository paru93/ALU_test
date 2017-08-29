vlog  -sv +define+SIM_DEBUG            +incdir+../../src/cpu_src  alu_tb.v

vlog  -sv +define+SIM_DEBUG            +incdir+../../src/cpu_src  ../../src/cpu_src/alu_functional_unit.v
vlog  -sv +define                      +incdir+../../src/cpu_src  ../../src/cpu_src/alu_RV.v
vlog  -sv +define+SIM_DEBUG+CON_DEBUG  +incdir+../../src/cpu_src  ../../src/cpu_src/decode_RV.v
vlog  -sv +define+SIM_DEBUG            +incdir+../../src/cpu_src  ../../src/cpu_src/disasm_RV.v
vlog  -sv +define+SIM_DEBUG+CON_DEBUG  +incdir+../../src/cpu_src  ../../src/cpu_src/microcode_RV.v
vlog  -sv +define+SIM_DEBUG            +incdir+../../src/cpu_src  ../../src/cpu_src/sd_fifo.v
vlog  -sv +define+SIM_DEBUG            +incdir+../../src/cpu_src  ../../src/cpu_src/vedic_mult16x16.v
vlog  -sv +define+SIM_DEBUG            +incdir+../../src/cpu_src  ../../src/cpu_src/vedic_mult32x32.v

view structure
vsim -novopt -t 1ps \
	alu_tb
do wave_tb1.do
run -all