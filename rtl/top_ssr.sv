module top_ssr(
    input logic clk,
    input logic rst,
    inout logic scl,
    inout logic sda,
    output logic led0
);

logic [11:0] data_wire;

pmod_adc_ad7991 u_pmod_adc_ad7991(
    .clk,
    .rst,
    .sda,
    .scl,
    .adc_ch0_data(data_wire)
);

ledtest u_ledtest(
    .clk,
    .rst,
    .adc_data(data_wire),
    .led0
);


endmodule