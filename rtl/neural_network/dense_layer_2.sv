import nn_parameters::*;

module dense_layer_2 (
    input logic signed [7:0] input_vector [0:IN_SIZE_2-1],
    output logic signed [7:0] output_vector [0:OUT_SIZE_2-1]
);


    logic signed [7:0] weight_matrix [0:OUT_SIZE_2-1][0:IN_SIZE_2-1];
    logic signed [7:0] bias_vector [0:OUT_SIZE_2-1];

    initial begin
        // Load weights from file
        $readmemh(WEIGHTS_FILE_2, weight_matrix);
        // Load biases from file
        $readmemh(BIAS_FILE_2, bias_vector);
    end

    integer i, j;
    always_comb begin
        for (i = 0; i < OUT_SIZE_2; i++) begin
            output_vector[i] = bias_vector[i];
            for (j = 0; j < IN_SIZE_2; j++) begin
                output_vector[i] = output_vector[i] + input_vector[j] * weight_matrix[i][j];
            end
            // ReLU activation function
            if (output_vector[i] < 0) output_vector[i] = 0;
        end
    end
endmodule
