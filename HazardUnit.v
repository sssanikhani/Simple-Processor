`timescale 1ns/1ns
module HazardUnit(input IDEX_MemRead, IDEX_RegWrite, input [4:0] IFID_RegisterRs, IFID_RegisterRt, 
                            IDEX_RegisterRt, IDEX_RegisterRd, output PCWrite, IFIDWrite, OP);
    assign OP = (IDEX_MemRead == 1 && (IDEX_RegisterRt == IFID_RegisterRs || IDEX_RegisterRt == IFID_RegisterRt)) ? 0 : 1;                 
    assign IFIDWrite = (IDEX_MemRead == 1 && (IDEX_RegisterRt == IFID_RegisterRs || IDEX_RegisterRt == IFID_RegisterRt)) ? 0 : 1;
    assign PCWrite = (IDEX_MemRead == 1 && (IDEX_RegisterRt == IFID_RegisterRs || IDEX_RegisterRt == IFID_RegisterRt)) ? 0 : 1;
          
endmodule






