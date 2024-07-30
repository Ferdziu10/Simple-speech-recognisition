`timescale 1ns / 1ps
import nn_parameters::*;
module neuron_1l_tb;

    // Parameters for the testbench (these should match the values in your `nn_parameters` package)
    parameter IN_SIZE_1 = 26;  // Example input size
    parameter OUT_SIZE_1 = 128;  // Example output size

    // Testbench signals
    logic clk;
    logic rst;
    logic signed [7:0] input_vector [0:IN_SIZE_1-1];
    logic [15:0] output_vector;

    // Instantiate the module under test (MUT)
    neuron_1l mut (
        .clk(clk),
        .rst(rst),
        .input_vector(input_vector),
        .output_vector(output_vector)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 0;

        #10;
        rst = 1;
        #10;
        rst = 0;
        // Initialize input vector with some values
        $readmemh("../../python/generated_files/input_vectoron.mem", input_vector);

        // Load weights, biases, and LUT
        $readmemh(WEIGHTS_FILE_1, mut.weight_matrix);
        $readmemh(BIAS_FILE_1, mut.bias_vector);

        // Wait for the combinational logic to process the inputs
        #10;
        // Display the results
        $display("Input Vector: %p", input_vector);
        $display("output_vector: %p", output_vector);
        

        // End the simulation
        $stop;
        end


endmodule
