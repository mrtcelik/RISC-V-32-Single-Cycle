`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// Processor Test Bench

module PROCESSOR( 
    input clock, 
    input reset,
    output zero
);

    wire [31:0] instruction_code;
    wire [3:0] alu_control;
    wire regwrite;

    IFU IFU_module(clock, reset, instruction_code);
	
    CONTROL control_module(instruction_code[31:25], instruction_code[14:12],instruction_code[6:0], alu_control, regwrite);
	
    Datapath datapath_module(instruction_code[19:15], instruction_code[24:20], instruction_code[11:7], alu_control, regwrite, clock, reset, zero);

endmodule
