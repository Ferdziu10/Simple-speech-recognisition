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
    input logic clk,
    input logic rst,
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
    logic [MEL_DATA_WIDTH-1:0] real_squared_nxt;
    logic [MEL_DATA_WIDTH-1:0] imag_squared_nxt;
    logic [MEL_DATA_WIDTH-1:0] sum_squares_nxt;
    logic [MEL_DATA_WIDTH-1:0] magnitude_nxt;
    logic [MEL_DATA_WIDTH-1:0] x;      // approximation of root
    logic [MEL_DATA_WIDTH-1:0] x_next; // next approximation
    logic [MEL_DATA_WIDTH-1:0] error;  // diffrence beyond next approximation

    // config parameter for iteration of Newton-Raphson algorithm
    localparam int ITERATIONS = 2;

//------------------------------------------------------------------------------
// output register with sync reset
//------------------------------------------------------------------------------
    always_ff@(posedge clk) begin
        if (rst) begin
            magnitude <= '0;
            real_squared <= '0;
            imag_squared <= '0;
            sum_squares <= '0;
        end else begin
            magnitude <= magnitude_nxt;
            real_squared <= real_squared_nxt;
            imag_squared <= imag_squared_nxt;
            sum_squares <= sum_squares_nxt;
        end
    end

//------------------------------------------------------------------------------
// logic
//------------------------------------------------------------------------------j
    always_comb begin
        if( real_part == 0 && imag_part == 0)
            magnitude_nxt = 0;
            real_squared_nxt = real_squared;
            imag_squared_nxt = imag_squared;
            sum_squares_nxt = sum_squares;
        else if(real_part == 0)
            magnitude_nxt = imag_part;
            real_squared_nxt = real_squared;
            imag_squared_nxt = imag_squared;
            sum_squares_nxt = sum_squares;
        else if(imag_part == 0)
            magnitude_nxt = real_part;
            real_squared_nxt = real_squared;
            imag_squared_nxt = imag_squared;
            sum_squares_nxt = sum_squares;
        else begin
            real_squared_nxt = real_part * real_part;
            imag_squared_nxt = imag_part * imag_part;
            sum_squares_nxt  = real_squared + imag_squared;
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
            magnitude_nxt = x;
        end
    end

endmodule