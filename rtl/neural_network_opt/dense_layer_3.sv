import nn_parameters::*;

module dense_layer_3 (
    input clk,
    input rst,
    input logic signed [31:0] input_vector [IN_SIZE_3-1:0],
    output logic signed [39:0] output_vector [OUT_SIZE_3-1:0]
);

    logic signed [7:0] weight_matrix [IN_SIZE_3-1:0][OUT_SIZE_3-1:0];
    logic signed [7:0] bias_vector [OUT_SIZE_3-1:0];
    logic signed [39:0] output_vector_nxt [OUT_SIZE_3-1:0];
    logic [7:0] i;
    logic [7:0] i_nxt;

    integer j, k;

assign weight_matrix[0] = {8'd40, 8'd16, 8'd38};
assign weight_matrix[1] = {-8'd4, -8'd8, 8'd10};
assign weight_matrix[2] = {-8'd17, 8'd20, -8'd27};
assign weight_matrix[3] = {-8'd19, -8'd43, 8'd41};
assign weight_matrix[4] = {-8'd13, 8'd8, -8'd9};
assign weight_matrix[5] = {-8'd20, -8'd19, 8'd48};
assign weight_matrix[6] = {8'd9, 8'd11, -8'd11};
assign weight_matrix[7] = {-8'd21, 8'd25, -8'd9};
assign weight_matrix[8] = {-8'd13, -8'd27, 8'd13};
assign weight_matrix[9] = {-8'd11, -8'd12, 8'd26};
assign weight_matrix[10] = {8'd27, 8'd5, 8'd28};
assign weight_matrix[11] = {8'd43, -8'd49, -8'd44};
assign weight_matrix[12] = {8'd26, 8'd9, -8'd1};
assign weight_matrix[13] = {8'd15, -8'd13, 8'd16};
assign weight_matrix[14] = {8'd7, -8'd24, 8'd14};
assign weight_matrix[15] = {8'd17, 8'd24, -8'd14};
assign weight_matrix[16] = {-8'd15, 8'd33, 8'd29};
assign weight_matrix[17] = {-8'd42, 8'd24, -8'd11};
assign weight_matrix[18] = {8'd38, -8'd24, 8'd30};
assign weight_matrix[19] = {8'd10, -8'd39, 8'd31};
assign weight_matrix[20] = {8'd0, -8'd25, 8'd24};
assign weight_matrix[21] = {-8'd13, -8'd29, 8'd43};
assign weight_matrix[22] = {8'd11, 8'd26, 8'd18};
assign weight_matrix[23] = {8'd29, 8'd6, 8'd39};
assign weight_matrix[24] = {-8'd47, -8'd9, -8'd3};
assign weight_matrix[25] = {-8'd36, 8'd8, 8'd17};
assign weight_matrix[26] = {8'd38, -8'd39, 8'd27};
assign weight_matrix[27] = {8'd2, 8'd2, -8'd35};
assign weight_matrix[28] = {-8'd6, -8'd31, -8'd47};
assign weight_matrix[29] = {-8'd27, -8'd24, -8'd34};
assign weight_matrix[30] = {8'd23, -8'd44, -8'd28};
assign weight_matrix[31] = {-8'd43, 8'd45, 8'd18};

assign bias_vector = {8'd11, 8'd53, -8'd62};

    always_ff @(posedge clk) begin
        if(rst) begin
            for (k = 0; k < OUT_SIZE_3; k++) 
            output_vector[k] <= '0;
            i <= '0;
        end else begin
            for (k = 0; k < OUT_SIZE_3; k++)
            output_vector[k] <= output_vector_nxt[k];
            i <= i_nxt;
    end
    end
    
    always_comb begin
        if (i < IN_SIZE_3) begin
            i_nxt = i + 1;
            for (j = 0; j < OUT_SIZE_3; j++) 
            output_vector_nxt[j] = output_vector[j] +  bias_vector[j] + input_vector[i] * weight_matrix[i][j];
        end else begin
            i_nxt = i;
            for (j = 0; j < OUT_SIZE_3; j++) begin
            if (output_vector[j] < 0) 
            output_vector_nxt [j] = 0;
            else
            output_vector_nxt [j] = output_vector [j];
            end
        end

        end
endmodule
