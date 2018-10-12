vlib work

vlog -timescale 1ns/1ns shift_register.v

vsim shift_register

log {/*}
add wave {/*}


force {SW[9]} 0 0, 1 10
force {SW[7: 0]} 10010011 0
# KEY[0] = clk;
force {KEY[0]} 0 0, 1 5 -r 10
# KEY[1] = Load_n;
force {KEY[1]} 0 0, 1 20
# KEY[2] = ShiftRight;
force {KEY[2]} 1 0,0 90
# KEY[3] = ASR
force {KEY[3]} 1 0, 0 50
run 100ns
