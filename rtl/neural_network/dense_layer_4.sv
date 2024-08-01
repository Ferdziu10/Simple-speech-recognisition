import nn_parameters::*;
module dense_layer_4 (
    input clk,
    input rst,
    input logic signed [55:0] input_vector [0:IN_SIZE_4-1],
    output logic signed [71:0] output_vector [0:OUT_SIZE_4-1]
);

    logic signed [15:0] weight_matrix [0:IN_SIZE_4-1][0:OUT_SIZE_4-1];
    logic signed [15:0] bias_vector [0:OUT_SIZE_4-1];

    logic signed [71:0] output_vector_nxt [0:OUT_SIZE_4-1];
    logic [7:0] i;
    logic [7:0] i_nxt;

    integer j, k;
    
    // Load weights, biases, and LUT
    initial begin
        $readmemh(WEIGHTS_FILE_4, weight_matrix);
        $readmemh(BIAS_FILE_4, bias_vector);
    end


    always_ff @(posedge clk) begin
        if(rst) begin
            for (k = 0; k < OUT_SIZE_4; k++) 
            output_vector[k] <= '0;
            i <= '0;
        end else begin
            for (k = 0; k < OUT_SIZE_4; k++)
            output_vector[k] <= output_vector_nxt[k];
            i <= i_nxt;
    end
    end

    always_comb begin
        // Compute logits
        if (i < IN_SIZE_4) begin
            i_nxt = i + 1;
            for (j = 0; j < OUT_SIZE_4; j++) 
            output_vector_nxt[j] = output_vector[j] +  bias_vector[j] + input_vector[i] * weight_matrix[i][j];
        end else begin
            i_nxt = i;
            output_vector_nxt[j] = output_vector[j];
        end
    end
endmodule
