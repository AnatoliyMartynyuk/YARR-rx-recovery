onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group top /sim_aurora_lane/rst_n_i
add wave -noupdate -group top /sim_aurora_lane/rst2_n_i
add wave -noupdate -group top /sim_aurora_lane/clk_rx_i
add wave -noupdate -group top /sim_aurora_lane/clk_serdes_i
add wave -noupdate -group top /sim_aurora_lane/clk_ddr_i
add wave -noupdate -group top /sim_aurora_lane/rx_data_i_p
add wave -noupdate -group top /sim_aurora_lane/rx_polarity
add wave -noupdate -group top /sim_aurora_lane/rx_data_out
add wave -noupdate -group top /sim_aurora_lane/rx_header_out
add wave -noupdate -group top /sim_aurora_lane/rx_status
add wave -noupdate -group top /sim_aurora_lane/rx_valid
add wave -noupdate -group top /sim_aurora_lane/tx_data
add wave -noupdate -group top /sim_aurora_lane/tx_data_s
add wave -noupdate -group top /sim_aurora_lane/tx_data_t
add wave -noupdate -group top /sim_aurora_lane/tx_counter
add wave -noupdate -group top /sim_aurora_lane/cnt
add wave -noupdate -group top /sim_aurora_lane/tx_data_valid
add wave -noupdate -group top -radix unsigned /sim_aurora_lane/u_aurora_rx_lane/sync_cnt
add wave -noupdate -group top /sim_aurora_lane/last_rx_cnt
add wave -noupdate -group top /sim_aurora_lane/curr_rx_cnt
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rst_n_i
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/clk_rx_i
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/clk_serdes_i
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rx_data_i_p
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rx_data_i_n
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rx_polarity_i
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rx_data_o
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rx_header_o
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rx_valid_o
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rx_stat_o
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/c_SLIP_SERDES_MAX
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/c_SERDES8_CYCLE
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/rst
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_idelay_rdy
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data8
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data8_s
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data8_d
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_lock
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data32_shift
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data32
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data32_valid
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes8_cnt
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_cnt
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/gearbox_data66
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/gearbox_data66_valid
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/gearbox_data66_valid_d
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/gearbox_slip
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/scrambled_data66
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/scrambled_data_valid
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/scrambled_data_valid_d
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/descrambled_data
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/descrambled_header
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/descrambled_data_valid
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/sync_cnt
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/valid_cnt
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/rst_i
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/clk_i
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data32_i
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data32_valid_i
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/slip_i
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/buffer194
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_o
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_valid_o
add wave -noupdate -group gbox -radix unsigned /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/gearbox_cnt
add wave -noupdate -group gbox -radix unsigned /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_cnt
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/shift_cnt
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/slip_cnt
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_t
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_t_valid
add wave -noupdate -group gbox -radix unsigned /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/blk_idx_offset
add wave -noupdate -group gbox -radix decimal /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/block_msb_idx
add wave -noupdate -group gbox -radix decimal /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/block_lsb_idx
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_buf
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_buf_empty
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_buf_read
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_buf2
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_buf2_empty
add wave -noupdate -group gbox /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/data66_buf2_read
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/rst_i
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/clk_i
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/gbox_buffer
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/gbox_cnt
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/buffer_dv
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/block_offset
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/buffer
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/headers
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/valid_hdr_cnt
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/valid_hdr_cnt_reg
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/max_cnt_stg1
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/max_cnt_stg1_reg
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/offset_stg1
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/offset_stg1_reg
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/max_cnt_stg2
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/offset_stg2
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/max_cnt_stg3
add wave -noupdate -group sync /sim_aurora_lane/u_aurora_rx_lane/gearbox32to66_cmp/u_block_sync/offset_stg3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {536645268836 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
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
WaveRestoreZoom {536302470132 fs} {541218606836 fs}
