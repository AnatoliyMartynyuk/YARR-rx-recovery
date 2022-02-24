onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group top_sim /sim_aurora_channel/rst_n_i
add wave -noupdate -group top_sim /sim_aurora_channel/rst2_n_i
add wave -noupdate -group top_sim /sim_aurora_channel/rst2_p_i
add wave -noupdate -group top_sim /sim_aurora_channel/clk_rx_i
add wave -noupdate -group top_sim /sim_aurora_channel/clk_serdes_i
add wave -noupdate -group top_sim /sim_aurora_channel/clk_ddr_i
add wave -noupdate -group top_sim /sim_aurora_channel/enable_i
add wave -noupdate -group top_sim /sim_aurora_channel/rx_data_i_p
add wave -noupdate -group top_sim /sim_aurora_channel/rx_data_i_n
add wave -noupdate -group top_sim /sim_aurora_channel/trig_tag_i
add wave -noupdate -group top_sim /sim_aurora_channel/rx_data_o
add wave -noupdate -group top_sim /sim_aurora_channel/rx_valid_o
add wave -noupdate -group top_sim /sim_aurora_channel/rx_stat_o
add wave -noupdate -group top_sim /sim_aurora_channel/tx_data
add wave -noupdate -group top_sim /sim_aurora_channel/tx_data_s
add wave -noupdate -group top_sim /sim_aurora_channel/tx_data_t
add wave -noupdate -group top_sim /sim_aurora_channel/tx_counter
add wave -noupdate -group top_sim /sim_aurora_channel/cnt
add wave -noupdate -group top_sim /sim_aurora_channel/clk_idelay
add wave -noupdate -group top_sim /sim_aurora_channel/idelay_rdy
add wave -noupdate -group top_sim /sim_aurora_channel/tx_data_valid
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rst_n_i
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/clk_rx_i
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/clk_serdes_i
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rx_data_i_p
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rx_data_i_n
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rx_polarity_i
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rx_data_o
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rx_header_o
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rx_valid_o
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rx_stat_o
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/c_SLIP_SERDES_MAX
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/c_SERDES8_CYCLE
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/rst
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_phase_adj_en
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_slip
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_idelay_rdy
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data8
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data8_s
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data8_d
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/datain_p
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/datain_n
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data2
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data2_s
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data2_d
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data2_valid
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data2_valid_s
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data2_sel
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_lock
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data32_shift
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data32
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_data32_valid
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes8_cnt
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/serdes_cnt
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/gearbox_data66
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/gearbox_data66_valid
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/gearbox_data66_valid_d
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/gearbox_slip
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/scrambled_data66
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/scrambled_data_valid
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/scrambled_data_valid_d
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/descrambled_data
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/descrambled_header
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/descrambled_data_valid
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/sync_cnt
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/slip_cnt
add wave -noupdate -group Lane /sim_aurora_channel/aurora_cmp/lane_loop(0)/lane_cmp/valid_cnt
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rst_n_i
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/clk_rx_i
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/clk_serdes_i
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/enable_i
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_data_i_p
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_data_i_n
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_polarity_i
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/trig_tag_i
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_active_lanes_i
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_data_o
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_valid_o
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_stat_o
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_data_s
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_valid_s
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_data
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_data_unbonded
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_header
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_header_unbonded
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_status
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_polarity
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_data_valid
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_data_valid_unbonded
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_bond_flag
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_lanes_ready
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_stat
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_dout
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_buf
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_din
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_full
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_empty
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_buf_empty
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_empty_ungated
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_ignore_n
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_autoreg
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_empty_gate
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_buf_rden
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_rden
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_rden_t
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rx_fifo_wren
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/rst_i
add wave -noupdate -expand -group channel /sim_aurora_channel/aurora_cmp/req_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {112964975 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
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
WaveRestoreZoom {0 fs} {4701494676 fs}
