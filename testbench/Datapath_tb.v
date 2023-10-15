`timescale 1ns / 1ps
// Author : Murat �elik
// Date : 02.10.2023
// DataPath TestBench

module Datapath_tb();

    reg [4:0] read_reg_num1;    // �lk okuma kayd� numaras� (5 bit )
    reg [4:0] read_reg_num2;    // �kinci okuma kayd� numaras� (5 bit)
    reg [4:0] write_reg;        // Yazma kayd� numaras� (5 bit)
    reg [3:0] alu_control;      // ALU kontrol sinyali (4 bit)
    reg regwrite;               // Register yazma kontrol sinyali
    reg clock;                  // Saat sinyali
    reg reset;                  // S�f�rlama kontrol sinyali

    Datapath DATAPATH_module(  // UUT
        read_reg_num1,
        read_reg_num2,
        write_reg,
        alu_control,
        regwrite,
        clock,
        reset,
        zero_flag
    );

    initial begin
        reset = 1;   // Ba�lang��ta s�f�rlama i�lemi aktif
        #20 reset = 0;  // 20 zaman birimi sonra s�f�rlama i�lemi devre d���
    end

    initial begin
        #25 read_reg_num1 = 0; read_reg_num2 = 0;
        #20 read_reg_num1 = 0; read_reg_num2 = 1;
        #20 read_reg_num1 = 0; read_reg_num2 = 1;
        #20 read_reg_num1 = 1; read_reg_num2 = 2;
    end

    initial begin
        regwrite = 0;  // Ba�lang��ta register yazma i�lemi devre d���
        #10
        regwrite = 1;  // 10 zaman birimi sonra register yazma i�lemi aktif
    end

    initial begin
        alu_control = 4'b0010;  // ALU kontrol sinyalini "ADD" olarak ayarla
    end

    initial begin
        clock = 0;  // Ba�lang��ta saat sinyali d���k
        forever #10 clock = ~clock;  // Her 10 zaman biriminde saat sinyalini de�i�tir
    end

    initial
        #200 $finish;  // 200 zaman birimi sonra testbench'i sonland�r

endmodule
