module i2c_master_tb();

  // Parameters
  localparam input_clk = 50000000;
  localparam bus_clk = 400000;
  localparam CLK_PERIOD = 20; // 50 MHz clock period in ns

  // Testbench signals
  logic clk;
  logic reset_n;
  logic ena;
  logic [6:0] addr;
  logic rw;
  logic [7:0] data_wr;
  logic busy;
  logic [7:0] data_rd;
  logic ack_error;
  tri sda;
  tri scl;

  // Pullups for I2C lines
  assign sda = 1'b1;
  assign scl = 1'b1;

  // DUT instance
  i2c_master #(
    .input_clk(input_clk),
    .bus_clk(bus_clk)
  ) uut (
    .clk(clk),
    .reset_n(reset_n),
    .ena(ena),
    .addr(addr),
    .rw(rw),
    .data_wr(data_wr),
    .busy(busy),
    .data_rd(data_rd),
    .ack_error(ack_error),
    .sda(sda),
    .scl(scl)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;
  end

  // Reset task
  task reset();
    begin
      reset_n = 0;
      ena = 0;
      addr = 0;
      rw = 0;
      data_wr = 0;
      #100;
      reset_n = 1;
    end
  endtask

  // I2C write task
  task i2c_write(input [6:0] address, input [7:0] data);
    begin
      addr = address;
      rw = 0;
      data_wr = data;
      ena = 1;
      @(posedge clk);
      ena = 0;
      wait (busy == 1);
      wait (busy == 0);
      if (ack_error) $display("Write to address %h failed", address);
      else $display("Write to address %h successful", address);
    end
  endtask

  // I2C read task
  task i2c_read(input [6:0] address, output [7:0] data);
    begin
      addr = address;
      rw = 1;
      ena = 1;
      @(posedge clk);
      ena = 0;
      wait (busy == 1);
      wait (busy == 0);
      if (ack_error) $display("Read from address %h failed", address);
      else $display("Read from address %h successful, data: %h", address, data_rd);
      data = data_rd;
    end
  endtask

  // Test sequence
  initial begin
    // Apply reset
    reset();

    // Test write operation
    $display("Starting I2C write test...");
    i2c_write(7'h50, 8'hAA);

    // Test read operation
    $display("Starting I2C read test...");
    logic [7:0] read_data;
    i2c_read(7'h50, read_data);

    // Finish simulation
    $finish;
  end

endmodule