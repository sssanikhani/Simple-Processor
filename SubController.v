`timescale 1ns/1ns
module SubController(input [5:0]OpCode, input [31:0] ReadData1, ReadData2, output PCSrc, IsJ, IF_FLUSH_TO_IDEXReg);
       wire JOrNot, Beq, Bne;
       assign Beq = (OpCode == 6'b000100) && (ReadData1 == ReadData2) ? 1 : 0; 
       assign Bne = (OpCode == 6'b000101) && (ReadData1 != ReadData2)? 1 : 0;
       assign JOrNot = (OpCode == 6'b000010) ? 1 : 0;
       assign PCSrc = Beq || Bne ? 1 : 0;
       assign IsJ =  JOrNot ? 1 : 0;
       assign IF_FLUSH_TO_IDEXReg = Beq || Bne || JOrNot ? 1 : 0;
endmodule
