/**
 * San Jose State University
 * EE178 Lab #4
 * Author: prof. Eric Crabilla
 *
 * Modified by:
 * 2023  AGH University of Science and Technology
 * MTM UEC2
 * Kacper Ferdek
 *
 * Description:
 * Top level synthesizable module including the project top and all the FPGA-referred modules.
 */

`timescale 1 ns / 1 ps

module top_ssr_basys3 (
    input  wire clk,
    input  wire btnC,
    output wire JA2,
    output wire JA8,
    output wire JA9,
    output wire JA10,
    inout wire JA3,
    inout wire JA4 
);


/**
 * Local variables and signals
 */

wire clk100MHz;
wire clk40MHz;
wire locked;


(* KEEP = "TRUE" *)
(* ASYNC_REG = "TRUE" *)

// For details on synthesis attributes used above, see AMD Xilinx UG 901:
// https://docs.xilinx.com/r/en-US/ug901-vivado-synthesis/Synthesis-Attributes


/**
 * Signals assignments
 */



/**
 * FPGA submodules placement
 */

// Mirror pclk on a pin for use by the testbench;
// not functionally required for this design to work.
(* CORE_GENERATION_INFO = "clk_wiz_0,clk_wiz_v6_0_9_0_0,{component_name=clk_wiz_0,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=2,clkin1_period=10.000,clkin2_period=10.000,use_power_down=false,use_reset=false,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *)

  clk_wiz_0_clk_wiz inst
  (
  // Clock out ports  
  .clk100MHz(clk100MHz),
  .clk40MHz(clk40MHz),
  // Status and control signals               
  .locked(locked),
 // Clock in ports
  .clk(clk)
  );

/**
 *  Project functional top module
 */

top_ssr u_top_ssr (
    .clk(clk100MHz),
    .rst(btnC),
    .scl(JA3),
    .sda(JA4),
    .adc_ch0_data(JA2),
    .adc_ch1_data(JA8),
    .adc_ch2_data(JA9),
    .adc_ch3_data(JA10)

);

endmodule
