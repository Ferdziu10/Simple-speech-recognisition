module top_ap(
    input logic clk,
    input logic rst,
    input logic [11:0] adc_data,
    output logic [15:0] output_vector [25:0]
);
logic s_valid;
logic s_ready;
logic m_valid;
logic m_ready;
logic [15:0] mel_out [39:0];
logic [15:0] reshape_out [39:0];
logic [31:0] sum;
logic [31:0] sum_sq;

pre_empahsis u_pre_emphasis(
    .clk,
    .rst,
    .sample_in(adc_data),
    .sample_out
);
framing u_framing(
    .clk,
    .rst,
    .sample_in,
    .frame_out,
    .frame_ready
);
windowing u_windowing(
    .clk,
    .rst,
    .frame_in,
    .frame_ready,
    .window_ready,
    .windowed_frame
);
top_fft u_top_fft(
    .clk,
    .rst,
    .frame_in,
    .fft_imag_out,
    .fft_real_out,
    .fft_done
);
zero_padding u_zero_padding(
    .data_in(),
    .data_out()
);
axi_set u_axi_set(
    .clk,
    .rst,
    .m_ready,
    .s_valid
);
mel_filter_bank_wrapper u_mel_filter_bank_wrapper(
    .clk,
    .rst,
    .in(),
    .out(mel_out),
    .s_ready,
    .m_valid,
    .s_valid,
    .m_ready
);
reshape_output u_reshape_output(
    .clk,
    .rst,
    .in(mel_out),
    .out(reshape_out)
);
mean_std_1 u_mean_std_1(
    .clk,
    .rst,
    .data_in(reshape_out),
    .sum,
    .sum_sq
);
mean_std_2 u_mean_std_2(
    .clk,
    .rst,
    .sum,
    .sum_sq,
    .features(output_vector)
)
/*
simple_to_axi u_simple_to_axi(
    .clk,
    .rst,
    .simple_data_in(ext_data),
    .simple_valid_in,
    .simple_ready_out,
    .axi_tdata(axi_indata),
    .axi_tvalid(s_axis_tvalid),
    .axi_tready(s_axis_tready)
);
mfcc u_mfcc(
    .clk,
    .reset(rst),
    .s_axis_tdata(axi_indata),
    .m_axis_tdata(axi_outdata),
    .s_axis_tready,
    .s_axis_tvalid,
    .m_axis_tvalid,
    .m_axis_tlast,
    .m_axis_tready
);
axi_to_simple u_axi_to_simple(
    .clk,
    .rst,
    .axi_tdata(axi_outdata),
    .axi_tvalid(m_axis_tvalid),
    .axi_tready(m_axis_tready),
    .axi_tlast(m_axis_tlast),
    .simple_data_out(output_vector),
    .simple_valid_out,
    .simple_last_out
);
*/

endmodule