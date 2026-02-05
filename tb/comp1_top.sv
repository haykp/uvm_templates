
module comp1_top;

    `include "uvm_macros.svh"
    import uvm_pkg::*;
    import comp1_env1_test_pkg::*;
  
    comp1_env1_tb_if    tb_if();

    pll_model dut (
        .clk(tb_if.clk),
        .reset_n(tb_if.reset_n),
    
        .valid(tb_if.agent_if.valid),
        .ready(tb_if.agent_if.ready),
        .err(tb_if.agent_if.err),
    
        .write(tb_if.agent_if.write),
        
        .data_rd(tb_if.agent_if.data_rd),
        .data_wr(tb_if.agent_if.data_wr)
    );
    
    initial begin
      $timeformat(-9, 3, "ns", 10);
      uvm_config_db#(virtual comp1_env1_tb_if)::set(null, "", "ENV1_VIF::", tb_if);
      run_test();
    end
    
    // ut_del_pragma_begin
    initial begin
    	$dumpfile("dump.vcd"); 
      $dumpvars;
    end
    // ut_del_pragma_end

  endmodule
  
  