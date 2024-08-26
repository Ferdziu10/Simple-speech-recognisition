`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 21:47:08
// Design Name: 
// Module Name: booth_top
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


module booth_top_1(
	input           clk,
    input           rst_n,
    input           en,

    input[11:0]      mult_1,
    input[11:0]      mult_2,

    output[23:0]    result,
    output			result_rdy
    );
    
    wire[5:0]       rdy;
    wire[23:0]      product[5:0];
	
	wire[15:0]			mult_long;
	assign mult_long =	{{12{1'b0}},mult_2};
	booth_1 uut0 (
    	.mult_1({mult_1[1:0],1'b0}),
    	.mult_2(mult_2),
    	.mult_pre(24'd0),
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.rdy(rdy[0]),
    	.mult_next(product[0])
	);
	
	booth_1 uut1 (
    	.mult_1({mult_1[3:1]}),
    	.mult_2(mult_2),
    	.mult_pre(24'd0),
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.rdy(rdy[1]),
    	.mult_next(product[1])
	);
	
	booth_1 uut2 (
    	.mult_1({mult_1[5:3]}),
    	.mult_2(mult_2),
    	.mult_pre(24'd0),
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.rdy(rdy[2]),
    	.mult_next(product[2])
	);
	
	booth_1 uut3 (
    	.mult_1({mult_1[7:5]}),
    	.mult_2(mult_2),
    	.mult_pre(24'd0),
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.rdy(rdy[3]),
    	.mult_next(product[3])
	);
	booth_1 uut4 (
    	.mult_1({mult_1[9:7]}),
    	.mult_2(mult_2),
    	.mult_pre(24'd0),
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.rdy(rdy[4]),
    	.mult_next(product[4])
	);
	booth_1 uut5 (
    	.mult_1({mult_1[11:9]}),
    	.mult_2(mult_2),
    	.mult_pre(24'd0),
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.rdy(rdy[5]),
    	.mult_next(product[5])
	);
	assign result = (product[5] << 10) + (product[4] << 8) + (product[3] << 6) + (product[2] << 4) + (product[1] << 2) + product[0];
	assign result_rdy = rdy[5];
endmodule