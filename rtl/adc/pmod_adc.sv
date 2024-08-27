module pmod_adc #(
    parameter integer sys_clk_freq = 50000000
) (
    input wire clk,             // Zegar systemowy
    input wire reset_n,         // Asynchroniczny reset aktywny niski
    inout wire scl,             // Zegar szeregowy I2C
    inout wire sda,             // Dane szeregowe I2C
    output reg i2c_ack_err,     // Flaga błędu potwierdzenia I2C
    output reg [11:0] adc_ch0_data, // Dane z kanału 0 ADC
    output reg [11:0] adc_ch1_data, // Dane z kanału 1 ADC
    output reg [11:0] adc_ch2_data, // Dane z kanału 2 ADC
    output reg [11:0] adc_ch3_data  // Dane z kanału 3 ADC
);

    typedef enum logic [1:0] {
        start,
        read_data,
        output_result
    } state_t;
    
    state_t state;
    
    logic [7:0] config;
    logic i2c_ena;
    logic [6:0] i2c_addr;
    logic i2c_rw;
    logic [7:0] i2c_data_wr;
    logic [7:0] i2c_data_rd;
    logic i2c_busy;
    logic busy_prev;
    logic [15:0] adc_buffer_a;
    logic [15:0] adc_buffer_b;
    logic [15:0] adc_buffer_c;
    logic [15:0] adc_buffer_d;

    integer busy_cnt = 0;
    integer counter = 0;

    i2c_master #(
        .input_clk(sys_clk_freq),
        .bus_clk(400000)
    ) i2c_master_0 (
        .clk(clk),
        .reset_n(reset_n),
        .ena(i2c_ena),
        .addr(i2c_addr),
        .rw(i2c_rw),
        .data_wr(i2c_data_wr),
        .busy(i2c_busy),
        .data_rd(i2c_data_rd),
        .ack_error(i2c_ack_err),
        .sda(sda),
        .scl(scl)
    );

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            counter <= 0;
            i2c_ena <= 0;
            busy_cnt <= 0;
            adc_ch0_data <= 12'b0;
            adc_ch1_data <= 12'b0;
            adc_ch2_data <= 12'b0;
            adc_ch3_data <= 12'b0;
            state <= start;
        end else begin
            case (state)
                start: begin
                    if (counter < sys_clk_freq / 10) begin
                        counter <= counter + 1;
                    end else begin
                        counter <= 0;
                        state <= read_data;
                    end
                end
                
                read_data: begin
                    busy_prev <= i2c_busy;
                    if (!busy_prev && i2c_busy) begin
                        busy_cnt <= busy_cnt + 1;
                    end
                    case (busy_cnt)
                        0: begin
                            i2c_ena <= 1;
                            i2c_addr <= 7'h28; // Adres ADC
                            i2c_rw <= 1;      // Komenda odczytu
                        end
                        1: if (!i2c_busy) adc_buffer_a[15:8] <= i2c_data_rd;
                        2: if (!i2c_busy) adc_buffer_a[7:0] <= i2c_data_rd;
                        3: if (!i2c_busy) adc_buffer_b[15:8] <= i2c_data_rd;
                        4: if (!i2c_busy) adc_buffer_b[7:0] <= i2c_data_rd;
                        5: if (!i2c_busy) adc_buffer_c[15:8] <= i2c_data_rd;
                        6: if (!i2c_busy) adc_buffer_c[7:0] <= i2c_data_rd;
                        7: if (!i2c_busy) adc_buffer_d[15:8] <= i2c_data_rd;
                        8: begin
                            i2c_ena <= 0;
                            if (!i2c_busy) begin
                                adc_buffer_d[7:0] <= i2c_data_rd;
                                busy_cnt <= 0;
                                state <= output_result;
                            end
                        end
                        default: ;
                    endcase
                end
                
                output_result: begin
                    case (adc_buffer_a[13:12])
                        2'b00: begin
                            adc_ch0_data <= adc_buffer_a[11:0];
                            adc_ch1_data <= adc_buffer_b[11:0];
                            adc_ch2_data <= adc_buffer_c[11:0];
                            adc_ch3_data <= adc_buffer_d[11:0];
                        end
                        2'b01: begin
                            adc_ch1_data <= adc_buffer_a[11:0];
                            adc_ch2_data <= adc_buffer_b[11:0];
                            adc_ch3_data <= adc_buffer_c[11:0];
                            adc_ch0_data <= adc_buffer_d[11:0];
                        end
                        2'b10: begin
                            adc_ch2_data <= adc_buffer_a[11:0];
                            adc_ch3_data <= adc_buffer_b[11:0];
                            adc_ch0_data <= adc_buffer_c[11:0];
                            adc_ch1_data <= adc_buffer_d[11:0];
                        end
                        2'b11: begin
                            adc_ch3_data <= adc_buffer_a[11:0];
                            adc_ch0_data <= adc_buffer_b[11:0];
                            adc_ch1_data <= adc_buffer_c[11:0];
                            adc_ch2_data <= adc_buffer_d[11:0];
                        end
                        default: ;
                    endcase
                    state <= read_data;
                end

                default: state <= start;
            endcase
        end
    end

endmodule