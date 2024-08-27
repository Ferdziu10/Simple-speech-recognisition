module top_ssr(
    input logic clk,
    input logic rst,
    inout logic scl,
    inout logic sda,

);

pmod_adc_ad7991 u_pmod_adc_ad7991(
    .clk,
    .rst,
    .sda,
    .scl,
);


endmodule