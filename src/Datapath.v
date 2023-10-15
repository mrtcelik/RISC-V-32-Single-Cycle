`timescale 1ns / 1ps
// Author : Murat �elik
// Date : 02.10.2023
// DataPath

module Datapath(
    input [4:0] read_reg_num1, // �lk okuma kayd� numaras� (5 bit)
    input [4:0] read_reg_num2, // �kinci okuma kayd� numaras� (5 bit)
    input [4:0] write_reg,     // Yazma kayd� numaras� (5 bit)
    input [3:0] alu_control,   // ALU kontrol sinyali (4 bit)
    input regwrite,            // Register yazma kontrol sinyali
    input clock,               // Saat sinyali
    input reset,               // S�f�rlama kontrol sinyali
    output zero_flag          // S�f�r bayra�� ��k���
);

    // Dahili Wire
    wire [31:0] read_data1;   // �lk okuma
    wire [31:0] read_data2;   // �kinci okuma
    wire [31:0] write_data;   // Yazma

    // Register dosyas�n� (REG_FILE) Olu�turma
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

    // ALU mod�l�n� �a��rma
    ALU alu_module(
        read_data1,
        read_data2,
        alu_control,
        write_data,
        zero_flag
    );

endmodule
