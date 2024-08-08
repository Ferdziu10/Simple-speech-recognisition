module log_comput (
    input logic clk,
    input logic reset,
    input logic [15:0] mel_in [0:12],
    output logic [15:0] log_out [0:12],
    input logic mel_ready,
    output logic log_ready
);
    integer i;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            log_ready <= 1'b0;
        end else if (mel_ready) begin
            for (i = 0; i < 13; i = i + 1) begin
                log_out[i] <= $ln(mel_in[i]);
            end
            log_ready <= 1'b1;
        end else begin
            log_ready <= 1'b0;
        end
    end
endmodule
