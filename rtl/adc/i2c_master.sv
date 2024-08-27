module i2c_master #(
  parameter input_clk = 50000000, // input clock speed in Hz
  parameter bus_clk = 400000 // I2C bus speed in Hz
)(
  input wire clk, // system clock
  input wire rst, // active low reset
  input wire ena, // latch in command
  input wire [6:0] addr, // address of target slave
  input wire rw, // '0' is write, '1' is read
  input wire [7:0] data_wr, // data to write to slave
  output reg busy, // indicates transaction in progress
  output reg [7:0] data_rd, // data read from slave
  output reg ack_error, // flag if improper acknowledge from slave
  inout wire sda, // serial data output of I2C bus
  inout wire scl // serial clock output of I2C bus
);

  localparam divider = (input_clk / bus_clk) / 4; // number of clocks in 1/4 cycle of SCL
  typedef enum logic [2:0] {ready, start, command, slv_ack1, wr, rd, slv_ack2, mstr_ack, stop} machine; // needed states

  reg [31:0] count; // timing for clock generation
  reg [2:0] state; // state machine
  reg data_clk, data_clk_prev; // data clock for SDA
  reg scl_clk; // constantly running internal SCL
  reg scl_ena; // enables internal SCL to output
  reg sda_int; // internal SDA
  reg sda_ena_n; // enables internal SDA to output
  reg [7:0] addr_rw; // latched in address and read/write
  reg [7:0] data_tx; // latched in data to write to slave
  reg [7:0] data_rx; // data received from slave
  reg [2:0] bit_cnt; // tracks bit number in transaction
  reg stretch; // identifies if slave is stretching SCL

  // generate the timing for the bus clock (scl_clk) and the data clock (data_clk)
  always_ff @(posedge clk or negedge rst) begin
    if (!rst) begin
      stretch <= 0;
      count <= 0;
    end else begin
      data_clk_prev <= data_clk;
      if (count == divider*4-1) begin
        count <= 0;
      end else if (!stretch) begin
        count <= count + 1;
      end
      case (count)
        0: scl_clk <= 0; data_clk <= 0;
        divider: scl_clk <= 0; data_clk <= 1;
        divider*2: scl_clk <= 1; data_clk <= 1; stretch <= (scl == 0);
        divider*3: scl_clk <= 1; data_clk <= 0;
      endcase
    end
  end

  // state machine and writing to SDA during SCL low (data_clk rising edge)
  always_ff @(posedge clk or posedge rst) begin
    if (!rst) begin
      state <= ready;
      busy <= 1;
      scl_ena <= 0;
      sda_int <= 1;
      ack_error <= 0;
      bit_cnt <= 7;
      data_rd <= 8'b00000000;
    end else begin
      if (data_clk && !data_clk_prev) begin
        case (state)
          ready: begin
            if (ena) begin
              busy <= 1;
              addr_rw <= {addr, rw};
              data_tx <= data_wr;
              state <= start;
            end else begin
              busy <= 0;
              state <= ready;
            end
          end
          start: begin
            busy <= 1;
            sda_int <= addr_rw[bit_cnt];
            state <= command;
          end
          command: begin
            if (bit_cnt == 0) begin
              sda_int <= 1;
              bit_cnt <= 7;
              state <= slv_ack1;
            end else begin
              bit_cnt <= bit_cnt - 1;
              sda_int <= addr_rw[bit_cnt-1];
              state <= command;
            end
          end
          slv_ack1: begin
            if (!addr_rw[0]) begin
              sda_int <= data_tx[bit_cnt];
              state <= wr;
            end else begin
              sda_int <= 1;
              state <= rd;
            end
          end
          wr: begin
            busy <= 1;
            if (bit_cnt == 0) begin
              sda_int <= 1;
              bit_cnt <= 7;
              state <= slv_ack2;
            end else begin
              bit_cnt <= bit_cnt - 1;
              sda_int <= data_tx[bit_cnt-1];
              state <= wr;
            end
          end
          rd: begin
            busy <= 1;
            if (bit_cnt == 0) begin
              if (ena && addr_rw == {addr, rw}) begin
                sda_int <= 0;
              end else begin
                sda_int <= 1;
              end
              bit_cnt <= 7;
              data_rd <= data_rx;
              state <= mstr_ack;
            end else begin
              bit_cnt <= bit_cnt - 1;
              state <= rd;
            end
          end
          slv_ack2: begin
            if (ena) begin
              busy <= 0;
              addr_rw <= {addr, rw};
              data_tx <= data_wr;
              if (addr_rw == {addr, rw}) begin
                sda_int <= data_wr[bit_cnt];
                state <= wr;
              end else begin
                state <= start;
              end
            end else begin
              state <= stop;
            end
          end
          mstr_ack: begin
            if (ena) begin
              busy <= 0;
              addr_rw <= {addr, rw};
              data_tx <= data_wr;
              if (addr_rw == {addr, rw}) begin
                sda_int <= 1;
                state <= rd;
              end else begin
                state <= start;
              end
            end else begin
              state <= stop;
            end
          end
          stop: begin
            busy <= 0;
            state <= ready;
          end
        endcase
      end else if (!data_clk && data_clk_prev) begin
        case (state)
          start: if (!scl_ena) scl_ena <= 1;
          slv_ack1: if (sda != 0 || ack_error) ack_error <= 1;
          rd: data_rx[bit_cnt] <= sda;
          slv_ack2: if (sda != 0 || ack_error) ack_error <= 1;
          stop: scl_ena <= 0;
        endcase
      end
    end
  end

  // set SDA output
  assign sda = (sda_ena_n == 0) ? 1'b0 : 1'bz;
  assign scl = (scl_ena && scl_clk == 0) ? 1'b0 : 1'bz;
  assign sda_ena_n = (state == start) ? data_clk_prev :
                     (state == stop) ? ~data_clk_prev : sda_int;

endmodule