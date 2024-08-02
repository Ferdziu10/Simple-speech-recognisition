module top_ssr(
    input logic clk,
    input logic rst,,
    inout logic scl,
    inout logic sda,
    output logic data_out 
);
wire [11:0] adc_data;

pmod_adc_ad7991 u_pmod_adc_ad7991(
    .clk,
    .reset_n (rst),
    .sda,
    .scl,
    .adc_ch0_data(adc_data)
);
save_file u_save_file(
    .clk,
    .rst,
    .data_in(adc_data),
    .sw0,           // switch
    .data_out,
    .read_enable,
    .address // 14-bit address to access 16K (2^14) locations needed only while reading
);


endmodule