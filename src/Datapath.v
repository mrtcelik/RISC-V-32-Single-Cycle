`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// DataPath

module Datapath(
    input [4:0] read_reg_num1, // Ýlk okuma kaydý numarasý (5 bit)
    input [4:0] read_reg_num2, // Ýkinci okuma kaydý numarasý (5 bit)
    input [4:0] write_reg,     // Yazma kaydý numarasý (5 bit)
    input [3:0] alu_control,   // ALU kontrol sinyali (4 bit)
    input regwrite,            // Register yazma kontrol sinyali
    input clock,               // Saat sinyali
    input reset,               // Sýfýrlama kontrol sinyali
    output zero_flag          // Sýfýr bayraðý çýkýþý
);

    // Dahili Wire
    wire [31:0] read_data1;   // Ýlk okuma
    wire [31:0] read_data2;   // Ýkinci okuma
    wire [31:0] write_data;   // Yazma

    // Register dosyasýný (REG_FILE) Oluþturma
    REG_FILE reg_file_module(
        read_reg_num1,
        read_reg_num2,
        write_reg,
        write_data,
        read_data1,
        read_data2,
        regwrite,
        clock,
        reset
    );

    // ALU modülünü çaðýrma
    ALU alu_module(
        read_data1,
        read_data2,
        alu_control,
        write_data,
        zero_flag
    );

endmodule
