`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2019 12:19:58 AM
// Design Name: 
// Module Name: filter_bank
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mel_filter_bank#(parameter N = 256)(
    input clk,
    input reset,
    input [31:0] in,
    output [15:0] out[40],
    input s_valid,
    output s_ready,
    output m_valid,
    input m_ready
    );

    // Zainicjalizowany filt_shift_reg
    logic[15:0] filt_shift_reg[N] = {16'd32768, 16'd32768, 16'd32768, 16'd16384, 16'd32768, 16'd16384, 16'd32768, 16'd32768, 16'd16384, 16'd32768, 16'd16384, 16'd32768, 16'd16384, 16'd32768, 16'd16384, 16'd32768, 16'd10923, 16'd21845, 16'd32768, 16'd16384, 16'd32768, 16'd10923, 16'd21845, 16'd32768, 16'd10923, 16'd21845, 16'd32768, 16'd10923, 16'd21845, 16'd32768, 16'd8192, 16'd16384, 16'd24576, 16'd32768, 16'd10923, 16'd21845, 16'd32768, 16'd8192, 16'd16384, 16'd24576, 16'd32768, 16'd8192, 16'd16384, 16'd24576, 16'd32768, 16'd8192, 16'd16384, 16'd24576, 16'd32768, 16'd6554, 16'd13107, 16'd19661, 16'd26214, 16'd32768, 16'd6554, 16'd13107, 16'd19661, 16'd26214, 16'd32768, 16'd6554, 16'd13107, 16'd19661, 16'd26214, 16'd32768, 16'd5461, 16'd10923, 16'd16384, 16'd21845, 16'd27307, 16'd32768, 16'd5461, 16'd10923, 16'd16384, 16'd21845, 16'd27307, 16'd32768, 16'd4681, 16'd9362, 16'd14043, 16'd18725, 16'd23406, 16'd28087, 16'd32768, 16'd4681, 16'd9362, 16'd14043, 16'd18725, 16'd23406, 16'd28087, 16'd32768, 16'd4681, 16'd9362, 16'd14043, 16'd18725, 16'd23406, 16'd28087, 16'd32768, 16'd4096, 16'd8192, 16'd12288, 16'd16384, 16'd20480, 16'd24576, 16'd28672, 16'd32768, 16'd3641, 16'd7282, 16'd10923, 16'd14564, 16'd18204, 16'd21845, 16'd25486, 16'd29127, 16'd32768, 16'd3641, 16'd7282, 16'd10923, 16'd14564, 16'd18204, 16'd21845, 16'd25486, 16'd29127, 16'd32768, 16'd3641, 16'd7282, 16'd10923, 16'd14564, 16'd18204, 16'd21845, 16'd25486, 16'd29127, 16'd32768, 16'd2979, 16'd5958, 16'd8937, 16'd11916, 16'd14895, 16'd17873, 16'd20852, 16'd23831, 16'd26810, 16'd29789, 16'd32768, 16'd2979, 16'd5958, 16'd8937, 16'd11916, 16'd14895, 16'd17873, 16'd20852, 16'd23831, 16'd26810, 16'd29789, 16'd32768, 16'd2731, 16'd5461, 16'd8192, 16'd10923, 16'd13653, 16'd16384, 16'd19115, 16'd21845, 16'd24576, 16'd27307, 16'd30037, 16'd32768, 16'd2731, 16'd5461, 16'd8192, 16'd10923, 16'd13653, 16'd16384, 16'd19115, 16'd21845, 16'd24576, 16'd27307, 16'd30037, 16'd32768, 16'd2341, 16'd4681, 16'd7022, 16'd9362, 16'd11703, 16'd14043, 16'd16384, 16'd18725, 16'd21065, 16'd23406, 16'd25746, 16'd28087, 16'd30427, 16'd32768, 16'd2341, 16'd4681, 16'd7022, 16'd9362, 16'd11703, 16'd14043, 16'd16384, 16'd18725, 16'd21065, 16'd23406, 16'd25746, 16'd28087, 16'd30427, 16'd32768, 16'd2048, 16'd4096, 16'd6144, 16'd8192, 16'd10240, 16'd12288, 16'd14336, 16'd16384, 16'd18432, 16'd20480, 16'd22528, 16'd24576, 16'd26624, 16'd28672, 16'd30720, 16'd32768, 16'd2048, 16'd4096, 16'd6144, 16'd8192, 16'd10240, 16'd12288, 16'd14336, 16'd16384, 16'd18432, 16'd20480, 16'd22528, 16'd24576, 16'd26624, 16'd28672, 16'd30720, 16'd32768, 16'd1820, 16'd3641, 16'd5461, 16'd7282, 16'd9102, 16'd10923, 16'd12743, 16'd14564, 16'd16384, 16'd18204, 16'd20025, 16'd21845, 16'd23666, 16'd25486, 16'd27307, 16'd29127, 16'd30948, 16'd32768};
    
    logic[15:0] filt;               
    logic new_window[3];            
    logic[15:0] bank_shift_reg[40]; 
    logic[5:0] d_counter;
    logic[5:0] q_counter;           
    logic in_ready;                 
    logic in_valid[3];              
    logic [31:0] product[2];        
    logic [31:0] inverse[2];        
    logic [31:0] q_ascending;
    logic [31:0] d_ascending;
    logic [31:0] q_descending;
    logic [31:0] d_descending;      
    logic [31:0] accumulation;      
    logic [15:0] dB;                
    
    assign s_ready = in_ready;
    assign in_valid[0] = s_valid;
    assign filt = filt_shift_reg[0];
    assign new_window[0] = (filt == 16'd32768);
    
    assign inverse[0] = in - product[0];
    assign accumulation = q_ascending + product[1];
    
    assign out = bank_shift_reg;
    assign m_valid = (q_counter == 6'd41);
    
    dB_LUT dB_calculator(.in(q_descending), .out(dB), .on(new_window[2]));

    mult_gen_1 mult_im (
      .CLK(clk),  // input wire CLK
      .A(in),      // input wire [31 : 0] A
      .B(filt),      // input wire [15 : 0] B
      .P(product[0])      // output wire [31 : 0] P
    );
    
    always_comb begin        
        if(in_valid[2] && s_ready) begin
            if(new_window[2]) begin
               d_ascending = in;
            end else begin
               d_descending = inverse[1];
            end
        end else begin
            q_ascending = d_ascending;
            q_descending = d_descending;
        end
    end
    
    always_ff @(posedge clk) begin
        if (reset) begin
            q_counter <= 0;
            for (int i = 0; i < 41; i++) begin
                bank_shift_reg[i] <= 0;
            end
        end
        else if (s_ready && s_valid) begin
            q_counter <= d_counter;
            for (int i = 0; i < 41; i++) begin
                bank_shift_reg[i] <= bank_shift_reg[i] + filt_shift_reg[d_counter + i];
            end
        end
        for (int j = 0; j < 40; j++) begin
            filt_shift_reg[j] <= filt_shift_reg[j + 1];
        end
        filt_shift_reg[40] <= filt_shift_reg[0];
    end
endmodule
