import nn_parameters::*;
module dense_layer_4 (
    input logic signed [7:0] input_vector [0:IN_SIZE_4-1],
    output logic [15:0] probabilities [0:OUT_SIZE_4-1]
);

    logic signed [7:0] weight_matrix [0:OUT_SIZE_4-1][0:IN_SIZE_4-1];
    logic signed [7:0] bias_vector [0:OUT_SIZE_4-1];
    logic [15:0] exp_lut [0:255];  // Example size, adjust as needed

    logic signed [15:0] logits [0:OUT_SIZE_4-1];
    logic [15:0] exp_values [0:OUT_SIZE_4-1];
    logic [15:0] sum_exp;

    integer i, j;
    
    // Load weights, biases, and LUT
    initial begin
        $readmemh(WEIGHTS_FILE_4, weight_matrix);
        $readmemh(BIAS_FILE_4, bias_vector);
        $readmemh(EXP_LUT_FILE, exp_lut);
    end

    always_comb begin
        // Compute logits
        for (i = 0; i < OUT_SIZE_4; i++) begin
            logits[i] = bias_vector[i];
            for (j = 0; j < IN_SIZE_4; j++) begin
                logits[i] = logits[i] + input_vector[j] * weight_matrix[i][j];
            end
        end
        
        // Compute exponentials using LUT
        for (i = 0; i < OUT_SIZE_4; i++) begin
            // For simplicity, assuming logits are in a suitable range for the LUT
            exp_values[i] = exp_lut[logits[i][15:8]];  // Adjust as necessary
        end

        // Compute sum of exponentials
        sum_exp = 0;
        for (i = 0; i < OUT_SIZE_4; i++) begin
            sum_exp = sum_exp + exp_values[i];
        end

        // Normalize to get probabilities
        for (i = 0; i < OUT_SIZE_4; i++) begin
            probabilities[i] = (exp_values[i] * 1000000) / sum_exp;  // Scale probabilities to [0, 1] range
        end
    end
endmodule
