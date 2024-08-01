module top_ssr(
    input logic clk,
    input logic rst,
    input logic but,
    inout logic scl,
    inout logic sda,
    output logic led0 
);

logic [1:0] value;
logic signed [7:0] input_vector [25:0];
example_mod u_example_mod(
    .clk,
    .rst,
    .sda,
    .scl,
    .input_vector
);
top_nn u_top_nn(
    .clk,
    .rst,
    .input_vector,
    .output_value (value)
);
led_logic u_led_logic(
    .clk,
    .rst,
    .led0,
    .but,
    .speech_rec(output_value)
);

endmodule