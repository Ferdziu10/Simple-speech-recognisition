module fifo (
    input  logic clk,
    input  logic rst,
    input  logic valid,          
    input  logic [NN_DATA_WIDTH-1:0] data_in1, 
    input  logic [NN_DATA_WIDTH-1:0] data_in2, 
    output logic [NN_DATA_WIDTH-1:0] data_out [NN_ARRAY_WIDTH-1:0] 
);

    // Deklaracja rejestrów FIFO
    logic [15:0] fifo_mem [25:0];
    
    // Wskaźniki głowy i ogona FIFO
    logic [4:0] head;
    logic [4:0] tail;
    
    // Licznik elementów w FIFO
    logic [5:0] counter;
    
    // Proces zapisu do FIFO
    always_ff @(posedge clk) begin
        if (rst) begin
            head <= 0;
            tail <= 0;
            counter <= 0;

            // Pętla zerująca rejestry FIFO
            for (int i = 0; i < 26; i++) begin
                fifo_mem[i] <= 16'h0000;
            end

        end else if (valid) begin
            // Zapis pierwszych danych do FIFO
            fifo_mem[head] <= data_in1;
            head <= (head + 1) % 26;

            // Zapis drugich danych do FIFO
            fifo_mem[head] <= data_in2;
            head <= (head + 1) % 26;

            // Aktualizacja licznika elementów
            if (counter < 25) begin
                counter <= counter + 2;
            end else begin
                tail <= (tail + 2) % 26;  // Przesunięcie wskaźnika ogona w przypadku pełnego FIFO
            end
        end
    end

    // Proces odczytu z FIFO na wyjście
    always_ff @(posedge clk) begin
        if (rst) begin
            // Pętla zerująca wyjścia
            for (int i = 0; i < 26; i++) begin
                data_out[i] <= 16'h0000;
            end
        end else begin
            // Kopiowanie danych z FIFO na wyjścia w kolejności od najstarszej do najmłodszej
            for (int i = 0; i < 26; i++) begin
                data_out[i] <= fifo_mem[(i + tail) % 26];
            end
        end
    end

endmodule