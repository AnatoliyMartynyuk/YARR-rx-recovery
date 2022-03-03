onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sim_iserdes2/clk
add wave -noupdate /sim_iserdes2/clk_2
add wave -noupdate /sim_iserdes2/clk_div
add wave -noupdate /sim_iserdes2/rst
add wave -noupdate /sim_iserdes2/input1
add wave -noupdate /sim_iserdes2/input2
add wave -noupdate /sim_iserdes2/bitslip
add wave -noupdate /sim_iserdes2/out
add wave -noupdate /sim_iserdes2/comb_out
add wave -noupdate /sim_iserdes2/input_word
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {175100000 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {443750 fs} {186818750 fs}
