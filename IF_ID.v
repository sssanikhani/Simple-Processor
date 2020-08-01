`timescale 1ns/1ns
module IF_ID(input clk, rst, if_flush, ld,
                input [31:0] addr_in, instr_in, 
                    output [31:0] addr_out, instr_out);

    wire flush;
    assign flush = rst | if_flush;
    Reg32_1ns addr(clk, flush, ld, addr_in, addr_out);
    Reg32_1ns instr(clk, flush, ld, instr_in, instr_out);

endmodule
