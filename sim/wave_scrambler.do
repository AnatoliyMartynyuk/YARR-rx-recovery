onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sim_scrambler/rst_n_i
add wave -noupdate /sim_scrambler/clk_ddr_i
add wave -noupdate /sim_scrambler/tx_data
add wave -noupdate /sim_scrambler/tx_data_s
add wave -noupdate /sim_scrambler/tx_data_t
add wave -noupdate /sim_scrambler/tx_counter
add wave -noupdate /sim_scrambler/cnt
add wave -noupdate /sim_scrambler/tx_data_valid
add wave -noupdate /sim_scrambler/test
add wave -noupdate /sim_scrambler/unscrambled_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {171 fs} 0}
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
WaveRestoreZoom {0 fs} {1 ps}
