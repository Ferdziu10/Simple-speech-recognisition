module windowing (
    input logic clk,
    input logic reset,
    input logic [15:0] frame_in [0:255],
    output logic [15:0] windowed_frame [0:255],
    input logic frame_ready,
    output logic window_ready
);
    logic [15:0] hamming_window [0:255];
    integer i;

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            hamming_window[i] = 16'd32767 - (16'd32767 * $cos(2.0 * 3.141592653589 * i / 255.0));
        end
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            window_ready <= 1'b0;
        end else if (frame_ready) begin
            for (i = 0; i < 256; i = i + 1) begin
                windowed_frame[i] <= frame_in[i] * hamming_window[i] >>> 15;
            end
            window_ready <= 1'b1;
        end else begin
            window_ready <= 1'b0;
        end
    end
endmodule
