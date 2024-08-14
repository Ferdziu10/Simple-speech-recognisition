module axi_to_simple (
    input logic clk,
    input logic reset,
    input logic [15:0] axi_tdata,
    input logic axi_tvalid,
    output logic axi_tready,
    input logic axi_tlast,         // Dodany sygnał TLAST
    output logic [15:0] simple_data_out,
    output logic simple_valid_out,
    output logic simple_last_out   // Sygnał TLAST na wyjściu prostego interfejsu
);

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        simple_data_out <= 16'b0;
        simple_valid_out <= 1'b0;
        simple_last_out <= 1'b0;    // Zresetowanie sygnału TLAST
        axi_tready <= 1'b1;
    end else begin
        if (axi_tvalid && axi_tready) begin
            simple_data_out <= axi_tdata;
            simple_valid_out <= 1'b1;
            simple_last_out <= axi_tlast;  // Przekazanie sygnału TLAST
            axi_tready <= 1'b0; // Wait until simple interface processes the data
        end else if (!simple_valid_out) begin
            axi_tready <= 1'b1; // Ready to receive new data
        end else begin
            simple_valid_out <= 1'b0; // Reset valid signal once data is processed
            simple_last_out <= 1'b0;  // Zresetowanie TLAST po przetworzeniu danych
        end
    end
end

endmodule