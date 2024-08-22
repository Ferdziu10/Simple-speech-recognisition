`timescale 1ns/1ps

module tb_pmod_adc_ad7991;

  // Parametry testbench
  parameter sys_clk_freq = 50_000_000; // 50 MHz system clock
  parameter clk_period = 20; // 20ns period (50 MHz)

  // Sygnaly testbench
  logic clk;
  logic reset_n;
  logic scl;  // sygnał SCL jako logic
  reg sda;    // sygnał SDA jako reg
  logic sda_out_en; // sygnał kontrolujący wyjście SDA (enable)
  wire sda_tri; // połączony sygnał SDA trójstanowy

  logic i2c_ack_err;
  logic [11:0] adc_ch0_data;
  logic [11:0] adc_ch1_data;
  logic [11:0] adc_ch2_data;
  logic [11:0] adc_ch3_data;

  // Trójstanowa wersja sda
  assign sda_tri = (sda_out_en) ? sda : 1'bz;

  // Instancja DUT (Device Under Test)
  pmod_adc_ad7991 #(
    .sys_clk_freq(sys_clk_freq)
  ) dut (
    .clk(clk),
    .reset_n(reset_n),
    .scl(scl),
    .sda(sda_tri),
    .i2c_ack_err(i2c_ack_err),
    .adc_ch0_data(adc_ch0_data),
    .adc_ch1_data(adc_ch1_data),
    .adc_ch2_data(adc_ch2_data),
    .adc_ch3_data(adc_ch3_data)
  );

  // Generowanie zegara
  initial begin
    clk = 0;
    forever #(clk_period/2) clk = ~clk;
  end

  // Ustawienia symulacji
  initial begin
    $display("Rozpoczęcie symulacji");

    // Inicjalizacja sygnałów
    reset_n = 0;
    sda_out_en = 0; // Wyłączamy kontrolę SDA na początku
    sda = 1'bz;     // Ustawiamy SDA w stan wysokiej impedancji
    #100;           // Czekaj 100 ns
    reset_n = 1;

    // Symulacja prostych danych na magistrali I2C
    simulate_i2c_transfer();

    // Symulacja przez pewien czas w celu uzyskania wyników
    #1000000; // Symulacja przez 1 ms

    $display("Zakończenie symulacji");
    $stop;
  end

  // Symulacja transferu I2C
  task simulate_i2c_transfer;
    begin
      // Symulacja prostej komunikacji I2C dla danych na 4 kanałach ADC
      // W tym przypadku symulujemy odczyt danych z kanałów ADC
      // Przykład prostego sekwencjonowania danych na linii SDA i SCL

      // Przykładowy transfer danych:
      // - Oczekiwane dane odczytane z ADC przez magistralę I2C:
      //   Kanał 0: 12'hA23
      //   Kanał 1: 12'hB34
      //   Kanał 2: 12'hC45
      //   Kanał 3: 12'hD56
      
      // Generowanie sygnału I2C
      wait_for_i2c_start();
      send_i2c_data(8'hA2);  // Wyślij MSB kanału 0
      send_i2c_data(8'h3A);  // Wyślij LSB kanału 0
      send_i2c_data(8'hB3);  // Wyślij MSB kanału 1
      send_i2c_data(8'h4B);  // Wyślij LSB kanału 1
      send_i2c_data(8'hC4);  // Wyślij MSB kanału 2
      send_i2c_data(8'h5C);  // Wyślij LSB kanału 2
      send_i2c_data(8'hD5);  // Wyślij MSB kanału 3
      send_i2c_data(8'h6D);  // Wyślij LSB kanału 3

      wait_for_i2c_stop();
    end
  endtask

  // Symulacja sygnału START na magistrali I2C
  task wait_for_i2c_start;
    begin
      @(negedge scl);
      @(negedge sda);
    end
  endtask

  // Symulacja sygnału STOP na magistrali I2C
  task wait_for_i2c_stop;
    begin
      @(posedge scl);
      @(posedge sda);
    end
  endtask

  // Symulacja przesyłania danych przez magistralę I2C
  task send_i2c_data(input [7:0] data);
    integer i;
    begin
      for (i = 7; i >= 0; i = i - 1) begin
        @(posedge scl);
        sda_out_en = 1;  // Włącz sterowanie linią SDA
        sda = data[i];
        @(negedge scl);
        sda_out_en = 0;  // Wyłącz sterowanie linią SDA (trójstan)
        sda = 1'bz;
      end
    end
  endtask

  // Monitorowanie wyników ADC
  initial begin
    $monitor("Czas: %0t | CH0: %h | CH1: %h | CH2: %h | CH3: %h | ACK_ERR: %b",
             $time, adc_ch0_data, adc_ch1_data, adc_ch2_data, adc_ch3_data, i2c_ack_err);
  end

endmodule
