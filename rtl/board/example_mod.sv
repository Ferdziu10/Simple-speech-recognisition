module example_mod(
    input  logic clk,          // zegar systemowy
    input  logic rst,           // reset
    inout logic sda, 
    inout logic scl,           
    output logic [15:0] input_vector [25:0]        // dioda
);

logic [15:0] input_vector_nxt [25:0];

integer k;
always_ff @(posedge clk) begin
    if(rst)begin
    for (k = 0; k < 26; k++) 
        input_vector[k] <= '0;
    end else begin
        for (k = 0; k < 26; k++) 
        input_vector[k] <= input_vector_nxt[k];
end
end

always_comb begin
    if(sda == scl) 
        input_vector_nxt[1] = 16'b00000001;
    else
        input_vector_nxt[1] = input_vector[1];
end

endmodule