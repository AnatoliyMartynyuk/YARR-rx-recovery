vlib work

# src files
vlog -work work ../src/block_sync.sv


# sim files
vlog -work work sim_block_sync.sv

vsim -t 1fs -novopt sim_block_sync -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_block_sync.do

run -all