vlib work

# Xilinix Libraries
#vmap unifast  C:/Xilinx/simulation_libs/unifast
#vmap unimacro C:/Xilinx/simulation_libs/unimacro
#vmap unisim   C:/Xilinx/simulation_libs/unisim
#vmap secureip C:/Xilinx/simulation_libs/secureip

# Packages
vcom -work work ../src/tef1001_R2_type.vhd
vcom -work work ../src/board_pkg.vhd

#Serdes Modules
# Xilinix IPs
vcom -work work ../src/serdes_1_to_468_idelay_ddr.vhd
vcom -work work ../src/delay_controller_wrap.vhd

# Serdes sim Modules
vlog -work work sim_serdes_8_1.sv

vsim -t 1fs -novopt sim_serdes_8_1 -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_serdes_8_1.do

run -all