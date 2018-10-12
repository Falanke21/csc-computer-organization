vlib work

vlog -timescale 1ns/1ns shift_register.v

vsim shift_register

log {/*}
add wave {/*}
force {SW[9]} 1
force {SW[7: 0]} 2#11111111
force {KEY[3: 0]} 2#0000 0, 2#0010 10, 2#0011 20 -r 30
run 30ns
