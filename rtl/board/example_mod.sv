module example_mod(
    input  logic clk,          // zegar systemowy
    input  logic rst,           // reset
    inout logic sda, 
    inout logic scl,           
    output logic [11:0] adc_data        
);

logic signed [11:0] adc_data_nxt;

always_ff @(posedge clk) begin
    if(rst)begin
        adc_data <= '0;
    end else begin
        adc_data <= adc_data_nxt;
end
end

always_comb begin
    if(sda == scl) 
        adc_data_nxt = 11'b00000000001;
    else
        adc_data_nxt = adc_data;
end

endmodule