module save_file (
    input logic clk,
    input logic rst,
    input logic [11:0] data_in,
    input  logic sw0,           // switch
    output logic [11:0] data_out,
    input logic read_enable,
    input logic [13:0] address // 14-bit address to access 16K (2^14) locations needed only while reading
);

    // Block RAM array to store 12-bit data
    logic [11:0] bram [0:16383]; // 2^14 = 16384 locations, 12 bits each
    logic [13:0] write_address; 

    // Write operation with automatic address increment
    always_ff @(posedge clk or posedge rst) begin
        if (rst || !sw0) begin
            write_address <= 14'd0;
        end else if (sw0) begin
            bram[write_address] <= data_in;
            write_address <= write_address + 1; // Increment address
        end
    end

    // Read operation
    always_ff @(posedge clk or posedge rst) begin
        if (rst || sw0) begin
            data_out <= 12'd0;
        end else if (read_enable && !sw0) begin
            data_out <= bram[address];
        end
    end

endmodule



