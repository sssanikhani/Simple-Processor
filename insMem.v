`timescale 1ns/1ns
module insMem(input [31:0] pc, output reg [31:0] ins);
    reg [31:0] main [0:16383];
    reg [31:0] real_pc;
    integer i;
    initial begin
        for (i = 0; i < 16384; i = i + 1) begin
            main[i] = 32'b0;
        end
        $readmemb ("instructions.data", main);
        $display (main[0]);
        $display (main[1]);
        $display (main[2]);
    end
    always @(pc) begin
        real_pc = pc >> 2;
        ins = main[real_pc];
    end
endmodule