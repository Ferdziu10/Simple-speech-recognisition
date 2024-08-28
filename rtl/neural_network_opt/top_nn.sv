module top_nn (
    input logic clk,
    input logic rst,
    input logic signed [15:0] input_vector [IN_SIZE_1-1:0],
    output logic [1:0] output_value 
);
    import nn_parameters::*;

    logic signed [23:0] dslayer1_output [OUT_SIZE_1-1:0];
    logic signed [31:0] dslayer2_output [OUT_SIZE_2-1:0];
    logic signed [39:0] dslayer3_output [OUT_SIZE_3-1:0];

dense_layer_1 u_dense_layer_1 (
    .clk,
    .rst,
    .input_vector(input_vector),
    .output_vector(dslayer1_output)
);

dense_layer_2 u_dense_layer_2 (
    .clk,
    .rst,
    .input_vector(dslayer1_output),
    .output_vector(dslayer2_output)
);

dense_layer_3 u_dense_layer_3 (
    .clk,
    .rst,
    .input_vector(dslayer2_output),
    .output_vector(dslayer3_output)
);

final_layer u_final_layer (
    .clk,
    .rst,
    .input_vector(dslayer3_output),
    .output_value(output_value)
);

endmodule
