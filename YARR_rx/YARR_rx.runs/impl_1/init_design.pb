
v
Command: %s
53*	vivadotcl2E
1link_design -top vc709_top -part xc7k160tfbg484-32default:defaultZ4-113h px? 
g
#Design is defaulting to srcset: %s
437*	planAhead2
	sources_12default:defaultZ12-437h px? 
j
&Design is defaulting to constrset: %s
434*	planAhead2
	constrs_12default:defaultZ12-434h px? 
W
Loading part %s157*device2$
xc7k160tfbg484-32default:defaultZ21-403h px? 
?
-Reading design checkpoint '%s' for cell '%s'
275*project2v
bc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp2default:default2
u_pll2default:defaultZ1-454h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0092default:default2
1034.6332default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
522default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
12default:defaultZ29-28h px? 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2020.12default:defaultZ1-479h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2~
hc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc2default:default2 

u_pll/inst	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2~
hc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc2default:default2 

u_pll/inst	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2x
bc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2 

u_pll/inst	2default:default8Z20-848h px? 
?
%Done setting XDC timing constraints.
35*timing2x
bc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
572default:default8@Z38-35h px? 
?
Deriving generated clocks
2*timing2x
bc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
572default:default8@Z38-2h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
get_clocks: 2default:default2
00:00:092default:default2
00:00:092default:default2
1504.4692default:default2
469.8362default:defaultZ17-268h px? 
?
c%s contains time %s which will be rounded to %s to ensure it is an integer multiple of 1 picosecond1787*	planAhead2!
-input_jitter2default:default2
0.0625002default:default2
0.0632default:default2x
bc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
572default:default8@Z12-2489h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2x
bc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2 

u_pll/inst	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default8Z20-179h px? 
?
?Clock '%s' completely overrides clock '%s', which is referenced by one or more other constraints. Any constraints that refer to the overridden clock will be ignored.
New: %s
Previous: %s
737*constraints2
clk2default:default2
clk_p2default:default2?
dummy1"b
Ncreate_clock -period 6.250 -name clk -waveform {0.000 3.125} [get_ports clk_p]2default:default"`
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2 [::"
1:]2default:default2?
dummy2"@
,create_clock -period 6.250 [get_ports clk_p]2default:default"m
bc:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2 [::"	
56:]2default:default8Z18-1055h px? 
?
Command failed: %s
69*common2C
/'AK34' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
32default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AL34' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
52default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AM39' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
122default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AN39' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
132default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AR37' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
142default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AT37' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
152default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AR35' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
162default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AP41' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
172default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AP42' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
182default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AU39' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
192default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AV30' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
522default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AY33' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
532default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'BA31' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
542default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'BA32' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
552default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AW30' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
562default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'AY30' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
572default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'BA30' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
582default:default8@Z17-69h px?
?
Command failed: %s
69*common2C
/'BB31' is not a valid site or package pin name.2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
592default:default8@Z17-69h px?
?
No cells matched '%s'.
180*	planAhead2 
*idelayctrl*2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
702default:default8@Z12-180h px? 
?
"'%s' expects at least one object.
55*common2 
set_property2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
702default:default8@Z17-55h px?
?
No cells matched '%s'.
180*	planAhead2

*idelaye2*2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
712default:default8@Z12-180h px? 
?
"'%s' expects at least one object.
55*common2 
set_property2default:default2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default2
712default:default8@Z17-55h px?
?
Finished Parsing XDC File [%s]
178*designutils2k
UC:/Users/User/Documents/YARR-rx-recovery/YARR_rx/YARR_rx.srcs/constrs_1/new/vc709.xdc2default:default8Z20-178h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1505.4572default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
102default:default2
32default:default2
212default:default2
02default:defaultZ4-41h px? 
]
%s completed successfully
29*	vivadotcl2
link_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2!
link_design: 2default:default2
00:00:172default:default2
00:00:182default:default2
1505.4572default:default2
470.8242default:defaultZ17-268h px? 


End Record