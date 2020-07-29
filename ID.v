`timescale 1ns/1ns
module ID(input clk, rst, RegWrite, input [31:0] next_addr, instr, RegWriteData, input [4:0] RegDest,
             output [31:0] branch_addr, Data1, Data2, immediate, output [25:0] jAddr, 
                output [5:0] opCode, funcCode, output [4:0] Rs, Rt, Rd);

   wire [31:0] branch_offset, sgnExtOut;

   Rfile registerFile(clk, rst, RegWrite, instr[25:21], instr[20:16], RegDest, RegWriteData, Data1, Data2);
   Adder branchAdder(next_addr, branch_offset, branch_addr);
   Shl2 shiftLeft2(sgnExtOut, branch_offset);
   sgnExtend signExt(instr[15:0], sgnExtOut);

   assign jAddr = instr[25:0];

   assign opCode = instr[31:26];
   assign funcCode = instr[5:0];

   assign Rs = instr[25:21];
   assign Rt = instr[20:16];
   assign Rd = instr[15:11];

   assign immediate = sgnExtOut;

endmodule