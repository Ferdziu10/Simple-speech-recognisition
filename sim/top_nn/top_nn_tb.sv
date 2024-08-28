module top_nn_tb;

    // Parameters
    localparam IN_SIZE = 26;  


    // Testbench signals
    logic signed [15:0] input_vector [IN_SIZE-1:0];  // Unpacked array
    logic [1:0] output_value;  
    logic clk;
    logic rst;
    // Instantiate the top_nn module
    top_nn uut (
        .input_vector(input_vector),
        .output_value(output_value),
        .clk(clk),
        .rst(rst)
    );
    always #5 clk = ~clk;
    // Stimulus process
    initial begin
        clk = 0;
        rst = 0;

        #1000;
        rst = 1;
        #1000;
        rst = 0;
        // Initialize input_vector with values from a preprocessed WAV file
        $readmemh("../../python/generated_files/input_vectoroth3.mem", input_vector);

        // Wait for some time to observe output
        #100;
        #300000;
        // Display intermediate and output probabilities
        $display(" output_value: %p;; 0-nothing, 1-on, 2-off", output_value);

        // Finish simulation
        $stop;
    end

endmodule
