vlib work

vlog -timescale 1ns/1ns sequence_detector.v

vsim sequence_detector

log {/*}
add wave {/*}
force {SW[0]} 0 0ns, 1 3ns, 0 20ns, 1 23ns
force {KEY[0]} 0 0ns, 1 1ns -r 2ns
force {SW[1]} 0 0ns, 1 5ns

run 40ns

# force {SW[0]} 0 0ns, 1 6ns
# force {KEY[0]} 0 0ns, 1 2ns -r 4ns
# force {SW[1]} 0 0ns, 1 10ns, 0 14ns, 1 16ns
#
# run 40ns
