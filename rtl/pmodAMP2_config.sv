module pmodAMP2_config (
    input logic clk,         // Zegar systemowy
    input logic rst,       // Reset systemu
    output logic [1:0] GAIN, // 2-bitowe wyjście dla ustawienia wzmocnienia
    output logic SHUTDOWN    // Wyjście kontrolujące tryb shutdown
);

always_ff @(posedge clk) begin
    if (reset) begin
        GAIN <= 2'b00;       // Resetowanie wartości GAIN
        SHUTDOWN <= 1'b0;    // Resetowanie wartości SHUTDOWN
    end else begin
        GAIN <= 2'b01;       // Ustawienie wzmocnienia na 1
        SHUTDOWN <= 1'b1;    // Ustawienie SHUTDOWN na 1 (aktywny)
    end
end

endmodule