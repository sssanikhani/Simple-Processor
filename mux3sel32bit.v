`timescale 1ns/1ns
module mux3sel32bit(input [31:0] in0, in1, in2, input [1:0] s, output reg [31:0] out);
    
    always @(in0, in1, in2, s) begin
        out = 32'b0;
        case(s)
            2'b0: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            default: out = 32'b0;
        endcase
    end

endmodule