`timescale 1ns/1ps

module tb_pmod_adc_ad7991;

    // Parametry
    localparam sys_clk_freq = 50000000;

    // Sygnały
    logic clk;
    logic reset_n;
    wire scl;
    wire sda;
    wire i2c_ack_err;
    wire [11:0] adc_ch0_data;
    wire [11:0] adc_ch1_data;
    wire [11:0] adc_ch2_data;
    wire [11:0] adc_ch3_data;

    // Instancja modułu pmod_adc_ad7991
    pmod_adc_ad7991 #(
        .sys_clk_freq(sys_clk_freq)
    ) dut (
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

    // Zegar systemowy
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // Okres zegara 20ns (50 MHz)
    end

    // Inicjalizacja
    initial begin
        reset_n = 0;
        #50 reset_n = 1; // Zwalnianie resetu po 50ns

        // Czekamy na zakończenie symulacji
        #1000000 $finish; // Zakończenie symulacji po 1ms
    end

    // Monitorowanie wyników
    initial begin
        $monitor("Time: %0t | ADC Ch0: %h | ADC Ch1: %h | ADC Ch2: %h | ADC Ch3: %h | I2C Ack Err: %b",
                 $time, adc_ch0_data, adc_ch1_data, adc_ch2_data, adc_ch3_data, i2c_ack_err);
    end

    // Symulacja I2C - przykład prosty
    logic [7:0] memory [0:15];
    initial begin
        // Przykładowe dane do symulacji
        memory[0] = 8'h30;
        memory[1] = 8'h31;
        memory[2] = 8'h32;
        memory[3] = 8'h33;
        memory[4] = 8'h34;
        memory[5] = 8'h35;
        memory[6] = 8'h36;
        memory[7] = 8'h37;
        memory[8] = 8'h38;
        memory[9] = 8'h39;
        memory[10] = 8'h3A;
        memory[11] = 8'h3B;
        memory[12] = 8'h3C;
        memory[13] = 8'h3D;
        memory[14] = 8'h3E;
        memory[15] = 8'h3F;

        // Symulacja magistrali I2C
        // Tu można dodać więcej szczegółów, aby zasymulować bardziej realistyczne zachowanie
    end

    // Prosta symulacja I2C
    assign sda = 1'bz; // Linia danych w stanie wysokiej impedancji (pasywny stan magistrali)
    assign scl = clk;  // Zegar I2C podąża za zegarem systemowym (przykład)

endmodule