`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 11:33:32 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top
(
   input logic clk, reset,
   input logic en,
   input logic [7:0] data_in,
   output logic check,
   output logic [7:0] data_read_consonants,
   output logic [7:0] data_read_vowels,
   output logic [7:0] consonants,
   output logic [7:0] vowels
);

  logic [5:0] addr_count, addr;
  logic is_vowel, not_vowel, en_cons, en_vow;

  // Instanțieri
  counter_6b c0(clk, reset, en, addr_count);
  reg_6b r0(clk, reset, addr_count, addr);
  vowel_checker_struct vc(data_in, is_vowel);
  demux dmux0(is_vowel, data_in, consonants, vowels);

  ram ram_consonants(clk, en_cons, addr, data_in, data_read_consonants);
  ram ram_vowels(clk, en_vow, addr, data_in, data_read_vowels);

  pass_check_fsm pfsm(clk, reset, en, data_in, check);
  
  not n0(not_vowel, is_vowel);
  and a0(en_cons, en, not_vowel);
  and a1(en_vow, en, is_vowel);

endmodule

