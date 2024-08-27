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
logic signed [15:0] features [25:0];
example_mod u_example_mod(
    .clk,
    .rst,
    .sda,
    .scl,
    .adc_data
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
    .speech_rec(value)
);

endmodule