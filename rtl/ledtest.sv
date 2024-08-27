module led_test(
    input  logic clk,          // zegar systemowy
    input  logic rst,           // reset
    input  wire [11:0] adc_data, // wynik rozpoznania mowy 0(nie rozponzano nic), 1(on), 2(off) 
    output logic led0           // dioda
);

logic led0_nxt;

always_ff @(posedge clk) begin
    if(rst)
        led0 <= '0;
    else
        led0 <= led0_nxt;
end

always_comb begin
    if(adc_data == 0) 
        led0_nxt = 0;
     else
        led0_nxt = 1;
end

endmodule