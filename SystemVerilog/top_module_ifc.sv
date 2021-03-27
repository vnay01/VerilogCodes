// top module with simple arbiter interface
module top;
    bit clk;
    always #50 clk=~clk;
        arb_if  arbif(clk);
        arb_with_ifc a1(arbif);
        test_with_ifc t1(arbif);
        endmodule:top