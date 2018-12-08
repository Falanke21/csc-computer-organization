vlib work

vlog -timescale 1ns/1ns part2.v

vsim control

log {/*}
add wave {/*}

force {clock} 0 0ns, 1 2ns -r 4ns

force {resetn} 0 0ns, 1 3ns
force {go} 0 0ns, 1 10ns, 0 30ns
force {x_enable} 0 0ns, 1 5ns, 0 10ns

run 40ns
