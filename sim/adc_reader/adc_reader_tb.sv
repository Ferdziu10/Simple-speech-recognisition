`timescale 1ns / 1ps

module adc_reader_tb;


    // Testbench signals
    logic clk;
    logic rst;
    logic [11:0] adc_data;
    logic [11:0] data_out [0:255];

    // Instantiate the module under test (MUT)
    adc_reader mut (
        .clk(clk),
        .rst(rst),
        .adc_data(adc_data),
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
        $readmemh("../../python/generated_files/input_adcoff2.txt", adc_data);


        // Wait for the combinational logic to process the inputs
        #40000;
        // Display the results
        // Display the results
        $display("Input Vector: %p", adc_data);
        for (int j = 0; j < 256; j++) begin
            $display("output_vector[%0d]: %0d", j, output_vector[j]);
        end
        // End the simulation
        $stop;
        end


endmodule
