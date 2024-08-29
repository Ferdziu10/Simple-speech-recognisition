module mean_std (
    input logic clk,
    input logic rst,
    input logic valid_in,
    input logic [15:0] data_in [0:19],
    output logic [15:0] mean,
    output logic [15:0] std,
    output logic valid_out
);

    // Zmienne pomocnicze
    logic [31:0] sum_nxt;
    logic [31:0] sum_sq_nxt;
    logic [31:0] mean_nxt;
    logic [31:0] variance_nxt;
    logic [15:0] stddev_nxt;
    logic [15:0] guess, guess_next;
    logic [31:0] difference;
    logic [15:0] i;
    logic valid_nxt;
    logic converged;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            valid_out  <= 0;
            mean <= 0;
            std <= 0;
        end else begin
            // Zapisanie wyników na wyjściu
            mean <= mean_nxt[15:0];    // Zapisujemy obliczoną srednia
            std <= stddev_nxt;  // Zapisujemy obliczone odchyleneis tandardwoe
            valid_out <= valid_nxt;
        end
    end

    always_comb begin
        valid_nxt = valid_in;
        sum_nxt = 0;
        sum_sq_nxt = 0;

        // Obliczanie sumy wszystkich wartości
        for (i = 0; i < 20; i = i + 1) begin
            sum_nxt = sum_nxt + data_in[i];
        end

        // Obliczanie średniej
        mean_nxt = sum_nxt / 20;

        // Obliczanie sumy kwadratów różnic od średniej
        for (i = 0; i < 20; i = i + 1) begin
            sum_sq_nxt = sum_sq_nxt + (data_in[i] - mean_nxt) * (data_in[i] - mean_nxt);
        end

        // Obliczanie wariancji
        variance_nxt = sum_sq_nxt / 20;

        // Obliczanie odchylenia standardowego
        //stddev_nxt = $clog2(variance_nxt);
        // Algorytm Newtona-Raphsona w pełni kombinacyjny
        guess = variance_nxt >> 1;  // Początkowe przybliżenie
        converged = 0;

        for (i = 0; i < 8; i = i + 1) begin
            if (!converged && guess != 0) begin
                guess_next = (guess + variance_nxt / guess) >> 1;

                // Sprawdzenie, czy algorytm się zbiega
                difference = guess > guess_next ? guess - guess_next : guess_next - guess;
                if (difference < 2) begin
                    converged = 1;
                end else begin
                    guess = guess_next;
                end
            end
        end

        stddev_nxt = guess;
    end


endmodule
