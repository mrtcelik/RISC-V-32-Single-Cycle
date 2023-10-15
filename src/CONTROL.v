`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// Control Unit

module CONTROL(
    input [6:0] funct7,       // 7 bitlik "funct7" kontrol sinyali
    input [2:0] funct3,       // 3 bitlik "funct3" kontrol sinyali
    input [6:0] opcode,       // 7 bitlik "opcode" kontrol sinyali
    output reg [3:0] alu_control,  // 4 bitlik ALU kontrol sinyali
    output reg regwrite_control    // Yazma (register write) kontrol sinyali
);
    always @(funct3 or funct7 or opcode)
    begin
        if (opcode == 7'b0110011) begin // R-type talimatlarý için kontrol

            regwrite_control = 1; // Yazma kontrol sinyalini etkinleþtir
            case (funct3)
                0: begin
                    if (funct7 == 0)
                        alu_control = 4'b0010; // ALU kontrol sinyalini "ADD" olarak ayarla
                    else if (funct7 == 32)
                        alu_control = 4'b0100; // ALU kontrol sinyalini "SUB" olarak ayarla
                end
                6: alu_control = 4'b0001; // ALU kontrol sinyalini "OR" olarak ayarla
                7: alu_control = 4'b0000; // ALU kontrol sinyalini "AND" olarak ayarla
                1: alu_control = 4'b0011; // ALU kontrol sinyalini "SLL" (sol kaydýrma) olarak ayarla
                5: alu_control = 4'b0101; // ALU kontrol sinyalini "SRL" (sað kaydýrma) olarak ayarla
                2: alu_control = 4'b0110; // ALU kontrol sinyalini "MUL" (çarpma) olarak ayarla
                4: alu_control = 4'b0111; // ALU kontrol sinyalini "XOR" olarak ayarla
            endcase
        end
    end
endmodule

