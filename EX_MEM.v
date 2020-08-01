`timescale 1ns/1ns
module EX_MEM(input clk, rst, wb_MemToReg_in, wb_RegWrite_in, MemRead_in, MemWrite_in, 
                input [31:0] ALURes_in, D2_in, input [4:0] RegDest_in,
                   output wb_MemToReg_out, wb_RegWrite_out, MemRead_out, MemWrite_out, 
                        output [31:0] ALURes_out, D2_out, output [4:0] RegDest_out);

    wire ld = 1;

    Reg1 wb_MemToReg(clk, rst, ld, wb_MemToReg_in, wb_MemToReg_out);
    Reg1 wb_RegWrite(clk, rst, ld, wb_RegWrite_in, wb_RegWrite_out);
    Reg1 MemRead(clk, rst, ld, MemRead_in, MemRead_out);
    Reg1 MemWrite(clk, rst, ld, MemWrite_in, MemWrite_out);

    Reg32 ALURes(clk, rst, ld, ALURes_in, ALURes_out);
    Reg32 D2(clk, rst, ld, D2_in, D2_out);

    Reg5 RegDest(clk, rst, ld, RegDest_in, RegDest_out);

endmodule