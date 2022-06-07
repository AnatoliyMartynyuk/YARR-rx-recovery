onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sim_aligner/dut/rst_i
add wave -noupdate /sim_aligner/dut/clk_i
add wave -noupdate /sim_aligner/dut/gbox_buffer
add wave -noupdate /sim_aligner/dut/gbox_cnt
add wave -noupdate /sim_aligner/dut/buffer_dv
add wave -noupdate -radix unsigned /sim_aligner/dut/block_offset
add wave -noupdate /sim_aligner/dut/seekers
add wave -noupdate -radix unsigned /sim_aligner/dut/seeker_pos_idx_n
add wave -noupdate -radix unsigned /sim_aligner/dut/seeker_pos_idx_c
add wave -noupdate /sim_aligner/dut/headers_buffer
add wave -noupdate /sim_aligner/dut/seeker_chosen
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {903391 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 118
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
WaveRestoreZoom {903169 fs} {912831 fs}
