//`include "/home/vnay01/Desktop/Vivado_projects/test_bench_structure/test_project_VIP/test_project_VIP.srcs/sim_1/new/axi_tasks.sv"
`include "/home/vnay01/Desktop/Vivado_projects/test_bench_structure/test_project_VIP/test_project_VIP.srcs/sim_1/new/testcases.sv"
`include "/home/vnay01/Desktop/Vivado_projects/test_bench_structure/test_project_VIP/test_project_VIP.srcs/sim_1/new/AXI_param_pkg.sv"


module tb;
import AXI_param_pkg::*;            // AXI parameters
import testcase_pkg::*;


//------------------------------------------------------------------------------
// AXI clock, reset and interface signals
//------------------------------------------------------------------------------
bit aclk;
always #10 aclk = ~aclk;

bit aresetn;
initial begin
    repeat (20) @(negedge aclk);
    aresetn = 1'b1;
end


//------------------------------------------------------------------------------
// AXI VIP Master
//------------------------------------------------------------------------------
axi_vip_master axi_mst (
    .aclk           (aclk),
    .aresetn        (aresetn),
    .m_axi_awaddr   (axi_awaddr),
    .m_axi_awlen    (axi_awlen),
    .m_axi_awsize   (axi_awsize[0+:$bits(axi_awsize)]),
    .m_axi_awburst  (axi_awburst[0+:$bits(axi_awburst)]),
    .m_axi_awlock   (axi_awlock),
    .m_axi_awcache  (axi_awcache),
    .m_axi_awprot   (axi_awprot),
    .m_axi_awregion (axi_awregion),
    .m_axi_awqos    (axi_awqos),
    .m_axi_awvalid  (axi_awvalid),
    .m_axi_awready  (axi_awready),
    .m_axi_wdata    (axi_wdata),
    .m_axi_wstrb    (axi_wstrb),
    .m_axi_wlast    (axi_wlast),
    .m_axi_wvalid   (axi_wvalid),
    .m_axi_wready   (axi_wready),
    .m_axi_bresp    (axi_bresp),
    .m_axi_bvalid   (axi_bvalid),
    .m_axi_bready   (axi_bready),
    .m_axi_araddr   (axi_araddr),
    .m_axi_arlen    (axi_arlen),
    .m_axi_arsize   (axi_arsize[0+:$bits(axi_arsize)]),
    .m_axi_arburst  (axi_arburst[0+:$bits(axi_arburst)]),
    .m_axi_arlock   (axi_arlock),
    .m_axi_arcache  (axi_arcache),
    .m_axi_arprot   (axi_arprot),
    .m_axi_arregion (axi_arregion),
    .m_axi_arqos    (axi_arqos),
    .m_axi_arvalid  (axi_arvalid),
    .m_axi_arready  (axi_arready),
    .m_axi_rdata    (axi_rdata),
    .m_axi_rresp    (axi_rresp),
    .m_axi_rlast    (axi_rlast),
    .m_axi_rvalid   (axi_rvalid),
    .m_axi_rready   (axi_rready)
);

// moved to axi_tasks.sv
// This cannot be moved to a different file. Leads to issues in access to VIP methods

 
axi_mst_agent_t axi_mst_agent;              // this is in axi_vip_master_pkg


initial begin
    axi_mst_agent = new("axi_mst_agent", axi_mst.inst.IF);
    axi_mst_agent.start_master();
end

// initial create_agent;


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

// write agent . This cannot be separated from the file where agent has been created ( module instantiation )
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

task axi_read (
    input  axi_addr_t  addr,
    input  axi_len_t   len = 0,
    input  axi_size_t  size = AXI_SIZE_4B,
    input  axi_burst_t burst = AXI_BURST_INCR,
    output axi_data_t  data [],
    output axi_resp_t  resp []
);
    bit [4096/(AXI_DATA_W/8)-1:0][AXI_DATA_W-1:0] data_o; // 4096 bytes is a Xilinx AXI VIP data size
    axi_vip_pkg::xil_axi_resp_t [255:0] resp_o; // 256 responses is a Xilinx AXI VIP parameter
    axi_vip_pkg::xil_axi_data_beat [255:0] ruser_o;
    axi_mst_agent.AXI4_READ_BURST(
        .id     (0),
        .addr   (axi_vip_pkg::xil_axi_ulong'(addr)),
        .len    (axi_vip_pkg::xil_axi_len_t'(len)),
        .size   (axi_vip_pkg::xil_axi_size_t'(size)),
        .burst  (axi_vip_pkg::xil_axi_burst_t'(burst)),
        .lock   (axi_vip_pkg::xil_axi_lock_t'(0)),
        .cache  (0),
        .prot   (0),
        .region (0),
        .qos    (0),
        .aruser (0),
        .data   (data_o),
        .resp   (resp_o),
        .ruser  (ruser_o)
    );
    data = new[len+1];
    resp = new[len+1];
    for (int i=0; i<=len; i++) begin
        data[i] = data_o[i];
        resp[i] = axi_resp_t'(resp_o[i]);
    end;
endtask

//------------------------------------------------------------------------------
// DUT
//------------------------------------------------------------------------------
localparam RAM_ADDR_W = 12;

axi_ram #(
    .DATA_WIDTH (AXI_DATA_W),
    .ADDR_WIDTH (RAM_ADDR_W),
    .STRB_WIDTH (AXI_STRB_W)
) dut (
    .clk            (aclk),
    .rst            (~aresetn),
    .s_axi_awid     ('0),
    .s_axi_awaddr   (axi_awaddr[RAM_ADDR_W-1:0]),
    .s_axi_awlen    (axi_awlen),
    .s_axi_awsize   (axi_awsize),
    .s_axi_awburst  (axi_awburst),
    .s_axi_awlock   (axi_awlock),
    .s_axi_awcache  (axi_awcache),
    .s_axi_awprot   (axi_awprot),
    .s_axi_awvalid  (axi_awvalid),
    .s_axi_awready  (axi_awready),
    .s_axi_wdata    (axi_wdata),
    .s_axi_wstrb    (axi_wstrb),
    .s_axi_wlast    (axi_wlast),
    .s_axi_wvalid   (axi_wvalid),
    .s_axi_wready   (axi_wready),
    .s_axi_bid      (),
    .s_axi_bresp    (axi_bresp[0+:$bits(axi_bresp)]),
    .s_axi_bvalid   (axi_bvalid),
    .s_axi_bready   (axi_bready),
    .s_axi_arid     (),
    .s_axi_araddr   (axi_araddr[RAM_ADDR_W-1:0]),
    .s_axi_arlen    (axi_arlen),
    .s_axi_arsize   (axi_arsize),
    .s_axi_arburst  (axi_arburst),
    .s_axi_arlock   (axi_arlock),
    .s_axi_arcache  (axi_arcache),
    .s_axi_arprot   (axi_arprot),
    .s_axi_arvalid  (axi_arvalid),
    .s_axi_arready  (axi_arready),
    .s_axi_rid      (),
    .s_axi_rdata    (axi_rdata),
    .s_axi_rresp    (axi_rresp[0+:$bits(axi_rresp)]),
    .s_axi_rlast    (axi_rlast),
    .s_axi_rvalid   (axi_rvalid),
    .s_axi_rready   (axi_rready)
);

//-------------------------------------------------------------------
// Testbench body
//-------------------------------------------------------------------
initial begin : tb_main
    axi_data_t  data [];
    axi_resp_t  resp [];
    axi_addr_t agent_addr;

    wait(aresetn);
    repeat(3) @(posedge aclk);

    $display("Do write...");
    data = new[3];
    data = {32'hdeadbeef, 32'hc0decafe, 32'hbabeb00b};
    axi_write(.addr('h100), .len(data.size()-1), .data(data), .resp(resp));

    $display("Do read...");
    axi_read(.addr('h100), .len(2), .data(data), .resp(resp));
    foreach(data[i])
        $display("\t%0d: data=0x%08x, resp=%0s", i, data[i], resp[i].name());
    
    #100ns
    testcase_1(.t_data(data),.t_addr(agent_addr));
    #10us;
    $stop;
end

endmodule


/* // Moved to AXI_param_pkg.sv file
//------------------------------------------------------------------------------
// AXI parameters and types
//------------------------------------------------------------------------------
typedef axi_vip_master_pkg::axi_vip_master_mst_t axi_mst_agent_t;

localparam AXI_ADDR_W   = axi_vip_master_pkg::axi_vip_master_VIP_ADDR_WIDTH;
localparam AXI_DATA_W   = axi_vip_master_pkg::axi_vip_master_VIP_DATA_WIDTH;
localparam AXI_STRB_W   = AXI_DATA_W / 8;
localparam AXI_BURST_W  = 2;
localparam AXI_CACHE_W  = 4;
localparam AXI_PROT_W   = 3;
localparam AXI_REGION_W = 4;
localparam AXI_USER_W   = 4;
localparam AXI_QOS_W    = 4;
localparam AXI_LEN_W    = 8;
localparam AXI_SIZE_W   = 3;
localparam AXI_RESP_W   = 2;

localparam AXI_BEATS_MAX = 2**AXI_LEN_W;

typedef logic [AXI_ADDR_W-1:0]   axi_addr_t;
typedef logic [AXI_DATA_W-1:0]   axi_data_t;
typedef logic [AXI_STRB_W-1:0]   axi_strb_t;
typedef logic [AXI_LEN_W-1:0]    axi_len_t;
typedef logic [AXI_CACHE_W-1:0]  axi_cache_t;
typedef logic [AXI_PROT_W-1:0]   axi_prot_t;
typedef logic [AXI_REGION_W-1:0] axi_region_t;
typedef logic [AXI_QOS_W-1:0]    axi_qos_t;

typedef enum logic [AXI_BURST_W-1:0] {
    AXI_BURST_FIXED = 2'b00,
    AXI_BURST_INCR  = 2'b01,
    AXI_BURST_WRAP  = 2'b10,
    AXI_BURST_RSVD  = 2'b11
} axi_burst_t;

typedef enum logic [AXI_RESP_W-1:0] {
    AXI_RESP_OKAY   = 2'b00,
    AXI_RESP_EXOKAY = 2'b01,
    AXI_RESP_SLVERR = 2'b10,
    AXI_RESP_DECERR = 2'b11
} axi_resp_t;

typedef enum logic [AXI_SIZE_W-1:0] {
    AXI_SIZE_1B    = 3'b000,
    AXI_SIZE_2B    = 3'b001,
    AXI_SIZE_4B    = 3'b010,
    AXI_SIZE_8B    = 3'b011,
    AXI_SIZE_16B   = 3'b100,
    AXI_SIZE_32B   = 3'b101,
    AXI_SIZE_64B   = 3'b110,
    AXI_SIZE_128B  = 3'b111
} axi_size_t;
*/
