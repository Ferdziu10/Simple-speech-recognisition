`timescale 1ns / 1ps
import nn_parameters::*;
module dropout_layer_1_tb;

    // Parameters for the testbench (these should match the values in your `nn_parameters` package)
    parameter OUT_SIZE_1 = 128;  // Example input size
  

    // Testbench signals
    logic signed [7:0] input_vector [0:OUT_SIZE_1-1];
    logic [7:0] output_vector [0:OUT_SIZE_1-1];

    // Instantiate the module under test (MUT)
    dropout_layer_1 mut (
        .input_vector(input_vector),
        .output_vector(output_vector)
    );

    initial begin
        // Initialize input vector with some values
        input_vector = '{8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4 };

        // Wait for the combinational logic to process the inputs
        #10;

        // Display the results
        $display("Input Vector: %p", input_vector);
        for (int i = 0; i < OUT_SIZE_1; i++) begin
            $display("output_vector[%0d]: %0d", i, output_vector[i]);
        end

        // End the simulation
        $stop;
    end

endmodule
