`timescale 1ns / 1ps

module adc_reader (
    input logic clk,
    input logic rst,
    input logic [11:0] adc_data,
    output logic [11:0] data_out [0:255],
    output logic ready
);

logic [11:0] data_out_nxt [0:255];
logic ready_nxt;

integer i,k;

always_ff @(posedge clk) begin
    if(rst) begin
        ready <= '0;
        for (k = 0; k < 256; k++) 
            data_out[k] <= '0;
    end else begin
        ready <= ready_nxt;
        for (k = 0; k < 256; k++) 
            data_out[k] <= data_out_nxt[k];
    end
end

always_comb begin
    for (i = 0; i < 256; i++) 
        data_out_nxt[i] = adc_data;
    ready_nxt = 1'b1;
end




endmodule