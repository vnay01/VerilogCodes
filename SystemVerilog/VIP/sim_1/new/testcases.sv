// testcases separated as tasks
package testcase_pkg;
import AXI_param_pkg::*;

task testcase_1(output axi_data_t t_data [], output axi_addr_t t_addr);

    $display("Running testcase number 1.");
    t_data = new[1];
    t_data = {32'hbabecafe};
    
    t_addr = 'h100; 

endtask

endpackage