runme.sh_questa

# Questa/ModelSim simulation script using UVM 1.2
# Usage: env UVM_DIR=<Path_to_this_folder>  UVM_HOME=/path/to/uvm-1.2 ./runme_questa.sh

vlib work

# Compile UVM 1.2 first into work library
vlog -sv \
    +incdir+$UVM_HOME/src \
    $UVM_HOME/src/uvm_pkg.sv \
    +define+UVM_NO_DPI \
    -timescale "1 ns / 1 ps"

# Compile design and testbench
vlog -sv \
    -f ./tb/scripts/tb_files_questa.f \
    dut/stack.sv \
    tb/comp1_top.sv \
    -timescale "1 ns / 1 ps" \
    $@

vsim -c work.comp1_env1_tb \
    +UVM_TESTNAME=env1_base_test \
    -do "run -all; quit -f" \
    $@

# For GUI mode, replace vsim line with:
# vsim work.comp1_env1_tb \
#     +UVM_TESTNAME=env1_base_test \
#     $@


