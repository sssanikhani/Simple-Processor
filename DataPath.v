`timescale 1ns/1ns
module DataPath(input clk, rst, isJ, pcSrc, pcWrite, IF_ID_RegWrite, id_if_flush, id_MemToReg, 
                    id_RegWrite, id_MemRead, id_MemWrite, id_aluSrc, id_RegDst,
                    input [2:0] id_ALUOp, input [1:0] ex_forwardA, ex_forwardB, 
                    output ex_MemRead, Mem_RegWrite, wb_RegWrite,
                    output [31:0] id_Data1, id_Data2, output [5:0] opCode, funcCode, 
                    output [4:0] id_Rt, id_Rs, ex_Rt, ex_Rs, Mem_Rd, wb_Rd);

    wire [31:0] branch_addr, if_inst, id_inst, if_next_addr, id_next_addr, 
                wb_RegWriteData, id_immediate, ex_Data1, ex_Data2, ex_immediate, 
                Mem_ALURes, ex_ALURes, ex_MemWriteData, Mem_MemWriteData, Mem_MemOut,
                wb_MemOut, wb_ALURes;
    wire [25:0] jAddr;
    wire [4:0] id_Rd, ex_Rd, ex_RegDest;
    wire [2:0] ex_ALUOp;
    wire ex_if_flush, ex_MemToReg, ex_RegWrite, ex_MemWrite, ex_ALUSrc, 
            ex_RegDst, Mem_MemToReg, wb_MemToReg;

    IF if_section(clk, rst, pcWrite, pcSrc, isJ, branch_addr, jAddr, if_next_addr, if_inst);
    
    
    IF_ID if_id_reg(clk, rst, ex_if_flush, IF_ID_RegWrite, if_next_addr, if_inst, id_next_addr, id_inst);
    
    
    ID id_section(clk, rst, wb_RegWrite, id_next_addr, id_inst, wb_RegWriteData, wb_Rd, branch_addr, 
                    id_Data1, id_Data2, id_immediate, jAddr, opCode, funcCode, id_Rs, id_Rt, id_Rd);
    
    
    ID_EX id_ex_reg(clk, rst, id_if_flush, id_MemToReg, id_RegWrite, id_MemRead, id_MemWrite, id_aluSrc, 
                        id_RegDst, id_ALUOp, id_Data1, id_Data2, id_immediate, id_Rt, 
                        id_Rs, id_Rd, ex_if_flush, ex_MemToReg, ex_RegWrite, ex_MemRead, 
                        ex_MemWrite, ex_ALUSrc, ex_RegDst, ex_ALUOp, ex_Data1, ex_Data2, 
                        ex_immediate, ex_Rt, ex_Rs, ex_Rd);

    
    EX ex_section(ex_RegDst, ex_ALUSrc, ex_ALUOp, ex_forwardA, ex_forwardB, ex_Data1, ex_Data2, Mem_ALURes, 
                        wb_RegWriteData, ex_immediate, ex_Rt, ex_Rd, ex_ALURes, ex_MemWriteData, ex_RegDest);


    
    
    EX_MEM ex_mem_reg(clk, rst, ex_MemToReg, ex_RegWrite, ex_MemRead, ex_MemWrite, 
                        ex_ALURes, ex_MemWriteData, ex_RegDest, Mem_MemToReg, Mem_RegWrite, 
                            Mem_MemRead, Mem_MemWrite, Mem_ALURes, Mem_MemWriteData, Mem_Rd);

    dataMem DataMemory(clk ,rst, Mem_MemRead, Mem_MemWrite, Mem_ALURes, Mem_MemWriteData, Mem_MemOut);


    MEM_WB mem_wb_reg(clk, rst, Mem_MemToReg, Mem_RegWrite, Mem_MemOut, Mem_ALURes, Mem_Rd, wb_MemToReg, 
                        wb_RegWrite, wb_MemOut, wb_ALURes, wb_Rd);


    mux32bit MemToRegMux(wb_ALURes, wb_MemOut, wb_MemToReg, wb_RegWriteData);

endmodule