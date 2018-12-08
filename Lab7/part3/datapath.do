vlib work

vlog -timescale 1ns/1ns part3.v

vsim datapath

log {/*}
add wave {/*}

force {clock} 0 0ns, 1 2ns -r 4ns
force {resetn} 0 0ns, 1 3ns
force {counter_enable} 1
force {color_in} 2#111
force {ld_x} 1
force {ld_y} 1
force {ld_color} 1
force {is_erase} 0 0ns, 1 30ns
force {cx_enable} 0 0ns, 1 10ns
force {cy_enable} 0

run 40ns
