`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 11:35:54 PM
// Design Name: 
// Module Name: ram
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


module ram
(   input logic clk, we,
    input logic [5:0] addr,
    input logic [7:0] w_data,
    output logic [7:0] r_data
);

  logic [7:0] mem [0:63];

  assign r_data = mem[addr];  // citire asincronă

  always_ff @(posedge clk) begin
    if (we)
      mem[addr] <= w_data;
  end

endmodule
