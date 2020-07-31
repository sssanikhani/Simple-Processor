`timescale 1ns/1ns
module mux3sel32bit(input [31:0] in0, in1, in2, input [1:0] s, output [31:0] out);

    wire [31:0] firstOut;
    
    mux32bit first(in0, in1, s[0], firstOut);
    mux32bit sec(firstOut, in2, s[1], out);

endmodule