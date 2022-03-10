vlib work


#YARR_rx Modules

vlog -work work ../src_timon/scrambler.v

# YARR_rx sim Modules
vlog -work work ./sim_scrambler.sv

vsim -t 1fs -novopt sim_scrambler -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_scrambler.do

run -all