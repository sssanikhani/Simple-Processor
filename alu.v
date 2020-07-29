`timescale 1ns/1ns
module alu(input [31:0] in1, in2, input [2:0] aluOpp, output reg [31:0] out);
    reg [31:0] twoscomp;
    always @(in1, in2, aluOpp) begin
        out = 32'b0;
        if(aluOpp == 3'b0) out = in1 + in2;
        else if(aluOpp == 3'b001) begin
            twoscomp = ~in2 + 32'b00000000000000000000000000000001;
            out = in1 + twoscomp;
        end
        else if(aluOpp == 3'b010) out = in1 & in2;
        else if(aluOpp == 3'b011) out = in1 | in2;
        else if(aluOpp == 3'b100) begin
            if (in1[31] == in2[31]) begin
                if(in1 < in2) out = 32'b00000000000000000000000000000001;
                else out = 32'b0;
            end
            else if(in1[31] == 1) out = 32'b00000000000000000000000000000001;
            else out = 32'b0;
        end
    end
endmodule