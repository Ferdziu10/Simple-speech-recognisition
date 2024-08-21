module mel_filter_bank_wrapper #(
    parameter N = 256
) (
    input clk,
    input reset,
    input s_valid,
    input m_ready,
    output s_ready,
    output m_valid,
    input [15:0] in[N-1:0],
    output [15:0] out[40]
);

    logic [31:0] sample_in;    // 32-bit sample to feed into the mel_filter_bank
    logic [7:0] sample_index;  // Index to track which sample to feed next
    logic internal_m_valid;   // Internal valid signal from the mel_filter_bank

    // Instantiate the mel_filter_bank module
    mel_filter_bank #(.N(N)) filter_bank (
        .clk(clk),
        .reset(reset),
        .in(sample_in),
        .out(out),
        .s_valid(s_valid),
        .s_ready(s_ready),
        .m_valid(internal_m_valid),
        .m_ready(m_ready)
    );

    // Manage sample feeding
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sample_index <= 0;
            sample_in <= 0;
        end else if (s_ready && s_valid) begin
            sample_in <= {16'b0, in[sample_index]};  // Zero-extend the 16-bit input to 32-bit
            sample_index <= sample_index + 1;
            if (sample_index == (N-1)) begin
                sample_index <= 0;  // Reset index when all samples are fed
            end
        end
    end

    // Generate the output valid signal when the filter bank has processed all samples
    assign m_valid = (sample_index == (N-1)) ? internal_m_valid : 1'b0;

endmodule
