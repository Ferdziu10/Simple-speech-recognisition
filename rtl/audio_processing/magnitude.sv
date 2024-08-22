module magnitude(
    input  logic [15:0] real_part,   // 16-bitowa część rzeczywista
    input  logic [15:0] imag_part,   // 16-bitowa część urojona
    output logic [31:0] magnitude    // 32-bitowy wynik (moduł)
);

    // Zmienne pomocnicze do przechowywania kwadratów i sumy kwadratów
    logic [31:0] real_squared;
    logic [31:0] imag_squared;
    logic [31:0] sum_squares;

    // Zmienne pomocnicze do algorytmu Newtona-Raphsona
    logic [31:0] x;      // Przybliżenie pierwiastka
    logic [31:0] x_next; // Następne przybliżenie
    logic [31:0] error;  // Różnica między kolejnymi przybliżeniami

    // Parametr konfiguracyjny określający liczbę iteracji algorytmu Newtona-Raphsona
    localparam int ITERATIONS = 10;

    // Obliczanie kwadratów i sumy kwadratów części rzeczywistej i urojonej
    always_comb begin
        if( real_part == 0 && imag_part == 0)
            magnitude = 0;
        else if(real_part == 0)
            magnitude = imag_part;
        else if(imag_part == 0)
            magnitude = real_part;
        else begin
            real_squared = real_part * real_part;
            imag_squared = imag_part * imag_part;
            sum_squares  = real_squared + imag_squared;
            //magnitude    = $sqrt(sum_squares);  // Obliczanie pierwiastka kwadratowego z sumy kwadratów

            // Inicjalizacja przybliżenia
            x = sum_squares;

            // Iteracyjny proces algorytmu Newtona-Raphsona
            for (int i = 0; i < ITERATIONS; i++) begin
                x_next = (x + sum_squares / x) >> 1; // x_next = (x + sum_squares / x) / 2
                error = (x > x_next) ? (x - x_next) : (x_next - x);

                // Jeżeli różnica między kolejnymi przybliżeniami jest mała, można przerwać iterację
                if (error < 1) begin
                    break;
                end
                x = x_next;
            end
        

        // Wynik końcowy to przybliżone x po zakończeniu iteracji
        magnitude = x;
        end
    end

endmodule