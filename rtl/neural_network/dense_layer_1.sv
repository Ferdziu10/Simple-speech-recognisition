module dense_layer_1 (
    input clk,
    input reset,
    input [DATA_WIDTH*IN_SIZE-1:0] input_data,
    input [DATA_WIDTH*IN_SIZE*OUT_SIZE-1:0] weights,
    input [DATA_WIDTH*OUT_SIZE-1:0] bias,
    output reg [DATA_WIDTH*OUT_SIZE-1:0] output_data
);
    import nn_parameters::*;
    // Internal signals
    wire signed [DATA_WIDTH-1:0] in_data [0:IN_SIZE-1];
    wire signed [DATA_WIDTH-1:0] w [0:IN_SIZE-1][0:OUT_SIZE-1];
    wire signed [DATA_WIDTH-1:0] b [0:OUT_SIZE-1];
    reg signed [DATA_WIDTH-1:0] out_data [0:OUT_SIZE-1];
    integer i, j;

    // Split input_data, weights, and bias into arrays
    generate
        for (i = 0; i < IN_SIZE; i = i + 1) begin
            assign in_data[i] = input_data[DATA_WIDTH*(i+1)-1:DATA_WIDTH*i];
        end
        for (i = 0; i < IN_SIZE; i = i + 1) begin
            for (j = 0; j < OUT_SIZE; j = j + 1) begin
                assign w[i][j] = weights[DATA_WIDTH*(i*OUT_SIZE+j+1)-1:DATA_WIDTH*(i*OUT_SIZE+j)];
            end
        end
        for (i = 0; i < OUT_SIZE; i = i + 1) begin
            assign b[i] = bias[DATA_WIDTH*(i+1)-1:DATA_WIDTH*i];
        end
    endgenerate

    // Compute the dense layer output
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < OUT_SIZE; i = i + 1) begin
                out_data[i] <= 0;
            end
        end else begin
            for (i = 0; i < OUT_SIZE; i = i + 1) begin
                out_data[i] <= b[i];
                for (j = 0; j < IN_SIZE; j = j + 1) begin
                    out_data[i] <= out_data[i] + in_data[j] * w[j][i];
                end
            end
        end
    end

    // Combine output data into a single bus
    generate
        for (i = 0; i < OUT_SIZE; i = i + 1) begin
            assign output_data[DATA_WIDTH*(i+1)-1:DATA_WIDTH*i] = out_data[i];
        end
    endgenerate

endmodule
