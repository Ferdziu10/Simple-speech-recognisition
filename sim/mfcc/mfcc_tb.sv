`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 10:22:11 PM
// Design Name: 
// Module Name: mfcc_tb
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
///////////////////////////////////////////////////////////////////////////////

module mfcc_tb;

    // Parameters
    parameter N = 512;
    parameter STRIDE = 256;
    parameter OUT_WIDTH = 26;
    
    // Inputs
    reg clk;
    reg reset;
    reg [15:0] s_axis_tdata;
    reg s_axis_tvalid;
    reg m_axis_tready;
    
    // Outputs
    wire [15:0] m_axis_tdata[OUT_WIDTH];
    wire s_axis_tready;
    wire m_axis_tvalid;
    wire m_axis_tlast;
    
    // Memory to store input data from file
    reg [15:0] input_memory [0:177999]; // Adjust size based on the number of samples in the file
    integer i;

    // Instantiate the Unit Under Test (UUT)
    mfcc #(
        .N(N),
        .STRIDE(STRIDE),
        .OUT_WIDTH(OUT_WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .s_axis_tdata(s_axis_tdata),
        .m_axis_tdata(m_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .m_axis_tlast(m_axis_tlast)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end
    
    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        s_axis_tdata = 16'h0;
        s_axis_tvalid = 0;
        m_axis_tready = 0;
        
        // Load data from the file into input_memory
        $readmemh("../../python/generated_files/input_adcoff2.txt", input_memory);
        
        // Wait 100 ns for global reset to finish
        #100000;
        reset = 0;

        // Input stimulus: Simulate feeding audio samples
        for (i = 0; i < 1000; i = i + 1) begin
            @(posedge clk);
            s_axis_tvalid = 1;
            s_axis_tdata = input_memory[i];
        end
        s_axis_tvalid = 0;
        
        // Test output readiness
        @(posedge clk);
        m_axis_tready = 1;
        
        // Wait and observe results
        #100000;

        // Finish the simulation
        $finish;
    end

    // Monitor output
    initial begin
        for (int i = 0; i < 26; i++) begin
 $display("output_vector[%0d]: %0d", i, m_axis_tdata[i]);
end 
        $monitor("Time=%0t | s_axis_tready=%b, m_axis_tvalid=%b, m_axis_tlast=%b", 
                 $time, s_axis_tready, m_axis_tvalid, m_axis_tlast, m_axis_tdata);
    end

endmodule
