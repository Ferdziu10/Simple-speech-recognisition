module zero_padding_12_to_16 (
    input  logic [11:0] data_in,   // 12-bitowe dane wejściowe
    output logic [15:0] data_out   // 16-bitowe dane wyjściowe
);

always_comb begin
    // Zero-padding: dodanie 4 zer do najbardziej znaczących bitów
    data_out = {4'b0000, data_in};
end

endmodule