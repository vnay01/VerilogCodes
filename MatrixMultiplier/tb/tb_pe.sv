/*
*
	Engineer : Vinay Singh
	Module   : tb_pe
	Description: Stand-alone testbench for simulating processing engine.
		     
	*
	* */

module tb_pe;

  // Parameters for the testbench
  localparam INPUT_DATA_WIDTH = 8;
  localparam OUTPUT_DATA_WIDTH = 32;
  localparam NUM_TEST_VECTORS = 10000;  // 10k test vectors

  // Testbench signals
  logic clk;
  logic rst_n;
  logic enable;
  logic [INPUT_DATA_WIDTH-1:0] a;
  logic [INPUT_DATA_WIDTH-1:0] b;
  logic [OUTPUT_DATA_WIDTH-1:0] c;
  logic [INPUT_DATA_WIDTH-1:0] a_out;
  logic [INPUT_DATA_WIDTH-1:0] b_out;

  // Instantiate the PE module
  pe #(INPUT_DATA_WIDTH, OUTPUT_DATA_WIDTH) uut (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .a(a),
    .b(b),
    .accum_out(c),
    .a_out(a_out),
    .b_out(b_out)
  );

  // Clock generation (period = 10ns)
  always begin
    #5 clk = ~clk;
  end

  // Generate random test vectors
  integer i;
  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    enable = 0;
    a = 0;
    b = 0;

    // Apply reset
    $display("Applying reset...");
    #15 rst_n = 1;

    // Test case generation loop for 1 million test vectors
    $display("Generating %d test vectors...", NUM_TEST_VECTORS);
    for (i = 0; i < NUM_TEST_VECTORS; i = i + 1) begin
      // Randomize the inputs
      a = $random & (2**INPUT_DATA_WIDTH - 1);  // Mask to 8 bits
      b = $random & (2**INPUT_DATA_WIDTH - 1);  // Mask to 8 bits
      enable = 1;  // Enable the PE

      // Apply the inputs to the DUT
      #10;

      // Display results every 10000 iterations for debugging purposes
      if (i % 10 == 0) begin
        $display("Test vector %0d: a = %d, b = %d, c = %d, a_out = %d, b_out = %d", 
                 i, a, b, c, a_out, b_out);
      end
    end

    // End the simulation after processing 1 million test vectors
    $display("Completed %d test vectors.", NUM_TEST_VECTORS);
    $finish;
  end

  // Monitor signals for debugging
  initial begin
    $monitor("At time %t: clk = %b, rst_n = %b, enable = %b, a = %d, b = %d, c = %d, a_out = %d, b_out = %d", 
             $time, clk, rst_n, enable, a, b, c, a_out, b_out);
  end

endmodule
