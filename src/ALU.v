`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// ALU : Arithmetic Logic Unit
/*
ALU Control lines | Function
-----------------------------
        0000    Bitwise-AND
        0001    Bitwise-OR
        0010	Add (A+B)
        0100	Subtract (A-B)
        1000	Set on less than
        0011    Shift left logical
        0101    Shift right logical
        0110    Multiply
        0111    Bitwise-XOR
*/

module ALU (
    input [31:0] in1, in2,  // Ýki girdi verisi in1 ve in2 (her biri 32 bit)
    input [3:0] alu_control, // ALU iþlem kontrol sinyali (4 bit)
    output reg [31:0] alu_result, // ALU'nun sonuç çýkýþý (32 bit)
    output reg zero_flag // Sýfýr bayraðý (0 bayraðý) çýkýþý (bir bit)
);
    always @(*)
    begin
        // Switch-Case
        case (alu_control)
        4'b0000: alu_result = in1 & in2; // AND iþlemi: in1 ve in2 arasýnda mantýksal "ve" iþlemi yapar
        4'b0001: alu_result = in1 | in2; // OR iþlemi: in1 ve in2 arasýnda mantýksal "veya" iþlemi yapar
        4'b0010: alu_result = in1 + in2; // Toplama iþlemi: in1 ve in2'yi toplar
        4'b0100: alu_result = in1 - in2; // Çýkarma iþlemi: in1'den in2'yi çýkarýr
        4'b1000: begin 
            if (in1 < in2)
                alu_result = 1; // Eðer in1, in2'den küçükse, sonuç 1 olur; aksi halde 0 olur
            else
                alu_result = 0;
        end
        4'b0011: alu_result = in1 << in2; // Ýkili sola kaydýrma iþlemi (shift): in1'i in2 kadar sola kaydýrýr
        4'b0101: alu_result = in1 >> in2; // Ýkili saða kaydýrma iþlemi (shift): in1'i in2 kadar saða kaydýrýr
        4'b0110: alu_result = in1 * in2; // Çarpma iþlemi: in1 ile in2'yi çarpar
        4'b0111: alu_result = in1 ^ in2; // XOR iþlemi: in1 ve in2 arasýnda mantýksal "XOR" iþlemi yapar
        endcase
        // ALU sonucu sýfýra eþitse, sýfýr bayraðýný ayarlama
        if (alu_result == 0)
            zero_flag = 1'b1; // Sonuç sýfýrsa, sýfýr bayraðý 1 olur
        else
            zero_flag = 1'b0; // Aksi halde sýfýr bayraðý 0 olur
    end
endmodule

