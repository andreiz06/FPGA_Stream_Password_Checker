`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 12:12:57 AM
// Design Name: 
// Module Name: testbench
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


module testbench();

logic clk, reset, en, check_t;
logic [7:0] char, vowels_t, consonants_t, dr_vowels_t, dr_consonants_t;

top dut
(
    .clk(clk),
    .reset(reset),
    .en(en),
    .data_in(char),
    .check(check_t),
    .data_read_consonants(dr_consonants_t),
    .data_read_vowels(dr_vowels_t),
    .consonants(consonants_t),
    .vowels(vowels_t)
);

  // Ceas
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    reset = 1;
    en = 0;
    char = 8'd0;

    #12 reset = 0;

    en = 1;
    char = "a"; #10;
    char = "b"; #10;
    char = "c"; #10;
    char = "d"; #10;
    char = "e"; #10;
    char = "f"; #10;

    char = "a"; #10;
    char = "n"; #10;
    char = "d"; #10;
    char = "r"; #10;
    char = "e"; #10;

    en = 0;
    #20;
    $finish;
  end

endmodule
