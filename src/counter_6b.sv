`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 11:34:04 PM
// Design Name: 
// Module Name: counter_6b
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


module counter_6b
(   input logic clk, reset, en,
    output logic [5:0] count
);

always_ff @(posedge clk) begin
    if (reset)
      count <= 0;
    else if (en)
      count <= count + 1;
end

endmodule
