`timescale 1ns / 1ps

module pmod_tb;

  // Sygnaly testowe
  reg clk;
  reg reset_n;
  wire scl;
  wire sda;
  wire i2c_ack_err;
  wire [11:0] adc_ch0_data;
  wire [11:0] adc_ch1_data;
  wire [11:0] adc_ch2_data;
  wire [11:0] adc_ch3_data;
  reg [6:0] i2c_address;
  reg [7:0] i2c_data;
  reg i2c_rw;

  // Instancja modułu
  pmod_adc_ad7991 uut (
    .clk(clk),
    .reset_n(reset_n),
    .scl(scl),
    .sda(sda),
    .i2c_ack_err(i2c_ack_err),
    .adc_ch0_data(adc_ch0_data),
    .adc_ch1_data(adc_ch1_data),
    .adc_ch2_data(adc_ch2_data),
    .adc_ch3_data(adc_ch3_data)
  );

  // Inicjalizacja
  initial begin
    // Zainicjalizowanie sygnałów
    clk = 0;
    reset_n = 0;
    i2c_address = 7'b0101000;
    i2c_data = 8'hA5;
    i2c_rw = 1'b1; // read operation
    
    // Zwolnienie resetu
    #100;
    reset_n = 1;
    
    // Transmisja danych I2C
    i2c_transmit(i2c_address, i2c_data, i2c_rw);
    
    // Zakończenie symulacji
    #1000;
    $finish;
  end

  // Generacja sygnału zegara
  always #5 clk = ~clk;

  // Zadanie symulujące transmisję I2C
  task i2c_transmit;
    input [6:0] address;
    input [7:0] data;
    input bit rw;
    integer i;

    begin
      // Warunek startu
      $display("Transmitting START condition");
      #10;

      // Transmisja adresu + bit R/W
      for (i = 6; i >= 0; i = i - 1) begin
        $display("Transmitting address bit %0d: %0b", i, address[i]);
        #10;
      end

      $display("Transmitting R/W bit: %0b", rw);
      #10;

      // Oczekiwanie na potwierdzenie od slave'a
      $display("Waiting for ACK from slave...");
      #10;
      $display("ACK received from slave");

      // Transmisja bajtu danych
      for (i = 7; i >= 0; i = i - 1) begin
        $display("Transmitting data bit %0d: %0b", i, data[i]);
        #10;
      end

      // Oczekiwanie na potwierdzenie od slave'a po danych
      $display("Waiting for ACK after data byte...");
      #10;
      $display("ACK received after data byte");

      // Warunek stopu
      $display("Transmitting STOP condition");
      #10;
    end
  endtask

endmodule
