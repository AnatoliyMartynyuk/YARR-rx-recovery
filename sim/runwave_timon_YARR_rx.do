vlib work

# Xilinix Libraries
#vmap unifast  C:/Xilinx/simulation_libs/unifast
#vmap unimacro C:/Xilinx/simulation_libs/unimacro
#vmap unisim   C:/Xilinx/simulation_libs/unisim
#vmap secureip C:/Xilinx/simulation_libs/secureip

# Xilinix IPs
vcom -work work ../src_timon/serdes_1_to_468_idelay_ddr.vhd
vcom -work work ../src_timon/delay_controller_wrap.vhd

# Packages
vcom -work work ../src_timon/tef1001_R2_type.vhd
vcom -work work ../src_timon/board_pkg.vhd

#YARR_rx Modules
vcom -work work ../src_timon/aurora_rx_channel.vhd
vcom -work work ../src_timon/cdr_serdes.vhd
vlog -work work ../src_timon/descrambler.v
vlog -work work ../src_timon/scrambler.v
vcom -work work ../src_timon/gearbox32to66.vhd
vcom -work work ../src_timon/aurora_rx_lane.vhd
vcom -work work ../src_timon/aurora_ch_bond.vhd
vcom -work work ../src_timon/rr_arbiter.vhd



# YARR_rx sim Modules
vcom -work work ../src_timon/sim_aurora_channel.vhd

vsim -t 1fs -novopt sim_aurora_channel -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_YARR_rx.do

run -all