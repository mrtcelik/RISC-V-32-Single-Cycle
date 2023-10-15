`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// DataPath TestBench

module Datapath_tb();

    reg [4:0] read_reg_num1;    // Ýlk okuma kaydý numarasý (5 bit )
    reg [4:0] read_reg_num2;    // Ýkinci okuma kaydý numarasý (5 bit)
    reg [4:0] write_reg;        // Yazma kaydý numarasý (5 bit)
    reg [3:0] alu_control;      // ALU kontrol sinyali (4 bit)
    reg regwrite;               // Register yazma kontrol sinyali
    reg clock;                  // Saat sinyali
    reg reset;                  // Sýfýrlama kontrol sinyali

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
        reset = 1;   // Baþlangýçta sýfýrlama iþlemi aktif
        #20 reset = 0;  // 20 zaman birimi sonra sýfýrlama iþlemi devre dýþý
    end

    initial begin
        #25 read_reg_num1 = 0; read_reg_num2 = 0;
        #20 read_reg_num1 = 0; read_reg_num2 = 1;
        #20 read_reg_num1 = 0; read_reg_num2 = 1;
        #20 read_reg_num1 = 1; read_reg_num2 = 2;
    end

    initial begin
        regwrite = 0;  // Baþlangýçta register yazma iþlemi devre dýþý
        #10
        regwrite = 1;  // 10 zaman birimi sonra register yazma iþlemi aktif
    end

    initial begin
        alu_control = 4'b0010;  // ALU kontrol sinyalini "ADD" olarak ayarla
    end

    initial begin
        clock = 0;  // Baþlangýçta saat sinyali düþük
        forever #10 clock = ~clock;  // Her 10 zaman biriminde saat sinyalini deðiþtir
    end

    initial
        #200 $finish;  // 200 zaman birimi sonra testbench'i sonlandýr

endmodule
