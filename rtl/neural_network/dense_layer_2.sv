import nn_parameters::*;

module dense_layer_2 (
    input clk,
    input rst,
    input logic signed [23:0] input_vector [IN_SIZE_2-1:0],
    output logic signed [31:0] output_vector [OUT_SIZE_2-1:0]
);


    logic signed [7:0] weight_matrix [IN_SIZE_2-1:0][OUT_SIZE_2-1:0];
    logic signed [7:0] bias_vector [OUT_SIZE_2-1:0];
    logic signed [31:0] output_vector_nxt [OUT_SIZE_2-1:0];
    logic [7:0] i;
    logic [7:0] i_nxt;

    integer j, k;

    assign weight_matrix = WEIGHTS_FILE_2;
    assign bias_vector = BIAS_FILE_2;

    
    always_ff @(posedge clk) begin
        if(rst) begin
            for (k = 0; k < OUT_SIZE_2; k++) 
            output_vector[k] <= '0;
            i <= '0;
        end else begin
            for (k = 0; k < OUT_SIZE_2; k++)
            output_vector[k] <= output_vector_nxt[k];
            i <= i_nxt;
    end
    end
    

    always_comb begin
        if (i < IN_SIZE_2) begin
            i_nxt = i + 1;
            for (j = 0; j < OUT_SIZE_2; j++) 
            output_vector_nxt[j] = output_vector[j] +  bias_vector[j] + input_vector[i] * weight_matrix[i][j];
        end else begin
            i_nxt = i;
            for (j = 0; j < OUT_SIZE_2; j++) begin
                if (output_vector[j] < 0) 
                    output_vector_nxt [j] = 0;
                else
                    output_vector_nxt [j] = output_vector [j];
            end
        end

        end
endmodule
