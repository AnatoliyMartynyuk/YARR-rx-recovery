create_clock -period 6.25 -name clk -waveform {0.000 3.125} [get_ports clk_p]

set_property PACKAGE_PIN AK34 [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property PACKAGE_PIN AL34 [get_ports clk_n]
set_property IOSTANDARD LVDS [get_ports clk_n]

##-------------------------------------
## LED Status Pinout   (bottom to top)
##-------------------------------------

set_property PACKAGE_PIN AM39 [get_ports {led[0]}]
set_property PACKAGE_PIN AN39 [get_ports {led[1]}]
set_property PACKAGE_PIN AR37 [get_ports {led[2]}]
set_property PACKAGE_PIN AT37 [get_ports {led[3]}]
set_property PACKAGE_PIN AR35 [get_ports {led[4]}]
set_property PACKAGE_PIN AP41 [get_ports {led[5]}]
set_property PACKAGE_PIN AP42 [get_ports {led[6]}]
set_property PACKAGE_PIN AU39 [get_ports {led[7]}]

set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[7]}]

set_property SLEW SLOW [get_ports {led[7]}]
set_property SLEW SLOW [get_ports {led[6]}]
set_property SLEW SLOW [get_ports {led[5]}]
set_property SLEW SLOW [get_ports {led[4]}]
set_property SLEW SLOW [get_ports {led[3]}]
set_property SLEW SLOW [get_ports {led[2]}]
set_property SLEW SLOW [get_ports {led[1]}]
set_property SLEW SLOW [get_ports {led[0]}]

set_property DRIVE 4 [get_ports {led[7]}]
set_property DRIVE 4 [get_ports {led[6]}]
set_property DRIVE 4 [get_ports {led[5]}]
set_property DRIVE 4 [get_ports {led[4]}]
set_property DRIVE 4 [get_ports {led[3]}]
set_property DRIVE 4 [get_ports {led[2]}]
set_property DRIVE 4 [get_ports {led[1]}]
set_property DRIVE 4 [get_ports {led[0]}]


##
## Switches
##
set_property PACKAGE_PIN AV30 [get_ports {gpio_switch[0]}]
set_property PACKAGE_PIN AY33 [get_ports {gpio_switch[1]}]
set_property PACKAGE_PIN BA31 [get_ports {gpio_switch[2]}]
set_property PACKAGE_PIN BA32 [get_ports {gpio_switch[3]}]
set_property PACKAGE_PIN AW30 [get_ports {gpio_switch[4]}]
set_property PACKAGE_PIN AY30 [get_ports {gpio_switch[5]}]
set_property PACKAGE_PIN BA30 [get_ports {gpio_switch[6]}]
set_property PACKAGE_PIN BB31 [get_ports {gpio_switch[7]}]

set_property IOSTANDARD LVCMOS18 [get_ports {gpio_switch[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_switch[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_switch[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_switch[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_switch[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_switch[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_switch[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_switch[7]}]

set_property IODELAY_GROUP IO_DLY1 [get_cells *idelayctrl*]
set_property IODELAY_GROUP IO_DLY1 [get_cells -hier *idelaye2*]