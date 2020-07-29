`timescale 1ns/1ns
module PipeLine(input clk, rst);

    wire [5:0] opCode, funcCode;
    wire isJ, pcSrc, pcWrite, IF_ID_RegWrite, if_flush, MemToReg, id_RegWrite, 
                Mem_RegWrite, wb_RegWrite, id_MemRead, ex_MemRead, 
                    Mem_MemRead, MemWrite, aluSrc, RegDst, op, RegDst_pre, 
                    RegWrite_pre, aluSrc_pre, MemRead_pre, MemWrite_pre, MemToReg_pre;
    wire [31:0] id_Data1, id_Data2;
    wire [2:0] aluOp, aluOp_pre;
    wire [4:0] id_Rt, id_Rs, ex_Rt, ex_Rs, Mem_Rd, wb_Rd;
    wire [1:0] forwardA, forwardB;
    wire nop_c = 0;

    DataPath dp(clk, rst, isJ, pcSrc, pcWrite, IF_ID_RegWrite, if_flush, MemToReg, id_RegWrite, 
                id_MemRead, MemWrite, aluSrc, RegDst, aluOp, forwardA, forwardB, ex_MemRead, 
                Mem_MemRead, ex_RegWrite, Mem_RegWrite, id_Data1, id_Data2, opCode, funcCode, 
                    id_Rt, id_Rs, ex_Rt, ex_Rs, Mem_Rd, wb_Rd);

    Controller cu(opCode, funcCode, RegDst_pre, RegWrite_pre, aluSrc_pre, MemRead_pre, 
                    MemWrite_pre, MemToReg_pre, aluOp_pre);

    OPMux opm(op, RegDst_pre, RegWrite_pre, aluSrc_pre, MemRead_pre, MemWrite_pre, MemToReg_pre, aluOp_pre, 
               RegDst, id_RegWrite, aluSrc, id_MemRead, MemWrite, MemToReg, aluOp);

    ForwardingUnit fu(Mem_RegWrite, wb_RegWrite, ex_Rs, ex_Rt, Mem_Rd, wb_Rd, forwardA, forwardB);

    HazardUnit hu(ex_MemRead, ex_RegWrite, id_Rs, id_Rt, ex_Rt, ex_Rd, pcWrite, IF_ID_RegWrite, op);

    SubController sc(opCode, id_Data1, id_Data2, pcSrc, isJ, if_flush);

endmodule