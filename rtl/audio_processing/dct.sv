module dct (
    input logic clk,
    input logic reset,
    input logic [15:0] log_in [0:12],
    output logic [15:0] mfcc_out [0:12],
    input logic log_ready,
    output logic dct_ready
);
    integer i, j;
    logic [15:0] dct_coeff [0:12][0:12];

    // Initialize DCT coefficients
    initial begin
        for (i = 0; i < 13; i = i + 1) begin
            for (j = 0; j < 13; j = j + 1) begin
                dct_coeff[i][j] = $cos(3.141592653589 * i * (2 * j + 1) / 26);
            end
        end
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            dct_ready <= 1'b0;
        end else if (log_ready) begin
            for (i = 0; i < 13; i = i + 1) begin
                mfcc_out[i] = 16'd0;
                for (j = 0; j < 13; j = j + 1) begin
                    mfcc_out[i] = mfcc_out[i] + log_in[j] * dct_coeff[i][j];
                end
            end
            dct_ready <= 1'b1;
        end else begin
            dct_ready <= 1'b0;
        end
    end
endmodule
