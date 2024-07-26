module top_nn (
    input logic signed [7:0] input_vector [0:IN_SIZE_1-1],
    output logic signed [15:0] output_probabilities [0:OUT_SIZE_4-1]
);
    import nn_parameters::*;

    logic signed [7:0] dslayer1_output [0:OUT_SIZE_1-1];
    logic signed [7:0] dplayer1_output [0:OUT_SIZE_1-1];
    logic signed [7:0] dslayer2_output [0:OUT_SIZE_2-1];
    logic signed [7:0] dplayer2_output [0:OUT_SIZE_2-1];
    logic signed [7:0] dslayer3_output [0:OUT_SIZE_3-1];
    logic signed [7:0] dplayer3_output [0:OUT_SIZE_3-1];

    // Instantiate Dense Layers
dense_layer_1 u_dense_layer_1 (
    .input_vector(input_vector),
    .output_vector(dslayer1_output)
);

dropout_layer_1 u_dropout_layer_1 (
    .input_vector(dslayer1_output),
    .output_vector(dplayer1_output)
);

dense_layer_2 u_dense_layer_2 (
    .input_vector(dplayer1_output),
    .output_vector(dplayer2_output)
);

dropout_layer_2 u_dropout_layer_2 (
    .input_vector(dplayer2_output),
    .output_vector(dslayer2_output)
);

dense_layer_3 u_dense_layer_3 (
    .input_vector(dslayer2_output),
     .output_vector(dslayer3_output)
);

dropout_layer_3 u_dropout_layer_3 (
    .input_vector(dslayer3_output),
    .output_vector(dplayer3_output)
);

dense_layer_4 u_dense_layer_4 (
    .input_vector(dplayer3_output),
    .probabilities(output_probabilities)
);


endmodule
