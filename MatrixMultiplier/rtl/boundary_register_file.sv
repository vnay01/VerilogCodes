`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 03/13/2025 04:16:21 PM
// Design Name: 
// Module Name: boundary_register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module will act as a template to create boundary register array \ 
//              Boundary register array can be used to feed the systolic array.    
//              Boundary register array structure to look as below :
//              4 Byte x FILE_DEPTH ; where the register file will have a width of 1byte and depth of \
//              FILE_DEPTH  
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*
    Ports :
        Inputs :
            1. clk
            2. rst_n
            3. load_en
            4. unpacked array of size 4bytes x BRFA depth
            5. read_en
        Outputs :
            1. upacked array of size 1 bytes x BRFA depth                  

    Functionality :
        BRFA will act as feeding registers to the processing_engine_array. This module \
        will be placed at the boundary of right_most and top_most processing elements  \
        Each register location of the BRFA can be loaded with 4 bytes. However, the output \
        from BRFA is always a 1 byte word. This output will be available only when the particular \
        register bank is enabled. 
        When enabled BRFA's register array will shift the contents of the register file by 1 byte. \
        A system controller must ensure that correct data is loaded from memory into the registers of BRFA \


*/


module boundary_register_file 
    #(parameter DATA_WIDTH = 32,
      parameter REG_FILE_DEPTH = 8)(
            input logic clk,
            input logic rst_n,
            input logic load_en,            
            input logic [REG_FILE_DEPTH-1:0] read_en,
            input logic [DATA_WIDTH-1:0] data_in [REG_FILE_DEPTH-1:0],
            output logic [DATA_WIDTH/4-1:0] data_out [REG_FILE_DEPTH-1:0] 
    );
    
    
    /* Functionality 
       Each register file index feeds one row/column of the systolic array. \ 
       Since the register file  can hold 4 Bytes of data, the controller will be responsible \
       for loading the correct data into the register array, with minimum read access from memory.
    */
    
    /* Signal declarations */
    logic [DATA_WIDTH-1:0] register_bank [REG_FILE_DEPTH-1:0];
    logic [DATA_WIDTH-1:0] register_bank_nxt [REG_FILE_DEPTH-1:0];
    logic [DATA_WIDTH-1:0] register_bank_shifted [REG_FILE_DEPTH-1:0];
    

    

//    logic [REG_FILE_DEPTH-1:0] read_en;

    always_ff@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            register_bank <= '{default:0};
            register_bank_shifted <= '{default:0};
        end else begin
            register_bank <= register_bank_nxt; 
            for(int i = 0; i < REG_FILE_DEPTH ; i++)begin
                if(read_en[i])begin
                    register_bank_shifted[i] <= register_bank_shifted[i] >> (DATA_WIDTH/4);                     
                end else begin
                    register_bank_shifted[i] <= register_bank[i];                                     
                end
//                data_out[i] <= register_bank_shifted[i][DATA_WIDTH/4-1:0];                
            end              
        end
    end 
    
    always_comb begin
        //defaults
        register_bank_nxt = register_bank;
//        register_bank_shifted = '{default:0};


        // load register array
        if(load_en)begin
            for(int i = 0; i < REG_FILE_DEPTH; i++)begin
                register_bank_nxt[i] = data_in[i];
            end           
        end
        
        // enable shifting of outputs 
//        for(int i = 0; i < REG_FILE_DEPTH ; i++)begin
//            if(read_en[i])begin
//                register_bank_shifted[i] = register_bank[i][DATA_WIDTH-1:DATA_WIDTH];      // logical right shit by 1 byte
//            end
//        end     
    end
    
    
    //Output assignments
    genvar j;
    generate
        for(j=0; j< REG_FILE_DEPTH; j++)begin 
            assign data_out[j] = register_bank_shifted[j][DATA_WIDTH/4-1:0];
        end     
    endgenerate
    
endmodule
