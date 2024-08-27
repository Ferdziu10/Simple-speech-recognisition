- zamienic arraye w nn 
- sprawdzic co i jak zegar
- warningi sdf, mel, adc
Warnings, critical warnings and errors from synthesis and implementation




 przesuniente tabulatorem warningi oznaczaja ze najprawdopodobniej naprawiono dany warning
----SYNTHESIS----
WARNING: [Synth 8-689] width (8) of port connection 'addr' does not match port width (6) of module 'Twiddle64' [rtl/audio_processing/fft/SdfUnit_TC.v:270]
WARNING: [Synth 8-6014] Unused sequential element bf2_start_1t_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:237]
WARNING: [Synth 8-689] width (8) of port connection 'addr' does not match port width (6) of module 'Twiddle64' [rtl/audio_processing/fft/SdfUnit_TC.v:270]
WARNING: [Synth 8-6014] Unused sequential element bf2_start_1t_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:237]
WARNING: [Synth 8-689] width (8) of port connection 'addr' does not match port width (6) of module 'Twiddle64' [rtl/audio_processing/fft/SdfUnit_TC.v:270]
WARNING: [Synth 8-6014] Unused sequential element bf2_start_1t_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:237]
WARNING: [Synth 8-689] width (8) of port connection 'addr' does not match port width (6) of module 'Twiddle64' [rtl/audio_processing/fft/SdfUnit_TC.v:270]
WARNING: [Synth 8-6014] Unused sequential element bf2_start_1t_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:237]
WARNING: [Synth 8-6014] Unused sequential element mu_do_re_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:327]
WARNING: [Synth 8-6014] Unused sequential element mu_do_im_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:328]
WARNING: [Synth 8-6014] Unused sequential element mu_do_en_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:333]
WARNING: [Synth 8-6014] Unused sequential element tw_nz_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:307]
WARNING: [Synth 8-6014] Unused sequential element tw_nz_1d_reg was removed.  [rtl/audio_processing/fft/SdfUnit_TC.v:308]
WARNING: [Synth 8-87] always_comb on '_out_reg' did not result in combinational logic [rtl/audio_processing/mel_filter/dB_LUT.sv:31]
WARNING: [Synth 8-4767] Trying to implement RAM 'fifo_mem_reg' in registers. Block RAM or DRAM implementation is not possible; see log for reasons.
WARNING: [Synth 8-87] always_comb on 'output_vector_nxt_reg[0]' did not result in combinational logic [rtl/neural_network/dense_layer_4.sv:42]
WARNING: [Synth 8-87] always_comb on 'output_vector_nxt_reg[1]' did not result in combinational logic [rtl/neural_network/dense_layer_4.sv:42]
WARNING: [Synth 8-87] always_comb on 'output_vector_nxt_reg[2]' did not result in combinational logic [rtl/neural_network/dense_layer_4.sv:42]
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
WARNING: [Synth 8-327] inferring latch for variable '_out_reg' [rtl/audio_processing/mel_filter/dB_LUT.sv:31]
WARNING: [Synth 8-327] inferring latch for variable 'output_vector_nxt_reg[0]' [rtl/neural_network/dense_layer_4.sv:42]
WARNING: [Synth 8-327] inferring latch for variable 'output_vector_nxt_reg[1]' [rtl/neural_network/dense_layer_4.sv:42]
WARNING: [Synth 8-327] inferring latch for variable 'output_vector_nxt_reg[2]' [rtl/neural_network/dense_layer_4.sv:42]
WARNING: [Synth 8-327] inferring latch for variable 'j' [rtl/neural_network/dense_layer_4.sv:39]
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
WARNING: [Synth 8-3323] Resources of type DSP have been overutilized. Used = 887, Available = 90. Use report_utilization command for details.

----IMPLEMENTATION----
CRITICAL WARNING: [Project 1-486] Could not resolve non-primitive black box cell 'mult_gen_1' instantiated as 'u_top_ssr/u_top_ap/u_mel_filter_bank/mult_im' [rtl/audio_processing/mel_filter/mel_filter_bank.sv:67]
ERROR: [DRC INBB-3] Black Box Instances: Cell 'u_top_ssr/u_top_ap/u_mel_filter_bank/mult_im' of type 'mult_gen_1' has undefined contents and is considered a black box.  The contents of this cell must be defined for opt_design to complete successfully.
WARNING: [DRC RPBF-3] IO port buffering is incomplete: Device port JA3 expects both input and output buffering but the buffers are incomplete.
WARNING: [DRC RPBF-3] IO port buffering is incomplete: Device port JA4 expects both input and output buffering but the buffers are incomplete.
ERROR: [Vivado_Tcl 4-78] Error(s) found during DRC. Opt_design not run.
ERROR: [Common 17-39] 'opt_design' failed due to earlier errors.