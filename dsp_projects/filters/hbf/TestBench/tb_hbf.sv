`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2024 08:28:01 AM
// Design Name: 
// Module Name: tb_hbf
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_hbf();
    
    // TEST PARAMETERS

    parameter NOF_INPUT_SAMPLES = 100;
    parameter NOF_OUTPUT_SAMPLES = NOF_INPUT_SAMPLES-FILTER_ORDER;
    
    logic [$clog2(NOF_TEST_VECTORS)-1:0]data_cnt;

    logic clk_out;
    logic rst_out;

    // clock divider signals
    logic [1:0]clk_counter = 0;
    
    // signals for testvectors
    
    string input_tv_file;
    string coeff_tv_file;
    string output_tv_file;
    
    assign input_tv_file = "/home/vinay/Desktop/hardware_projects/dsp_projects/models/HBF_Design/HBF_Design/TV_RX_LPF_17May2024121513/inputStream_1b5.txt"; 
    assign coeff_tv_file = "/home/vinay/Desktop/hardware_projects/dsp_projects/models/HBF_Design/HBF_Design/TV_RX_LPF_17May2024121513/filtCoefs_1b9.txt";
    assign output_tv_file = "/home/vinay/Desktop/hardware_projects/dsp_projects/models/HBF_Design/HBF_Design/TV_RX_LPF_17May2024121513/outputStream_1b7.txt";
    
    logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_samples[NOF_TEST_VECTORS-1:0];
    logic [COEFF_DATA_WIDTH-1:0] coeff_tv [FILTER_ORDER-1:0];
    logic [OUTPUT_SAMPLE_DATA_WIDTH -1 :0] output_samples [NOF_TEST_VECTORS-1:0];
    
    // test_vector 
    logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_sample_tv [NOF_TEST_VECTORS-1:0];
//    logic [COEFF_DATA_WIDTH-1:0] coeff_tv [FILTER_ORDER-1:0];
    logic [OUTPUT_SAMPLE_DATA_WIDTH-1:0] output_sample_data[NOF_OUTPUT_SAMPLES-1:0];



    // module signals
    logic input_valid;
    logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_sample;
    logic [COEFF_DATA_WIDTH-1:0] coeff [FILTER_ORDER-1:0];
    logic [OUTPUT_SAMPLE_DATA_WIDTH-1:0] output_sample;
    logic valid_out;
  // clock logic
    parameter clock_period = 10;


    always begin
      #(clock_period/2) clk_out = ~clk_out;
    end

    initial begin
      clk_out = 0;      
    end
    
    
    // block to load test vectors
    initial begin
        $readmemh(input_tv_file, input_samples);
        $readmemh(coeff_tv_file, coeff_tv);
        $readmemh(output_tv_file,output_samples);
        
    end

    
    // derived clock
    
    always_ff@(posedge clk_out)begin
      clk_counter = clk_counter + 1;
    end

    // TEST Setup
    
    initial begin
        rst_out = 1'b0;
        #100ns;
        rst_out = 1'b1;
//        #100ns;
        
        for(int i = 0; i < FILTER_ORDER; i++)begin
            coeff[i] = coeff_tv[i];
        end
//        for(int i = 0; i < NOF_TEST_VECTORS; i++)begin
//            input_sample_tv[i] = i;
//        end
    end
    
    always_ff@(posedge clk_out)begin
        if(!rst_out)begin
            input_sample <= 0;
            input_valid <= 0;
//            coeff <= '{default:0}; 
            data_cnt <= 0;           
        end else begin
//            coeff <= coeff_tv;
            if( data_cnt <  NOF_TEST_VECTORS)begin
                input_valid <= 1'b1;
                data_cnt <= data_cnt + 1;
                input_sample <= input_samples[data_cnt];                                
            end else begin
                input_valid <= 1'b0;
                data_cnt <= 0;
                input_sample <= 0;                 
            end
        end
    end

// Module instantiations
hbf_top hbf_top_i(
        .clk            (clk_out),
        .filter_clk     (clk_counter[0]),
        .rst_n          (rst_out),
        .input_valid    (input_valid),
        .input_sample   (input_sample),
        .coeff          (coeff),
        .output_sample  (output_sample),
        .valid_out      (valid_out)

    );
//// VIP
//axi_vip_0 axi_vip_0_i(
//  .aclk(clk_out),                      // input wire aclk
//  .aresetn(!rst_out),                // input wire aresetn
//  .m_axi_awid(m_axi_awid),          // output wire [1 : 0] m_axi_awid
//  .m_axi_awaddr(m_axi_awaddr),      // output wire [31 : 0] m_axi_awaddr
//  .m_axi_awlen(m_axi_awlen),        // output wire [7 : 0] m_axi_awlen
//  .m_axi_awsize(m_axi_awsize),      // output wire [2 : 0] m_axi_awsize
//  .m_axi_awburst(m_axi_awburst),    // output wire [1 : 0] m_axi_awburst
//  .m_axi_awlock(m_axi_awlock),      // output wire [0 : 0] m_axi_awlock
//  .m_axi_awprot(m_axi_awprot),      // output wire [2 : 0] m_axi_awprot
//  .m_axi_awregion(m_axi_awregion),  // output wire [3 : 0] m_axi_awregion
//  .m_axi_awqos(m_axi_awqos),        // output wire [3 : 0] m_axi_awqos
//  .m_axi_awvalid(m_axi_awvalid),    // output wire m_axi_awvalid
//  .m_axi_awready(m_axi_awready),    // input wire m_axi_awready
//  .m_axi_wdata(m_axi_wdata),        // output wire [31 : 0] m_axi_wdata
//  .m_axi_wstrb(m_axi_wstrb),        // output wire [3 : 0] m_axi_wstrb
//  .m_axi_wlast(m_axi_wlast),        // output wire m_axi_wlast
//  .m_axi_wvalid(m_axi_wvalid),      // output wire m_axi_wvalid
//  .m_axi_wready(m_axi_wready),      // input wire m_axi_wready
//  .m_axi_bid(m_axi_bid),            // input wire [1 : 0] m_axi_bid
//  .m_axi_bresp(m_axi_bresp),        // input wire [1 : 0] m_axi_bresp
//  .m_axi_bvalid(m_axi_bvalid),      // input wire m_axi_bvalid
//  .m_axi_bready(m_axi_bready),      // output wire m_axi_bready
//  .m_axi_arid(m_axi_arid),          // output wire [1 : 0] m_axi_arid
//  .m_axi_araddr(m_axi_araddr),      // output wire [31 : 0] m_axi_araddr
//  .m_axi_arlen(m_axi_arlen),        // output wire [7 : 0] m_axi_arlen
//  .m_axi_arsize(m_axi_arsize),      // output wire [2 : 0] m_axi_arsize
//  .m_axi_arburst(m_axi_arburst),    // output wire [1 : 0] m_axi_arburst
//  .m_axi_arlock(m_axi_arlock),      // output wire [0 : 0] m_axi_arlock
//  .m_axi_arprot(m_axi_arprot),      // output wire [2 : 0] m_axi_arprot
//  .m_axi_arregion(m_axi_arregion),  // output wire [3 : 0] m_axi_arregion
//  .m_axi_arqos(m_axi_arqos),        // output wire [3 : 0] m_axi_arqos
//  .m_axi_arvalid(m_axi_arvalid),    // output wire m_axi_arvalid
//  .m_axi_arready(m_axi_arready),    // input wire m_axi_arready
//  .m_axi_rid(m_axi_rid),            // input wire [1 : 0] m_axi_rid
//  .m_axi_rdata(m_axi_rdata),        // input wire [31 : 0] m_axi_rdata
//  .m_axi_rresp(m_axi_rresp),        // input wire [1 : 0] m_axi_rresp
//  .m_axi_rlast(m_axi_rlast),        // input wire m_axi_rlast
//  .m_axi_rvalid(m_axi_rvalid),      // input wire m_axi_rvalid
//  .m_axi_rready(m_axi_rready)      // output wire m_axi_rready
//);


// clock vip
//clk_vip_0 clk_vip_0_i(
//  .clk_out(clk_out)  // output wire clk_out
//);

//// reset vip
//rst_vip_0 rst_vip_0_i (
//  .rst_out(rst_out)  // output wire rst_out
//);

endmodule
