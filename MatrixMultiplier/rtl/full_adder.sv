/* A simple full adder module */
module full_adder(
    input [7:0] a,
    input [7:0] b,
    output [7:0] sum,
    output overflow
  );
    assign {overflow, sum} = a + b;
endmodule
  