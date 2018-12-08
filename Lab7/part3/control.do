vlib work

vlog -timescale 1ns/1ns part3.v

vsim control

log {/*}
add wave {/*}

force {clock} 0 0ns, 1 2ns -r 4ns
force {resetn} 0 0ns, 1 3ns

run 500ns
