module full_adder_tb;

    // Testbench signals
    logic [7:0] a, b;
    logic [7:0] sum_dut;
    logic overflow_dut;
    logic [7:0] sum_golden;
    logic overflow_golden;
  
    // Import the C function
    import "DPI-C" function void fullAdder8Bit(
      input byte a,
      input byte b,
      output byte sum,
      output byte overflow
    );
  
    // DUT instantiation (assuming full_adder is the module under test)
    full_adder dut (
      .a(a),
      .b(b),
      .sum(sum_dut),
      .overflow(overflow_dut)
    );
  

    // Coverage points
    int num_passed_tests = 0;
    int num_failed_tests = 0;

    initial begin
      // Testbench stimulus
      bit [7:0] test_vectors_a[5] = '{8'h12, 8'hFF, 8'h00, 8'h80, 8'h45};
      bit [7:0] test_vectors_b[5] = '{8'h34, 8'h01, 8'h00, 8'h80, 8'h32};

      int iterations;         // Number of iterations to run
      int seed = 32'hDEADBEEF;
  
    // Get the number of iterations from the command line arguments
      if (!$value$plusargs("iterations=%d", iterations)) begin
        $display("WARNING: iterations not specified. Using default value of 20.");
        iterations = 20000; // Default number of iterations
      end
      
      
      for (int i = 0; i < iterations; i++) begin
        a = $urandom(seed*2*i)% 256;    // generate 8-bit random number
        b = $urandom(seed*2*i+1)% 256;    // generate 8-bit random number
  
        // Call the C model for golden reference
        fullAdder8Bit(a, b, sum_golden, overflow_golden);
  
        #10; // Wait for DUT response
      
        // Assertions for output comparison
        assert(sum_dut == sum_golden) else begin
          $error("Sum mismatch: a = %h, b = %h | DUT: %h, Golden: %h",
                 a, b, sum_dut, sum_golden);
          num_failed_tests++;
        end
  
        assert(overflow_dut == overflow_golden) else begin
          $error("Overflow mismatch: a = %h, b = %h | DUT: %b, Golden: %b",
                 a, b, overflow_dut, overflow_golden);
          num_failed_tests++;
        end        
  
      // Display message for passing tests
        if (sum_dut == sum_golden && overflow_dut == overflow_golden) begin
          $display("Test Passed: a = %h, b = %h, sum = %h, overflow = %b",
                   a, b, sum_dut, overflow_dut);
          num_passed_tests++;
        end
      end
  
      // Final test summary
      $display("\n======== Test Summary ========");
      $display("Total Tests: %d", num_passed_tests + num_failed_tests);
      $display("Passed Tests: %d", num_passed_tests);
      $display("Failed Tests: %d", num_failed_tests);
      $display("=============================");
      $finish;

    end
  endmodule
  