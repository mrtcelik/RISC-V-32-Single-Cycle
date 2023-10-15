`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// Processor

module Processor_tb ();
    
    reg clock;
    reg reset;
    wire zero;

    // Instantiating the processor!!!
    PROCESSOR test_processor(clock,reset,zero);

    initial begin
        reset = 1;
        #50 reset = 0;
    end
    initial begin
        clock = 0;
        forever #20 clock = ~clock;
    end
    initial
    #300 $finish;
    
endmodule