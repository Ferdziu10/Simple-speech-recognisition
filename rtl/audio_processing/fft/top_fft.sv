module top_fft(
    input logic clk,
    input logic rst,
    input logic [11:0] frame_in [0:255],
    output logic [11:0] fft_real_out [0:255],
    output logic [11:0] fft_imag_out [0:255],
    output logic fft_done
);

fft_top_1 u_fft_top_1(
    .clk,
    .rst_n(rst),
    .x_0(frame_in[0]),
    .x_1(frame_in[1]),
    .x_2(frame_in[2]),
    .x_3(frame_in[3]),
    .x_4(frame_in[4]),
    .x_5(frame_in[5]),
    .x_6(frame_in[6]),
    .x_7(frame_in[7]),
    .y_0_r(fft_real_out[0]),
    .y_1_r(fft_real_out[1]),
    .y_2_r(fft_real_out[2]),
    .y_3_r(fft_real_out[3]),
    .y_4_r(fft_real_out[4]),
    .y_5_r(fft_real_out[5]),
    .y_6_r(fft_real_out[6]),
    .y_7_r(fft_real_out[7]),
    .y_0_i(fft_imag_out[0]),
    .y_1_i(fft_imag_out[1]),
    .y_2_i(fft_imag_out[2]),
    .y_3_i(fft_imag_out[3]),
    .y_4_i(fft_imag_out[4]),
    .y_5_i(fft_imag_out[5]),
    .y_6_i(fft_imag_out[6]),
    .y_7_i(fft_imag_out[7])
);
// do skonczenia

endmodule