`timescale 1ns/1ns
module jAddressTo32(input [25:0] address, input [3:0] pc_page, output [31:0] final);
    wire [1:0] w_add = 2'b0;
    assign final = {pc_page, address, w_add};
endmodule