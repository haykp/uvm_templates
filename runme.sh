# Usage: env UVM_DIR=<Path_to_this_folder>  UVM_HOME=/path/to/uvm-1.2 ./runme.sh

xrun \
    -f ./tb/scripts/tb_files.f \
    dut/pll_model.sv \
    tb/comp1_top.sv \
    -sv -uvm -uvmhome $UVM_HOME \
    -vtimescale "1 ns / 1 ps" \
    +UVM_TESTNAME=env1_base_test \
    +access+rwc -gui \
    $@


#-parseinfo include -messages \

