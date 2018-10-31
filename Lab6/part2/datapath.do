vlib work

vlog -timescale 1ns/1ns poly_function_modified.v

vsim datapath

log {/*}
add wave {/*}

force {resetn} 0 0ns, 1 2ns
force {clk} 0 0ns, 1 1ns -r 2ns
force {data_in[7:0]} 8#00000001
force {ld_alu_out} 0
force {ld_x} 0
force {ld_a} 1 5ns, 0 10ns
force {ld_b} 1 15ns, 0 20ns
force {ld_c} 0
force {alu_op} 0
force {alu_select_a} 2#00
force {alu_select_b} 2#01

force {ld_r} 1 30ns
run 40ns

force {resetn} 0 0ns, 1 2ns
force {clk} 0 0ns, 1 1ns -r 2ns
force {data_in[7:0]} 8#00000011
force {ld_alu_out} 0
force {ld_x} 0
force {ld_a} 1 5ns, 0 10ns
force {ld_b} 1 15ns, 0 20ns
force {ld_c} 0
force {alu_op} 1
force {alu_select_a} 2#00
force {alu_select_b} 2#01

force {ld_r} 1 30ns
run 40ns
