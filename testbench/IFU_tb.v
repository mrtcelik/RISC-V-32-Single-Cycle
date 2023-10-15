`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// Instruction Fetch Unit TestBench

module IFU_tb();
    reg CLOCK, RESET;
    wire [31:0] OUTPUT;

    // UUT
    IFU IFU_module(CLOCK,RESET,OUTPUT);

    // Print the Output
    initial
    $monitor($time, "CLOCK = %b, RESET = %b, Instruction Code = %h", CLOCK,RESET,OUTPUT);

    // Initializing reset
    initial
    begin
        RESET = 1'b0;
        #20 RESET = 1'b1;
        #200 RESET = 1'b0;
        #100 RESET = 1'b1;
    end

    // Initializing clock
    initial
    begin
        CLOCK = 1;
        forever #20 CLOCK = ~CLOCK;
    end

    initial
    #400 $finish;

endmodule
