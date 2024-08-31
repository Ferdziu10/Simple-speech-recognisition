`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////
/*
 Module name:   FFT64_tb
 Authors:       Mateusz Gibas, Kacper Ferdek
 Version:       2.1
 Last modified: 2024-08-29
 Coding style: safe, with FPGA sync reset
 Description:  test bench for FFT64
 */
//////////////////////////////////////////////////////////////////////////////


module FFT64_tb;

parameter WIDTH = 16;
//------------------------------------------------------------------------------
// Testbench signals
//------------------------------------------------------------------------------
logic                clock;
logic                reset;
logic                di_en;
logic [WIDTH-1:0]    di_re;
logic [WIDTH-1:0]    di_im;
logic                do_en;
logic [WIDTH-1:0]    do_re;
logic [WIDTH-1:0]    do_im;
//------------------------------------------------------------------------------
// DUT instantiation
//------------------------------------------------------------------------------
FFT64 #(.WIDTH(WIDTH)) DUT (
    .clock(clock),
    .reset(reset),
    .di_en(di_en),
    .di_re(di_re),
    .di_im(di_im),
    .do_en(do_en),
    .do_re(do_re),
    .do_im(do_im)
);
//------------------------------------------------------------------------------
// Clock generation
//------------------------------------------------------------------------------
always #5 clock = ~clock; // 100MHz clock
//------------------------------------------------------------------------------
// Test vectors
//------------------------------------------------------------------------------
logic [WIDTH-1:0] test_input_re [0:63] = {6314, -5354, -28154, 11432, -24379, 24470, 16680, -15485, -25402, -4122, 31062, -17528, -10346, 4953, -28409, -31515, -31134, 9475, -1484, 30409, -24485, 13112, -26301, 4490, -30570, -21832, -19860, -917, 30846, 13907, -18462, -27496, 28561, -25694, -1342, -8207, 25960, -23490, -22359, 6085, -21681, 8522, -30551, 24961, 15930, 6709, -21999, -5701, 7207, 13753, -3775, -1517, -21149, -21052, 913, 24201, 30281, -19345, -22864, -31014, -18317, -29226, -16530, 13106, 9152};
logic [WIDTH-1:0] test_input_im [0:63];
logic [WIDTH-1:0] expected_output_re [0:63] ={32174, 61611, 62370, 1124, 64718, 3078, 63556, 1493, 3772, 481, 973, 231, 656, 61339, 342, 323, 2601, 64298, 293, 2293, 63501, 62193, 1849, 1027, 2092, 3013, 1860, 2478, 138, 63878, 64224, 58722, 4464, 63551, 62711, 1593, 2950, 760, 1333, 2794, 62683, 1275, 2261, 576, 63345, 2208, 2732, 3384, 2548, 63985, 60262, 63868, 284, 64982, 18, 65232, 64972, 914, 65347, 556, 693, 64382, 513, 65143, 64464};
logic [WIDTH-1:0] expected_output_im [0:63] = {0, 1757, 1056, 700, 63313, 611, 1246, 63083, 62574, 2779, 2474, 2742, 91, 60393, 3678, 60052, 1202, 63943, 942, 64195, 64564, 63435, 2055, 1262, 64169, 64540, 3467, 3960, 1055, 64662, 64370, 452, 139, 63480, 633, 3025, 65335, 883, 64259, 1658, 5630, 1546, 2107, 1682, 439, 1191, 1799, 63714, 2993, 1555, 1853, 4779, 62792, 78, 65399, 4019, 61880, 64820, 63778, 61998, 60517, 4148, 65322, 1013, 64627, 61947};
integer i;
//------------------------------------------------------------------------------
// Testbench logic
//------------------------------------------------------------------------------
initial begin
    // Initialize imaginary part of the input to zero
    for (i = 0; i < 64; i = i + 1) 
        test_input_im[i] = 0;
    // Initialize signals
    clock = 0;
    reset = 1;
    di_en = 0;
    di_re = 0;
    di_im = 0;
    // Release reset after some time
    #15 reset = 0;
    // Apply input data
    for (i = 0; i < 64; i = i + 1) begin
        #10;
        di_en = 1;
        di_re = test_input_re[i];
        di_im = test_input_im[i];
    end
    di_en = 0;
    // Wait for FFT output
    #50000;
    // Check output data
    for (i = 0; i < 64; i = i + 1) begin
        #10;
        if (do_en) begin
            if (do_re !== expected_output_re[i] || do_im !== expected_output_im[i]) begin
                $display("ERROR: Output mismatch at index %d: Expected (%d, %d), Got (%d, %d)",
                    i, expected_output_re[i], expected_output_im[i], do_re, do_im);
            end else begin
                $display("PASS: Output match at index %d: (%d, %d)",
                    i, do_re, do_im);
            end
        end
    end
    // End simulation
    $finish;
end

endmodule