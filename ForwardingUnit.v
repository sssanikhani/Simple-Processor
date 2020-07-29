`timescale 1ns/1ns
module ForwardingUnit(input EXMEM_RegWrite, MEMWB_RegWrite, input [4:0] IDEX_RegisterRs, IDEX_RegisterRt, 
                  EXMEM_RegisterRd, MEMWB_RegisterRd, output [1:0] ForwardA, ForwardB);
    assign ForwardA = (EXMEM_RegWrite == 1 && EXMEM_RegisterRd == IDEX_RegisterRs && EXMEM_RegisterRd != 0) ?
                       2 :((MEMWB_RegWrite == 1 && MEMWB_RegisterRd == IDEX_RegisterRs && MEMWB_RegisterRd != 0)? 1 : 0);
    assign ForwardB = (EXMEM_RegWrite == 1 && EXMEM_RegisterRd == IDEX_RegisterRt && EXMEM_RegisterRd != 0) ?
                       2 :((MEMWB_RegWrite == 1 && MEMWB_RegisterRd == IDEX_RegisterRt && MEMWB_RegisterRd != 0)? 1 : 0);              
endmodule
