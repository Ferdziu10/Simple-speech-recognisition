//////////////////////////////////////////////////////////////////////////////
/*
 Module name:   multiplier
 Authors:       Kacper Ferdek, Mateusz Gibas
 Version:       1.0
 Last modified: 2024-08-29
 Coding style: safe, with FPGA sync reset
 Description:  Simple multiplier
 */
//////////////////////////////////////////////////////////////////////////////
import ap_parameters::*;
module multiplier(
    input logic clk,
    input logic rst,
    input logic [A_WIDTH-1:0] a,
    input logic [B_WIDTH-1:0] b,
    output logic [P_WIDTH-1:0] p
);

//------------------------------------------------------------------------------
// local variables
//------------------------------------------------------------------------------
logic [P_WIDTH-1:0] p_nxt;
logic [A_WIDTH+B_WIDTH-1:0] p_reg;
logic [A_WIDTH+B_WIDTH-1:0] p_reg_nxt;

//------------------------------------------------------------------------------
// output register with sync reset
//------------------------------------------------------------------------------
always_ff @(posedge clk) begin
    if(rst) begin
        p <= '0;
        p_reg <= '0;
    end else begin
        p <= p_nxt;
        p_reg <= p_reg_nxt;
    end
end

//------------------------------------------------------------------------------
// logic
//------------------------------------------------------------------------------
always_comb begin
    p_reg_nxt = a * b;
    p_nxt = p_reg[A_WIDTH+B_WIDTH-1:A_WIDTH+B_WIDTH-1-P_WIDTH];
end
endmodule