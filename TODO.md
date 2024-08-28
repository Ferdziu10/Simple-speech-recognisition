Warnings, critical warnings and errors from synthesis and implementation

Created: 2024-08-28 02:49:59

----SYNTHESIS----
WARNING: [Synth 8-8943] 'mult_gen_v12_0_19' is not compiled in library 'mult_gen_v12_0_19' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/ip/mult_gen_0/synth/mult_gen_0.vhd:57]
WARNING: [Synth 8-7071] port 'i2c_ack_err' of module 'pmod_adc_ad7991' is unconnected for instance 'u_pmod_adc_ad7991' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/top_ssr.sv:13]
WARNING: [Synth 8-7071] port 'adc_ch1_data' of module 'pmod_adc_ad7991' is unconnected for instance 'u_pmod_adc_ad7991' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/top_ssr.sv:13]
WARNING: [Synth 8-7071] port 'adc_ch2_data' of module 'pmod_adc_ad7991' is unconnected for instance 'u_pmod_adc_ad7991' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/top_ssr.sv:13]
WARNING: [Synth 8-7071] port 'adc_ch3_data' of module 'pmod_adc_ad7991' is unconnected for instance 'u_pmod_adc_ad7991' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/top_ssr.sv:13]
WARNING: [Synth 8-7023] instance 'u_pmod_adc_ad7991' of module 'pmod_adc_ad7991' has 9 connections declared, but only 5 given [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/top_ssr.sv:13]
WARNING: [Synth 8-689] width (8) of port connection 'addr' does not match port width (6) of module 'Twiddle64' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:270]
WARNING: [Synth 8-689] width (8) of port connection 'addr' does not match port width (6) of module 'Twiddle64' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:270]
WARNING: [Synth 8-689] width (8) of port connection 'addr' does not match port width (6) of module 'Twiddle64' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:270]
WARNING: [Synth 8-689] width (8) of port connection 'addr' does not match port width (6) of module 'Twiddle64' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:270]
WARNING: [Synth 8-7071] port 'but' of module 'top_ssr' is unconnected for instance 'u_top_ssr' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/fpga/rtl/top_ssr_basys3.sv:55]
WARNING: [Synth 8-7023] instance 'u_top_ssr' of module 'top_ssr' has 6 connections declared, but only 5 given [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/fpga/rtl/top_ssr_basys3.sv:55]
WARNING: [Synth 8-3848] Net i2c_data_wr in module/entity pmod_adc_ad7991 does not have driver. [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/adc/pmod_adc_ad7991.vhd:48]
WARNING: [Synth 8-6014] Unused sequential element bf2_start_1t_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:237]
WARNING: [Synth 8-6014] Unused sequential element bf2_start_1t_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:237]
WARNING: [Synth 8-6014] Unused sequential element bf2_start_1t_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:237]
WARNING: [Synth 8-6014] Unused sequential element bf2_start_1t_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:237]
WARNING: [Synth 8-6014] Unused sequential element mu_do_re_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:327]
WARNING: [Synth 8-6014] Unused sequential element mu_do_im_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:328]
WARNING: [Synth 8-6014] Unused sequential element mu_do_en_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:333]
WARNING: [Synth 8-6014] Unused sequential element tw_nz_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:307]
WARNING: [Synth 8-6014] Unused sequential element tw_nz_1d_reg was removed.  [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/fft/SdfUnit_TC.v:308]
WARNING: [Synth 8-87] always_comb on '_out_reg' did not result in combinational logic [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/mel_filter/dB_LUT.sv:31]
WARNING: [Synth 8-4767] Trying to implement RAM 'fifo_mem_reg' in registers. Block RAM or DRAM implementation is not possible; see log for reasons.
WARNING: [Synth 8-7129] Port data_in1[15] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[14] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[13] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[12] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[11] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[10] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[9] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[8] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[7] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[6] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[5] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[4] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[3] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[2] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[1] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[0] in module fifo is either unconnected or has no load
WARNING: [Synth 8-327] inferring latch for variable '_out_reg' [C:/Users/Kacper/Desktop/UEC/Projekt/Simple-speech-recognisition/rtl/audio_processing/mel_filter/dB_LUT.sv:31]
WARNING: [Synth 8-7129] Port data_in1[15] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[14] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[13] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[12] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[11] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[10] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[9] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[8] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[7] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[6] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[5] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[4] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[3] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[2] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[1] in module fifo is either unconnected or has no load
WARNING: [Synth 8-7129] Port data_in1[0] in module fifo is either unconnected or has no load
WARNING: [Synth 8-3323] Resources of type DSP have been overutilized. Used = 611, Available = 90. Use report_utilization command for details.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_top_ap/u_mel_filter_bank/dB_calculator/_out_reg[7]) is unused and will be removed from module top_ssr_basys3.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_top_ap/u_mel_filter_bank/dB_calculator/_out_reg[6]) is unused and will be removed from module top_ssr_basys3.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_top_ap/u_mel_filter_bank/dB_calculator/_out_reg[5]) is unused and will be removed from module top_ssr_basys3.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_top_ap/u_mel_filter_bank/dB_calculator/_out_reg[4]) is unused and will be removed from module top_ssr_basys3.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_top_ap/u_mel_filter_bank/dB_calculator/_out_reg[3]) is unused and will be removed from module top_ssr_basys3.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_top_ap/u_mel_filter_bank/dB_calculator/_out_reg[2]) is unused and will be removed from module top_ssr_basys3.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_top_ap/u_mel_filter_bank/dB_calculator/_out_reg[1]) is unused and will be removed from module top_ssr_basys3.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_top_ap/u_mel_filter_bank/dB_calculator/_out_reg[0]) is unused and will be removed from module top_ssr_basys3.

----IMPLEMENTATION----
WARNING: [DRC BUFC-1] Input Buffer Connections: Input buffer JA4_IOBUF_inst/IBUF has no loads. It is recommended to have an input buffer drive an internal load.
