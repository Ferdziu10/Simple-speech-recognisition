`timescale 1ns / 1ps

module filter_bank_v2#(parameter N = 256)(
    input clk,
    input reset,
    input [31:0] in,
    output [15:0] out[40]
    );
    
    // Przykładowe wartości filt_shift_reg dla N = 256
    logic[15:0] filt_shift_reg[N] = { /* wartości inicjalizujące */ };
    
    logic [15:0] filt;                // Współczynnik do pomnożenia z aktualnym wejściem
    logic [15:0] bank_shift_reg[40];  // Rejestr przesuwny dla energii banku filtra (w dB)
    logic [5:0] d_counter;
    logic [5:0] q_counter;            // Licznik do śledzenia przetwarzania
    logic [31:0] q_in;                // Zopóźnione wejście dla przetwarzania potokowego
    logic [31:0] product[2];          // Wynik mnożenia potokowego
    logic [31:0] inverse[2];          // in - scaled_product
    logic [31:0] q_ascending;
    logic [31:0] d_ascending;
    logic [31:0] q_descending;
    logic [31:0] d_descending;        // Wstępujące i opadające boczne widma banków filtrów
    logic [31:0] accumulation;        // Akumulacja do oszczędzania jednego sumatora
    logic [15:0] dB;                  // Zapis energii spektralnej w dB
    logic new_window[3];              // Wskaźnik początku/końca/środka banku filtrów

    assign filt = filt_shift_reg[0];
    assign new_window[0] = (filt == 16'd32768);

    assign inverse[0] = q_in - product[0];
    assign accumulation = q_ascending + product[1];
    
    assign out = bank_shift_reg;
    
    dB_LUT dB_calculator(
        .in(q_descending), 
        .out(dB), 
        .on(new_window[2])
    );

    mult_gen_1 mult_im (
        .CLK(clk),  
        .A(in),      
        .B(filt),    
        .P(product[0]) 
    );
    
    always_comb begin        
        if (new_window[2]) begin
            d_ascending = 0;
            d_descending = accumulation;
            d_counter = q_counter + 1;
        end else begin
            d_ascending = accumulation;
            d_descending = q_descending + inverse[1];
            d_counter = q_counter;
        end
    end
    
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            q_in <= 0;
            new_window[1:2] <= {0, 0};
            product[0:1] <= {0, 0};
            inverse[1] <= 0;
            q_counter <= 0;
            q_ascending <= 0;
            q_descending <= 0;
        end else begin
            q_in <= in;
            new_window[1:2] <= new_window[0:1];
            product[1] <= product[0];
            inverse[1] <= inverse[0];
            q_counter <= d_counter;
            q_ascending <= d_ascending;
            q_descending <= d_descending;
        
            // Przesunięcie rejestru filt
            filt_shift_reg[N-1] <= filt_shift_reg[0];
            filt_shift_reg[0:N-2] <= filt_shift_reg[1:N-1];
            
            // Przesunięcie banku rejestru
            if (new_window[2]) begin
                bank_shift_reg[39] <= dB;
                bank_shift_reg[0:38] <= bank_shift_reg[1:39];
            end
        end
    end
endmodule