// Data Flow model of a 2 to 4 line decoder
// Data Flow modelling allows us to describe a circuit in terms of 
// its function rather than its structure.
// Verilog code below
module decoder_2to4(output [0:3]D, input A,B,E);
// refer Truth Table for a 2 to 4 Line decoder for bit combination which translate to a particular output.
  assign D[0]= ~(~A&~B&~E),
         D[1]= ~(~A&B&~E),  
         D[2]= ~(A&~B&~E),
         D[3]= ~(A&B&~E);
endmodule
