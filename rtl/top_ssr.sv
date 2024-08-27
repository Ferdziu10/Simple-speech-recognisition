module top_ssr(
    input logic clk,
    input logic rst,
    inout logic scl,
    inout logic sda,
    output logic [11:0] adc_ch0_data, 
    output logic [11:0] adc_ch1_data,
    output logic [11:0] adc_ch2_data,
    output logic [11:0] adc_ch3_data 
);

pmod_adc_ad7991 u_pmod_adc_ad7991(
    .clk,
    .rst,
    .sda,
    .scl,
    .adc_ch0_data 
    .adc_ch1_data 
    .adc_ch2_data 
    .adc_ch3_data 
);


endmodule