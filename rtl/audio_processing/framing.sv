module framing (
    input logic clk,
    input logic rst,
    input logic [11:0] sample_in,
    output logic [11:0] frame_out [0:255],
    output logic frame_ready
);
    logic [11:0] frame_out_nxt [0:255];
    logic [11:0] buffer [0:255];
    logic [11:0] buffer_nxt [0:255];
    logic [7:0] index;
    logic [7:0] index_nxt;
    logic frame_ready_nxt;
    integer i, k;

    always_ff @(posedge clk) begin
        if (rst) begin
            index <= 8'd0;
            frame_ready <= 1'b0;
            for (i = 0; i < 256; i++) begin
                frame_out [i] <= 8'd0;
                buffer [i] <= 8'd0;
            end
        end else begin
            index <= index_nxt;
            frame_ready <= frame_ready_nxt;
            for (i = 0; i < 256; i++) begin
                frame_out [i] <= frame_out_nxt [i];
                buffer [i] <= buffer_nxt [i];
            end
        end
    end
    always_comb begin
        buffer_nxt[index] <= sample_in;
        if (index == 8'd255) begin
            index_nxt = 8'd0;
            frame_ready_nxt = 1'b1;
            for (k = 0; k < 256; k++) begin
                frame_out_nxt[k] <= buffer[k];
            end
        end else begin
            index_nxt <= index + 8'd1;
            frame_ready_nxt <= 1'b0;
        end
    end


endmodule
