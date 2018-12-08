vlib work

vlog -timescale 1ns/1ns part2.v

vsim together

log {/*}
add wave {/*}

force {clock} 0 0ns, 1 2ns -r 4ns
force {resetn} 0 0ns, 1 3ns

force {x_enable} 0 0ns, 1 10ns, 0 14ns
force {go} 0 0ns, 1 20ns
force {input_color} 2#000 0ns, 2#111 5ns
force {position} 2#1111110

run 40ns
