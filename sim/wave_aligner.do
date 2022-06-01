onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sim_aligner/dut/rst_i
add wave -noupdate /sim_aligner/dut/clk_i
add wave -noupdate /sim_aligner/dut/gbox_buffer
add wave -noupdate /sim_aligner/dut/gbox_cnt
add wave -noupdate /sim_aligner/dut/buffer_dv
add wave -noupdate /sim_aligner/dut/block_offset
add wave -noupdate /sim_aligner/dut/buffer
add wave -noupdate /sim_aligner/dut/seeker
add wave -noupdate /sim_aligner/dut/seeker_pos_idx
add wave -noupdate /sim_aligner/dut/seeker_pos_idx_reg
add wave -noupdate /sim_aligner/dut/valid_hdr_cnt
add wave -noupdate /sim_aligner/dut/valid_hdr_cnt_reg
add wave -noupdate /sim_aligner/dut/max_cnt_stg1
add wave -noupdate /sim_aligner/dut/max_cnt_stg1_reg
add wave -noupdate /sim_aligner/dut/offset_stg1
add wave -noupdate /sim_aligner/dut/offset_stg1_reg
add wave -noupdate /sim_aligner/dut/max_cnt_stg2
add wave -noupdate /sim_aligner/dut/offset_stg2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {659 fs} 0}
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
WaveRestoreZoom {0 fs} {9822 fs}
