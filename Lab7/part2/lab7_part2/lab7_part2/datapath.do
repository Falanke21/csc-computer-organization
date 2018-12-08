vlib work

vlog -timescale 1ns/1ns part2.v

vsim datapath

log {/*}
add wave {/*}

force {clock} 0 0ns, 1 2ns -r 4ns

force {counter_enable} 0 0ns
force {data_in} 2#0000001 0ns, 2#1111111 14ns
force {ld_x} 0 0ns, 1 5ns, 0 10ns
force {ld_y} 0 0ns, 1 15ns
force {ld_color} 0 0ns, 1 15ns
force {color_in} 2#000 0ns, 2#111 15ns
force {resetn} 0 0ns, 1 3ns

run 30ns

force {counter_enable} 1 0ns
force {data_in} 2#0000001 0ns
force {ld_x} 0 0ns, 1 5ns, 0 10ns
force {ld_y} 0 0ns, 1 15ns
force {ld_color} 0 0ns, 1 15ns
force {color_in} 2#000 0ns, 2#111 15ns
force {resetn} 0 0ns, 1 3ns

run 30ns
