`timescale 1ns / 1ps
// Author : Murat Çelik
// Date : 02.10.2023
// Instruction Fetch Unit
/*
The instruction fetch unit has clock and reset pins as input and 32-bit instruction code as output.
Internally the block has Instruction Memory, Program Counter(P.C) and an adder to increment counter by 4, 
on every positive clock edge.
*/

module IFU(
    input clock,              // Saat 
    input reset,              // Sýfýrlama 
    output [31:0] Instruction_Code  // Cikis
);

    reg [31:0] PC = 32'b0;   // 32 bitlik program sayacý

    // UUT
    INST_MEM instr_mem(PC, reset, Instruction_Code);
    always @(posedge clock, posedge reset)
    begin
        if (reset == 1)  // Eðer sýfýrlama (reset) aktifse, program sayacýný sýfýrla
            PC <= 0;
        else
            PC <= PC + 4;  // Pozitif saat kenarýnda program sayacýný 4 artýr (bir sonraki komutun adresini hesapla)
    end
endmodule

