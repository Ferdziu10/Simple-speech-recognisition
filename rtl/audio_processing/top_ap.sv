module top_ap(
    input logic clk,
    input logic rst,
    input logic [11:0] adc_data,
    output logic [11:0] output_vector [25:0]
);

logic [11:0] bufor_data [255:0];
logic [23:0] sum;
logic [23:0] sum_sq;
logic ready;


adc_reader u_adc_reader(
    .clk,
    .rst,
    .adc_data,
    .data_out (bufor_data),
    .ready
);
extractor_1 u_extractor_1(
    .clk,
    .rst,
    .data_in (bufor_data),
    .sum,
    .sum_sq
);
extractor_2 u_extractor_2(
    .clk,
    .rst,
    .sum,
    .sum_sq,
    .features (output_vector)
);
endmodule