`timescale 1ns/1ns
module ID_EX(input clk, rst, if_flush_in, wb_MemToReg_in, wb_RegWrite_in, MemRead_in, MemWrite_in, ex_ALUSrc_in, ex_RegDst_in, 
                input [2:0] ex_ALUOp_in, input [31:0] D1_in, D2_in, immediate_in, input [4:0] Rt_in, Rs_in, Rd_in,
                    output if_flush_out, wb_MemToReg_out, wb_RegWrite_out, MemRead_out, MemWrite_out, ex_ALUSrc_out, ex_RegDst_out, 
                        output [2:0] ex_ALUOp_out, output [31:0] D1_out, D2_out, immediate_out, output [4:0] Rt_out, Rs_out, Rd_out);

    
    wire ld = 1;

    Reg1 if_flush(clk, rst, ld, if_flush_in, if_flush_out);
    Reg1 wb_MemToReg(clk, rst, ld, wb_MemToReg_in, wb_MemToReg_out);
    Reg1 wb_RegWrite(clk, rst, ld, wb_RegWrite_in, wb_RegWrite_out);
    Reg1 MemRead(clk, rst, ld, MemRead_in, MemRead_out);
    Reg1 MemWrite(clk, rst, ld, MemWrite_in, MemWrite_out);
    Reg1 ex_ALUSrc(clk, rst, ld, ex_ALUSrc_in, ex_ALUSrc_out);
    Reg1 ex_RegDst(clk, rst, ld, ex_RegDst_in, ex_RegDst_out);

    Reg3 ex_ALUOp(clk, rst, ld, ex_ALUOp_in, ex_ALUOp_out);
    
    Reg32 D1(clk, rst, ld, D1_in, D1_out);
    Reg32 D2(clk, rst, ld, D2_in, D2_out);
    Reg32 immediate(clk, rst, ld, immediate_in, immediate_out);

    Reg5 Rt(clk, rst, ld, Rt_in, Rt_out);
    Reg5 Rs(clk, rst, ld, Rs_in, Rs_out);
    Reg5 Rd(clk, rst, ld, Rd_in, Rd_out);

endmodule