`timescale 1ns/1ns
module mux5bit(input [4:0] in0, in1, input s, output reg [4:0] out);
    always @(in0, in1, s) begin
        out = 0;
        if(s) out = in1;
        else out = in0;
    end
endmodule