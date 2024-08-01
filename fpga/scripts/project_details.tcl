# Copyright (C) 2023  AGH University of Science and Technology
# MTM UEC2
# Author: Piotr Kaczmarczyk
#
# Description:
# Project detiles required for generate_bitstream.tcl
# Make sure that project_name, top_module and target are correct.
# Provide paths to all the files required for synthesis and implementation.
# Depending on the file type, it should be added in the corresponding section.
# If the project does not use files of some type, leave the corresponding section commented out.

#-----------------------------------------------------#
#                   Project details                   #
#-----------------------------------------------------#
# Project name                                  -- EDIT
set project_name ssr_project

# Top module name                               -- EDIT
set top_module top_ssr_basys3

# FPGA device
set target xc7a35tcpg236-1

#-----------------------------------------------------#
#                    Design sources                   #
#-----------------------------------------------------#
# Specify .xdc files location                   -- EDIT
set xdc_files {
    constraints/top_ssr_basys3.xdc
    constraints/clk_wiz_0.xdc
}

# Specify SystemVerilog design files location   -- EDIT
set sv_files {
    ../rtl/neural_network/dense_layer_1.sv
    ../rtl/neural_network/dense_layer_2.sv
    ../rtl/neural_network/dense_layer_3.sv
    ../rtl/neural_network/dense_layer_4.sv
    ../rtl/neural_network/final_layer.sv
    ../rtl/neural_network/dropout_layer_1.sv
    ../rtl/neural_network/dropout_layer_2.sv
    ../rtl/neural_network/dropout_layer_3.sv
    ../rtl/neural_network/nn_parameters.sv
    ../rtl/neural_network/top_nn.sv
    ../rtl/led_logic/led_logic.sv
    ../rtl/board/example_mod.sv
    ../rtl/top_ssr.sv
    rtl/top_ssr_basys3.sv
}

# Specify Verilog design files location         -- EDIT
set verilog_files {
    rtl/clk_wiz_0_clk_wiz.v
}

# Specify VHDL design files location            -- EDIT
# set vhdl_files {
#    path/to/file.vhd
# }

# Specify files for a memory initialization     -- EDIT
# set mem_files {
#    path/to/file.data
# }
