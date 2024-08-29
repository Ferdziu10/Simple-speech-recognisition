//////////////////////////////////////////////////////////////////////////////
/*
 Module name:   magnitude
 Authors:       Kacper Ferdek, Mateusz Gibas
 Version:       1.0
 Last modified: 2024-08-29
 Coding style: safe, with FPGA sync reset
 Description:  Calculating magnitude from real part and imaginaris part of fft
 */
//////////////////////////////////////////////////////////////////////////////
import ap_parameters::*;
module magnitude(
    input  logic [FFT_DATA_WIDTH-1:0] real_part,   // 16-bitowa część rzeczywista
    input  logic [FFT_DATA_WIDTH-1:0] imag_part,   // 16-bitowa część urojona
    output logic [MEL_DATA_WIDTH-1:0] magnitude    // 32-bitowy wynik (moduł)
);

//------------------------------------------------------------------------------
// local variables
//------------------------------------------------------------------------------
    logic [MEL_DATA_WIDTH-1:0] real_squared;
    logic [MEL_DATA_WIDTH-1:0] imag_squared;
    logic [MEL_DATA_WIDTH-1:0] sum_squares;
    logic [MEL_DATA_WIDTH-1:0] x;      // Przybliżenie pierwiastka
    logic [MEL_DATA_WIDTH-1:0] x_next; // Następne przybliżenie
    logic [MEL_DATA_WIDTH-1:0] error;  // Różnica między kolejnymi przybliżeniami

    // Parametr konfiguracyjny określający liczbę iteracji algorytmu Newtona-Raphsona
    localparam int ITERATIONS = 2;

//------------------------------------------------------------------------------
// logic
//------------------------------------------------------------------------------j
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