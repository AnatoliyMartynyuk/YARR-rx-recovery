
w
Command: %s
53*	vivadotcl2F
2synth_design -top vc709_top -part xc7k160tfbg484-32default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
?The '%s' target of the following IPs are stale, please generate the output products using the generate_target or synth_ip command before running synth_design.
%s160*	vivadotcl2
	Synthesis2default:default2w
cC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
2default:defaultZ4-393h px? 
?
?The '%s' target of the following IPs are stale, please generate the output products using the generate_target or synth_ip command before running synth_design.
%s160*	vivadotcl2"
Implementation2default:default2w
cC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
2default:defaultZ4-393h px? 
?
IP '%s' is locked:
%s
1260*coregen2
	clk_wiz_02default:default2?
?* This IP has board specific outputs. Current project board 'unset' and the board 'xilinx.com:vc709:part0:1.8' used to customize the IP 'clk_wiz_0' do not match. * Current project part 'xc7k160tfbg484-3' and the part 'xc7vx690tffg1761-2' used to customize the IP 'clk_wiz_0' do not match.2default:defaultZ19-2162h px?
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7k160t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7k160t2default:defaultZ17-349h px? 
W
Loading part %s157*device2$
xc7k160tfbg484-32default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
63122default:defaultZ8-7075h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1034.547 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2
	vc709_top2default:default2
 2default:default2n
XC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/new/vc709_top.sv2default:default2
232default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2

IDELAYCTRL2default:default2
 2default:default2K
5C:/Xilinx/Vivado/2020.1/scripts/rt/data/unisim_comp.v2default:default2
350562default:default8@Z8-6157h px? 
d
%s
*synth2L
8	Parameter SIM_DEVICE bound to: 7SERIES - type: string 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

IDELAYCTRL2default:default2
 2default:default2
12default:default2
12default:default2K
5C:/Xilinx/Vivado/2020.1/scripts/rt/data/unisim_comp.v2default:default2
350562default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	clk_wiz_02default:default2
 2default:default2?
?C:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.runs/synth_1/.Xil/Vivado-14796-DESKTOP-HC8675R/realtime/clk_wiz_0_stub.v2default:default2
52default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	clk_wiz_02default:default2
 2default:default2
22default:default2
12default:default2?
?C:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.runs/synth_1/.Xil/Vivado-14796-DESKTOP-HC8675R/realtime/clk_wiz_0_stub.v2default:default2
52default:default8@Z8-6155h px? 
?
synthesizing module '%s'638*oasys2"
aurora_rx_lane2default:default2Y
CC:/Users/User/Documents/YARR-rx-recovery/src/aurora_rx_lane_wip.vhd2default:default2
412default:default8@Z8-638h px? 
V
%s
*synth2>
*	Parameter S bound to: 8 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter D bound to: 1 - type: integer 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKIN_PERIOD bound to: 1.562500 - type: double 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter REF_FREQ bound to: 310.000000 - type: double 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter HIGH_PERFORMANCE_MODE bound to: TRUE - type: string 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter DATA_FORMAT bound to: PER_CLOCK - type: string 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2.
serdes_1_to_468_idelay_ddr2default:default2_
KC:/Users/User/Documents/YARR-rx-recovery/src/serdes_1_to_468_idelay_ddr.vhd2default:default2
652default:default2

serdes_cmp2default:default2.
serdes_1_to_468_idelay_ddr2default:default2Y
CC:/Users/User/Documents/YARR-rx-recovery/src/aurora_rx_lane_wip.vhd2default:default2
2102default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2.
serdes_1_to_468_idelay_ddr2default:default2a
KC:/Users/User/Documents/YARR-rx-recovery/src/serdes_1_to_468_idelay_ddr.vhd2default:default2
962default:default8@Z8-638h px? 
V
%s
*synth2>
*	Parameter S bound to: 8 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter D bound to: 1 - type: integer 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKIN_PERIOD bound to: 1.562500 - type: double 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter REF_FREQ bound to: 310.000000 - type: double 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter HIGH_PERFORMANCE_MODE bound to: TRUE - type: string 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter DATA_FORMAT bound to: PER_CLOCK - type: string 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter S bound to: 8 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2)
delay_controller_wrap2default:default2Z
FC:/Users/User/Documents/YARR-rx-recovery/src/delay_controller_wrap.vhd2default:default2
632default:default2
dc_inst2default:default2)
delay_controller_wrap2default:default2a
KC:/Users/User/Documents/YARR-rx-recovery/src/serdes_1_to_468_idelay_ddr.vhd2default:default2
3252default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2)
delay_controller_wrap2default:default2\
FC:/Users/User/Documents/YARR-rx-recovery/src/delay_controller_wrap.vhd2default:default2
842default:default8@Z8-638h px? 
V
%s
*synth2>
*	Parameter S bound to: 8 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2)
delay_controller_wrap2default:default2
32default:default2
12default:default2\
FC:/Users/User/Documents/YARR-rx-recovery/src/delay_controller_wrap.vhd2default:default2
842default:default8@Z8-256h px? 
d
%s
*synth2L
8	Parameter CINVCTRL_SEL bound to: FALSE - type: string 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter DELAY_SRC bound to: IDATAIN - type: string 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter HIGH_PERFORMANCE_MODE bound to: TRUE - type: string 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter IDELAY_TYPE bound to: VAR_LOAD - type: string 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter IDELAY_VALUE bound to: 0 - type: integer 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter IS_DATAIN_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter IS_IDATAIN_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter PIPE_SEL bound to: FALSE - type: string 
2default:defaulth p
x
? 
m
%s
*synth2U
A	Parameter REFCLK_FREQUENCY bound to: 310.000000 - type: double 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter SIGNAL_PATTERN bound to: DATA - type: string 
2default:defaulth p
x
? 
?
,binding component instance '%s' to cell '%s'113*oasys2
idelay_m2default:default2
IDELAYE22default:default2a
KC:/Users/User/Documents/YARR-rx-recovery/src/serdes_1_to_468_idelay_ddr.vhd2default:default2
3772default:default8@Z8-113h px? 
_
%s
*synth2G
3	Parameter DATA_RATE bound to: DDR - type: string 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter DATA_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
? 
i
%s
*synth2Q
=	Parameter DYN_CLKDIV_INV_EN bound to: FALSE - type: string 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter DYN_CLK_INV_EN bound to: FALSE - type: string 
2default:defaulth p
x
? 
O
%s
*synth27
#	Parameter INIT_Q1 bound to: 1'b0 
2default:defaulth p
x
? 
O
%s
*synth27
#	Parameter INIT_Q2 bound to: 1'b0 
2default:defaulth p
x
? 
O
%s
*synth27
#	Parameter INIT_Q3 bound to: 1'b0 
2default:defaulth p
x
? 
O
%s
*synth27
#	Parameter INIT_Q4 bound to: 1'b0 
2default:defaulth p
x
? 
k
%s
*synth2S
?	Parameter INTERFACE_TYPE bound to: NETWORKING - type: string 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter IOBDELAY bound to: IFD - type: string 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter IS_CLKB_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter IS_CLKDIVP_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter IS_CLKDIV_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter IS_CLK_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter IS_OCLKB_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter IS_OCLK_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter NUM_CE bound to: 2 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter OFB_USED bound to: FALSE - type: string 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter SERDES_MODE bound to: MASTER - type: string 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter SRVAL_Q1 bound to: 1'b0 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter SRVAL_Q2 bound to: 1'b0 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter SRVAL_Q3 bound to: 1'b0 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter SRVAL_Q4 bound to: 1'b0 
2default:defaulth p
x
? 
?
,binding component instance '%s' to cell '%s'113*oasys2
	iserdes_m2default:default2
	ISERDESE22default:default2a
KC:/Users/User/Documents/YARR-rx-recovery/src/serdes_1_to_468_idelay_ddr.vhd2default:default2
3972default:default8@Z8-113h px? 
d
%s
*synth2L
8	Parameter CINVCTRL_SEL bound to: FALSE - type: string 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter DELAY_SRC bound to: IDATAIN - type: string 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter HIGH_PERFORMANCE_MODE bound to: TRUE - type: string 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter IDELAY_TYPE bound to: VAR_LOAD - type: string 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter IDELAY_VALUE bound to: 0 - type: integer 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter IS_DATAIN_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter IS_IDATAIN_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter PIPE_SEL bound to: FALSE - type: string 
2default:defaulth p
x
? 
m
%s
*synth2U
A	Parameter REFCLK_FREQUENCY bound to: 310.000000 - type: double 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter SIGNAL_PATTERN bound to: DATA - type: string 
2default:defaulth p
x
? 
?
,binding component instance '%s' to cell '%s'113*oasys2
idelay_s2default:default2
IDELAYE22default:default2a
KC:/Users/User/Documents/YARR-rx-recovery/src/serdes_1_to_468_idelay_ddr.vhd2default:default2
4342default:default8@Z8-113h px? 
_
%s
*synth2G
3	Parameter DATA_RATE bound to: DDR - type: string 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter DATA_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
? 
i
%s
*synth2Q
=	Parameter DYN_CLKDIV_INV_EN bound to: FALSE - type: string 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter DYN_CLK_INV_EN bound to: FALSE - type: string 
2default:defaulth p
x
? 
O
%s
*synth27
#	Parameter INIT_Q1 bound to: 1'b0 
2default:defaulth p
x
? 
O
%s
*synth27
#	Parameter INIT_Q2 bound to: 1'b0 
2default:defaulth p
x
? 
O
%s
*synth27
#	Parameter INIT_Q3 bound to: 1'b0 
2default:defaulth p
x
? 
O
%s
*synth27
#	Parameter INIT_Q4 bound to: 1'b0 
2default:defaulth p
x
? 
k
%s
*synth2S
?	Parameter INTERFACE_TYPE bound to: NETWORKING - type: string 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter IOBDELAY bound to: IFD - type: string 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter IS_CLKB_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter IS_CLKDIVP_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter IS_CLKDIV_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter IS_CLK_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter IS_OCLKB_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter IS_OCLK_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter NUM_CE bound to: 2 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter OFB_USED bound to: FALSE - type: string 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter SERDES_MODE bound to: MASTER - type: string 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter SRVAL_Q1 bound to: 1'b0 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter SRVAL_Q2 bound to: 1'b0 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter SRVAL_Q3 bound to: 1'b0 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter SRVAL_Q4 bound to: 1'b0 
2default:defaulth p
x
? 
?
,binding component instance '%s' to cell '%s'113*oasys2
	iserdes_s2default:default2
	ISERDESE22default:default2a
KC:/Users/User/Documents/YARR-rx-recovery/src/serdes_1_to_468_idelay_ddr.vhd2default:default2
4542default:default8@Z8-113h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2.
serdes_1_to_468_idelay_ddr2default:default2
42default:default2
12default:default2a
KC:/Users/User/Documents/YARR-rx-recovery/src/serdes_1_to_468_idelay_ddr.vhd2default:default2
962default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
gearbox32to662default:default2V
BC:/Users/User/Documents/YARR-rx-recovery/src/gearbox32to66_wip.vhd2default:default2
132default:default2%
gearbox32to66_cmp2default:default2!
gearbox32to662default:default2Y
CC:/Users/User/Documents/YARR-rx-recovery/src/aurora_rx_lane_wip.vhd2default:default2
4432default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
gearbox32to662default:default2X
BC:/Users/User/Documents/YARR-rx-recovery/src/gearbox32to66_wip.vhd2default:default2
282default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
header_seeker2default:default2Q
=C:/Users/User/Documents/YARR-rx-recovery/src/header_seeker.sv2default:default2
42default:default2#
u_header_seeker2default:default2!
header_seeker2default:default2X
BC:/Users/User/Documents/YARR-rx-recovery/src/gearbox32to66_wip.vhd2default:default2
862default:default8@Z8-3491h px? 
?
synthesizing module '%s'%s4497*oasys2!
header_seeker2default:default2
 2default:default2S
=C:/Users/User/Documents/YARR-rx-recovery/src/header_seeker.sv2default:default2
42default:default8@Z8-6157h px? 
V
%s
*synth2>
*	Parameter c_DATA_HEADER bound to: 2'b01 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter c_CMD_HEADER bound to: 2'b10 
2default:defaulth p
x
? 
?
%s
*synth2?
?	Parameter seeker_positions bound to: 462'b000000100001110001101001001100110010011111010010101010110110001011011101111010000100000101000100000010110001110001000100101000010111001101000111010100000000000100001000000111000101000011010010000001001100101100011001001110000111110000010100010110010001001011100111010100011010100101011110110101011101110000010000011000100100011110010101001101101000010100111010110101100110111001011111100001100001100001001000110000011110010010001010100110000011011001111001000010 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
header_seeker2default:default2
 2default:default2
52default:default2
12default:default2S
=C:/Users/User/Documents/YARR-rx-recovery/src/header_seeker.sv2default:default2
42default:default8@Z8-6155h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
gearbox32to662default:default2
62default:default2
12default:default2X
BC:/Users/User/Documents/YARR-rx-recovery/src/gearbox32to66_wip.vhd2default:default2
282default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
descrambler2default:default2N
:C:/Users/User/Documents/YARR-rx-recovery/src/descrambler.v2default:default2
52default:default2#
descrambler_cmp2default:default2
descrambler2default:default2Y
CC:/Users/User/Documents/YARR-rx-recovery/src/aurora_rx_lane_wip.vhd2default:default2
4882default:default8@Z8-3491h px? 
?
synthesizing module '%s'%s4497*oasys2
descrambler2default:default2
 2default:default2P
:C:/Users/User/Documents/YARR-rx-recovery/src/descrambler.v2default:default2
52default:default8@Z8-6157h px? 
c
%s
*synth2K
7	Parameter RX_DATA_WIDTH bound to: 64 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
descrambler2default:default2
 2default:default2
72default:default2
12default:default2P
:C:/Users/User/Documents/YARR-rx-recovery/src/descrambler.v2default:default2
52default:default8@Z8-6155h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2"
aurora_rx_lane2default:default2
82default:default2
12default:default2Y
CC:/Users/User/Documents/YARR-rx-recovery/src/aurora_rx_lane_wip.vhd2default:default2
412default:default8@Z8-256h px? 
?
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
12default:default2
	rx_data_o2default:default2
642default:default2"
aurora_rx_lane2default:default2n
XC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/new/vc709_top.sv2default:default2
862default:default8@Z8-689h px? 
?
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
12default:default2
rx_header_o2default:default2
22default:default2"
aurora_rx_lane2default:default2n
XC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/new/vc709_top.sv2default:default2
872default:default8@Z8-689h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	vc709_top2default:default2
 2default:default2
92default:default2
12default:default2n
XC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/new/vc709_top.sv2default:default2
232default:default8@Z8-6155h px? 
?
%s*synth2?
xFinished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1095.008 ; gain = 60.461
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1095.008 ; gain = 60.461
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1095.008 ; gain = 60.461
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0452default:default2
1102.1762default:default2
0.0002default:defaultZ17-268h px? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
42default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
wc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2default:default2
u_pll	2default:default8Z20-848h px? 
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
wc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2default:default2
12default:default8@Z12-584h px?
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
wc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2default:default2
42default:default8@Z12-584h px?
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
wc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2default:default2
62default:default8@Z12-584h px?
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
wc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2default:default2
u_pll	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default8Z20-179h px? 
?
AClock '%s' completely overrides clock '%s'.
New: %s
Previous: %s
738*constraints2
clk2default:default2
clk_p2default:default2?
dummy1"b
Ncreate_clock -period 6.250 -name clk -waveform {0.000 3.125} [get_ports clk_p]2default:default"`
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2 [::"
1:]2default:default2?
dummy2"@
,create_clock -period 6.250 [get_ports clk_p]2default:default"?
wc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2 [::"
2:]2default:default8Z18-1056h px? 
?
No cells matched '%s'.
180*	planAhead2 
*idelayctrl*2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
702default:default8@Z12-180h px?
?
No cells matched '%s'.
180*	planAhead2

*idelaye2*2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
712default:default8@Z12-180h px?
?
Finished Parsing XDC File [%s]
178*designutils2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default8Z20-178h px? 
?
?One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2i
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2/
.Xil/vc709_top_propImpl.xdc2default:defaultZ1-498h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2i
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2/
.Xil/vc709_top_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1232.2032default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0132default:default2
1232.2032default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Constraint Validation : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7k160tfbg484-3
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    7 Bit       Adders := 7     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 6     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 10    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    5 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit         XORs := 64    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 8     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               64 Bit    Wide XORs := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Wide XORs := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Wide XORs := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	              194 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               67 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               66 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               64 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               58 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               33 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 11    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                7 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 28    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   66 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    7 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 15    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	  22 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	  12 Input    2 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 37    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 8     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2m
YPart Resources:
DSPs: 600 (col length:100)
BRAMs: 650 (col length: RAMB18 100 RAMB36 50)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
M
%s*synth25
!
ROM: Preliminary Mapping	Report
2default:defaulth px? 
q
%s*synth2Y
E+--------------+------------------+---------------+----------------+
2default:defaulth px? 
r
%s*synth2Z
F|Module Name   | RTL Object       | Depth x Width | Implemented As | 
2default:defaulth px? 
q
%s*synth2Y
E+--------------+------------------+---------------+----------------+
2default:defaulth px? 
r
%s*synth2Z
F|header_seeker | seeker_positions | 32x7          | LUT            | 
2default:defaulth px? 
r
%s*synth2Z
F|header_seeker | seeker_positions | 32x7          | LUT            | 
2default:defaulth px? 
r
%s*synth2Z
F|header_seeker | seeker_positions | 32x7          | LUT            | 
2default:defaulth px? 
r
%s*synth2Z
F|header_seeker | seeker_positions | 32x7          | LUT            | 
2default:defaulth px? 
r
%s*synth2Z
F|header_seeker | seeker_positions | 32x7          | LUT            | 
2default:defaulth px? 
r
%s*synth2Z
F|header_seeker | seeker_positions | 32x7          | LUT            | 
2default:defaulth px? 
r
%s*synth2Z
F+--------------+------------------+---------------+----------------+

2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:30 ; elapsed = 00:00:32 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Timing Optimization : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Technology Mapping : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
vFinished IO Insertion : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|      |BlackBox name |Instances |
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|1     |clk_wiz_0     |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
H
%s*synth20
+------+-----------+------+
2default:defaulth px? 
H
%s*synth20
|      |Cell       |Count |
2default:defaulth px? 
H
%s*synth20
+------+-----------+------+
2default:defaulth px? 
H
%s*synth20
|1     |clk_wiz    |     1|
2default:defaulth px? 
H
%s*synth20
|2     |CARRY4     |     2|
2default:defaulth px? 
H
%s*synth20
|3     |IDELAYCTRL |     1|
2default:defaulth px? 
H
%s*synth20
|4     |IDELAYE2   |     2|
2default:defaulth px? 
H
%s*synth20
|5     |ISERDESE2  |     2|
2default:defaulth px? 
H
%s*synth20
|6     |LUT1       |    21|
2default:defaulth px? 
H
%s*synth20
|7     |LUT2       |    43|
2default:defaulth px? 
H
%s*synth20
|8     |LUT3       |   141|
2default:defaulth px? 
H
%s*synth20
|9     |LUT4       |    47|
2default:defaulth px? 
H
%s*synth20
|10    |LUT5       |   159|
2default:defaulth px? 
H
%s*synth20
|11    |LUT6       |   350|
2default:defaulth px? 
H
%s*synth20
|12    |MUXF7      |    33|
2default:defaulth px? 
H
%s*synth20
|13    |MUXF8      |    11|
2default:defaulth px? 
H
%s*synth20
|14    |FDCE       |   303|
2default:defaulth px? 
H
%s*synth20
|15    |FDPE       |     3|
2default:defaulth px? 
H
%s*synth20
|16    |FDRE       |   203|
2default:defaulth px? 
H
%s*synth20
|17    |FDSE       |     3|
2default:defaulth px? 
H
%s*synth20
|18    |IBUF       |     3|
2default:defaulth px? 
H
%s*synth20
|19    |OBUF       |     4|
2default:defaulth px? 
H
%s*synth20
|20    |OBUFT      |     4|
2default:defaulth px? 
H
%s*synth20
+------+-----------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:26 ; elapsed = 00:00:35 . Memory (MB): peak = 1232.203 ; gain = 60.461
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1232.203 ; gain = 197.656
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0172default:default2
1232.2032default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
502default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12default:default2
22default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1233.4922default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
452default:default2
102default:default2
12default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:422default:default2
00:00:452default:default2
1233.4922default:default2
198.9452default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2g
SC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.runs/synth_1/vc709_top.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2|
hExecuting : report_utilization -file vc709_top_utilization_synth.rpt -pb vc709_top_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri May 20 13:32:20 20222default:defaultZ17-206h px? 


End Record