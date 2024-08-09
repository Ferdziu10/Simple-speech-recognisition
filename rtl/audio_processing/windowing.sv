module windowing (
    input logic clk,
    input logic reset,
    input logic [11:0] frame_in [0:255],
    output logic [11:0] windowed_frame [0:255],
    input logic frame_ready,
    output logic window_ready
);

    // Hamming window coefficients in 12-bit fixed-point format
    logic [11:0] hamming_window [0:255];
    
    initial begin
        hamming_window[0] = 12'd2048; // Example values, actual precomputed values should be used
        hamming_window[1] = 12'd2050; // Populate the entire array with precomputed values
        // ... populate the rest of the array
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            window_ready <= 1'b0;
        end else if (frame_ready) begin
            for (integer i = 0; i < 256; i = i + 1) begin
                // 12-bit frame * 12-bit window = 24-bit result
                logic [23:0] mult_result;
                mult_result = frame_in[i] * hamming_window[i];

                // Right shift by 11 to get back to 12-bit
                windowed_frame[i] <= mult_result[22:11];
            end
            window_ready <= 1'b1;
        end else begin
            window_ready <= 1'b0;
        end
    end

endmodule
