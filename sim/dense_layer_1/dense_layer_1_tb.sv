`timescale 1ns / 1ps
import nn_parameters::*;
module dense_layer_1_tb;

    // Parameters for the testbench (these should match the values in your `nn_parameters` package)
    parameter IN_SIZE_1 = 26;  // Example input size
    parameter OUT_SIZE_1 = 32;  // Example output size

    // Testbench signals
    logic clk;
    logic rst;
    logic signed [15:0] input_vector [IN_SIZE_1-1:0];
    logic signed [23:0] output_vector [OUT_SIZE_1-1:0];

    // Instantiate the module under test (MUT)
    dense_layer_1 mut (
        .clk(clk),
        .rst(rst),
        .input_vector(input_vector),
        .output_vector(output_vector)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 0;

        #1000;
        rst = 1;
        #1000;
        rst = 0;
        // Initialize input vector with some values
        $readmemh("../../python/generated_files/input_vectoroth.mem", input_vector);

        // Load weights, biases, and LUT

        // Wait for the combinational logic to process the inputs
        #40000;
        // Display the results
        // Display the results
        $display("Input Vector: %p", input_vector);
        for (int j = 0; j < OUT_SIZE_1; j++) begin
            $display("output_vector[%0d]: %0d", j, output_vector[j]);
        end
        // End the simulation
        $stop;
        end


endmodule
