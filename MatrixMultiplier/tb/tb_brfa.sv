`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 08:56:22 PM
// Design Name: 
// Module Name: tb_brfa
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


`timescale 1ns / 1ps

module tb_brfa;
    
    parameter DATA_WIDTH = 32;
    parameter REG_FILE_DEPTH = 8;
    parameter BYTE_WIDTH = DATA_WIDTH / 4;  // One byte width

    logic clk;
    logic rst_n;
    logic load_en;
    logic [REG_FILE_DEPTH-1:0] read_en;
    logic [DATA_WIDTH-1:0] data_in [REG_FILE_DEPTH-1:0];
    logic [DATA_WIDTH/4-1:0] data_out [REG_FILE_DEPTH-1:0];

    // Reference model
    logic [DATA_WIDTH-1:0] ref_register_bank [REG_FILE_DEPTH-1:0];

    // Instantiate DUT
    boundary_register_file #(
        .DATA_WIDTH(DATA_WIDTH),
        .REG_FILE_DEPTH(REG_FILE_DEPTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .load_en(load_en),
        .read_en(read_en),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    // Clock Generation
    always #5 clk = ~clk;
    
    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;
        load_en = 0;
        read_en = 0;
        
        for (int i = 0; i < REG_FILE_DEPTH; i++) begin
            data_in[i] = 0;
            ref_register_bank[i] = 0;
        end

        // Reset the DUT
        #10 rst_n = 1;
        
        #10;
        // **Multiple Randomized Load Cycles**
        repeat (5) begin
            load_en = 1;
            for (int i = 0; i < REG_FILE_DEPTH; i++) begin
                if ($random % 2) begin // Randomly decide which registers to load
                    data_in[i] = $random;
                    ref_register_bank[i] = data_in[i]; // Store expected value
                end
            end
            #10 load_en = 0;
            #10;
        end
        
        // **Multiple Randomized Read Cycles**
        repeat (10) begin
            read_en = $random; // Randomly enable reads for different registers
            #10;
        end
        
        // End simulation
        #20 $finish;
    end
    
    // Self-checking mechanism
    always @(posedge clk) begin
        if (|read_en) begin
            for (int i = 0; i < REG_FILE_DEPTH; i++) begin
                if (read_en[i]) begin
                    logic [BYTE_WIDTH-1:0] expected_data_out = ref_register_bank[i][BYTE_WIDTH-1:0];

                    if (data_out[i] !== expected_data_out) begin
                        $error("Mismatch at time %t | Register %0d: Expected = %h, Got = %h", 
                               $time, i, expected_data_out, data_out[i]);
                    end else begin
                        $display("Time %t | Register %0d Read Correct: Data Out = %h", 
                                 $time, i, data_out[i]);
                    end
                    
                    // Shift expected data in reference model
                    ref_register_bank[i] = ref_register_bank[i] >> BYTE_WIDTH;
                end
            end
        end
    end
        
endmodule
