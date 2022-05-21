onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sim_block_sync/dut/rst_i
add wave -noupdate /sim_block_sync/dut/clk_i
add wave -noupdate /sim_block_sync/dut/gbox_buffer
add wave -noupdate /sim_block_sync/dut/buffer_dv
add wave -noupdate -radix unsigned /sim_block_sync/dut/block_offset
add wave -noupdate /sim_block_sync/dut/buffer
add wave -noupdate /sim_block_sync/dut/seeker
add wave -noupdate -radix unsigned -childformat {{{/sim_block_sync/dut/seeker_pos_idx[5]} -radix unsigned} {{/sim_block_sync/dut/seeker_pos_idx[4]} -radix unsigned} {{/sim_block_sync/dut/seeker_pos_idx[3]} -radix unsigned} {{/sim_block_sync/dut/seeker_pos_idx[2]} -radix unsigned} {{/sim_block_sync/dut/seeker_pos_idx[1]} -radix unsigned} {{/sim_block_sync/dut/seeker_pos_idx[0]} -radix unsigned}} -subitemconfig {{/sim_block_sync/dut/seeker_pos_idx[5]} {-radix unsigned} {/sim_block_sync/dut/seeker_pos_idx[4]} {-radix unsigned} {/sim_block_sync/dut/seeker_pos_idx[3]} {-radix unsigned} {/sim_block_sync/dut/seeker_pos_idx[2]} {-radix unsigned} {/sim_block_sync/dut/seeker_pos_idx[1]} {-radix unsigned} {/sim_block_sync/dut/seeker_pos_idx[0]} {-radix unsigned}} /sim_block_sync/dut/seeker_pos_idx
add wave -noupdate -radix unsigned /sim_block_sync/dut/seeker_pos_idx_reg
add wave -noupdate -radix unsigned /sim_block_sync/dut/valid_hdr_cnt
add wave -noupdate -radix unsigned /sim_block_sync/dut/valid_hdr_cnt_reg
add wave -noupdate -radix unsigned /sim_block_sync/dut/max_cnt_stg1
add wave -noupdate -radix unsigned /sim_block_sync/dut/max_cnt_stg1_reg
add wave -noupdate -radix unsigned /sim_block_sync/dut/offset_stg1
add wave -noupdate -radix unsigned /sim_block_sync/dut/offset_stg1_reg
add wave -noupdate -radix unsigned /sim_block_sync/dut/max_cnt_stg2
add wave -noupdate -radix unsigned /sim_block_sync/dut/offset_stg2
add wave -noupdate -radix unsigned /sim_block_sync/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {804 fs} 0}
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
WaveRestoreZoom {0 fs} {12057 fs}
