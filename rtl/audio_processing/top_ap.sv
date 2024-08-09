module top_ap(
    input logic clk,
    input logic rst,
    input logic [11:0] adc_data,
    output logic [11:0] output_vector [25:0]
);
logic [11:0] adc_data;
logic [11:0] high_freq_bost;
logic [11:0] bufor_data [255:0];

logic frame_ready;


pre_emphasis u_pre_emphasis(
    .clk,
    .rst,
    .sample_in (adc_data),
    .sample_out (high_freq_bost)
);
framing u_framing(
    .clk,
    .rst,
    .sample_in(high_freq_bost),
    .frame_out(bufor_data),
    .frame_ready
);
windowing u_windowing(
    .clk,
    .rst,
    .frame_in(bufor_data),
    .frame_ready,
    .windowed_frame,
    .window_ready
);
top_fft u_top_fft(
    .clk,
    .rst,

);
top_mfcc u_top_mfcc(
    .clk,
    .rst,

);
log_comput u_log_comput(
    .clk,
    .rst,

);
dct u_dct(
    .clk,
    .rst,

);
endmodule