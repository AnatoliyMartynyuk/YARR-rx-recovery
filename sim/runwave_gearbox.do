vlib work

# Xilinix Libraries
#vmap unifast  C:/Xilinx/simulation_libs/unifast
#vmap unimacro C:/Xilinx/simulation_libs/unimacro
#vmap unisim   C:/Xilinx/simulation_libs/unisim
#vmap secureip C:/Xilinx/simulation_libs/secureip

# Packages
vcom -work work ../src/tef1001_R2_type.vhd
vcom -work work ../src/board_pkg.vhd

#YARR_rx Modules
vcom -work work ../src/gearbox32to66.vhd

# YARR_rx sim Modules
vcom -work work sim_gearbox.vhd

vsim -t 1fs -novopt sim_gearbox -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_gearbox.do

run -all