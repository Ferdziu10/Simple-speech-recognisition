import nn_parameters::*;
module dropout_layer_3 (
    input clk,
    input rst,
    input logic signed [59:0] input_vector [OUT_SIZE_3-1:0],
    output logic signed [59:0] output_vector [OUT_SIZE_3-1:0]
);

    logic signed [59:0] output_vector_nxt [OUT_SIZE_3-1:0];

    integer i, k;
    real random_value;

    always_ff@(posedge clk) begin
        if (rst) begin
            for (k = 0; k < OUT_SIZE_3; k++) 
                output_vector[k] <= '0;
        end else begin
            for (k = 0; k < OUT_SIZE_3; k++) 
                output_vector[k] <= output_vector_nxt[k];
        end
    end

    always_comb begin
        for (i = 0; i < OUT_SIZE_3; i++) begin
            random_value = $random; // Generate a random value
            if (random_value < DROPOUT_RATE * 2**31) begin // Check against dropout rate
                output_vector_nxt[i] = 0; // Dropout
            end else begin
                output_vector_nxt[i] = input_vector[i]; // Pass through
            end
        end
    end
endmodule
