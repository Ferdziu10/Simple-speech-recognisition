`timescale 1ns / 1ps
import nn_parameters::*;
module dense_layer_4_tb;

    // Parameters for the testbench (these should match the values in your `nn_parameters` package)
    parameter IN_SIZE_4 = 32;  // Example input size
    parameter OUT_SIZE_4 = 3;  // Example output size

    // Testbench signals
    logic signed [7:0] input_vector [0:IN_SIZE_4-1];
    logic [15:0] probabilities [0:OUT_SIZE_4-1];

    // Instantiate the module under test (MUT)
    dense_layer_4 mut (
        .input_vector(input_vector),
        .probabilities(probabilities)
    );

    initial begin
        // Initialize input vector with some values
        input_vector = '{8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4 };

        // Load weights, biases, and LUT
        $readmemh(WEIGHTS_FILE_4, mut.weight_matrix);
        $readmemh(BIAS_FILE_4, mut.bias_vector);
        $readmemh(EXP_LUT_FILE, mut.exp_lut);

        // Wait for the combinational logic to process the inputs
        #10;

        // Display the results
        $display("Input Vector: %p", input_vector);
        for (int i = 0; i < OUT_SIZE_4; i++) begin
            $display("Probability[%0d]: %0d", i, probabilities[i]);
        end

        // End the simulation
        $stop;
    end

endmodule
