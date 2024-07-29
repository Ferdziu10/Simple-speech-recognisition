`timescale 1ns / 1ps
import nn_parameters::*;
module dense_layer_2_tb;

    // Parameters for the testbench (these should match the values in your `nn_parameters` package)
    parameter IN_SIZE_2 = 128;  // Example input size
    parameter OUT_SIZE_2 = 64;  // Example output size

    // Testbench signals
    logic signed [15:0] input_vector [0:IN_SIZE_2-1];
    logic [23:0] output_vector [0:OUT_SIZE_2-1];

    // Instantiate the module under test (MUT)
    dense_layer_2 mut (
        .input_vector(input_vector),
        .output_vector(output_vector)
    );

    initial begin
        // Initialize input vector with some values
        $readmemh("../../python/generated_files/input_dense2_hex.txt", input_vector);

        // Load weights, biases, and LUT
        $readmemh(WEIGHTS_FILE_2, mut.weight_matrix);
        $readmemh(BIAS_FILE_2, mut.bias_vector);

        // Wait for the combinational logic to process the inputs
        #10;

        // Display the results
        $display("Input Vector: %p", input_vector);
        for (int i = 0; i < OUT_SIZE_2; i++) begin
            $display("output_vector[%0d]: %0d", i, output_vector[i]);
        end

        // End the simulation
        $stop;
    end

endmodule
