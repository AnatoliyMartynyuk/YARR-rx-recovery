vlib work

# Xilinix Libraries
#vmap unifast  C:/Xilinx/simulation_libs/unifast
#vmap unimacro C:/Xilinx/simulation_libs/unimacro
#vmap unisim   C:/Xilinx/simulation_libs/unisim
#vmap secureip C:/Xilinx/simulation_libs/secureip

# Xilinix IPs
vcom -work work ../src/serdes_1_to_468_idelay_ddr.vhd
vcom -work work ../src/delay_controller_wrap.vhd

# Packages
vcom -work work ../src/tef1001_R2_type.vhd
vcom -work work ../src/board_pkg.vhd

#YARR_rx Modules
vcom -work work ../src/cdr_serdes.vhd
vlog -work work ../src/descrambler.v
vlog -work work ../src/scrambler.v
vcom -work work ../src/gearbox32to66.vhd
vcom -work work ../src/aurora_rx_lane.vhd
vcom -work work ../src/aurora_ch_bond.vhd
vcom -work work ../src/rr_arbiter.vhd



# YARR_rx sim Modules
vcom -work work ../src/sim_aurora_channel.vhd

vsim -t 1fs -novopt sim_aurora_channel -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_YARR_rx.do

run -all