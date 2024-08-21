`timescale 1ns / 1ps

module mean_std_1 (
    input logic clk,
    input logic rst,
    input logic [15:0] data_in [0:39],
    output logic [31:0] sum,
    output logic [31:0] sum_sq 
);

logic [31:0] sum_nxt;
logic [31:0] sum_sq_nxt;

integer i,k;

always_ff @(posedge clk) begin
    if(rst) begin
        sum <= '0;
        sum_sq <= '0;
    end else begin
        sum <= sum_nxt;
        sum_sq <= sum_sq_nxt;
    end
end

always_comb begin
    for (i = 0; i < 40; i++) begin
        sum_nxt = sum + data_in [i];
        sum_sq_nxt = sum_sq + data_in [i] * data_in [i];
    end
end




endmodule