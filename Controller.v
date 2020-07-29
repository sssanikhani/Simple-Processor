`timescale 1ns/1ns
module Controller(input [5:0]OpCode, FuncCode, output reg RegDst, RegWrite, AluSrc, MemRead, MemWrite, 
MemToReg, output reg [2:0]ALUOperation);
  reg [5:0] ADD = 6'b100000, SUB = 6'b100010, AND = 6'b100100, OR = 6'b100101, SLT = 6'b101010;
  always@(OpCode, FuncCode)begin
    
    RegDst = 0; RegWrite = 0; AluSrc = 0; MemRead = 0; MemWrite = 0; 
    MemToReg = 0; ALUOperation = 0;
    
    //R_TYPE
    if(OpCode == 6'b000000 || OpCode == 6'b001000 || OpCode == 6'b001100) begin
      
      //ADD, SUB, AND, OR, SLT 
      if(OpCode == 6'b000000)begin
        case(FuncCode)
          ADD: begin ALUOperation = 0; RegWrite = 1; end
          SUB: begin ALUOperation = 1; RegWrite = 1; end
          AND: begin ALUOperation = 2; RegWrite = 1; end
          OR: begin ALUOperation = 3; RegWrite = 1; end
          SLT: begin ALUOperation = 4; RegWrite = 1; end
          default:ALUOperation = 0;
        endcase
        RegDst = 1;
      end
      
      //ADDI
      if(OpCode == 6'b001000)begin
        ALUOperation = 0;
        RegDst = 0; RegWrite = 1; AluSrc = 1;
      end
      
      //ANDI
      if(OpCode == 6'b001100)begin
        ALUOperation = 2;
        RegDst = 0; RegWrite = 1; AluSrc = 1;
      end 
      
    end
  
  
    //Memory
    if(OpCode == 6'b101011 || OpCode == 6'b100011)begin
      
      //SW
      if(OpCode == 6'b101011)begin
         ALUOperation = 0;
         RegWrite = 0; AluSrc = 1; MemRead = 0; MemWrite = 1; 
      end
      
      //LW
      if(OpCode == 6'b100011)begin
        RegDst = 0;
        ALUOperation = 0;
        RegWrite = 1; AluSrc = 1; MemRead = 1; MemWrite = 0; MemToReg = 1;
      end
      
    end
    
    //Jump Or Branch
    if(OpCode == 6'b000010 || OpCode == 6'b000100 || OpCode == 6'b000101)begin
      
      //j
      if(OpCode == 6'b000010)begin
      end
      
      //Beq
      if(OpCode == 6'b000100)begin
      end
      
      //Bne
      if(OpCode == 6'b000101)begin
      end
      
    end
    
  end
  

endmodule








