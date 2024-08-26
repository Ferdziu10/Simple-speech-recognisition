`timescale 1ns / 1ps
import nn_parameters::*;
module dense_layer_3_tb;

    // Parameters for the testbench (these should match the values in your `nn_parameters` package)
    parameter IN_SIZE_3 = 64;  // Example input size
    parameter OUT_SIZE_3 = 32;  // Example output size

    // Testbench signals
    logic clk;
    logic rst;
    logic signed [47:0] input_vector [IN_SIZE_3-1:0];
    logic signed [63:0] output_vector [OUT_SIZE_3-1:0];
    

    // Instantiate the module under test (MUT)
    dense_layer_3 mut (
        .input_vector(input_vector),
        .output_vector(output_vector),
        .clk(clk),
        .rst(rst)
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
        input_vector = {8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4, 8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4,8'd1, 8'd2, 8'd3, 8'd4 };

        // Load weights, biases, and LUT
        $readmemh(WEIGHTS_FILE_3, mut.weight_matrix);
        $readmemh(BIAS_FILE_3, mut.bias_vector);

        // Wait for the combinational logic to process the inputs
        #30000;

        // Display the results
        $display("Input Vector: %p", input_vector);
        for (int i = 0; i < OUT_SIZE_3; i++) begin
            $display("output_vector[%0d]: %0d", i, output_vector[i]);
        end

        // End the simulation
        $stop;
    end

endmodule
