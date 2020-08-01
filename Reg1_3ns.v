`timescale 1ns/1ns
module Reg1_3ns(input clk, rst, ld, input  in, output reg out);
    always @(posedge clk, posedge rst) begin
        #3
        if(rst) out = 1'b0;
        else if(ld) out = in;
        else out = out;
    end
endmodule