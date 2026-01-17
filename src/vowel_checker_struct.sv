`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 11:36:22 PM
// Design Name: 
// Module Name: vowel_checker_struct
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



module vowel_checker_struct
(   input logic [7:0] data_in,
    output logic is_vowel
);

  assign is_vowel = (data_in == "a") || (data_in == "e") || (data_in == "i") ||
                    (data_in == "o") || (data_in == "u");

endmodule

