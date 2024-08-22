module led_logic(
    input  logic clk,          // zegar systemowy
    input  logic rst,           // reset
    input  wire [1:0] speech_rec, // wynik rozpoznania mowy 0(nie rozponzano nic), 1(on), 2(off) 
    input  logic sw0,           // przełącznik
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
    if(sw0) begin
        case(speech_rec) 
            2'b00: led0_nxt = led0;
            2'b01: led0_nxt = 1;
            2'b10: led0_nxt = 0;
            default: led0_nxt= led0;
        endcase
    end else
        led0_nxt= led0;
end

endmodule