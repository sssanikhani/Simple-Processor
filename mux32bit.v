`timescale 1ns/1ns
module mux32bit(input [31:0] in0, in1, input s, output reg [31:0] out);
    always @(in0, in1, s) begin
        out = 0;
        if(s) out = in1;
        else out = in0;
    end
endmodule