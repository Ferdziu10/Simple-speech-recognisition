module dense_layer_4_tb;

    // Parameters
    parameter IN_SIZE_4 = 8;
    parameter OUT_SIZE_4 = 3;
    
    // Testbench Signals
    logic signed [7:0] input_vector [0:IN_SIZE_4-1];
    logic [15:0] probabilities [0:OUT_SIZE_4-1];
    
    // Instantiate the dense layer module
    dense_layer_4 #(
        .IN_SIZE_4(IN_SIZE_4),
        .OUT_SIZE_4(OUT_SIZE_4)
    ) dut (
        .input_vector(input_vector),
        .probabilities(probabilities)
    );
    
    // Clock and Reset signals if needed
    // logic clk, reset;
    
    // Initial block for test stimulus
    initial begin
        // Initialize inputs
        input_vector[0] = 8'sd1;
        input_vector[1] = 8'sd2;
        input_vector[2] = 8'sd3;
        input_vector[3] = 8'sd4;
        input_vector[4] = 8'sd5;
        input_vector[5] = 8'sd6;
        input_vector[6] = 8'sd7;
        input_vector[7] = 8'sd8;
        
        // Apply stimulus
        #10;  // Wait for 10 time units
        
        // Add more test cases as needed

        // Finish simulation
        #100;
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("At time %0t, Probabilities: %p", $time, probabilities);
    end
    
endmodule
