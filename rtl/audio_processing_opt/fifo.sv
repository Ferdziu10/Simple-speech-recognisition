//////////////////////////////////////////////////////////////////////////////
/*
 Module name:   fifo
 Authors:       Kacper Ferdek, Mateusz Gibas
 Version:       1.0
 Last modified: 2024-08-29
 Coding style: safe, with FPGA sync reset
 Description:  Simple fifo which combine data into arrays. And start reading by the oldest data.
 */
//////////////////////////////////////////////////////////////////////////////
import ap_parameters::*;
module fifo (
    input  logic clk,
    input  logic rst,
    input  logic valid,           // Wejście valid
    input  logic [NN_DATA_WIDTH-1:0] data_in1, // Pierwsze dane wejściowe
    input  logic [NN_DATA_WIDTH-1:0] data_in2, // Drugie dane wejściowe
    output logic [NN_DATA_WIDTH-1:0] data_out [NN_ARRAY_WIDTH-1:0] // Wyjście: 26 16-bitowych danych
);

//------------------------------------------------------------------------------
// local variables
//------------------------------------------------------------------------------
    logic [NN_DATA_WIDTH-1:0] fifo_mem [NN_ARRAY_WIDTH:0];
    logic [4:0] head;
    logic [4:0] head_nxt;
    
    
//------------------------------------------------------------------------------
// output register with sync reset
//------------------------------------------------------------------------------
    always_ff @(posedge clk) begin
        if (rst) begin
            head <= '0;
            for (int i = 0; i < NN_ARRAY_WIDTH; i++) begin
                data_out[i] <= 16'h0000;
            end

        end else  begin
            for (int i = 0; i < NN_ARRAY_WIDTH; i++) begin
                data_out[i] <= fifo_mem[(i + head) % NN_ARRAY_WIDTH];
            end
            head <= head_nxt;
        end
    end

//------------------------------------------------------------------------------
// logic
//------------------------------------------------------------------------------
    always_comb begin
            if (valid) begin
            // Save first data to fifo
            fifo_mem[head] = data_in1;
            // SAve second data to fifo
            fifo_mem[head+1] = data_in2;
            head_nxt = (head + 2) % NN_ARRAY_WIDTH;
        end else begin
            for (int i = 0; i < NN_ARRAY_WIDTH; i++) begin
                fifo_mem[i] = data_out[i];
            end
            head_nxt = head;
        end
    end



endmodule