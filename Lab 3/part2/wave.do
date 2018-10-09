# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns rc_adder.v

# Load simulation using mux as the top level simulation module.
vsim rc_adder

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

# First test case
# Set input values using the force command, signal names need to be in {} brackets.

# 00001
force {SW[7:4]} 2#0000
force {SW[3:0]} 2#0001
force {SW[8]} 0
run 10 ns

# 10000
force {SW[7:4]} 2#1111
force {SW[3:0]} 2#0001
force {SW[8]} 0
run 10 ns

#01111
force {SW[7:4]} 2#1010
force {SW[3:0]} 2#0101
force {SW[8]} 0
run 10 ns

#11110
force {SW[7:4]} 2#1111
force {SW[3:0]} 2#1111
force {SW[8]} 0
run 10 ns

#01010
force {SW[7:4]} 2#1001
force {SW[3:0]} 2#0001
force {SW[8]} 0
run 10 ns
