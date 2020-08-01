`timescale 1ns/1ns
module Rfile(input clk, rst, regWrite, input [4:0] inR1, inR2, writeR, input [31:0] writeRData, output reg [31:0] Rdata1, Rdata2);
    reg [31:0] main [0:31];
    integer i;
    always @(main[0]) main[0] = 32'b0;
    always @(posedge rst, clk, regWrite) begin
        // #1
        if(rst) begin
            Rdata1 = 32'b0;
            Rdata2 = 32'b0;
            for (i = 0; i < 32; i = i + 1) begin
                main[i] = 32'b0;
            end
        end
        else begin
            #2
            if(clk && regWrite) begin
                main[writeR] = writeRData;
            end
        end
    end
    always @(inR1, inR2) begin
        Rdata1 = main[inR1];
        Rdata2 = main[inR2];
    end
endmodule