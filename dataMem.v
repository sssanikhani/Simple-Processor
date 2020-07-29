`timescale 1ns/1ns
module dataMem(input clk, rst, readMem, writeMem, input [31:0] address, writeData, output reg [31:0] data);
    reg [31:0] main [0:16383];
    reg [31:0] real_address;
    reg [31:0] array [0:19];
    integer i;
    initial begin
        $readmemh ("dataMem.data", array);
        for (i = 0; i < 20; i = i + 1) begin
            main[250 + i] = array[i];
        end
    end
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            for (i = 0; i < 16384; i = i + 1) begin
                main[i] = 32'b0;
            end
            for (i = 0; i < 20; i = i + 1) begin
                main[250 + i] = array[i];
            end
        end
        else begin
            if(writeMem) begin
                real_address = address >> 2;
                main[real_address] = writeData;
            end
        end
    end
    always @(address, readMem) begin
        if(readMem) begin
            real_address = address >> 2;
            data = main[real_address];
        end
        else data = 32'b0;
    end
endmodule