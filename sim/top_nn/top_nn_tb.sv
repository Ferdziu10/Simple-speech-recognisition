module top_nn_tb;

    // Parameters
    localparam IN_SIZE = 26;   // Adjust to your actual input size
    localparam OUT_SIZE = 3;    // Adjust to your actual output size

    // Testbench signals
    logic signed [7:0] input_vector [0:IN_SIZE-1];  // Unpacked array
    logic [255:0] output_probabilities [0:OUT_SIZE-1];  // Unpacked array

    // Instantiate the top_nn module
    top_nn uut (
        .input_vector(input_vector),
        .output_probabilities(output_probabilities)
    );

    // Stimulus process
    initial begin
        // Initialize input_vector with values from a preprocessed WAV file
        $readmemh("../../python/generated_files/input_vectoroth.mem", input_vector);

        // Wait for some time to observe output
        #100;
        
        // Display intermediate and output probabilities
        $display("Output Probabilities:");
        for (int i = 0; i < OUT_SIZE; i++) begin
            $display("Probability[%0d] = %0d", i, output_probabilities[i]);
        end

        // Finish simulation
        $stop;
    end

endmodule
