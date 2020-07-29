`timescale 1ns/1ns
module EX(input RegDst, ALUSrc, input [2:0] ALUOp, input [1:0] forwardA, forwardB, 
            input [31:0] Data1, Data2, preData, prePreData, immediate, input [4:0] Rt, Rd, 
                output [31:0] ALUOut, MemWriteData, output [4:0] RegDest);

    wire [31:0] newData1, newData2;

    mux3sel32bit muxA(Data1, preData, prePreData, forwardA, newData1);
    mux3sel32bit muxB(Data2, preData, prePreData, forwardB, newData2);
    mux32bit aluSrcMux(newData2, immediate, ALUSrc, aluSecOp);
    mux5bit RegDstMux(Rt, Rd, RegDst, RegDest);
    alu ALUComponent(newData1, aluSecOp, ALUOp, ALUOut);

    assign MemWriteData = newData2;

endmodule