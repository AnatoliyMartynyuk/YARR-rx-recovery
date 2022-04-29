onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sim_block_sync/rst_i
add wave -noupdate /sim_block_sync/clk_i
add wave -noupdate /sim_block_sync/gbox_buffer
add wave -noupdate /sim_block_sync/gbox_cnt
add wave -noupdate /sim_block_sync/block_offset
add wave -noupdate /sim_block_sync/dut/headers
add wave -noupdate /sim_block_sync/dut/valid_hdr_cnt
add wave -noupdate /sim_block_sync/dut/valid_hdr_cnt_reg
add wave -noupdate /sim_block_sync/dut/max_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2279 fs} 0}
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
WaveRestoreZoom {2200 fs} {3200 fs}
