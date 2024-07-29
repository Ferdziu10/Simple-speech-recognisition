import nn_parameters::*;
module dropout_layer_1 (
    input logic [15:0] input_vector [OUT_SIZE_1-1:0],
    output logic [15:0] output_vector [OUT_SIZE_1-1:0]
);

    integer i;
    real random_value;

    always_comb begin
        for (i = 0; i < OUT_SIZE_1; i++) begin
            random_value = $random; // Generate a random value
            if (random_value < DROPOUT_RATE * 2**31) begin // Check against dropout rate
                output_vector[i] = 0; // Dropout
            end else begin
                output_vector[i] = input_vector[i]; // Pass through
            end
        end
    end
endmodule
