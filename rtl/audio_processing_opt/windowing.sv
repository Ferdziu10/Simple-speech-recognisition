module windowing (
    input logic clk,
    input logic rst,
    input logic [11:0] frame_in [0:63],
    output logic [11:0] windowed_frame [0:63],
    input logic frame_ready,
    output logic window_ready
);

    logic [11:0] windowed_frame_nxt [0:63];
    logic window_ready_nxt;
    logic [11:0] hamming_window [0:63];
 //   logic [23:0] mult_result;
    logic [23:0] mult_result_nxt;
    integer i,k;
    // Initialize the Hamming window coefficients
    assign hamming_window[0] = 12'd164;
    assign hamming_window[1] = 12'd168;
    assign hamming_window[2] = 12'd182;
    assign hamming_window[3] = 12'd206;
    assign hamming_window[4] = 12'd238;
    assign hamming_window[5] = 12'd278;
    assign hamming_window[6] = 12'd327;
    assign hamming_window[7] = 12'd384;
    assign hamming_window[8] = 12'd448;
    assign hamming_window[9] = 12'd518;
    assign hamming_window[10] = 12'd595;
    assign hamming_window[11] = 12'd676;
    assign hamming_window[12] = 12'd761;
    assign hamming_window[13] = 12'd850;
    assign hamming_window[14] = 12'd942;
    assign hamming_window[15] = 12'd1035;
    assign hamming_window[16] = 12'd1129;
    assign hamming_window[17] = 12'd1222;
    assign hamming_window[18] = 12'd1315;
    assign hamming_window[19] = 12'd1405;
    assign hamming_window[20] = 12'd1493;
    assign hamming_window[21] = 12'd1576;
    assign hamming_window[22] = 12'd1655;
    assign hamming_window[23] = 12'd1728;
    assign hamming_window[24] = 12'd1796;
    assign hamming_window[25] = 12'd1856;
    assign hamming_window[26] = 12'd1909;
    assign hamming_window[27] = 12'd1954;
    assign hamming_window[28] = 12'd1990;
    assign hamming_window[29] = 12'd2018;
    assign hamming_window[30] = 12'd2036;
    assign hamming_window[31] = 12'd2046;
    assign hamming_window[32] = 12'd2046;
    assign hamming_window[33] = 12'd2036;
    assign hamming_window[34] = 12'd2018;
    assign hamming_window[35] = 12'd1990;
    assign hamming_window[36] = 12'd1954;
    assign hamming_window[37] = 12'd1909;
    assign hamming_window[38] = 12'd1856;
    assign hamming_window[39] = 12'd1796;
    assign hamming_window[40] = 12'd1728;
    assign hamming_window[41] = 12'd1655;
    assign hamming_window[42] = 12'd1576;
    assign hamming_window[43] = 12'd1493;
    assign hamming_window[44] = 12'd1405;
    assign hamming_window[45] = 12'd1315;
    assign hamming_window[46] = 12'd1222;
    assign hamming_window[47] = 12'd1129;
    assign hamming_window[48] = 12'd1035;
    assign hamming_window[49] = 12'd942;
    assign hamming_window[50] = 12'd850;
    assign hamming_window[51] = 12'd761;
    assign hamming_window[52] = 12'd676;
    assign hamming_window[53] = 12'd595;
    assign hamming_window[54] = 12'd518;
    assign hamming_window[55] = 12'd448;
    assign hamming_window[56] = 12'd384;
    assign hamming_window[57] = 12'd327;
    assign hamming_window[58] = 12'd278;
    assign hamming_window[59] = 12'd238;
    assign hamming_window[60] = 12'd206;
    assign hamming_window[61] = 12'd182;
    assign hamming_window[62] = 12'd168;
    assign hamming_window[63] = 12'd164;


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
            for (k = 0; k < 64; k++)
            windowed_frame[k] <= 12'd0;
      //      mult_result <= 24'd0;
        end else begin
            window_ready <= window_ready_nxt;
            for (k = 0; k < 64; k++)
            windowed_frame[k] <= windowed_frame_nxt[k];
       //     mult_result <= mult_result_nxt;
        end 
    end

    always_comb begin
        if(frame_ready) begin
            for (i = 0; i < 64; i++) begin
                mult_result_nxt = frame_in[i] * hamming_window[i];
                windowed_frame_nxt[i] = mult_result_nxt[22:11];
            end
            window_ready_nxt = 1'b1;
        end else begin
            for (i = 0; i < 64; i++) 
                windowed_frame_nxt[i] = windowed_frame[i];
        //    mult_result_nxt = mult_result;
            window_ready_nxt = window_ready;
        end
    end

endmodule
