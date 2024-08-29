module example_mod1(
    input  logic clk,          // zegar systemowy
    input  logic rst,           // reset
    input logic signed [15:0] features [25:0], 
    output logic [1:0] value
);

logic signed [1:0] value_nxt;

always_ff @(posedge clk) begin
    if(rst)begin
        value <= '0;
    end else begin
        value <= value_nxt;
end
end

always_comb begin
    if(features[0] == 16'd0 && features[1] == 16'd0 && features[2] == 16'd0 && features[3] == 16'd0 && features[4] == 16'd0 && features[5] == 16'd0 && features[6] == 16'd0 && features[7] == 16'd0 && features[8] == 16'd0 && features[9] == 16'd0 && features[10] == 16'd0 && features[11] == 16'd0 && features[12] == 16'd0 && features[13] == 16'd0 && features[14] == 16'd0 && features[15] == 16'd0 && features[16] == 16'd0 && features[17] == 16'd0 && features[18] == 16'd0 && features[19] == 16'd0 && features[20] == 16'd0 && features[21] == 16'd0 && features[22] == 16'd0 && features[23] == 16'd0 && features[24] == 16'd0 && features[25] == 16'd0) 
        value_nxt = 2'd1;
    else
        value_nxt = value;
end

endmodule