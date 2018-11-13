vlib work

vlog -timescale 1ns/1ns ram32x4.v

vsim -L altera_mf_ver ram32x4

log {/*}
add wave {/*}

force {address} 2#00000 0ns, 2#00001 40ns
force {clock} 0 0ns, 1 1ns -r 2ns
force {wren} 0 0ns, 1 10ns -r 40ns
force {data} 2#0000 0ns, 2#0001 10ns, 2#0101 20ns, 2#1111 30ns -r 40ns

run 80ns

force {address} 2#10000 0ns, 2#00011 40ns
force {clock} 0 0ns, 1 1ns -r 2ns
force {wren} 0 0ns, 1 10ns -r 40ns
force {data} 2#0000 0ns, 2#0001 10ns, 2#0101 20ns, 2#1111 30ns -r 40ns

run 80ns

force {address} 2#00000 0ns
force {clock} 0 0ns, 1 1ns -r 2ns

force {data} 2#0000 0ns, 2#0001 10ns, 2#0101 20ns, 2#0000 30ns

run 40ns
