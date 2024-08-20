module top_ap(
    input logic clk,
    input logic rst,
    input logic [11:0] adc_data,
    output logic [15:0] output_vector [25:0]
);
logic [15:0] ext_data;
logic [15:0] axi_indata;
logic [15:0] axi_outdata [25:0];
logic s_axis_tvalid;
logic s_axi_tready;
logic m_axis_tvalid;
logic m_axis_tlast;
logic m_axis_tready;
logic simple_valid_in;
logic simple_ready_out;
logic simple_valid_out;
logic simple_last_out;

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
    .data_out(ext_data)
);
mel_filter_bank u_filter_bank_v2(
    .clk,
    .rst,
    .in,
    .out
);
reshape_output u_reshape_output(
    .clk,
    .rst,
    .in,
    .out
);
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