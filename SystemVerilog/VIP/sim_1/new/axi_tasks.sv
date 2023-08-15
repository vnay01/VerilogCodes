// AXI VIP agent tasks
       // axi_mst_agent_t is in this package


package axi_tasks_pkg;
import axi_vip_pkg::*;
import AXI_param_pkg::*;
import axi_vip_master_pkg::*;


task create_agent;
    axi_mst_agent_t axi_mst_agent;
    axi_mst_agent = new("axi_mst_agent", axi_mst.inst.IF);
    axi_mst_agent.start_master();


task axi_write (
    input  axi_addr_t  addr,
    input  axi_len_t   len = 1,
    input  axi_size_t  size = AXI_SIZE_4B,
    input  axi_burst_t burst = AXI_BURST_INCR,
    input  axi_data_t  data [],
    output axi_resp_t  resp []
);
    logic [(4096/(AXI_DATA_W/8))-1:0][AXI_DATA_W-1:0] wdata; // 4096 bytes is a Xilinx AXI VIP data size
    axi_vip_pkg::xil_axi_resp_t wresp;

    for (int i=0; i<=len; i++) begin
        wdata[i] = data[i];
    end

    axi_mst_agent.AXI4_WRITE_BURST(
        .id     ('0),
        .addr   (axi_vip_pkg::xil_axi_ulong'(addr)),
        .len    (axi_vip_pkg::xil_axi_len_t'(len)),
        .size   (axi_vip_pkg::xil_axi_size_t'(size)),
        .burst  (axi_vip_pkg::xil_axi_burst_t'(burst)),
        .lock   (axi_vip_pkg::xil_axi_lock_t'('0)),
        .cache  ('0),
        .prot   ('0),
        .region ('0),
        .qos    ('0),
        .awuser ('0),
        .data   (wdata),
        .wuser  ('0),
        .resp   (wresp)
    );
    resp = new[1];
    resp[0] = axi_resp_t'(wresp);
endtask

endtask


endpackage