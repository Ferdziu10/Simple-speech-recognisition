`timescale 1ns / 1ps
import nn_parameters::*;
module dropout_layer_1_tb;

    // Parameters for the testbench (these should match the values in your `nn_parameters` package)
    parameter OUT_SIZE_1 = 128;  // Example input size
  

    // Testbench signals
    logic signed [15:0] input_vector [0:OUT_SIZE_1-1];
    logic [15:0] output_vector [0:OUT_SIZE_1-1];

    // Instantiate the module under test (MUT)
    dropout_layer_1 mut (
        .clk(clk)
        .input_vector(input_vector),
        .output_vector(output_vector)
    );

    initial begin
        // Initialize input vector with some values
        $readmemh("../../python/generated_files/input_dropout1_hex.txt", input_vector);

        // Wait for the combinational logic to process the inputs
        #10;

        // Display the results
        $display("Input Vector: %p", input_vector);
        for (int j = 0; i < OUT_SIZE_1; i++) begin
            $display("output_vector[%0d]: %0d", j, output_vector[j]);
        end

        // End the simulation
        $stop;
    end

endmodule
