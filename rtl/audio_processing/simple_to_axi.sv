module simple_to_axi (
    input logic clk,
    input logic reset,
    input logic [31:0] simple_data_in,
    input logic simple_valid_in,
    output logic simple_ready_out,
    output logic [31:0] axi_tdata,
    output logic axi_tvalid,
    input logic axi_tready
);

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        axi_tdata <= 32'b0;
        axi_tvalid <= 1'b0;
        simple_ready_out <= 1'b1;
    end else begin
        if (simple_valid_in && simple_ready_out) begin
            axi_tdata <= simple_data_in;
            axi_tvalid <= 1'b1;
            simple_ready_out <= 1'b0; // simple interface is now busy
        end else if (axi_tready && axi_tvalid) begin
            axi_tvalid <= 1'b0;
            simple_ready_out <= 1'b1; // simple interface is ready for new data
        end
    end
end

endmodule