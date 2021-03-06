`timescale 1ns/1ns
module PipeTB();

    reg clk, rst;

    PipeLine MipsPipe(clk, rst);
    // 1st Test: MEM2000 ---> 00000000000000011110100001111100  : 125052
    
    // 2nd Test: MEM2004 ---> 00000000000000000000000000010001  : 17
    //           MEM2000 ---> 00000000000011110000000000001000  : 983048

    initial begin
        #10 rst = 0; clk = 0; #10 rst = 1; #10 rst = 0;
        repeat (1000) begin
            #20 clk = 1; #20 clk = 0;
        end
    end

endmodule