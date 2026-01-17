`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 11:37:02 PM
// Design Name: 
// Module Name: pass_check_fsm
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


module pass_check_fsm
(
    input logic clk,
    input logic reset,
    input logic en,
    input logic [7:0] data_in,
    output logic pass_ok
);

  localparam S0 = 3'd0,
             S1 = 3'd1,
             S2 = 3'd2,
             S3 = 3'd3,
             S4 = 3'd4,
             S5 = 3'd5;

  logic [2:0] state, next_state;

  // FSM: trecere la următoarea stare
  always_ff @(posedge clk) begin
    if (reset)
      state <= S0;
    else if (en)
      state <= next_state;
  end

  // FSM: logic de tranziție și ieșire
  always_comb begin
    pass_ok = 0;
    case (state)
      S0: if (data_in == "a") next_state = S1;
          else next_state = S0;

      S1: if (data_in == "n") next_state = S2;
          else next_state = S0;

      S2: if (data_in == "d") next_state = S3;
          else next_state = S0;

      S3: if (data_in == "r") next_state = S4;
          else next_state = S0;

      S4: if (data_in == "e") begin
            next_state = S5;
            pass_ok = 1;
          end else next_state = S0;

      S5: next_state = S0;

      default: next_state = S0;
    endcase
  end

endmodule