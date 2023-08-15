
package AXI_param_pkg;
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


/// Signals to connect VIP and BRAM

axi_addr_t   axi_awaddr;
axi_len_t    axi_awlen;
axi_size_t   axi_awsize;
axi_burst_t  axi_awburst;
logic        axi_awlock;
axi_cache_t  axi_awcache;
axi_prot_t   axi_awprot;
axi_region_t axi_awregion;
axi_qos_t    axi_awqos;
logic        axi_awvalid;
logic        axi_awready;
axi_data_t   axi_wdata;
axi_strb_t   axi_wstrb;
logic        axi_wlast;
logic        axi_wvalid;
logic        axi_wready;
axi_resp_t   axi_bresp;
logic        axi_bvalid;
logic        axi_bready;
axi_addr_t   axi_araddr;
axi_len_t    axi_arlen;
axi_size_t   axi_arsize;
axi_burst_t  axi_arburst;
logic        axi_arlock;
axi_cache_t  axi_arcache;
axi_prot_t   axi_arprot;
axi_region_t axi_arregion;
axi_qos_t    axi_arqos;
logic        axi_arvalid;
logic        axi_arready;
axi_data_t   axi_rdata;
axi_resp_t   axi_rresp;
logic        axi_rlast;
logic        axi_rvalid;
logic        axi_rready;

endpackage