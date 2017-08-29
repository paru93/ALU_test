onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group alu_tb /alu_tb/reset
add wave -noupdate -group alu_tb /alu_tb/clk_100
add wave -noupdate -group alu_tb /alu_tb/debug
add wave -noupdate -group alu_tb /alu_tb/pc
add wave -noupdate -group alu_tb /alu_tb/cnt
add wave -noupdate -group alu_tb /alu_tb/xfer
add wave -noupdate -group alu_tb /alu_tb/dec_data_in
add wave -noupdate -group alu_tb /alu_tb/dec_valid_in
add wave -noupdate -group alu_tb /alu_tb/dec_rdy_out
add wave -noupdate -group alu_tb /alu_tb/dm_rdy
add wave -noupdate -group alu_tb /alu_tb/dm_valid
add wave -noupdate -group alu_tb /alu_tb/dm_data
add wave -noupdate -group alu_tb /alu_tb/mdc_rdy
add wave -noupdate -group alu_tb /alu_tb/mdc_valid
add wave -noupdate -group alu_tb /alu_tb/mdc_data
add wave -noupdate -group alu_tb /alu_tb/program_memory
add wave -noupdate -group alu_tb /alu_tb/i_str
add wave -noupdate -group alu_tb /alu_tb/pc_str
add wave -noupdate -group DEC /alu_tb/DEC/clk_in
add wave -noupdate -group DEC /alu_tb/DEC/reset_in
add wave -noupdate -group DEC /alu_tb/DEC/data_in
add wave -noupdate -group DEC /alu_tb/DEC/valid_in
add wave -noupdate -group DEC /alu_tb/DEC/rdy_out
add wave -noupdate -group DEC /alu_tb/DEC/data_out
add wave -noupdate -group DEC /alu_tb/DEC/valid_out
add wave -noupdate -group DEC /alu_tb/DEC/rdy_in
add wave -noupdate -group DEC /alu_tb/DEC/trap
add wave -noupdate -group DEC /alu_tb/DEC/xfer_in
add wave -noupdate -group DEC /alu_tb/DEC/xfer_out
add wave -noupdate -group DEC /alu_tb/DEC/full
add wave -noupdate -group DEC /alu_tb/DEC/ui
add wave -noupdate -group DEC /alu_tb/DEC/dd
add wave -noupdate -group DEC /alu_tb/DEC/dd_out
add wave -noupdate -group DEC /alu_tb/DEC/i
add wave -noupdate -group DEC /alu_tb/DEC/s_imm
add wave -noupdate -group DEC /alu_tb/DEC/i_imm
add wave -noupdate -group DEC /alu_tb/DEC/b_imm
add wave -noupdate -group DEC /alu_tb/DEC/u_imm
add wave -noupdate -group DEC /alu_tb/DEC/funct7
add wave -noupdate -expand -group Micro /alu_tb/micro/clk_in
add wave -noupdate -expand -group Micro /alu_tb/micro/reset_in
add wave -noupdate -expand -group Micro /alu_tb/micro/data_in
add wave -noupdate -expand -group Micro /alu_tb/micro/valid_in
add wave -noupdate -expand -group Micro /alu_tb/micro/rdy_out
add wave -noupdate -expand -group Micro /alu_tb/micro/data_out
add wave -noupdate -expand -group Micro /alu_tb/micro/valid_out
add wave -noupdate -expand -group Micro /alu_tb/micro/rdy_in
add wave -noupdate -expand -group Micro /alu_tb/micro/rom
add wave -noupdate -expand -group Micro /alu_tb/micro/m_state
add wave -noupdate -expand -group Micro /alu_tb/micro/m_next
add wave -noupdate -expand -group Micro /alu_tb/micro/mpc
add wave -noupdate -expand -group Micro /alu_tb/micro/mpc_next
add wave -noupdate -expand -group Micro /alu_tb/micro/full
add wave -noupdate -expand -group Micro /alu_tb/micro/f_wr
add wave -noupdate -expand -group Micro /alu_tb/micro/micro_data
add wave -noupdate -expand -group Micro /alu_tb/micro/reg_data
add wave -noupdate -expand -group Micro /alu_tb/micro/mdc_data
add wave -noupdate -expand -group Micro /alu_tb/micro/mrom_addr
add wave -noupdate -expand -group Micro /alu_tb/micro/dd
add wave -noupdate -expand -group Micro /alu_tb/micro/ipd
add wave -noupdate -expand -group Micro /alu_tb/micro/xfer_in
add wave -noupdate -expand -group Micro /alu_tb/micro/xfer_out
add wave -noupdate -expand -group Micro /alu_tb/micro/mdone
add wave -noupdate -expand -group Micro /alu_tb/micro/mrx
add wave -noupdate -expand -group Micro /alu_tb/micro/mry
add wave -noupdate -expand -group Micro /alu_tb/micro/mreg_wr
add wave -noupdate -expand -group Micro /alu_tb/micro/mreg_wr_data
add wave -noupdate -expand -group Micro /alu_tb/micro/mz
add wave -noupdate -expand -group Micro /alu_tb/micro/mz_next
add wave -noupdate -expand -group Micro /alu_tb/micro/mop
add wave -noupdate -expand -group Micro /alu_tb/micro/error_marker
add wave -noupdate -expand -group Micro /alu_tb/micro/i_str
add wave -noupdate -expand -group Micro /alu_tb/micro/pc_str
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {29880 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
configure wave -valuecolwidth 84
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {62318 ps}
