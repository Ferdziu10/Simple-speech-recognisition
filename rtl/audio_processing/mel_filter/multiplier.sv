import ap_parameters::*;
module multiplier(
    input logic clk,
    input logic rst,
    input logic [A_WIDTH-1:0] a,
    input logic [B_WIDTH-1:0] b,
    output logic [P_WIDTH-1:0] p
);
logic [P_WIDTH-1:0] p_nxt;
logic [A_WIDTH+B_WIDTH-1:0] p_reg;
logic [A_WIDTH+B_WIDTH-1:0] p_reg_nxt;
always_ff @(posedge clk) begin
    if(rst) begin
        p <= '0;
        p_reg <= '0;
    end else begin
        p <= p_nxt;
        p_reg <= p_reg_nxt;
    end
end
always_comb begin
    p_reg_nxt = a * b;
    p_nxt = p_reg[A_WIDTH+B_WIDTH-1:A_WIDTH+B_WIDTH-1-P_WIDTH];
end
endmodule