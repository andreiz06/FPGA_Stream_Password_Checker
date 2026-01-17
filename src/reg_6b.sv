`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 11:34:47 PM
// Design Name: 
// Module Name: reg_6b
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


module reg_6b
(   input logic clk, reset,
    input logic [5:0] in,
    output logic [5:0] out
);

  always_ff @(posedge clk) begin
    if(reset) out <= 0;
    else out <= in;
  end

endmodule

