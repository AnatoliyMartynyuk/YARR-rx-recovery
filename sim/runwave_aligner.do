vlib work

# src files
vlog -work work ../src/seeker33.sv
vlog -work work ../src/seeker22.sv
vlog -work work ../src/seeker11.sv
vlog -work work ../src/seeker6.sv
vlog -work work ../src/seeker3.sv
vlog -work work ../src/seeker2.sv
vlog -work work ../src/seeker1.sv
vlog -work work ../src/aligner.sv

# sim files
vlog -work work sim_aligner.sv

vsim -t 1fs -novopt sim_aligner -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_aligner.do

run -all