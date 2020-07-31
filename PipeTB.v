`timescale 1ns/1ns
module PipeTB();

    reg clk, rst;
    wire MemToReg;

    PipeLine MipsPipe(clk, rst, MemToReg);
    
    
    initial begin
        #10 rst = 0; clk = 0; #10 rst = 1; #10 rst = 0;
        repeat (1000) begin
            #20 clk = 1; #20 clk = 0;
        end
    end

endmodule