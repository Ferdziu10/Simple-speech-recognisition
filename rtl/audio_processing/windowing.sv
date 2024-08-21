module windowing (
    input logic clk,
    input logic rst,
    input logic [11:0] frame_in [0:255],
    output logic [11:0] windowed_frame [0:255],
    input logic frame_ready,
    output logic window_ready
);

    logic [11:0] windowed_frame_nxt [0:255];
    logic window_ready_nxt;
    logic [11:0] hamming_window [0:255];
    logic [23:0] mult_result;
    logic [23:0] mult_result_nxt;
    integer i,k;
    // Initialize the Hamming window coefficients
    initial begin
        hamming_window[0] = 12'd164;
hamming_window[1] = 12'd164;
hamming_window[2] = 12'd165;
hamming_window[3] = 12'd166;
hamming_window[4] = 12'd168;
hamming_window[5] = 12'd171;
hamming_window[6] = 12'd174;
hamming_window[7] = 12'd178;
hamming_window[8] = 12'd182;
hamming_window[9] = 12'd187;
hamming_window[10] = 12'd192;
hamming_window[11] = 12'd198;
hamming_window[12] = 12'd205;
hamming_window[13] = 12'd212;
hamming_window[14] = 12'd219;
hamming_window[15] = 12'd227;
hamming_window[16] = 12'd236;
hamming_window[17] = 12'd245;
hamming_window[18] = 12'd255;
hamming_window[19] = 12'd265;
hamming_window[20] = 12'd276;
hamming_window[21] = 12'd287;
hamming_window[22] = 12'd299;
hamming_window[23] = 12'd311;
hamming_window[24] = 12'd324;
hamming_window[25] = 12'd337;
hamming_window[26] = 12'd350;
hamming_window[27] = 12'd365;
hamming_window[28] = 12'd379;
hamming_window[29] = 12'd394;
hamming_window[30] = 12'd410;
hamming_window[31] = 12'd425;
hamming_window[32] = 12'd442;
hamming_window[33] = 12'd458;
hamming_window[34] = 12'd475;
hamming_window[35] = 12'd493;
hamming_window[36] = 12'd511;
hamming_window[37] = 12'd529;
hamming_window[38] = 12'd547;
hamming_window[39] = 12'd566;
hamming_window[40] = 12'd585;
hamming_window[41] = 12'd605;
hamming_window[42] = 12'd625;
hamming_window[43] = 12'd645;
hamming_window[44] = 12'd665;
hamming_window[45] = 12'd686;
hamming_window[46] = 12'd707;
hamming_window[47] = 12'd728;
hamming_window[48] = 12'd749;
hamming_window[49] = 12'd771;
hamming_window[50] = 12'd792;
hamming_window[51] = 12'd814;
hamming_window[52] = 12'd837;
hamming_window[53] = 12'd859;
hamming_window[54] = 12'd881;
hamming_window[55] = 12'd904;
hamming_window[56] = 12'd927;
hamming_window[57] = 12'd949;
hamming_window[58] = 12'd972;
hamming_window[59] = 12'd995;
hamming_window[60] = 12'd1018;
hamming_window[61] = 12'd1042;
hamming_window[62] = 12'd1065;
hamming_window[63] = 12'd1088;
hamming_window[64] = 12'd1111;
hamming_window[65] = 12'd1134;
hamming_window[66] = 12'd1158;
hamming_window[67] = 12'd1181;
hamming_window[68] = 12'd1204;
hamming_window[69] = 12'd1227;
hamming_window[70] = 12'd1250;
hamming_window[71] = 12'd1273;
hamming_window[72] = 12'd1295;
hamming_window[73] = 12'd1318;
hamming_window[74] = 12'd1341;
hamming_window[75] = 12'd1363;
hamming_window[76] = 12'd1385;
hamming_window[77] = 12'd1407;
hamming_window[78] = 12'd1429;
hamming_window[79] = 12'd1451;
hamming_window[80] = 12'd1472;
hamming_window[81] = 12'd1494;
hamming_window[82] = 12'd1515;
hamming_window[83] = 12'd1535;
hamming_window[84] = 12'd1556;
hamming_window[85] = 12'd1576;
hamming_window[86] = 12'd1596;
hamming_window[87] = 12'd1616;
hamming_window[88] = 12'd1635;
hamming_window[89] = 12'd1654;
hamming_window[90] = 12'd1673;
hamming_window[91] = 12'd1691;
hamming_window[92] = 12'd1709;
hamming_window[93] = 12'd1727;
hamming_window[94] = 12'd1744;
hamming_window[95] = 12'd1761;
hamming_window[96] = 12'd1777;
hamming_window[97] = 12'd1793;
hamming_window[98] = 12'd1809;
hamming_window[99] = 12'd1824;
hamming_window[100] = 12'd1839;
hamming_window[101] = 12'd1853;
hamming_window[102] = 12'd1867;
hamming_window[103] = 12'd1881;
hamming_window[104] = 12'd1894;
hamming_window[105] = 12'd1906;
hamming_window[106] = 12'd1918;
hamming_window[107] = 12'd1929;
hamming_window[108] = 12'd1940;
hamming_window[109] = 12'd1951;
hamming_window[110] = 12'd1961;
hamming_window[111] = 12'd1970;
hamming_window[112] = 12'd1979;
hamming_window[113] = 12'd1988;
hamming_window[114] = 12'd1995;
hamming_window[115] = 12'd2003;
hamming_window[116] = 12'd2009;
hamming_window[117] = 12'd2016;
hamming_window[118] = 12'd2021;
hamming_window[119] = 12'd2026;
hamming_window[120] = 12'd2031;
hamming_window[121] = 12'd2035;
hamming_window[122] = 12'd2038;
hamming_window[123] = 12'd2041;
hamming_window[124] = 12'd2044;
hamming_window[125] = 12'd2045;
hamming_window[126] = 12'd2046;
hamming_window[127] = 12'd2047;
hamming_window[128] = 12'd2047;
hamming_window[129] = 12'd2046;
hamming_window[130] = 12'd2045;
hamming_window[131] = 12'd2044;
hamming_window[132] = 12'd2041;
hamming_window[133] = 12'd2038;
hamming_window[134] = 12'd2035;
hamming_window[135] = 12'd2031;
hamming_window[136] = 12'd2026;
hamming_window[137] = 12'd2021;
hamming_window[138] = 12'd2016;
hamming_window[139] = 12'd2009;
hamming_window[140] = 12'd2003;
hamming_window[141] = 12'd1995;
hamming_window[142] = 12'd1988;
hamming_window[143] = 12'd1979;
hamming_window[144] = 12'd1970;
hamming_window[145] = 12'd1961;
hamming_window[146] = 12'd1951;
hamming_window[147] = 12'd1940;
hamming_window[148] = 12'd1929;
hamming_window[149] = 12'd1918;
hamming_window[150] = 12'd1906;
hamming_window[151] = 12'd1894;
hamming_window[152] = 12'd1881;
hamming_window[153] = 12'd1867;
hamming_window[154] = 12'd1853;
hamming_window[155] = 12'd1839;
hamming_window[156] = 12'd1824;
hamming_window[157] = 12'd1809;
hamming_window[158] = 12'd1793;
hamming_window[159] = 12'd1777;
hamming_window[160] = 12'd1761;
hamming_window[161] = 12'd1744;
hamming_window[162] = 12'd1727;
hamming_window[163] = 12'd1709;
hamming_window[164] = 12'd1691;
hamming_window[165] = 12'd1673;
hamming_window[166] = 12'd1654;
hamming_window[167] = 12'd1635;
hamming_window[168] = 12'd1616;
hamming_window[169] = 12'd1596;
hamming_window[170] = 12'd1576;
hamming_window[171] = 12'd1556;
hamming_window[172] = 12'd1535;
hamming_window[173] = 12'd1515;
hamming_window[174] = 12'd1494;
hamming_window[175] = 12'd1472;
hamming_window[176] = 12'd1451;
hamming_window[177] = 12'd1429;
hamming_window[178] = 12'd1407;
hamming_window[179] = 12'd1385;
hamming_window[180] = 12'd1363;
hamming_window[181] = 12'd1341;
hamming_window[182] = 12'd1318;
hamming_window[183] = 12'd1295;
hamming_window[184] = 12'd1273;
hamming_window[185] = 12'd1250;
hamming_window[186] = 12'd1227;
hamming_window[187] = 12'd1204;
hamming_window[188] = 12'd1181;
hamming_window[189] = 12'd1158;
hamming_window[190] = 12'd1134;
hamming_window[191] = 12'd1111;
hamming_window[192] = 12'd1088;
hamming_window[193] = 12'd1065;
hamming_window[194] = 12'd1042;
hamming_window[195] = 12'd1018;
hamming_window[196] = 12'd995;
hamming_window[197] = 12'd972;
hamming_window[198] = 12'd949;
hamming_window[199] = 12'd927;
hamming_window[200] = 12'd904;
hamming_window[201] = 12'd881;
hamming_window[202] = 12'd859;
hamming_window[203] = 12'd837;
hamming_window[204] = 12'd814;
hamming_window[205] = 12'd792;
hamming_window[206] = 12'd771;
hamming_window[207] = 12'd749;
hamming_window[208] = 12'd728;
hamming_window[209] = 12'd707;
hamming_window[210] = 12'd686;
hamming_window[211] = 12'd665;
hamming_window[212] = 12'd645;
hamming_window[213] = 12'd625;
hamming_window[214] = 12'd605;
hamming_window[215] = 12'd585;
hamming_window[216] = 12'd566;
hamming_window[217] = 12'd547;
hamming_window[218] = 12'd529;
hamming_window[219] = 12'd511;
hamming_window[220] = 12'd493;
hamming_window[221] = 12'd475;
hamming_window[222] = 12'd458;
hamming_window[223] = 12'd442;
hamming_window[224] = 12'd425;
hamming_window[225] = 12'd410;
hamming_window[226] = 12'd394;
hamming_window[227] = 12'd379;
hamming_window[228] = 12'd365;
hamming_window[229] = 12'd350;
hamming_window[230] = 12'd337;
hamming_window[231] = 12'd324;
hamming_window[232] = 12'd311;
hamming_window[233] = 12'd299;
hamming_window[234] = 12'd287;
hamming_window[235] = 12'd276;
hamming_window[236] = 12'd265;
hamming_window[237] = 12'd255;
hamming_window[238] = 12'd245;
hamming_window[239] = 12'd236;
hamming_window[240] = 12'd227;
hamming_window[241] = 12'd219;
hamming_window[242] = 12'd212;
hamming_window[243] = 12'd205;
hamming_window[244] = 12'd198;
hamming_window[245] = 12'd192;
hamming_window[246] = 12'd187;
hamming_window[247] = 12'd182;
hamming_window[248] = 12'd178;
hamming_window[249] = 12'd174;
hamming_window[250] = 12'd171;
hamming_window[251] = 12'd168;
hamming_window[252] = 12'd166;
hamming_window[253] = 12'd165;
hamming_window[254] = 12'd164;
hamming_window[255] = 12'd164;
    end

   // initial begin
    //    integer i;
    //    for (i = 0; i < 256; i = i + 1) begin
            // Calculate Hamming window coefficients
            // The Hamming window is defined as: w[n] = 0.54 - 0.46 * cos(2 * pi * n / (N-1))
            // where N is the window length, n is the sample index.
    //        real window_val = 0.54 - 0.46 * $cos(2 * $pi * i / 255);
            // Convert the floating-point window_val to 12-bit fixed-point
     //       hamming_window[i] = $rtoi(window_val * 2048); // Scale to fit 12-bit range
     //   end
   // end

    always_ff @(posedge clk) begin
        if (rst) begin
            window_ready <= 1'b0;
            for (k = 0; k < 256; k++)
            windowed_frame[k] <= 12'd0;
            mult_result <= 24'd0;
        end else begin
            window_ready <= window_ready_nxt;
            for (k = 0; k < 256; k++)
            windowed_frame[k] <= windowed_frame_nxt[k];
            mult_result <= mult_result_nxt;
        end 
    end

    always_comb begin
        if(frame_ready) begin
            for (i = 0; i < 256; i++) begin
                mult_result_nxt = frame_in[i] * hamming_window[i];
                windowed_frame_nxt[i] = mult_result_nxt[22:11];
            end
            window_ready_nxt = 1'b1;
        end else begin
            for (i = 0; i < 256; i++) 
                windowed_frame_nxt[i] = windowed_frame[i];
            mult_result_nxt = mult_result;
            window_ready_nxt = window_ready;
        end
    end

endmodule
