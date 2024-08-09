module top_fft (
    input logic clk,
    input logic rst,
    input logic [11:0] frame_in [0:255],
    output logic [11:0] fft_real_out [0:255],
    output logic [11:0] fft_imag_out [0:255],
    output logic fft_done
);

    // Instancje modułu fft_top_1
    fft_top_1 u_fft_top_1 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[0]),
        .x_1(frame_in[1]),
        .x_2(frame_in[2]),
        .x_3(frame_in[3]),
        .x_4(frame_in[4]),
        .x_5(frame_in[5]),
        .x_6(frame_in[6]),
        .x_7(frame_in[7]),
        .y_0_r(fft_real_out[0]),
        .y_1_r(fft_real_out[1]),
        .y_2_r(fft_real_out[2]),
        .y_3_r(fft_real_out[3]),
        .y_4_r(fft_real_out[4]),
        .y_5_r(fft_real_out[5]),
        .y_6_r(fft_real_out[6]),
        .y_7_r(fft_real_out[7]),
        .y_0_i(fft_imag_out[0]),
        .y_1_i(fft_imag_out[1]),
        .y_2_i(fft_imag_out[2]),
        .y_3_i(fft_imag_out[3]),
        .y_4_i(fft_imag_out[4]),
        .y_5_i(fft_imag_out[5]),
        .y_6_i(fft_imag_out[6]),
        .y_7_i(fft_imag_out[7])
    );

    fft_top_1 u_fft_top_2 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[8]),
        .x_1(frame_in[9]),
        .x_2(frame_in[10]),
        .x_3(frame_in[11]),
        .x_4(frame_in[12]),
        .x_5(frame_in[13]),
        .x_6(frame_in[14]),
        .x_7(frame_in[15]),
        .y_0_r(fft_real_out[8]),
        .y_1_r(fft_real_out[9]),
        .y_2_r(fft_real_out[10]),
        .y_3_r(fft_real_out[11]),
        .y_4_r(fft_real_out[12]),
        .y_5_r(fft_real_out[13]),
        .y_6_r(fft_real_out[14]),
        .y_7_r(fft_real_out[15]),
        .y_0_i(fft_imag_out[8]),
        .y_1_i(fft_imag_out[9]),
        .y_2_i(fft_imag_out[10]),
        .y_3_i(fft_imag_out[11]),
        .y_4_i(fft_imag_out[12]),
        .y_5_i(fft_imag_out[13]),
        .y_6_i(fft_imag_out[14]),
        .y_7_i(fft_imag_out[15])
    );

    fft_top_1 u_fft_top_3 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[16]),
        .x_1(frame_in[17]),
        .x_2(frame_in[18]),
        .x_3(frame_in[19]),
        .x_4(frame_in[20]),
        .x_5(frame_in[21]),
        .x_6(frame_in[22]),
        .x_7(frame_in[23]),
        .y_0_r(fft_real_out[16]),
        .y_1_r(fft_real_out[17]),
        .y_2_r(fft_real_out[18]),
        .y_3_r(fft_real_out[19]),
        .y_4_r(fft_real_out[20]),
        .y_5_r(fft_real_out[21]),
        .y_6_r(fft_real_out[22]),
        .y_7_r(fft_real_out[23]),
        .y_0_i(fft_imag_out[16]),
        .y_1_i(fft_imag_out[17]),
        .y_2_i(fft_imag_out[18]),
        .y_3_i(fft_imag_out[19]),
        .y_4_i(fft_imag_out[20]),
        .y_5_i(fft_imag_out[21]),
        .y_6_i(fft_imag_out[22]),
        .y_7_i(fft_imag_out[23])
    );

    fft_top_1 u_fft_top_4 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[24]),
        .x_1(frame_in[25]),
        .x_2(frame_in[26]),
        .x_3(frame_in[27]),
        .x_4(frame_in[28]),
        .x_5(frame_in[29]),
        .x_6(frame_in[30]),
        .x_7(frame_in[31]),
        .y_0_r(fft_real_out[24]),
        .y_1_r(fft_real_out[25]),
        .y_2_r(fft_real_out[26]),
        .y_3_r(fft_real_out[27]),
        .y_4_r(fft_real_out[28]),
        .y_5_r(fft_real_out[29]),
        .y_6_r(fft_real_out[30]),
        .y_7_r(fft_real_out[31]),
        .y_0_i(fft_imag_out[24]),
        .y_1_i(fft_imag_out[25]),
        .y_2_i(fft_imag_out[26]),
        .y_3_i(fft_imag_out[27]),
        .y_4_i(fft_imag_out[28]),
        .y_5_i(fft_imag_out[29]),
        .y_6_i(fft_imag_out[30]),
        .y_7_i(fft_imag_out[31])
    );

    fft_top_1 u_fft_top_5 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[32]),
        .x_1(frame_in[33]),
        .x_2(frame_in[34]),
        .x_3(frame_in[35]),
        .x_4(frame_in[36]),
        .x_5(frame_in[37]),
        .x_6(frame_in[38]),
        .x_7(frame_in[39]),
        .y_0_r(fft_real_out[32]),
        .y_1_r(fft_real_out[33]),
        .y_2_r(fft_real_out[34]),
        .y_3_r(fft_real_out[35]),
        .y_4_r(fft_real_out[36]),
        .y_5_r(fft_real_out[37]),
        .y_6_r(fft_real_out[38]),
        .y_7_r(fft_real_out[39]),
        .y_0_i(fft_imag_out[32]),
        .y_1_i(fft_imag_out[33]),
        .y_2_i(fft_imag_out[34]),
        .y_3_i(fft_imag_out[35]),
        .y_4_i(fft_imag_out[36]),
        .y_5_i(fft_imag_out[37]),
        .y_6_i(fft_imag_out[38]),
        .y_7_i(fft_imag_out[39])
    );

    fft_top_1 u_fft_top_6 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[40]),
        .x_1(frame_in[41]),
        .x_2(frame_in[42]),
        .x_3(frame_in[43]),
        .x_4(frame_in[44]),
        .x_5(frame_in[45]),
        .x_6(frame_in[46]),
        .x_7(frame_in[47]),
        .y_0_r(fft_real_out[40]),
        .y_1_r(fft_real_out[41]),
        .y_2_r(fft_real_out[42]),
        .y_3_r(fft_real_out[43]),
        .y_4_r(fft_real_out[44]),
        .y_5_r(fft_real_out[45]),
        .y_6_r(fft_real_out[46]),
        .y_7_r(fft_real_out[47]),
        .y_0_i(fft_imag_out[40]),
        .y_1_i(fft_imag_out[41]),
        .y_2_i(fft_imag_out[42]),
        .y_3_i(fft_imag_out[43]),
        .y_4_i(fft_imag_out[44]),
        .y_5_i(fft_imag_out[45]),
        .y_6_i(fft_imag_out[46]),
        .y_7_i(fft_imag_out[47])
    );

    fft_top_1 u_fft_top_7 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[48]),
        .x_1(frame_in[49]),
        .x_2(frame_in[50]),
        .x_3(frame_in[51]),
        .x_4(frame_in[52]),
        .x_5(frame_in[53]),
        .x_6(frame_in[54]),
        .x_7(frame_in[55]),
        .y_0_r(fft_real_out[48]),
        .y_1_r(fft_real_out[49]),
        .y_2_r(fft_real_out[50]),
        .y_3_r(fft_real_out[51]),
        .y_4_r(fft_real_out[52]),
        .y_5_r(fft_real_out[53]),
        .y_6_r(fft_real_out[54]),
        .y_7_r(fft_real_out[55]),
        .y_0_i(fft_imag_out[48]),
        .y_1_i(fft_imag_out[49]),
        .y_2_i(fft_imag_out[50]),
        .y_3_i(fft_imag_out[51]),
        .y_4_i(fft_imag_out[52]),
        .y_5_i(fft_imag_out[53]),
        .y_6_i(fft_imag_out[54]),
        .y_7_i(fft_imag_out[55])
    );

    fft_top_1 u_fft_top_8 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[56]),
        .x_1(frame_in[57]),
        .x_2(frame_in[58]),
        .x_3(frame_in[59]),
        .x_4(frame_in[60]),
        .x_5(frame_in[61]),
        .x_6(frame_in[62]),
        .x_7(frame_in[63]),
        .y_0_r(fft_real_out[56]),
        .y_1_r(fft_real_out[57]),
        .y_2_r(fft_real_out[58]),
        .y_3_r(fft_real_out[59]),
        .y_4_r(fft_real_out[60]),
        .y_5_r(fft_real_out[61]),
        .y_6_r(fft_real_out[62]),
        .y_7_r(fft_real_out[63]),
        .y_0_i(fft_imag_out[56]),
        .y_1_i(fft_imag_out[57]),
        .y_2_i(fft_imag_out[58]),
        .y_3_i(fft_imag_out[59]),
        .y_4_i(fft_imag_out[60]),
        .y_5_i(fft_imag_out[61]),
        .y_6_i(fft_imag_out[62]),
        .y_7_i(fft_imag_out[63])
    );

    fft_top_1 u_fft_top_9 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[64]),
        .x_1(frame_in[65]),
        .x_2(frame_in[66]),
        .x_3(frame_in[67]),
        .x_4(frame_in[68]),
        .x_5(frame_in[69]),
        .x_6(frame_in[70]),
        .x_7(frame_in[71]),
        .y_0_r(fft_real_out[64]),
        .y_1_r(fft_real_out[65]),
        .y_2_r(fft_real_out[66]),
        .y_3_r(fft_real_out[67]),
        .y_4_r(fft_real_out[68]),
        .y_5_r(fft_real_out[69]),
        .y_6_r(fft_real_out[70]),
        .y_7_r(fft_real_out[71]),
        .y_0_i(fft_imag_out[64]),
        .y_1_i(fft_imag_out[65]),
        .y_2_i(fft_imag_out[66]),
        .y_3_i(fft_imag_out[67]),
        .y_4_i(fft_imag_out[68]),
        .y_5_i(fft_imag_out[69]),
        .y_6_i(fft_imag_out[70]),
        .y_7_i(fft_imag_out[71])
    );

    fft_top_1 u_fft_top_10 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[72]),
        .x_1(frame_in[73]),
        .x_2(frame_in[74]),
        .x_3(frame_in[75]),
        .x_4(frame_in[76]),
        .x_5(frame_in[77]),
        .x_6(frame_in[78]),
        .x_7(frame_in[79]),
        .y_0_r(fft_real_out[72]),
        .y_1_r(fft_real_out[73]),
        .y_2_r(fft_real_out[74]),
        .y_3_r(fft_real_out[75]),
        .y_4_r(fft_real_out[76]),
        .y_5_r(fft_real_out[77]),
        .y_6_r(fft_real_out[78]),
        .y_7_r(fft_real_out[79]),
        .y_0_i(fft_imag_out[72]),
        .y_1_i(fft_imag_out[73]),
        .y_2_i(fft_imag_out[74]),
        .y_3_i(fft_imag_out[75]),
        .y_4_i(fft_imag_out[76]),
        .y_5_i(fft_imag_out[77]),
        .y_6_i(fft_imag_out[78]),
        .y_7_i(fft_imag_out[79])
    );

    fft_top_1 u_fft_top_11 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[80]),
        .x_1(frame_in[81]),
        .x_2(frame_in[82]),
        .x_3(frame_in[83]),
        .x_4(frame_in[84]),
        .x_5(frame_in[85]),
        .x_6(frame_in[86]),
        .x_7(frame_in[87]),
        .y_0_r(fft_real_out[80]),
        .y_1_r(fft_real_out[81]),
        .y_2_r(fft_real_out[82]),
        .y_3_r(fft_real_out[83]),
        .y_4_r(fft_real_out[84]),
        .y_5_r(fft_real_out[85]),
        .y_6_r(fft_real_out[86]),
        .y_7_r(fft_real_out[87]),
        .y_0_i(fft_imag_out[80]),
        .y_1_i(fft_imag_out[81]),
        .y_2_i(fft_imag_out[82]),
        .y_3_i(fft_imag_out[83]),
        .y_4_i(fft_imag_out[84]),
        .y_5_i(fft_imag_out[85]),
        .y_6_i(fft_imag_out[86]),
        .y_7_i(fft_imag_out[87])
    );

    fft_top_1 u_fft_top_12 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[88]),
        .x_1(frame_in[89]),
        .x_2(frame_in[90]),
        .x_3(frame_in[91]),
        .x_4(frame_in[92]),
        .x_5(frame_in[93]),
        .x_6(frame_in[94]),
        .x_7(frame_in[95]),
        .y_0_r(fft_real_out[88]),
        .y_1_r(fft_real_out[89]),
        .y_2_r(fft_real_out[90]),
        .y_3_r(fft_real_out[91]),
        .y_4_r(fft_real_out[92]),
        .y_5_r(fft_real_out[93]),
        .y_6_r(fft_real_out[94]),
        .y_7_r(fft_real_out[95]),
        .y_0_i(fft_imag_out[88]),
        .y_1_i(fft_imag_out[89]),
        .y_2_i(fft_imag_out[90]),
        .y_3_i(fft_imag_out[91]),
        .y_4_i(fft_imag_out[92]),
        .y_5_i(fft_imag_out[93]),
        .y_6_i(fft_imag_out[94]),
        .y_7_i(fft_imag_out[95])
    );

    fft_top_1 u_fft_top_13 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[96]),
        .x_1(frame_in[97]),
        .x_2(frame_in[98]),
        .x_3(frame_in[99]),
        .x_4(frame_in[100]),
        .x_5(frame_in[101]),
        .x_6(frame_in[102]),
        .x_7(frame_in[103]),
        .y_0_r(fft_real_out[96]),
        .y_1_r(fft_real_out[97]),
        .y_2_r(fft_real_out[98]),
        .y_3_r(fft_real_out[99]),
        .y_4_r(fft_real_out[100]),
        .y_5_r(fft_real_out[101]),
        .y_6_r(fft_real_out[102]),
        .y_7_r(fft_real_out[103]),
        .y_0_i(fft_imag_out[96]),
        .y_1_i(fft_imag_out[97]),
        .y_2_i(fft_imag_out[98]),
        .y_3_i(fft_imag_out[99]),
        .y_4_i(fft_imag_out[100]),
        .y_5_i(fft_imag_out[101]),
        .y_6_i(fft_imag_out[102]),
        .y_7_i(fft_imag_out[103])
    );

    fft_top_1 u_fft_top_14 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[104]),
        .x_1(frame_in[105]),
        .x_2(frame_in[106]),
        .x_3(frame_in[107]),
        .x_4(frame_in[108]),
        .x_5(frame_in[109]),
        .x_6(frame_in[110]),
        .x_7(frame_in[111]),
        .y_0_r(fft_real_out[104]),
        .y_1_r(fft_real_out[105]),
        .y_2_r(fft_real_out[106]),
        .y_3_r(fft_real_out[107]),
        .y_4_r(fft_real_out[108]),
        .y_5_r(fft_real_out[109]),
        .y_6_r(fft_real_out[110]),
        .y_7_r(fft_real_out[111]),
        .y_0_i(fft_imag_out[104]),
        .y_1_i(fft_imag_out[105]),
        .y_2_i(fft_imag_out[106]),
        .y_3_i(fft_imag_out[107]),
        .y_4_i(fft_imag_out[108]),
        .y_5_i(fft_imag_out[109]),
        .y_6_i(fft_imag_out[110]),
        .y_7_i(fft_imag_out[111])
    );

    fft_top_1 u_fft_top_15 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[112]),
        .x_1(frame_in[113]),
        .x_2(frame_in[114]),
        .x_3(frame_in[115]),
        .x_4(frame_in[116]),
        .x_5(frame_in[117]),
        .x_6(frame_in[118]),
        .x_7(frame_in[119]),
        .y_0_r(fft_real_out[112]),
        .y_1_r(fft_real_out[113]),
        .y_2_r(fft_real_out[114]),
        .y_3_r(fft_real_out[115]),
        .y_4_r(fft_real_out[116]),
        .y_5_r(fft_real_out[117]),
        .y_6_r(fft_real_out[118]),
        .y_7_r(fft_real_out[119]),
        .y_0_i(fft_imag_out[112]),
        .y_1_i(fft_imag_out[113]),
        .y_2_i(fft_imag_out[114]),
        .y_3_i(fft_imag_out[115]),
        .y_4_i(fft_imag_out[116]),
        .y_5_i(fft_imag_out[117]),
        .y_6_i(fft_imag_out[118]),
        .y_7_i(fft_imag_out[119])
    );

    fft_top_1 u_fft_top_16 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[120]),
        .x_1(frame_in[121]),
        .x_2(frame_in[122]),
        .x_3(frame_in[123]),
        .x_4(frame_in[124]),
        .x_5(frame_in[125]),
        .x_6(frame_in[126]),
        .x_7(frame_in[127]),
        .y_0_r(fft_real_out[120]),
        .y_1_r(fft_real_out[121]),
        .y_2_r(fft_real_out[122]),
        .y_3_r(fft_real_out[123]),
        .y_4_r(fft_real_out[124]),
        .y_5_r(fft_real_out[125]),
        .y_6_r(fft_real_out[126]),
        .y_7_r(fft_real_out[127]),
        .y_0_i(fft_imag_out[120]),
        .y_1_i(fft_imag_out[121]),
        .y_2_i(fft_imag_out[122]),
        .y_3_i(fft_imag_out[123]),
        .y_4_i(fft_imag_out[124]),
        .y_5_i(fft_imag_out[125]),
        .y_6_i(fft_imag_out[126]),
        .y_7_i(fft_imag_out[127])
    );

    fft_top_1 u_fft_top_17 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[128]),
        .x_1(frame_in[129]),
        .x_2(frame_in[130]),
        .x_3(frame_in[131]),
        .x_4(frame_in[132]),
        .x_5(frame_in[133]),
        .x_6(frame_in[134]),
        .x_7(frame_in[135]),
        .y_0_r(fft_real_out[128]),
        .y_1_r(fft_real_out[129]),
        .y_2_r(fft_real_out[130]),
        .y_3_r(fft_real_out[131]),
        .y_4_r(fft_real_out[132]),
        .y_5_r(fft_real_out[133]),
        .y_6_r(fft_real_out[134]),
        .y_7_r(fft_real_out[135]),
        .y_0_i(fft_imag_out[128]),
        .y_1_i(fft_imag_out[129]),
        .y_2_i(fft_imag_out[130]),
        .y_3_i(fft_imag_out[131]),
        .y_4_i(fft_imag_out[132]),
        .y_5_i(fft_imag_out[133]),
        .y_6_i(fft_imag_out[134]),
        .y_7_i(fft_imag_out[135])
    );

    fft_top_1 u_fft_top_18 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[136]),
        .x_1(frame_in[137]),
        .x_2(frame_in[138]),
        .x_3(frame_in[139]),
        .x_4(frame_in[140]),
        .x_5(frame_in[141]),
        .x_6(frame_in[142]),
        .x_7(frame_in[143]),
        .y_0_r(fft_real_out[136]),
        .y_1_r(fft_real_out[137]),
        .y_2_r(fft_real_out[138]),
        .y_3_r(fft_real_out[139]),
        .y_4_r(fft_real_out[140]),
        .y_5_r(fft_real_out[141]),
        .y_6_r(fft_real_out[142]),
        .y_7_r(fft_real_out[143]),
        .y_0_i(fft_imag_out[136]),
        .y_1_i(fft_imag_out[137]),
        .y_2_i(fft_imag_out[138]),
        .y_3_i(fft_imag_out[139]),
        .y_4_i(fft_imag_out[140]),
        .y_5_i(fft_imag_out[141]),
        .y_6_i(fft_imag_out[142]),
        .y_7_i(fft_imag_out[143])
    );

    fft_top_1 u_fft_top_19 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[144]),
        .x_1(frame_in[145]),
        .x_2(frame_in[146]),
        .x_3(frame_in[147]),
        .x_4(frame_in[148]),
        .x_5(frame_in[149]),
        .x_6(frame_in[150]),
        .x_7(frame_in[151]),
        .y_0_r(fft_real_out[144]),
        .y_1_r(fft_real_out[145]),
        .y_2_r(fft_real_out[146]),
        .y_3_r(fft_real_out[147]),
        .y_4_r(fft_real_out[148]),
        .y_5_r(fft_real_out[149]),
        .y_6_r(fft_real_out[150]),
        .y_7_r(fft_real_out[151]),
        .y_0_i(fft_imag_out[144]),
        .y_1_i(fft_imag_out[145]),
        .y_2_i(fft_imag_out[146]),
        .y_3_i(fft_imag_out[147]),
        .y_4_i(fft_imag_out[148]),
        .y_5_i(fft_imag_out[149]),
        .y_6_i(fft_imag_out[150]),
        .y_7_i(fft_imag_out[151])
    );

    fft_top_1 u_fft_top_20 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[152]),
        .x_1(frame_in[153]),
        .x_2(frame_in[154]),
        .x_3(frame_in[155]),
        .x_4(frame_in[156]),
        .x_5(frame_in[157]),
        .x_6(frame_in[158]),
        .x_7(frame_in[159]),
        .y_0_r(fft_real_out[152]),
        .y_1_r(fft_real_out[153]),
        .y_2_r(fft_real_out[154]),
        .y_3_r(fft_real_out[155]),
        .y_4_r(fft_real_out[156]),
        .y_5_r(fft_real_out[157]),
        .y_6_r(fft_real_out[158]),
        .y_7_r(fft_real_out[159]),
        .y_0_i(fft_imag_out[152]),
        .y_1_i(fft_imag_out[153]),
        .y_2_i(fft_imag_out[154]),
        .y_3_i(fft_imag_out[155]),
        .y_4_i(fft_imag_out[156]),
        .y_5_i(fft_imag_out[157]),
        .y_6_i(fft_imag_out[158]),
        .y_7_i(fft_imag_out[159])
    );

    fft_top_1 u_fft_top_21 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[160]),
        .x_1(frame_in[161]),
        .x_2(frame_in[162]),
        .x_3(frame_in[163]),
        .x_4(frame_in[164]),
        .x_5(frame_in[165]),
        .x_6(frame_in[166]),
        .x_7(frame_in[167]),
        .y_0_r(fft_real_out[160]),
        .y_1_r(fft_real_out[161]),
        .y_2_r(fft_real_out[162]),
        .y_3_r(fft_real_out[163]),
        .y_4_r(fft_real_out[164]),
        .y_5_r(fft_real_out[165]),
        .y_6_r(fft_real_out[166]),
        .y_7_r(fft_real_out[167]),
        .y_0_i(fft_imag_out[160]),
        .y_1_i(fft_imag_out[161]),
        .y_2_i(fft_imag_out[162]),
        .y_3_i(fft_imag_out[163]),
        .y_4_i(fft_imag_out[164]),
        .y_5_i(fft_imag_out[165]),
        .y_6_i(fft_imag_out[166]),
        .y_7_i(fft_imag_out[167])
    );

    fft_top_1 u_fft_top_22 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[168]),
        .x_1(frame_in[169]),
        .x_2(frame_in[170]),
        .x_3(frame_in[171]),
        .x_4(frame_in[172]),
        .x_5(frame_in[173]),
        .x_6(frame_in[174]),
        .x_7(frame_in[175]),
        .y_0_r(fft_real_out[168]),
        .y_1_r(fft_real_out[169]),
        .y_2_r(fft_real_out[170]),
        .y_3_r(fft_real_out[171]),
        .y_4_r(fft_real_out[172]),
        .y_5_r(fft_real_out[173]),
        .y_6_r(fft_real_out[174]),
        .y_7_r(fft_real_out[175]),
        .y_0_i(fft_imag_out[168]),
        .y_1_i(fft_imag_out[169]),
        .y_2_i(fft_imag_out[170]),
        .y_3_i(fft_imag_out[171]),
        .y_4_i(fft_imag_out[172]),
        .y_5_i(fft_imag_out[173]),
        .y_6_i(fft_imag_out[174]),
        .y_7_i(fft_imag_out[175])
    );

    fft_top_1 u_fft_top_23 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[176]),
        .x_1(frame_in[177]),
        .x_2(frame_in[178]),
        .x_3(frame_in[179]),
        .x_4(frame_in[180]),
        .x_5(frame_in[181]),
        .x_6(frame_in[182]),
        .x_7(frame_in[183]),
        .y_0_r(fft_real_out[176]),
        .y_1_r(fft_real_out[177]),
        .y_2_r(fft_real_out[178]),
        .y_3_r(fft_real_out[179]),
        .y_4_r(fft_real_out[180]),
        .y_5_r(fft_real_out[181]),
        .y_6_r(fft_real_out[182]),
        .y_7_r(fft_real_out[183]),
        .y_0_i(fft_imag_out[176]),
        .y_1_i(fft_imag_out[177]),
        .y_2_i(fft_imag_out[178]),
        .y_3_i(fft_imag_out[179]),
        .y_4_i(fft_imag_out[180]),
        .y_5_i(fft_imag_out[181]),
        .y_6_i(fft_imag_out[182]),
        .y_7_i(fft_imag_out[183])
    );

    fft_top_1 u_fft_top_24 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[184]),
        .x_1(frame_in[185]),
        .x_2(frame_in[186]),
        .x_3(frame_in[187]),
        .x_4(frame_in[188]),
        .x_5(frame_in[189]),
        .x_6(frame_in[190]),
        .x_7(frame_in[191]),
        .y_0_r(fft_real_out[184]),
        .y_1_r(fft_real_out[185]),
        .y_2_r(fft_real_out[186]),
        .y_3_r(fft_real_out[187]),
        .y_4_r(fft_real_out[188]),
        .y_5_r(fft_real_out[189]),
        .y_6_r(fft_real_out[190]),
        .y_7_r(fft_real_out[191]),
        .y_0_i(fft_imag_out[184]),
        .y_1_i(fft_imag_out[185]),
        .y_2_i(fft_imag_out[186]),
        .y_3_i(fft_imag_out[187]),
        .y_4_i(fft_imag_out[188]),
        .y_5_i(fft_imag_out[189]),
        .y_6_i(fft_imag_out[190]),
        .y_7_i(fft_imag_out[191])
    );

    fft_top_1 u_fft_top_25 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[192]),
        .x_1(frame_in[193]),
        .x_2(frame_in[194]),
        .x_3(frame_in[195]),
        .x_4(frame_in[196]),
        .x_5(frame_in[197]),
        .x_6(frame_in[198]),
        .x_7(frame_in[199]),
        .y_0_r(fft_real_out[192]),
        .y_1_r(fft_real_out[193]),
        .y_2_r(fft_real_out[194]),
        .y_3_r(fft_real_out[195]),
        .y_4_r(fft_real_out[196]),
        .y_5_r(fft_real_out[197]),
        .y_6_r(fft_real_out[198]),
        .y_7_r(fft_real_out[199]),
        .y_0_i(fft_imag_out[192]),
        .y_1_i(fft_imag_out[193]),
        .y_2_i(fft_imag_out[194]),
        .y_3_i(fft_imag_out[195]),
        .y_4_i(fft_imag_out[196]),
        .y_5_i(fft_imag_out[197]),
        .y_6_i(fft_imag_out[198]),
        .y_7_i(fft_imag_out[199])
    );

    fft_top_1 u_fft_top_26 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[200]),
        .x_1(frame_in[201]),
        .x_2(frame_in[202]),
        .x_3(frame_in[203]),
        .x_4(frame_in[204]),
        .x_5(frame_in[205]),
        .x_6(frame_in[206]),
        .x_7(frame_in[207]),
        .y_0_r(fft_real_out[200]),
        .y_1_r(fft_real_out[201]),
        .y_2_r(fft_real_out[202]),
        .y_3_r(fft_real_out[203]),
        .y_4_r(fft_real_out[204]),
        .y_5_r(fft_real_out[205]),
        .y_6_r(fft_real_out[206]),
        .y_7_r(fft_real_out[207]),
        .y_0_i(fft_imag_out[200]),
        .y_1_i(fft_imag_out[201]),
        .y_2_i(fft_imag_out[202]),
        .y_3_i(fft_imag_out[203]),
        .y_4_i(fft_imag_out[204]),
        .y_5_i(fft_imag_out[205]),
        .y_6_i(fft_imag_out[206]),
        .y_7_i(fft_imag_out[207])
    );

    fft_top_1 u_fft_top_27 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[208]),
        .x_1(frame_in[209]),
        .x_2(frame_in[210]),
        .x_3(frame_in[211]),
        .x_4(frame_in[212]),
        .x_5(frame_in[213]),
        .x_6(frame_in[214]),
        .x_7(frame_in[215]),
        .y_0_r(fft_real_out[208]),
        .y_1_r(fft_real_out[209]),
        .y_2_r(fft_real_out[210]),
        .y_3_r(fft_real_out[211]),
        .y_4_r(fft_real_out[212]),
        .y_5_r(fft_real_out[213]),
        .y_6_r(fft_real_out[214]),
        .y_7_r(fft_real_out[215]),
        .y_0_i(fft_imag_out[208]),
        .y_1_i(fft_imag_out[209]),
        .y_2_i(fft_imag_out[210]),
        .y_3_i(fft_imag_out[211]),
        .y_4_i(fft_imag_out[212]),
        .y_5_i(fft_imag_out[213]),
        .y_6_i(fft_imag_out[214]),
        .y_7_i(fft_imag_out[215])
    );

    fft_top_1 u_fft_top_28 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[216]),
        .x_1(frame_in[217]),
        .x_2(frame_in[218]),
        .x_3(frame_in[219]),
        .x_4(frame_in[220]),
        .x_5(frame_in[221]),
        .x_6(frame_in[222]),
        .x_7(frame_in[223]),
        .y_0_r(fft_real_out[216]),
        .y_1_r(fft_real_out[217]),
        .y_2_r(fft_real_out[218]),
        .y_3_r(fft_real_out[219]),
        .y_4_r(fft_real_out[220]),
        .y_5_r(fft_real_out[221]),
        .y_6_r(fft_real_out[222]),
        .y_7_r(fft_real_out[223]),
        .y_0_i(fft_imag_out[216]),
        .y_1_i(fft_imag_out[217]),
        .y_2_i(fft_imag_out[218]),
        .y_3_i(fft_imag_out[219]),
        .y_4_i(fft_imag_out[220]),
        .y_5_i(fft_imag_out[221]),
        .y_6_i(fft_imag_out[222]),
        .y_7_i(fft_imag_out[223])
    );

    fft_top_1 u_fft_top_29 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[224]),
        .x_1(frame_in[225]),
        .x_2(frame_in[226]),
        .x_3(frame_in[227]),
        .x_4(frame_in[228]),
        .x_5(frame_in[229]),
        .x_6(frame_in[230]),
        .x_7(frame_in[231]),
        .y_0_r(fft_real_out[224]),
        .y_1_r(fft_real_out[225]),
        .y_2_r(fft_real_out[226]),
        .y_3_r(fft_real_out[227]),
        .y_4_r(fft_real_out[228]),
        .y_5_r(fft_real_out[229]),
        .y_6_r(fft_real_out[230]),
        .y_7_r(fft_real_out[231]),
        .y_0_i(fft_imag_out[224]),
        .y_1_i(fft_imag_out[225]),
        .y_2_i(fft_imag_out[226]),
        .y_3_i(fft_imag_out[227]),
        .y_4_i(fft_imag_out[228]),
        .y_5_i(fft_imag_out[229]),
        .y_6_i(fft_imag_out[230]),
        .y_7_i(fft_imag_out[231])
    );

    fft_top_1 u_fft_top_30 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[232]),
        .x_1(frame_in[233]),
        .x_2(frame_in[234]),
        .x_3(frame_in[235]),
        .x_4(frame_in[236]),
        .x_5(frame_in[237]),
        .x_6(frame_in[238]),
        .x_7(frame_in[239]),
        .y_0_r(fft_real_out[232]),
        .y_1_r(fft_real_out[233]),
        .y_2_r(fft_real_out[234]),
        .y_3_r(fft_real_out[235]),
        .y_4_r(fft_real_out[236]),
        .y_5_r(fft_real_out[237]),
        .y_6_r(fft_real_out[238]),
        .y_7_r(fft_real_out[239]),
        .y_0_i(fft_imag_out[232]),
        .y_1_i(fft_imag_out[233]),
        .y_2_i(fft_imag_out[234]),
        .y_3_i(fft_imag_out[235]),
        .y_4_i(fft_imag_out[236]),
        .y_5_i(fft_imag_out[237]),
        .y_6_i(fft_imag_out[238]),
        .y_7_i(fft_imag_out[239])
    );

    fft_top_1 u_fft_top_31 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[240]),
        .x_1(frame_in[241]),
        .x_2(frame_in[242]),
        .x_3(frame_in[243]),
        .x_4(frame_in[244]),
        .x_5(frame_in[245]),
        .x_6(frame_in[246]),
        .x_7(frame_in[247]),
        .y_0_r(fft_real_out[240]),
        .y_1_r(fft_real_out[241]),
        .y_2_r(fft_real_out[242]),
        .y_3_r(fft_real_out[243]),
        .y_4_r(fft_real_out[244]),
        .y_5_r(fft_real_out[245]),
        .y_6_r(fft_real_out[246]),
        .y_7_r(fft_real_out[247]),
        .y_0_i(fft_imag_out[240]),
        .y_1_i(fft_imag_out[241]),
        .y_2_i(fft_imag_out[242]),
        .y_3_i(fft_imag_out[243]),
        .y_4_i(fft_imag_out[244]),
        .y_5_i(fft_imag_out[245]),
        .y_6_i(fft_imag_out[246]),
        .y_7_i(fft_imag_out[247])
    );

    fft_top_1 u_fft_top_32 (
        .clk(clk),
        .rst_n(rst),
        .x_0(frame_in[248]),
        .x_1(frame_in[249]),
        .x_2(frame_in[250]),
        .x_3(frame_in[251]),
        .x_4(frame_in[252]),
        .x_5(frame_in[253]),
        .x_6(frame_in[254]),
        .x_7(frame_in[255]),
        .y_0_r(fft_real_out[248]),
        .y_1_r(fft_real_out[249]),
        .y_2_r(fft_real_out[250]),
        .y_3_r(fft_real_out[251]),
        .y_4_r(fft_real_out[252]),
        .y_5_r(fft_real_out[253]),
        .y_6_r(fft_real_out[254]),
        .y_7_r(fft_real_out[255]),
        .y_0_i(fft_imag_out[248]),
        .y_1_i(fft_imag_out[249]),
        .y_2_i(fft_imag_out[250]),
        .y_3_i(fft_imag_out[251]),
        .y_4_i(fft_imag_out[252]),
        .y_5_i(fft_imag_out[253]),
        .y_6_i(fft_imag_out[254]),
        .y_7_i(fft_imag_out[255])
    );

endmodule