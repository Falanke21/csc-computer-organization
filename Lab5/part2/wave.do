vlib work

vlog -timescale 1ns/1ps counter_fucker.v

vsim counter_fucker

log {/*}
add wave {/*}
force {SW[2]} 1
force {CLOCK_50} 0 0ps, 1 1ps -r 2ps
force {SW[9]} 0 0ps, 1 3ps
force {SW[1:0]} 2#01
run 1000000ns
