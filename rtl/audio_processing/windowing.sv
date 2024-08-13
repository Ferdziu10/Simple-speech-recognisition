module windowing (
    input logic clk,
    input logic reset,
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
        hamming_window[0] = 12'd0;
        hamming_window[1] = 12'd15;
        hamming_window[2] = 12'd60;
        hamming_window[3] = 12'd134;
        hamming_window[4] = 12'd238;
        hamming_window[5] = 12'd372;
        hamming_window[6] = 12'd536;
        hamming_window[7] = 12'd730;
        hamming_window[8] = 12'd954;
        hamming_window[9] = 12'd1208;
        hamming_window[10] = 12'd1492;
        hamming_window[11] = 12'd1806;
        hamming_window[12] = 12'd2148;
        hamming_window[13] = 12'd2518;
        hamming_window[14] = 12'd2916;
        hamming_window[15] = 12'd3341;
        hamming_window[16] = 12'd3792;
        hamming_window[17] = 12'd4270;
        hamming_window[18] = 12'd4774;
        hamming_window[19] = 12'd5304;
        hamming_window[20] = 12'd5860;
        hamming_window[21] = 12'd6442;
        hamming_window[22] = 12'd7049;
        hamming_window[23] = 12'd7681;
        hamming_window[24] = 12'd8338;
        hamming_window[25] = 12'd9019;
        hamming_window[26] = 12'd9716;
        hamming_window[27] = 12'd10439;
        hamming_window[28] = 12'd11187;
        hamming_window[29] = 12'd11961;
        hamming_window[30] = 12'd12760;
        hamming_window[31] = 12'd13585;
        hamming_window[32] = 12'd14435;
        hamming_window[33] = 12'd15312;
        hamming_window[34] = 12'd16215;
        hamming_window[35] = 12'd17144;
        hamming_window[36] = 12'd18098;
        hamming_window[37] = 12'd19078;
        hamming_window[38] = 12'd20084;
        hamming_window[39] = 12'd21116;
        hamming_window[40] = 12'd22173;
        hamming_window[41] = 12'd23256;
        hamming_window[42] = 12'd24364;
        hamming_window[43] = 12'd25497;
        hamming_window[44] = 12'd26656;
        hamming_window[45] = 12'd27840;
        hamming_window[46] = 12'd29049;
        hamming_window[47] = 12'd30283;
        hamming_window[48] = 12'd31542;
        hamming_window[49] = 12'd32825;
        hamming_window[50] = 12'd34134;
        hamming_window[51] = 12'd35466;
        hamming_window[52] = 12'd36823;
        hamming_window[53] = 12'd38103;
        hamming_window[54] = 12'd39306;
        hamming_window[55] = 12'd40433;
        hamming_window[56] = 12'd41483;
        hamming_window[57] = 12'd42456;
        hamming_window[58] = 12'd43352;
        hamming_window[59] = 12'd44172;
        hamming_window[60] = 12'd44915;
        hamming_window[61] = 12'd45582;
        hamming_window[62] = 12'd46173;
        hamming_window[63] = 12'd46688;
        hamming_window[64] = 12'd47127;
        hamming_window[65] = 12'd47491;
        hamming_window[66] = 12'd47780;
        hamming_window[67] = 12'd47994;
        hamming_window[68] = 12'd48133;
        hamming_window[69] = 12'd48198;
        hamming_window[70] = 12'd48189;
        hamming_window[71] = 12'd48006;
        hamming_window[72] = 12'd47649;
        hamming_window[73] = 12'd47119;
        hamming_window[74] = 12'd46416;
        hamming_window[75] = 12'd45541;
        hamming_window[76] = 12'd44495;
        hamming_window[77] = 12'd43279;
        hamming_window[78] = 12'd41895;
        hamming_window[79] = 12'd40345;
        hamming_window[80] = 12'd38631;
        hamming_window[81] = 12'd36756;
        hamming_window[82] = 12'd34723;
        hamming_window[83] = 12'd32536;
        hamming_window[84] = 12'd30199;
        hamming_window[85] = 12'd27716;
        hamming_window[86] = 12'd25091;
        hamming_window[87] = 12'd22329;
        hamming_window[88] = 12'd19437;
        hamming_window[89] = 12'd16422;
        hamming_window[90] = 12'd13294;
        hamming_window[91] = 12'd10064;
        hamming_window[92] = 12'd6726;
        hamming_window[93] = 12'd3311;
        hamming_window[94] = 12'd0;
        hamming_window[95] = 12'd-3286;
        hamming_window[96] = 12'd-6578;
        hamming_window[97] = 12'd-9868;
        hamming_window[98] = 12'd-13144;
        hamming_window[99] = 12'd-16413;
        hamming_window[100] = 12'd-19656;
        hamming_window[101] = 12'd-22862;
        hamming_window[102] = 12'd26023;
        hamming_window[103] = 12'd29127;
        hamming_window[104] = 12'd32167;
        hamming_window[105] = 12'd35127;
        hamming_window[106] = 12'd37993;
        hamming_window[107] = 12'd40756;
        hamming_window[108] = 12'd43404;
        hamming_window[109] = 12'd45927;
        hamming_window[110] = 12'd48315;
        hamming_window[111] = 12'd50558;
        hamming_window[112] = 12'd52643;
        hamming_window[113] = 12'd54562;
        hamming_window[114] = 12'd56293;
        hamming_window[115] = 12'd57723;
        hamming_window[116] = 12'd58850;
        hamming_window[117] = 12'd59681;
        hamming_window[118] = 12'd60223;
        hamming_window[119] = 12'd60485;
        hamming_window[120] = 12'd60477;
        hamming_window[121] = 12'd60209;
        hamming_window[122] = 12'd59593;
        hamming_window[123] = 12'd58651;
        hamming_window[124] = 12'd57289;
        hamming_window[125] = 12'd55425;
        hamming_window[126] = 12'd53075;
        hamming_window[127] = 12'd50257;
        hamming_window[128] = 12'd46992;
        hamming_window[129] = 12'd43311;
        hamming_window[130] = 12'd39151;
        hamming_window[131] = 12'd34571;
        hamming_window[132] = 12'd29568;
        hamming_window[133] = 12'd24190;
        hamming_window[134] = 12'd18478;
        hamming_window[135] = 12'd12385;
        hamming_window[136] = 12'd5958;
        hamming_window[137] = 12'd476;
        hamming_window[138] = 12'd-5987;
        hamming_window[139] = 12'd-12269;
        hamming_window[140] = 12'd-18476;
        hamming_window[141] = 12'd-24514;
        hamming_window[142] = 12'd-30378;
        hamming_window[143] = 12'd-36065;
        hamming_window[144] = 12'd-41574;
        hamming_window[145] = 12'd-46805;
        hamming_window[146] = 12'd-51855;
        hamming_window[147] = 12'd-56629;
        hamming_window[148] = 12'd-61129;
        hamming_window[149] = 12'd-65356;
        hamming_window[150] = 12'd-69311;
        hamming_window[151] = 12'd-72996;
        hamming_window[152] = 12'd-76311;
        hamming_window[153] = 12'd-79256;
        hamming_window[154] = 12'd-81833;
        hamming_window[155] = 12'd83942;
        hamming_window[156] = 12'd85583;
        hamming_window[157] = 12'd86756;
        hamming_window[158] = 12'd87462;
        hamming_window[159] = 12'd87701;
        hamming_window[160] = 12'd87475;
        hamming_window[161] = 12'd86784;
        hamming_window[162] = 12'd85629;
        hamming_window[163] = 12'd84011;
        hamming_window[164] = 12'd81932;
        hamming_window[165] = 12'd79391;
        hamming_window[166] = 12'd76391;
        hamming_window[167] = 12'd72984;
        hamming_window[168] = 12'd69170;
        hamming_window[169] = 12'd64931;
        hamming_window[170] = 12'd60294;
        hamming_window[171] = 12'd55235;
        hamming_window[172] = 12'd49727;
        hamming_window[173] = 12'd43797;
        hamming_window[174] = 12'd37419;
        hamming_window[175] = 12'd30605;
        hamming_window[176] = 12'd23389;
        hamming_window[177] = 12'd15831;
        hamming_window[178] = 12'd7927;
        hamming_window[179] = 12'd-930;
        hamming_window[180] = 12'd-10290;
        hamming_window[181] = 12'd-18925;
        hamming_window[182] = 12'd-27614;
        hamming_window[183] = 12'd-36323;
        hamming_window[184] = 12'd-45757;
        hamming_window[185] = 12'd-55868;
        hamming_window[186] = 12'd-66571;
        hamming_window[187] = 12'd-77781;
        hamming_window[188] = 12'd-89724;
        hamming_window[189] = 12'd-102545;
        hamming_window[190] = 12'd-116688;
        hamming_window[191] = 12'd-131596;
        hamming_window[192] = 12'd-147217;
        hamming_window[193] = 12'd-163498;
        hamming_window[194] = 12'd-180387;
        hamming_window[195] = 12'd-197837;
        hamming_window[196] = 12'd-215795;
        hamming_window[197] = 12'd-234217;
        hamming_window[198] = 12'd-253067;
        hamming_window[199] = 12'd-272309;
        hamming_window[200] = 12'd-291912;
        hamming_window[201] = 12'd-311861;
        hamming_window[202] = 12'd-332126;
        hamming_window[203] = 12'd-352683;
        hamming_window[204] = 12'd-373506;
        hamming_window[205] = 12'd-394569;
        hamming_window[206] = 12'd-415831;
        hamming_window[207] = 12'd-437257;
        hamming_window[208] = 12'd-458811;
        hamming_window[209] = 12'd-480457;
        hamming_window[210] = 12'd-502154;
        hamming_window[211] = 12'd-523863;
        hamming_window[212] = 12'd-545551;
        hamming_window[213] = 12'd-567179;
        hamming_window[214] = 12'd-588704;
        hamming_window[215] = 12'd-610085;
        hamming_window[216] = 12'd-631278;
        hamming_window[217] = 12'd-652249;
        hamming_window[218] = 12'd-672954;
        hamming_window[219] = 12'd-693354;
        hamming_window[220] = 12'd-713414;
        hamming_window[221] = 12'd-733104;
        hamming_window[222] = 12'd-752386;
        hamming_window[223] = 12'd-771224;
        hamming_window[224] = 12'd-789581;
        hamming_window[225] = 12'd-807419;
        hamming_window[226] = 12'd-824703;
        hamming_window[227] = 12'd-841397;
        hamming_window[228] = 12'd-857469;
        hamming_window[229] = 12'd-872884;
        hamming_window[230] = 12'd-887610;
        hamming_window[231] = 12'd-901615;
        hamming_window[232] = 12'd-914870;
        hamming_window[233] = 12'd-927341;
        hamming_window[234] = 12'd-938994;
        hamming_window[235] = 12'd-949783;
        hamming_window[236] = 12'd-959679;
        hamming_window[237] = 12'd-968659;
        hamming_window[238] = 12'd-976693;
        hamming_window[239] = 12'd-983751;
        hamming_window[240] = 12'd-989803;
        hamming_window[241] = 12'd-994821;
        hamming_window[242] = 12'd-998785;
        hamming_window[243] = 12'd-1007597;
        hamming_window[244] = 12'd1017936;
        hamming_window[245] = 12'd1027778;
        hamming_window[246] = 12'd1037090;
        hamming_window[247] = 12'd1045848;
        hamming_window[248] = 12'd1054028;
        hamming_window[249] = 12'd1061607;
        hamming_window[250] = 12'd1068558;
        hamming_window[251] = 12'd1074866;
        hamming_window[252] = 12'd1080519;
        hamming_window[253] = 12'd1085498;
        hamming_window[254] = 12'd1089786;
        hamming_window[255] = 12'd1093376;
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
        if (reset) begin
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
