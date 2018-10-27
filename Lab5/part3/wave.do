vlib work

vlog -timescale 1ns/1ns morse_encoder.v

vsim morse

log {/*}
add wave {/*}
force {rate} 0;
force {key[2: 0]} 2#000 0ns, 2#001 100ns, 2#010 200ns
force {start} 0 0ns, 1 20ns -r 40ns
force {clk} 0 0ps, 1 1ns -r 2ns
force {asr_n} 0 0ns, 1 5ns, 0 95ns, 1 100ns, 0 205ns, 1 210ns
run 300ns
