onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group top /sim_aurora_lane/rst_n_i
add wave -noupdate -expand -group top /sim_aurora_lane/rst2_n_i
add wave -noupdate -expand -group top /sim_aurora_lane/clk_rx_i
add wave -noupdate -expand -group top /sim_aurora_lane/clk_serdes_i
add wave -noupdate -expand -group top /sim_aurora_lane/clk_ddr_i
add wave -noupdate -expand -group top /sim_aurora_lane/rx_data_i_p
add wave -noupdate -expand -group top /sim_aurora_lane/rx_polarity
add wave -noupdate -expand -group top /sim_aurora_lane/rx_data_out
add wave -noupdate -expand -group top /sim_aurora_lane/rx_header_out
add wave -noupdate -expand -group top /sim_aurora_lane/rx_status
add wave -noupdate -expand -group top /sim_aurora_lane/rx_valid
add wave -noupdate -expand -group top /sim_aurora_lane/tx_data
add wave -noupdate -expand -group top /sim_aurora_lane/tx_data_s
add wave -noupdate -expand -group top /sim_aurora_lane/tx_data_t
add wave -noupdate -expand -group top /sim_aurora_lane/tx_counter
add wave -noupdate -expand -group top /sim_aurora_lane/cnt
add wave -noupdate -expand -group top /sim_aurora_lane/tx_data_valid
add wave -noupdate -expand -group top -radix unsigned /sim_aurora_lane/u_aurora_rx_lane/sync_cnt
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
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_phase_adj_en
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_slip
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_idelay_rdy
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data8
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data8_s
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data8_d
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/datain_p
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/datain_n
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data2
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data2_s
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data2_d
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data2_valid
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data2_valid_s
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/serdes_data2_sel
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
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/slip_cnt
add wave -noupdate -group internal /sim_aurora_lane/u_aurora_rx_lane/valid_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {842005600000 fs} 0}
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
WaveRestoreZoom {840245800 ps} {850745800 ps}
