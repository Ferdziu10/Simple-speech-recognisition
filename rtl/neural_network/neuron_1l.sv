import nn_parameters::*;

module neuron_1l (
    input clk,
    input rst,
    input logic signed [7:0] input_vector [0:IN_SIZE_1-1],
    output logic signed [15:0] output_vector [0:OUT_SIZE_1-1]
);


    logic signed [7:0] weight_matrix [0:OUT_SIZE_1-1][0:IN_SIZE_1-1];
    logic signed [7:0] bias_vector [0:OUT_SIZE_1-1];
    logic signed [15:0] output_vector_nxt [0:OUT_SIZE_1-1];
    logic signed [7:0] i;
    logic signed [7:0] i_nxt;



    initial begin
        // Load weights from file
        $readmemh(WEIGHTS_FILE_1, weight_matrix);
        // Load biases from file
        $readmemh(BIAS_FILE_1, bias_vector);
    end

    integer i;
    always_ff @(posedge clk) begin
        if(rst)
            output_vector[j] <= '0;
            i <= '0;
        else 
            output_vector[j] <= output_vector_nxt[j];
            i <= i_nxt;
    end
    

    always_comb begin
        
        if (i_nxt < IN_SIZE_1) begin
            i_nxt = i + 1;
            for (j = 0; i < OUT_SIZE_2; j++) 
            output_vector_nxt[j] = output_vector[j] +  bias_vector[j] + input_vector[i] * weight_matrix[j][i];
        end else begin
            i_nxt = i;
            for (j = 0; i < OUT_SIZE_2; j++) 
            if (output_vector[j] < 0) 
            output_vector_nxt [j] = 0;
            else
            output_vector_nxt [j] = output_vector [j];
        end

        end
endmodule
