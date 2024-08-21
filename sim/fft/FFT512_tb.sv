`timescale 1ns / 1ps

module FFT256_tb;

    parameter WIDTH = 16;

    // Testbench signals
    logic                clock;
    logic                reset;
    logic                di_en;
    logic [WIDTH-1:0]    di_re;
    logic [WIDTH-1:0]    di_im;
    logic                do_en;
    logic [WIDTH-1:0]    do_re;
    logic [WIDTH-1:0]    do_im;

    // Instantiate the FFT256 module
    FFT256 #(.WIDTH(WIDTH)) DUT (
        .clock(clock),
        .reset(reset),
        .di_en(di_en),
        .di_re(di_re),
        .di_im(di_im),
        .do_en(do_en),
        .do_re(do_re),
        .do_im(do_im)
    );

    // Clock generation
    always #5 clock = ~clock;

    // Test vectors
    logic [WIDTH-1:0] test_input_re [0:255];
    logic [WIDTH-1:0] test_input_im [0:255];
    logic [WIDTH-1:0] expected_output_re [0:255];
    logic [WIDTH-1:0] expected_output_im [0:255];

    integer i;

    initial begin
        // Initialize signals
        clock = 0;
        reset = 1;
        di_en = 0;
        di_re = 0;
        di_im = 0;

        // Load test vectors (example: sine wave input)
        // These values should be calculated using an external FFT tool or software
        // Here we are just initializing them to some example values for demonstration
        for (i = 0; i < 256; i = i + 1) begin
            test_input_re[i] = i;   // Example data, replace with actual data
            test_input_im[i] = 0;   // Example data, replace with actual data
            expected_output_re[i] = i;  // Expected FFT output, replace with actual expected values
            expected_output_im[i] = 0;  // Expected FFT output, replace with actual expected values
        end

        // Release reset
        #15 reset = 0;

        // Apply input data
        for (i = 0; i < 256; i = i + 1) begin
            #10;
            di_en = 1;
            di_re = test_input_re[i];
            di_im = test_input_im[i];
        end
        di_en = 0;

        // Wait for FFT output
        #5000;

        // Check output data
        for (i = 0; i < 256; i = i + 1) begin
            #10;
            if (do_en) begin
                if (do_re !== expected_output_re[i] || do_im !== expected_output_im[i]) begin
                    $display("ERROR: Output mismatch at index %d: Expected (%d, %d), Got (%d, %d)",
                        i, expected_output_re[i], expected_output_im[i], do_re, do_im);
                end else begin
                    $display("PASS: Output match at index %d: (%d, %d)",
                        i, do_re, do_im);
                end
            end
        end

        // End simulation
        $finish;
    end
endmodule