module top_ssr(
    input logic clk,
    input logic rst,
    input logic but,
    inout logic scl,
    inout logic sda,
    output logic led0 
);

logic [1:0] value;
logic [11:0] adc_data;
logic [11:0] features [25:0];
pmod_adc_ad7991 u_pmod_adc_ad7991(
    .clk,
    .reset_n(rst),
    .sda,
    .scl,
    .adc_ch0_data(adc_data)
);
top_ap u_top_ap(
    .clk,
    .rst,
    .adc_data,
    .output_vector(features)
);
top_nn u_top_nn(
    .clk,
    .rst,
    .input_vector(features),
    .output_value(value)
);
led_logic u_led_logic(
    .clk,
    .rst,
    .led0,
    .but,
    .speech_rec(output_value)
);

endmodule