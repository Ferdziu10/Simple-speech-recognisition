module framing (
    input logic clk,
    input logic rst,
    input logic [11:0] sample_in,
    output logic [11:0] frame_out [0:63],
    output logic frame_ready
);
    // Wewnetrzne logiki
    logic [11:0] frame_out_nxt [0:63];
    logic [11:0] buffer [0:63];
    logic [11:0] buffer_nxt [0:63];
    logic [7:0] index;
    logic [7:0] index_nxt;
    logic frame_ready_nxt;
    integer i, k;

    // Blok zegarowy (sekwencyjny)
    always_ff @(posedge clk) begin
        if (rst) begin
            index <= 8'd0;
            frame_ready <= 1'b0;
            for (i = 0; i < 64; i++) begin
                frame_out[i] <= 12'd0;
                buffer[i] <= 12'd0;
            end
        end else begin
            index <= index_nxt;
            frame_ready <= frame_ready_nxt;
            for (i = 0; i < 64; i++) begin
                frame_out[i] <= frame_out_nxt[i];
                buffer[i] <= buffer_nxt[i];
            end
        end
    end

    
    always_comb begin
        // Domyślne przypisania
        index_nxt = index;
        frame_ready_nxt = 1'b0;
        for (k = 0; k < 64; k++) begin
            buffer_nxt[k] = buffer[k];
            frame_out_nxt[k] = frame_out[k];
        end

        // Logika przetwarzania
        buffer_nxt[index] = sample_in; // Zapis próbki do bufora
        if (index == 8'd63) begin
            index_nxt = 8'd0;
            frame_ready_nxt = 1'b1;
            for (k = 0; k < 64; k++) begin
                frame_out_nxt[k] = buffer[k]; // Przypisanie bufora do wyjścia ramki
            end
        end else begin
            index_nxt = index + 8'd1; // Inkrementacja indeksu
        end
    end

endmodule
