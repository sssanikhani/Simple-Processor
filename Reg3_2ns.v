`timescale 1ns/1ns
module Reg3_2ns(input clk, rst, ld, input [2:0] parIn, output reg [2:0] parOut);
    always @(posedge clk, posedge rst) begin
        #2
        if(rst) parOut = 3'b0;
        else if(ld) parOut = parIn;
        else parOut = parOut;
    end
endmodule