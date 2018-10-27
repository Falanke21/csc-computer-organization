vlib work

vlog -timescale 1ns/1ps fre_counter.v

vsim fre_counter

log {/*}
add wave {/*}
force {SW[2]} 1
force {CLOCK_50} 0 0ps, 1 1ps -r 2ps
force {SW[7:4]} 2#0000
force {SW[9]} 0
force {SW[3]} 0 0ps, 1 3ps
force {SW[1:0]} 2#01
run 1000000ns