`timescale 1ns/1ns
module MEM_WB(input clk, rst, wb_MemToReg_in, wb_RegWrite_in, input [31:0] MemRes_in, ALURes_in, input [4:0] RegDest_in,
                output wb_MemToReg_out, wb_RegWrite_out, output [31:0] MemRes_out, ALURes_out, output [4:0] RegDest_out);

    wire ld = 1;

    Reg1 wb_MemToReg(clk, rst, ld, wb_MemToReg_in, wb_MemToReg_out);
    Reg1 wb_RegWrite(clk, rst, ld, wb_RegWrite_in, wb_RegWrite_out);
    
    Reg32 MemRes(clk, rst, ld, MemRes_in, MemRes_out);
    Reg32 ALURes(clk, rst, ld, ALURes_in, ALURes_out);
    
    Reg5 RegDest(clk, rst, ld, RegDest_in, RegDest_out);

endmodule