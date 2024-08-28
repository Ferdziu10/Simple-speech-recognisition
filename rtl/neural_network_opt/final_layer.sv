import nn_parameters::*;

module final_layer (
    input clk,
    input rst,
    input logic signed [DATA_WIDTH_3-1:0] input_vector [OUT_SIZE_3-1:0],
    output logic [DATA_WIDTH_FINAL-1:0] output_value
);
    logic [1:0] output_value_nxt ;

always_ff @(posedge clk) begin
    if(rst) begin
        output_value <= '0;
    end else begin
        output_value <= output_value_nxt;
    end
end

always_comb begin
        if(input_vector[0] > input_vector[1]) begin
            if(input_vector[2] > input_vector[0])
            output_value_nxt = 2'b01;
            else
            output_value_nxt = 2'b10;
        end else
        output_value_nxt = 2'b00;            
end

endmodule