vlib work

vlog -timescale 1ns/1ns poly_function_modified.v

vsim control

log {/*}
add wave {/*}

force {resetn} 0 0ns, 1 2ns
force {clk} 0 0ns, 1 1ns -r 2ns
force {go} 0 0ns, 1 10ns -r 20ns

run 200ns
