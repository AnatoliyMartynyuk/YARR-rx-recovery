onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sim_gearbox/clk_i
add wave -noupdate /sim_gearbox/rst_i
add wave -noupdate /sim_gearbox/data32_i
add wave -noupdate /sim_gearbox/data32_valid_i
add wave -noupdate /sim_gearbox/slip_i
add wave -noupdate /sim_gearbox/data66_o
add wave -noupdate /sim_gearbox/data66_valid_o
add wave -noupdate -radix decimal /sim_gearbox/one_position
add wave -noupdate /sim_gearbox/u_gearbox32to66/buffer128
add wave -noupdate /sim_gearbox/u_gearbox32to66/gearbox_cnt
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_cnt
add wave -noupdate /sim_gearbox/u_gearbox32to66/shift_cnt
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_t
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_t_valid
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_buf
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_buf_empty
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_buf_read
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_buf2
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_buf2_empty
add wave -noupdate /sim_gearbox/u_gearbox32to66/data66_buf2_read
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28881971 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 255
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
WaveRestoreZoom {0 fs} {443659164 fs}
