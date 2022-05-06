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
vcom -work work ../src/gearbox32to66_wip.vhd
vcom -work work ../src/aurora_rx_lane_wip.vhd
vcom -work work ../src/aurora_ch_bond.vhd
vcom -work work ../src/rr_arbiter.vhd
vlog -work work ../src/block_sync.sv



# YARR_rx sim Modules
vlog -work work ./sim_aurora_lane_drop_regression.sv

vsim -t 1fs -novopt sim_aurora_lane -L unisim -L secureip -L unifast -L unimacro

view signals
view wave

do wave_lane_drop_regression.do

run -all