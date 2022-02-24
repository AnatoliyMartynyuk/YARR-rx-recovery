vlib work

# Xilinix Libraries
#vmap unifast  C:/Xilinx/simulation_libs/unifast
#vmap unimacro C:/Xilinx/simulation_libs/unimacro
#vmap unisim   C:/Xilinx/simulation_libs/unisim
#vmap secureip C:/Xilinx/simulation_libs/secureip

# Packages
vcom -work work ../src/tef1001_R2_type.vhd
vcom -work work ../src/board_pkg.vhd

# Serdes sim Modules
vlog -work work sim_iserdes2.sv

vsim -t 1fs -novopt sim_iserdes2 -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_iserdes2.do

run -all