`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 11:35:12 PM
// Design Name: 
// Module Name: demux
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


module demux
(   input logic sel,
    input logic [7:0] in,
    output logic [7:0] out0, out1
);

always_comb begin
    case(sel)
    0: begin
            out0 = in;
            out1 = 8'b0;
       end
    1: begin
            out1 = in;
            out0 = 8'b0;
       end
    endcase
end

endmodule
