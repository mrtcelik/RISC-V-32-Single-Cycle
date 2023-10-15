`timescale 1ns / 1ps
// Author : Murat �elik
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
    input [31:0] in1, in2,  // �ki girdi verisi in1 ve in2 (her biri 32 bit)
    input [3:0] alu_control, // ALU i�lem kontrol sinyali (4 bit)
    output reg [31:0] alu_result, // ALU'nun sonu� ��k��� (32 bit)
    output reg zero_flag // S�f�r bayra�� (0 bayra��) ��k��� (bir bit)
);
    always @(*)
    begin
        // Switch-Case
        case (alu_control)
        4'b0000: alu_result = in1 & in2; // AND i�lemi: in1 ve in2 aras�nda mant�ksal "ve" i�lemi yapar
        4'b0001: alu_result = in1 | in2; // OR i�lemi: in1 ve in2 aras�nda mant�ksal "veya" i�lemi yapar
        4'b0010: alu_result = in1 + in2; // Toplama i�lemi: in1 ve in2'yi toplar
        4'b0100: alu_result = in1 - in2; // ��karma i�lemi: in1'den in2'yi ��kar�r
        4'b1000: begin 
            if (in1 < in2)
                alu_result = 1; // E�er in1, in2'den k���kse, sonu� 1 olur; aksi halde 0 olur
            else
                alu_result = 0;
        end
        4'b0011: alu_result = in1 << in2; // �kili sola kayd�rma i�lemi (shift): in1'i in2 kadar sola kayd�r�r
        4'b0101: alu_result = in1 >> in2; // �kili sa�a kayd�rma i�lemi (shift): in1'i in2 kadar sa�a kayd�r�r
        4'b0110: alu_result = in1 * in2; // �arpma i�lemi: in1 ile in2'yi �arpar
        4'b0111: alu_result = in1 ^ in2; // XOR i�lemi: in1 ve in2 aras�nda mant�ksal "XOR" i�lemi yapar
        endcase
        // ALU sonucu s�f�ra e�itse, s�f�r bayra��n� ayarlama
        if (alu_result == 0)
            zero_flag = 1'b1; // Sonu� s�f�rsa, s�f�r bayra�� 1 olur
        else
            zero_flag = 1'b0; // Aksi halde s�f�r bayra�� 0 olur
    end
endmodule

