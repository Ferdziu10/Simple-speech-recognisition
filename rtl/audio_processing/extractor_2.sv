`timescale 1ns / 1ps

module extractor_2 (
    input logic clk,
    input logic rst,
    input logic [23:0] sum,
    input logic [23:0] sum_sq,
    output logic [11:0] features [25:0]
);

logic [11:0] features_nxt [25:0];


integer i,k;

always_ff @(posedge clk) begin
    if(rst) begin
        for (k = 0; k < 26; k++) 
            features[k] <= '0;
    end else begin
        for (k = 0; k < 26; k++) 
            features[k] <= features_nxt[k];
    end
end

always_comb begin
    for (i = 0; i < 13; i++) begin
        features_nxt[i] = sum / 256;
        features_nxt[13 + i] = sum_sq / 256 - (sum / 256) * (sum / 256);
    end
end

endmodule