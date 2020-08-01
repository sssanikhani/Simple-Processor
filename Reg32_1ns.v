`timescale 1ns/1ns
module Reg32_1ns(input clk, rst, ld, input [31:0] parIn, output reg [31:0] parOut);
    always @(posedge clk, posedge rst) begin
        #1
        if(rst) parOut = 32'b0;
        else if(ld) parOut = parIn;
        else parOut = parOut;
    end
endmodule