`timescale 1ns/1ns
module EX_MEM(input clk, rst, wb_MemToReg_in, wb_RegWrite_in, MemRead_in, MemWrite_in, 
                input [31:0] ALURes_in, D2_in, input [4:0] RegDest_in,
                   output wb_MemToReg_out, wb_RegWrite_out, MemRead_out, MemWrite_out, 
                        output [31:0] ALURes_out, D2_out, output [4:0] RegDest_out);

    wire ld = 1;

    Reg1_2ns wb_MemToReg(clk, rst, ld, wb_MemToReg_in, wb_MemToReg_out);
    Reg1_2ns wb_RegWrite(clk, rst, ld, wb_RegWrite_in, wb_RegWrite_out);
    Reg1_2ns MemRead(clk, rst, ld, MemRead_in, MemRead_out);
    Reg1_2ns MemWrite(clk, rst, ld, MemWrite_in, MemWrite_out);

    Reg32_2ns ALURes(clk, rst, ld, ALURes_in, ALURes_out);
    Reg32_2ns D2(clk, rst, ld, D2_in, D2_out);

    Reg5_2ns RegDest(clk, rst, ld, RegDest_in, RegDest_out);

endmodule