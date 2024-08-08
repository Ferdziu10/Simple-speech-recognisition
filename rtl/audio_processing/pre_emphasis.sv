module pre_emphasis (
    input logic clk,
    input logic rst,
    input logic [15:0] sample_in,
    output logic [15:0] sample_out
);
    logic [15:0] prev_sample;
    logic [15:0] prev_sample_nxt;
    logic [15:0] sample_out_nxt;

    always_ff @(posedge clk) begin
        if (rst) begin
            prev_sample <= 16'd0;
            sample_out <= 16'd0;
        end else begin
            sample_out <= sample_out_nxt;
            prev_sample <= prev_sample_nxt;
        end
    end
    always_comb begin
        sample_out_nxt = sample_in - (prev_sample >>> 1);
        prev_sample_nxt = sample_in;
    end
endmodule
