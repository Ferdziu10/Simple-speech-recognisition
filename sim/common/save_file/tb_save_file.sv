`timescale 1ns / 1ps

module tb_save_file;

    // Inputs
    logic clk;
    logic rst;
    logic [11:0] data_in;
    logic sw0;
    logic read_enable;
    logic [13:0] address;

    // Outputs
    logic [11:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    save_file uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .sw0(sw0),
        .data_out(data_out),
        .read_enable(read_enable),
        .address(address)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        data_in = 12'd0;
        sw0 = 0;
        read_enable = 0;
        address = 14'd0;

        // Wait for global reset
        #20;
        rst = 0;

        // Write data to memory
        sw0 = 1;
        for (int i = 0; i < 10; i++) begin
            data_in = i;
            #10; // Wait for one clock cycle
        end
        sw0 = 0;

        // Read data from memory and check
        for (int i = 0; i < 10; i++) begin
            address = i;
            read_enable = 1;
            #10; // Wait for one clock cycle
            if (data_out != i) begin
                $display("Test failed at address %d: expected %d, got %d", i, i, data_out);
            end else begin
                $display("Data read correctly at address %d: %d", i, data_out);
            end
            read_enable = 0;
        end

        $display("Test completed.");
        $finish;
    end
endmodule