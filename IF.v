`timescale 1ns/1ns
module IF(input clk, rst, PCWrite, pcSrc, isJ, input [31:0] branch_addr, input [25:0] j_addr, output [31:0] next_addr, inst);
    
    wire [31:0] pcIn, pcOut, final_jAddr, pcSrcOut, nextAddress;
    wire [31:0] num4 = 32'b00000000000000000000000000000100;


    Reg32 pcReg(clk, rst, PCWrite, pcIn, pcOut);
    jAddressTo32 jaddr(j_addr, pcOut[31:28], final_jAddr);
    Adder plus4(num4, pcOut, nextAddress);
    insMem instMemory(pcOut, inst);
    mux32bit pcSrcMux(nextAddress, branch_addr, pcSrc, pcSrcOut);
    mux32bit isJMux(pcSrcOut, final_jAddr, isJ, pcIn);


    assign next_addr = nextAddress;
endmodule