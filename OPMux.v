`timescale 1ns/1ns
module OPMux(input op, RegDst, RegWrite, aluSrc, MemRead, MemWrite, MemToReg, input [2:0] aluOp, 
                output f_RegDst, f_RegWrite, f_aluSrc, f_MemRead, f_MemWrite, f_MemToReg, output [2:0] f_aluOp);

    assign f_RegDst = (op == 0) ? 1'b0 : RegDst;
    assign f_RegWrite = (op == 0) ? 1'b0 : RegWrite;
    assign f_aluSrc = (op == 0) ? 1'b0 : aluSrc;
    assign f_MemRead = (op == 0) ? 1'b0 : MemRead;
    assign f_MemWrite = (op == 0) ? 1'b0 : MemWrite;
    assign f_MemToReg = (op == 0) ? 1'b0 : MemToReg;
    assign f_aluOp = (op == 0) ? 3'b0 : aluOp;

endmodule
