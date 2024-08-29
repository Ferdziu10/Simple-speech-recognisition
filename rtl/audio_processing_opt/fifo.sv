module fifo (
    input  logic clk,
    input  logic rst,
    input  logic valid,           // Wejście valid
    input  logic [15:0] data_in1, // Pierwsze dane wejściowe
    input  logic [15:0] data_in2, // Drugie dane wejściowe
    output logic [15:0] data_out [25:0] // Wyjście: 26 16-bitowych danych
);

    // Deklaracja rejestrów FIFO
    logic [15:0] fifo_mem [25:0];
    
    // Wskaźniki głowy i ogona FIFO
    logic [4:0] head;
    logic [4:0] head_nxt;
    
    
    // Proces zapisu do FIFO
    always_ff @(posedge clk) begin
        if (rst) begin
            head <= '0;
            // Pętla zerująca rejestry FIFO
            for (int i = 0; i < 26; i++) begin
                data_out[i] <= 16'h0000;
            end

        end else  begin
            for (int i = 0; i < 26; i++) begin
                data_out[i] <= fifo_mem[(i + head) % 26];
            end
            head <= head_nxt;
        end
    end

    always_comb begin
            if (valid) begin
            // Zapis pierwszych danych do FIFO
            fifo_mem[head] <= data_in1;
            // Zapis drugich danych do FIFO
            fifo_mem[head+1] <= data_in2;
            head_nxt <= (head + 2) % 26;
        end else begin
            for (int i = 0; i < 26; i++) begin
                fifo_mem[i] <= data_out[i];
            end
            head_nxt <= head;
        end
    end



endmodule