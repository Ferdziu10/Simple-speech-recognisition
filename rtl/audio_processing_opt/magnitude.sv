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
    logic [MEL_DATA_WIDTH-1:0] x;      // approximation of root
    logic [MEL_DATA_WIDTH-1:0] x_next; // next approximation
    logic [MEL_DATA_WIDTH-1:0] error;  // diffrence beyond next approximation

    // config parameter for iteration of Newton-Raphson algorithm
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
            x = sum_squares;

            // Iterative process of Newton-Raphson algorithm
            for (int i = 0; i < ITERATIONS; i++) begin
                x_next = (x + sum_squares / x) >> 1; // x_next = (x + sum_squares / x) / 2
                error = (x > x_next) ? (x - x_next) : (x_next - x);
                if (error < 1) begin
                    break;
                end
                x = x_next;
            end
            magnitude = x;
        end
    end

endmodule