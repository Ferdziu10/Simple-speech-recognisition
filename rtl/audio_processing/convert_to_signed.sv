module convert_to_signed (
    input  logic [15:0] unsigned_vector [25:0],  // Wejściowy wektor logiczny
    output logic signed [15:0] signed_vector [25:0]  // Wyjściowy wektor signed
);

    // Konwersja danych wejściowych na signed
    always_comb begin
        for (int i = 0; i < 26; i++) begin
            signed_vector[i] = signed'(unsigned_vector_vector[i]);
        end
    end

endmodule