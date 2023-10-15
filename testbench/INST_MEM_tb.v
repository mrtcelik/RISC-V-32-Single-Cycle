`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// Instruction Memory TestBench


module INST_MEM_tb();
    reg [31:0] PC;
    reg RESET;
    wire [31:0]INST_CODE;

    // Instantiating instruction memory module
    INST_MEM INST_MEM_module(PC,RESET,INST_CODE);

    initial
    $monitor($time, " Instruction code = %h, PC = %d", INST_CODE, PC);

    // Test
    initial
    begin
        RESET = 1'b0;
        #20 RESET = 1'b1;
        #20 PC = 32'd0;
        #20 PC = 32'd4;
        #20 PC = 32'd8;
        #20 PC = 32'd12;
    end

    // Terminating after 150 clock cycles
    initial
    #150 $finish;

endmodule
