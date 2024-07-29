import nn_parameters::*;
module dropout_layer_2 (
    input logic [23:0] input_vector [OUT_SIZE_2-1:0],
    output logic [23:0] output_vector [OUT_SIZE_2-1:0]
);

    integer i;
    real random_value;

    always_comb begin
        for (i = 0; i < OUT_SIZE_2; i++) begin
            random_value = $random; // Generate a random value
            if (random_value < DROPOUT_RATE * 2**31) begin // Check against dropout rate
                output_vector[i] = 0; // Dropout
            end else begin
                output_vector[i] = input_vector[i]; // Pass through
            end
        end
    end
endmodule
