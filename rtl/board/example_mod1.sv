module example_mod1(
    input  logic clk,          // zegar systemowy
    input  logic rst,           // reset
    input logic features, 
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
    if(features == 16'd0) 
        value_nxt = 2'd1;
    else
        value_nxt = value;
end

endmodule