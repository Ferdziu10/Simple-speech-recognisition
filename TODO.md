Warnings, critical warnings and errors from synthesis and implementation

Created: 2024-08-28 01:16:59

----SYNTHESIS----
WARNING: [Synth 8-3848] Net i2c_data_wr in module/entity pmod_adc_ad7991 does not have driver. [rtl/adc/pmod_adc_ad7991.vhd:48]
WARNING: [Synth 8-7071] port 'i2c_ack_err' of module 'pmod_adc_ad7991' is unconnected for instance 'u_pmod_adc_ad7991' [rtl/top_ssr.sv:11]
WARNING: [Synth 8-7071] port 'adc_ch1_data' of module 'pmod_adc_ad7991' is unconnected for instance 'u_pmod_adc_ad7991' [rtl/top_ssr.sv:11]
WARNING: [Synth 8-7071] port 'adc_ch2_data' of module 'pmod_adc_ad7991' is unconnected for instance 'u_pmod_adc_ad7991' [rtl/top_ssr.sv:11]
WARNING: [Synth 8-7071] port 'adc_ch3_data' of module 'pmod_adc_ad7991' is unconnected for instance 'u_pmod_adc_ad7991' [rtl/top_ssr.sv:11]
WARNING: [Synth 8-7023] instance 'u_pmod_adc_ad7991' of module 'pmod_adc_ad7991' has 9 connections declared, but only 5 given [rtl/top_ssr.sv:11]
WARNING: [Synth 8-7080] Parallel synthesis criteria is not met
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_pmod_adc_ad7991/i2c_master_0/FSM_onehot_state_reg[5]) is unused and will be removed from module top_ssr_basys3.
WARNING: [Synth 8-3332] Sequential element (u_top_ssr/u_pmod_adc_ad7991/i2c_master_0/FSM_onehot_state_reg[4]) is unused and will be removed from module top_ssr_basys3.

----IMPLEMENTATION----
CLEAR :)