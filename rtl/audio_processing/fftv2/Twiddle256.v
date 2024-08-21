//----------------------------------------------------------------------
//  Twiddle: 256-Point Twiddle Table for Radix-2^2 Butterfly
//----------------------------------------------------------------------
module Twiddle #(
    parameter   TW_FF = 1   //  Use Output Register
)(
    input           clock,  //  Master Clock
    input   [7:0]   addr,   //  Twiddle Factor Number
    output  [11:0]  tw_re,  //  Twiddle Factor (Real)
    output  [11:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[11:0]  wn_re[0:255];   //  Twiddle Table (Real)
wire[11:0]  wn_im[0:255];   //  Twiddle Table (Imag)
wire[11:0]  mx_re;          //  Multiplexer output (Real)
wire[11:0]  mx_im;          //  Multiplexer output (Imag)
reg [11:0]  ff_re;          //  Register output (Real)
reg [11:0]  ff_im;          //  Register output (Imag)

assign  mx_re = wn_re[addr];
assign  mx_im = wn_im[addr];

always @(posedge clock) begin
    ff_re <= mx_re;
    ff_im <= mx_im;
end

assign  tw_re = TW_FF ? ff_re : mx_re;
assign  tw_im = TW_FF ? ff_im : mx_im;

//----------------------------------------------------------------------
//  Twiddle Factor Value
//----------------------------------------------------------------------
//  Multiplication is bypassed when twiddle address is 0.
//  Setting wn_re[0] = 0 and wn_im[0] = 0 makes it easier to check the waveform.
//  It may also reduce power consumption slightly.
//
//      wn_re = cos(-2pi*n/256)         wn_im = sin(-2pi*n/256)
assign  wn_re[  0] = 12'h800;   assign  wn_im[  0] = 12'h000;   //   0  1.000  0.000
assign  wn_re[  1] = 12'h7F6;   assign  wn_im[  1] = 12'hF37;   //   1  0.995 -0.098
assign  wn_re[  2] = 12'h7D9;   assign  wn_im[  2] = 12'hE70;   //   2  0.981 -0.195
assign  wn_re[  3] = 12'h7A8;   assign  wn_im[  3] = 12'hDAD;   //   3  0.957 -0.290
assign  wn_re[  4] = 12'h764;   assign  wn_im[  4] = 12'hCF0;   //   4  0.924 -0.383
assign  wn_re[  5] = 12'h70E;   assign  wn_im[  5] = 12'hC3A;   //   5  0.882 -0.471
assign  wn_re[  6] = 12'h6A6;   assign  wn_im[  6] = 12'hB8E;   //   6  0.831 -0.556
assign  wn_re[  7] = 12'h62F;   assign  wn_im[  7] = 12'hAEC;   //   7  0.773 -0.634
assign  wn_re[  8] = 12'h5A8;   assign  wn_im[  8] = 12'hA58;   //   8  0.707 -0.707
assign  wn_re[  9] = 12'h513;   assign  wn_im[  9] = 12'h9D1;   //   9  0.634 -0.773
assign  wn_re[ 10] = 12'h471;   assign  wn_im[ 10] = 12'h959;   //  10  0.556 -0.831
assign  wn_re[ 11] = 12'h3C5;   assign  wn_im[ 11] = 12'h8F2;   //  11  0.471 -0.882
assign  wn_re[ 12] = 12'h30F;   assign  wn_im[ 12] = 12'h89C;   //  12  0.383 -0.924
assign  wn_re[ 13] = 12'h252;   assign  wn_im[ 13] = 12'h858;   //  13  0.290 -0.957
assign  wn_re[ 14] = 12'h18F;   assign  wn_im[ 14] = 12'h827;   //  14  0.195 -0.981
assign  wn_re[ 15] = 12'h0C8;   assign  wn_im[ 15] = 12'h80A;   //  15  0.098 -0.995
assign  wn_re[ 16] = 12'h000;   assign  wn_im[ 16] = 12'h800;   //  16  0.000 -1.000
assign  wn_re[ 17] = 12'hF37;   assign  wn_im[ 17] = 12'h80A;   //  17 -0.098 -0.995
assign  wn_re[ 18] = 12'hE70;   assign  wn_im[ 18] = 12'h827;   //  18 -0.195 -0.981
assign  wn_re[ 19] = 12'hDAD;   assign  wn_im[ 19] = 12'h858;   //  19 -0.290 -0.957
assign  wn_re[ 20] = 12'hCF0;   assign  wn_im[ 20] = 12'h89C;   //  20 -0.383 -0.924
assign  wn_re[ 21] = 12'hC3A;   assign  wn_im[ 21] = 12'h8F2;   //  21 -0.471 -0.882
assign  wn_re[ 22] = 12'hB8E;   assign  wn_im[ 22] = 12'h959;   //  22 -0.556 -0.831
assign  wn_re[ 23] = 12'hAEC;   assign  wn_im[ 23] = 12'h9D1;   //  23 -0.634 -0.773
assign  wn_re[ 24] = 12'hA58;   assign  wn_im[ 24] = 12'hA58;   //  24 -0.707 -0.707
assign  wn_re[ 25] = 12'h9D1;   assign  wn_im[ 25] = 12'hAEC;   //  25 -0.773 -0.634
assign  wn_re[ 26] = 12'h959;   assign  wn_im[ 26] = 12'hB8E;   //  26 -0.831 -0.556
assign  wn_re[ 27] = 12'h8F2;   assign  wn_im[ 27] = 12'hC3A;   //  27 -0.882 -0.471
assign  wn_re[ 28] = 12'h89C;   assign  wn_im[ 28] = 12'hCF0;   //  28 -0.924 -0.383
assign  wn_re[ 29] = 12'h858;   assign  wn_im[ 29] = 12'hDAD;   //  29 -0.957 -0.290
assign  wn_re[ 30] = 12'h827;   assign  wn_im[ 30] = 12'hE70;   //  30 -0.981 -0.195
assign  wn_re[ 31] = 12'h80A;   assign  wn_im[ 31] = 12'hF37;   //  31 -0.995 -0.098
assign  wn_re[ 32] = 12'h800;   assign  wn_im[ 32] = 12'h800;   //  32 -1.000  0.000
assign  wn_re[ 33] = 12'h80A;   assign  wn_im[ 33] = 12'h0C8;   //  33 -0.995  0.098
assign  wn_re[ 34] = 12'h827;   assign  wn_im[ 34] = 12'h18F;   //  34 -0.981  0.195
assign  wn_re[ 35] = 12'h858;   assign  wn_im[ 35] = 12'h252;   //  35 -0.957  0.290
assign  wn_re[ 36] = 12'h89C;   assign  wn_im[ 36] = 12'h30F;   //  36 -0.924  0.383
assign  wn_re[ 37] = 12'h8F2;   assign  wn_im[ 37] = 12'h3C5;   //  37 -0.882  0.471
assign  wn_re[ 38] = 12'h959;   assign  wn_im[ 38] = 12'h471;   //  38 -0.831  0.556
assign  wn_re[ 39] = 12'h9D1;   assign  wn_im[ 39] = 12'h513;   //  39 -0.773  0.634
assign  wn_re[ 40] = 12'hA58;   assign  wn_im[ 40] = 12'h5A8;   //  40 -0.707  0.707
assign  wn_re[ 41] = 12'hAEC;   assign  wn_im[ 41] = 12'h62F;   //  41 -0.634  0.773
assign  wn_re[ 42] = 12'hB8E;   assign  wn_im[ 42] = 12'h6A6;   //  42 -0.556  0.831
assign  wn_re[ 43] = 12'hC3A;   assign  wn_im[ 43] = 12'h70E;   //  43 -0.471  0.882
assign  wn_re[ 44] = 12'hCF0;   assign  wn_im[ 44] = 12'h764;   //  44 -0.383  0.924
assign  wn_re[ 45] = 12'hDAD;   assign  wn_im[ 45] = 12'h7A8;   //  45 -0.290  0.957
assign  wn_re[ 46] = 12'hE70;   assign  wn_im[ 46] = 12'h7D9;   //  46 -0.195  0.981
assign  wn_re[ 47] = 12'hF37;   assign  wn_im[ 47] = 12'h7F6;   //  47 -0.098  0.995
assign  wn_re[ 48] = 12'h800;   assign  wn_im[ 48] = 12'h800;   //  48 -0.000  1.000
assign  wn_re[ 49] = 12'h7F6;   assign  wn_im[ 49] = 12'hF37;   //  49  0.098  0.995
assign  wn_re[ 50] = 12'h7D9;   assign  wn_im[ 50] = 12'hE70;   //  50  0.195  0.981
assign  wn_re[ 51] = 12'h7A8;   assign  wn_im[ 51] = 12'hDAD;   //  51  0.290  0.957
assign  wn_re[ 52] = 12'h764;   assign  wn_im[ 52] = 12'hCF0;   //  52  0.383  0.924
assign  wn_re[ 53] = 12'h70E;   assign  wn_im[ 53] = 12'hC3A;   //  53  0.471  0.882
assign  wn_re[ 54] = 12'h6A6;   assign  wn_im[ 54] = 12'hB8E;   //  54  0.556  0.831
assign  wn_re[ 55] = 12'h62F;   assign  wn_im[ 55] = 12'hAEC;   //  55  0.634  0.773
assign  wn_re[ 56] = 12'h5A8;   assign  wn_im[ 56] = 12'hA58;   //  56  0.707  0.707
assign  wn_re[ 57] = 12'h513;   assign  wn_im[ 57] = 12'h9D1;   //  57  0.773  0.634
assign  wn_re[ 58] = 12'h471;   assign  wn_im[ 58] = 12'h959;   //  58  0.831  0.556
assign  wn_re[ 59] = 12'h3C5;   assign  wn_im[ 59] = 12'h8F2;   //  59  0.882  0.471
assign  wn_re[ 60] = 12'h30F;   assign  wn_im[ 60] = 12'h89C;   //  60  0.924  0.383
assign  wn_re[ 61] = 12'h252;   assign  wn_im[ 61] = 12'h858;   //  61  0.957  0.290
assign  wn_re[ 62] = 12'h18F;   assign  wn_im[ 62] = 12'h827;   //  62  0.981  0.195
assign  wn_re[ 63] = 12'h0C8;   assign  wn_im[ 63] = 12'h80A;   //  63  0.995  0.098
assign  wn_re[ 64] = 12'h000;   assign  wn_im[ 64] = 12'h800;   //  64  1.000  0.000
assign  wn_re[ 65] = 12'hF37;   assign  wn_im[ 65] = 12'h80A;   //  65 -0.098  0.995
assign  wn_re[ 66] = 12'hE70;   assign  wn_im[ 66] = 12'h827;   //  66 -0.195  0.981
assign  wn_re[ 67] = 12'hDAD;   assign  wn_im[ 67] = 12'h858;   //  67 -0.290  0.957
assign  wn_re[ 68] = 12'hCF0;   assign  wn_im[ 68] = 12'h89C;   //  68 -0.383  0.924
assign  wn_re[ 69] = 12'hC3A;   assign  wn_im[ 69] = 12'h8F2;   //  69 -0.471  0.882
assign  wn_re[ 70] = 12'hB8E;   assign  wn_im[ 70] = 12'h959;   //  70 -0.556  0.831
assign  wn_re[ 71] = 12'hAEC;   assign  wn_im[ 71] = 12'h9D1;   //  71 -0.634  0.773
assign  wn_re[ 72] = 12'hA58;   assign  wn_im[ 72] = 12'hA58;   //  72 -0.707  0.707
assign  wn_re[ 73] = 12'h9D1;   assign  wn_im[ 73] = 12'hAEC;   //  73 -0.773  0.634
assign  wn_re[ 74] = 12'h959;   assign  wn_im[ 74] = 12'hB8E;   //  74 -0.831  0.556
assign  wn_re[ 75] = 12'h8F2;   assign  wn_im[ 75] = 12'hC3A;   //  75 -0.882  0.471
assign  wn_re[ 76] = 12'h89C;   assign  wn_im[ 76] = 12'hCF0;   //  76 -0.924  0.383
assign  wn_re[ 77] = 12'h858;   assign  wn_im[ 77] = 12'hDAD;   //  77 -0.957  0.290
assign  wn_re[ 78] = 12'h827;   assign  wn_im[ 78] = 12'hE70;   //  78 -0.981  0.195
assign  wn_re[ 79] = 12'h80A;   assign  wn_im[ 79] = 12'hF37;   //  79 -0.995  0.098
assign  wn_re[ 80] = 12'h800;   assign  wn_im[ 80] = 12'h800;   //  80 -1.000  0.000
assign  wn_re[ 81] = 12'h7F6;   assign  wn_im[ 81] = 12'hF37;   //  81  0.098  0.995
assign  wn_re[ 82] = 12'h7D9;   assign  wn_im[ 82] = 12'hE70;   //  82  0.195  0.981
assign  wn_re[ 83] = 12'h7A8;   assign  wn_im[ 83] = 12'hDAD;   //  83  0.290  0.957
assign  wn_re[ 84] = 12'h764;   assign  wn_im[ 84] = 12'hCF0;   //  84  0.383  0.924
assign  wn_re[ 85] = 12'h70E;   assign  wn_im[ 85] = 12'hC3A;   //  85  0.471  0.882
assign  wn_re[ 86] = 12'h6A6;   assign  wn_im[ 86] = 12'hB8E;   //  86  0.556  0.831
assign  wn_re[ 87] = 12'h62F;   assign  wn_im[ 87] = 12'hAEC;   //  87  0.634  0.773
assign  wn_re[ 88] = 12'h5A8;   assign  wn_im[ 88] = 12'hA58;   //  88  0.707  0.707
assign  wn_re[ 89] = 12'h513;   assign  wn_im[ 89] = 12'h9D1;   //  89  0.773  0.634
assign  wn_re[ 90] = 12'h471;   assign  wn_im[ 90] = 12'h959;   //  90  0.831  0.556
assign  wn_re[ 91] = 12'h3C5;   assign  wn_im[ 91] = 12'h8F2;   //  91  0.882  0.471
assign  wn_re[ 92] = 12'h30F;   assign  wn_im[ 92] = 12'h89C;   //  92  0.924  0.383
assign  wn_re[ 93] = 12'h252;   assign  wn_im[ 93] = 12'h858;   //  93  0.957  0.290
assign  wn_re[ 94] = 12'h18F;   assign  wn_im[ 94] = 12'h827;   //  94  0.981  0.195
assign  wn_re[ 95] = 12'h0C8;   assign  wn_im[ 95] = 12'h80A;   //  95  0.995  0.098
assign  wn_re[ 96] = 12'h000;   assign  wn_im[ 96] = 12'h800;   //  96  1.000  0.000
assign  wn_re[ 97] = 12'hF37;   assign  wn_im[ 97] = 12'h80A;   //  97 -0.098  0.995
assign  wn_re[ 98] = 12'hE70;   assign  wn_im[ 98] = 12'h827;   //  98 -0.195  0.981
assign  wn_re[ 99] = 12'hDAD;   assign  wn_im[ 99] = 12'h858;   //  99 -0.290  0.957
assign  wn_re[100] = 12'hCF0;   assign  wn_im[100] = 12'h89C;   // 100 -0.383  0.924
assign  wn_re[101] = 12'hC3A;   assign  wn_im[101] = 12'h8F2;   // 101 -0.471  0.882
assign  wn_re[102] = 12'hB8E;   assign  wn_im[102] = 12'h959;   // 102 -0.556  0.831
assign  wn_re[103] = 12'hAEC;   assign  wn_im[103] = 12'h9D1;   // 103 -0.634  0.773
assign  wn_re[104] = 12'hA58;   assign  wn_im[104] = 12'hA58;   // 104 -0.707  0.707
assign  wn_re[105] = 12'h9D1;   assign  wn_im[105] = 12'hAEC;   // 105 -0.773  0.634
assign  wn_re[106] = 12'h959;   assign  wn_im[106] = 12'hB8E;   // 106 -0.831  0.556
assign  wn_re[107] = 12'h8F2;   assign  wn_im[107] = 12'hC3A;   // 107 -0.882  0.471
assign  wn_re[108] = 12'h89C;   assign  wn_im[108] = 12'hCF0;   // 108 -0.924  0.383
assign  wn_re[109] = 12'h858;   assign  wn_im[109] = 12'hDAD;   // 109 -0.957  0.290
assign  wn_re[110] = 12'h827;   assign  wn_im[110] = 12'hE70;   // 110 -0.981  0.195
assign  wn_re[111] = 12'h80A;   assign  wn_im[111] = 12'hF37;   // 111 -0.995  0.098
assign  wn_re[112] = 12'h800;   assign  wn_im[112] = 12'h800;   // 112 -1.000  0.000
assign  wn_re[113] = 12'h7F6;   assign  wn_im[113] = 12'hF37;   // 113  0.098  0.995
assign  wn_re[114] = 12'h7D9;   assign  wn_im[114] = 12'hE70;   // 114  0.195  0.981
assign  wn_re[115] = 12'h7A8;   assign  wn_im[115] = 12'hDAD;   // 115  0.290  0.957
assign  wn_re[116] = 12'h764;   assign  wn_im[116] = 12'hCF0;   // 116  0.383  0.924
assign  wn_re[117] = 12'h70E;   assign  wn_im[117] = 12'hC3A;   // 117  0.471  0.882
assign  wn_re[118] = 12'h6A6;   assign  wn_im[118] = 12'hB8E;   // 118  0.556  0.831
assign  wn_re[119] = 12'h62F;   assign  wn_im[119] = 12'hAEC;   // 119  0.634  0.773
assign  wn_re[120] = 12'h5A8;   assign  wn_im[120] = 12'hA58;   // 120  0.707  0.707
assign  wn_re[121] = 12'h513;   assign  wn_im[121] = 12'h9D1;   // 121  0.773  0.634
assign  wn_re[122] = 12'h471;   assign  wn_im[122] = 12'h959;   // 122  0.831  0.556
assign  wn_re[123] = 12'h3C5;   assign  wn_im[123] = 12'h8F2;   // 123  0.882  0.471
assign  wn_re[124] = 12'h30F;   assign  wn_im[124] = 12'h89C;   // 124  0.924  0.383
assign  wn_re[125] = 12'h252;   assign  wn_im[125] = 12'h858;   // 125  0.957  0.290
assign  wn_re[126] = 12'h18F;   assign  wn_im[126] = 12'h827;   // 126  0.981  0.195
assign  wn_re[127] = 12'h0C8;   assign  wn_im[127] = 12'h80A;   // 127  0.995  0.098
assign  wn_re[128] = 12'h000;   assign  wn_im[128] = 12'h800;   // 128  1.000  0.000
assign  wn_re[129] = 12'hF37;   assign  wn_im[129] = 12'h80A;   // 129 -0.098  0.995
assign  wn_re[130] = 12'hE70;   assign  wn_im[130] = 12'h827;   // 130 -0.195  0.981
assign  wn_re[131] = 12'hDAD;   assign  wn_im[131] = 12'h858;   // 131 -0.290  0.957
assign  wn_re[132] = 12'hCF0;   assign  wn_im[132] = 12'h89C;   // 132 -0.383  0.924
assign  wn_re[133] = 12'hC3A;   assign  wn_im[133] = 12'h8F2;   // 133 -0.471  0.882
assign  wn_re[134] = 12'hB8E;   assign  wn_im[134] = 12'h959;   // 134 -0.556  0.831
assign  wn_re[135] = 12'hAEC;   assign  wn_im[135] = 12'h9D1;   // 135 -0.634  0.773
assign  wn_re[136] = 12'hA58;   assign  wn_im[136] = 12'hA58;   // 136 -0.707  0.707
assign  wn_re[137] = 12'h9D1;   assign  wn_im[137] = 12'hAEC;   // 137 -0.773  0.634
assign  wn_re[138] = 12'h959;   assign  wn_im[138] = 12'hB8E;   // 138 -0.831  0.556
assign  wn_re[139] = 12'h8F2;   assign  wn_im[139] = 12'hC3A;   // 139 -0.882  0.471
assign  wn_re[140] = 12'h89C;   assign  wn_im[140] = 12'hCF0;   // 140 -0.924  0.383
assign  wn_re[141] = 12'h858;   assign  wn_im[141] = 12'hDAD;   // 141 -0.957  0.290
assign  wn_re[142] = 12'h827;   assign  wn_im[142] = 12'hE70;   // 142 -0.981  0.195
assign  wn_re[143] = 12'h80A;   assign  wn_im[143] = 12'hF37;   // 143 -0.995  0.098
assign  wn_re[144] = 12'h800;   assign  wn_im[144] = 12'h800;   // 144 -1.000  0.000
assign  wn_re[145] = 12'h7F6;   assign  wn_im[145] = 12'hF37;   // 145  0.098  0.995
assign  wn_re[146] = 12'h7D9;   assign  wn_im[146] = 12'hE70;   // 146  0.195  0.981
assign  wn_re[147] = 12'h7A8;   assign  wn_im[147] = 12'hDAD;   // 147  0.290  0.957
assign  wn_re[148] = 12'h764;   assign  wn_im[148] = 12'hCF0;   // 148  0.383  0.924
assign  wn_re[149] = 12'h70E;   assign  wn_im[149] = 12'hC3A;   // 149  0.471  0.882
assign  wn_re[150] = 12'h6A6;   assign  wn_im[150] = 12'hB8E;   // 150  0.556  0.831
assign  wn_re[151] = 12'h62F;   assign  wn_im[151] = 12'hAEC;   // 151  0.634  0.773
assign  wn_re[152] = 12'h5A8;   assign  wn_im[152] = 12'hA58;   // 152  0.707  0.707
assign  wn_re[153] = 12'h513;   assign  wn_im[153] = 12'h9D1;   // 153  0.773  0.634
assign  wn_re[154] = 12'h471;   assign  wn_im[154] = 12'h959;   // 154  0.831  0.556
assign  wn_re[155] = 12'h3C5;   assign  wn_im[155] = 12'h8F2;   // 155  0.882  0.471
assign  wn_re[156] = 12'h30F;   assign  wn_im[156] = 12'h89C;   // 156  0.924  0.383
assign  wn_re[157] = 12'h252;   assign  wn_im[157] = 12'h858;   // 157  0.957  0.290
assign  wn_re[158] = 12'h18F;   assign  wn_im[158] = 12'h827;   // 158  0.981  0.195
assign  wn_re[159] = 12'h0C8;   assign  wn_im[159] = 12'h80A;   // 159  0.995  0.098
assign  wn_re[160] = 12'h000;   assign  wn_im[160] = 12'h800;   // 160  1.000  0.000
assign  wn_re[161] = 12'hF37;   assign  wn_im[161] = 12'h80A;   // 161 -0.098  0.995
assign  wn_re[162] = 12'hE70;   assign  wn_im[162] = 12'h827;   // 162 -0.195  0.981
assign  wn_re[163] = 12'hDAD;   assign  wn_im[163] = 12'h858;   // 163 -0.290  0.957
assign  wn_re[164] = 12'hCF0;   assign  wn_im[164] = 12'h89C;   // 164 -0.383  0.924
assign  wn_re[165] = 12'hC3A;   assign  wn_im[165] = 12'h8F2;   // 165 -0.471  0.882
assign  wn_re[166] = 12'hB8E;   assign  wn_im[166] = 12'h959;   // 166 -0.556  0.831
assign  wn_re[167] = 12'hAEC;   assign  wn_im[167] = 12'h9D1;   // 167 -0.634  0.773
assign  wn_re[168] = 12'hA58;   assign  wn_im[168] = 12'hA58;   // 168 -0.707  0.707
assign  wn_re[169] = 12'h9D1;   assign  wn_im[169] = 12'hAEC;   // 169 -0.773  0.634
assign  wn_re[170] = 12'h959;   assign  wn_im[170] = 12'hB8E;   // 170 -0.831  0.556
assign  wn_re[171] = 12'h8F2;   assign  wn_im[171] = 12'hC3A;   // 171 -0.882  0.471
assign  wn_re[172] = 12'h89C;   assign  wn_im[172] = 12'hCF0;   // 172 -0.924  0.383
assign  wn_re[173] = 12'h858;   assign  wn_im[173] = 12'hDAD;   // 173 -0.957  0.290
assign  wn_re[174] = 12'h827;   assign  wn_im[174] = 12'hE70;   // 174 -0.981  0.195
assign  wn_re[175] = 12'h80A;   assign  wn_im[175] = 12'hF37;   // 175 -0.995  0.098
assign  wn_re[176] = 12'h800;   assign  wn_im[176] = 12'h800;   // 176 -1.000  0.000
assign  wn_re[177] = 12'h7F6;   assign  wn_im[177] = 12'hF37;   // 177  0.098  0.995
assign  wn_re[178] = 12'h7D9;   assign  wn_im[178] = 12'hE70;   // 178  0.195  0.981
assign  wn_re[179] = 12'h7A8;   assign  wn_im[179] = 12'hDAD;   // 179  0.290  0.957
assign  wn_re[180] = 12'h764;   assign  wn_im[180] = 12'hCF0;   // 180  0.383  0.924
assign  wn_re[181] = 12'h70E;   assign  wn_im[181] = 12'hC3A;   // 181  0.471  0.882
assign  wn_re[182] = 12'h6A6;   assign  wn_im[182] = 12'hB8E;   // 182  0.556  0.831
assign  wn_re[183] = 12'h62F;   assign  wn_im[183] = 12'hAEC;   // 183  0.634  0.773
assign  wn_re[184] = 12'h5A8;   assign  wn_im[184] = 12'hA58;   // 184  0.707  0.707
assign  wn_re[185] = 12'h513;   assign  wn_im[185] = 12'h9D1;   // 185  0.773  0.634
assign  wn_re[186] = 12'h471;   assign  wn_im[186] = 12'h959;   // 186  0.831  0.556
assign  wn_re[187] = 12'h3C5;   assign  wn_im[187] = 12'h8F2;   // 187  0.882  0.471
assign  wn_re[188] = 12'h30F;   assign  wn_im[188] = 12'h89C;   // 188  0.924  0.383
assign  wn_re[189] = 12'h252;   assign  wn_im[189] = 12'h858;   // 189  0.957  0.290
assign  wn_re[190] = 12'h18F;   assign  wn_im[190] = 12'h827;   // 190  0.981  0.195
assign  wn_re[191] = 12'h0C8;   assign  wn_im[191] = 12'h80A;   // 191  0.995  0.098
assign  wn_re[192] = 12'h000;   assign  wn_im[192] = 12'h800;   // 192  1.000  0.000
assign  wn_re[193] = 12'hF37;   assign  wn_im[193] = 12'h80A;   // 193 -0.098  0.995
assign  wn_re[194] = 12'hE70;   assign  wn_im[194] = 12'h827;   // 194 -0.195  0.981
assign  wn_re[195] = 12'hDAD;   assign  wn_im[195] = 12'h858;   // 195 -0.290  0.957
assign  wn_re[196] = 12'hCF0;   assign  wn_im[196] = 12'h89C;   // 196 -0.383  0.924
assign  wn_re[197] = 12'hC3A;   assign  wn_im[197] = 12'h8F2;   // 197 -0.471  0.882
assign  wn_re[198] = 12'hB8E;   assign  wn_im[198] = 12'h959;   // 198 -0.556  0.831
assign  wn_re[199] = 12'hAEC;   assign  wn_im[199] = 12'h9D1;   // 199 -0.634  0.773
assign  wn_re[200] = 12'hA58;   assign  wn_im[200] = 12'hA58;   // 200 -0.707  0.707
assign  wn_re[201] = 12'h9D1;   assign  wn_im[201] = 12'hAEC;   // 201 -0.773  0.634
assign  wn_re[202] = 12'h959;   assign  wn_im[202] = 12'hB8E;   // 202 -0.831  0.556
assign  wn_re[203] = 12'h8F2;   assign  wn_im[203] = 12'hC3A;   // 203 -0.882  0.471
assign  wn_re[204] = 12'h89C;   assign  wn_im[204] = 12'hCF0;   // 204 -0.924  0.383
assign  wn_re[205] = 12'h858;   assign  wn_im[205] = 12'hDAD;   // 205 -0.957  0.290
assign  wn_re[206] = 12'h827;   assign  wn_im[206] = 12'hE70;   // 206 -0.981  0.195
assign  wn_re[207] = 12'h80A;   assign  wn_im[207] = 12'hF37;   // 207 -0.995  0.098
assign  wn_re[208] = 12'h800;   assign  wn_im[208] = 12'h800;   // 208 -1.000  0.000
assign  wn_re[209] = 12'h7F6;   assign  wn_im[209] = 12'hF37;   // 209  0.098  0.995
assign  wn_re[210] = 12'h7D9;   assign  wn_im[210] = 12'hE70;   // 210  0.195  0.981
assign  wn_re[211] = 12'h7A8;   assign  wn_im[211] = 12'hDAD;   // 211  0.290  0.957
assign  wn_re[212] = 12'h764;   assign  wn_im[212] = 12'hCF0;   // 212  0.383  0.924
assign  wn_re[213] = 12'h70E;   assign  wn_im[213] = 12'hC3A;   // 213  0.471  0.882
assign  wn_re[214] = 12'h6A6;   assign  wn_im[214] = 12'hB8E;   // 214  0.556  0.831
assign  wn_re[215] = 12'h62F;   assign  wn_im[215] = 12'hAEC;   // 215  0.634  0.773
assign  wn_re[216] = 12'h5A8;   assign  wn_im[216] = 12'hA58;   // 216  0.707  0.707
assign  wn_re[217] = 12'h513;   assign  wn_im[217] = 12'h9D1;   // 217  0.773  0.634
assign  wn_re[218] = 12'h471;   assign  wn_im[218] = 12'h959;   // 218  0.831  0.556
assign  wn_re[219] = 12'h3C5;   assign  wn_im[219] = 12'h8F2;   // 219  0.882  0.471
assign  wn_re[220] = 12'h30F;   assign  wn_im[220] = 12'h89C;   // 220  0.924  0.383
assign  wn_re[221] = 12'h252;   assign  wn_im[221] = 12'h858;   // 221  0.957  0.290
assign  wn_re[222] = 12'h18F;   assign  wn_im[222] = 12'h827;   // 222  0.981  0.195
assign  wn_re[223] = 12'h0C8;   assign  wn_im[223] = 12'h80A;   // 223  0.995  0.098
assign  wn_re[224] = 12'h000;   assign  wn_im[224] = 12'h800;   // 224  1.000  0.000
assign  wn_re[225] = 12'hF37;   assign  wn_im[225] = 12'h80A;   // 225 -0.098  0.995
assign  wn_re[226] = 12'hE70;   assign  wn_im[226] = 12'h827;   // 226 -0.195  0.981
assign  wn_re[227] = 12'hDAD;   assign  wn_im[227] = 12'h858;   // 227 -0.290  0.957
assign  wn_re[228] = 12'hCF0;   assign  wn_im[228] = 12'h89C;   // 228 -0.383  0.924
assign  wn_re[229] = 12'hC3A;   assign  wn_im[229] = 12'h8F2;   // 229 -0.471  0.882
assign  wn_re[230] = 12'hB8E;   assign  wn_im[230] = 12'h959;   // 230 -0.556  0.831
assign  wn_re[231] = 12'hAEC;   assign  wn_im[231] = 12'h9D1;   // 231 -0.634  0.773
assign  wn_re[232] = 12'hA58;   assign  wn_im[232] = 12'hA58;   // 232 -0.707  0.707
assign  wn_re[233] = 12'h9D1;   assign  wn_im[233] = 12'hAEC;   // 233 -0.773  0.634
assign  wn_re[234] = 12'h959;   assign  wn_im[234] = 12'hB8E;   // 234 -0.831  0.556
assign  wn_re[235] = 12'h8F2;   assign  wn_im[235] = 12'hC3A;   // 235 -0.882  0.471
assign  wn_re[236] = 12'h89C;   assign  wn_im[236] = 12'hCF0;   // 236 -0.924  0.383
assign  wn_re[237] = 12'h858;   assign  wn_im[237] = 12'hDAD;   // 237 -0.957  0.290
assign  wn_re[238] = 12'h827;   assign  wn_im[238] = 12'hE70;   // 238 -0.981  0.195
assign  wn_re[239] = 12'h80A;   assign  wn_im[239] = 12'hF37;   // 239 -0.995  0.098
assign  wn_re[240] = 12'h800;   assign  wn_im[240] = 12'h800;   // 240 -1.000  0.000
assign  wn_re[241] = 12'h7F6;   assign  wn_im[241] = 12'hF37;   // 241  0.098  0.995
assign  wn_re[242] = 12'h7D9;   assign  wn_im[242] = 12'hE70;   // 242  0.195  0.981
assign  wn_re[243] = 12'h7A8;   assign  wn_im[243] = 12'hDAD;   // 243  0.290  0.957
assign  wn_re[244] = 12'h764;   assign  wn_im[244] = 12'hCF0;   // 244  0.383  0.924
assign  wn_re[245] = 12'h70E;   assign  wn_im[245] = 12'hC3A;   // 245  0.471  0.882
assign  wn_re[246] = 12'h6A6;   assign  wn_im[246] = 12'hB8E;   // 246  0.556  0.831
assign  wn_re[247] = 12'h62F;   assign  wn_im[247] = 12'hAEC;   // 247  0.634  0.773
assign  wn_re[248] = 12'h5A8;   assign  wn_im[248] = 12'hA58;   // 248  0.707  0.707
assign  wn_re[249] = 12'h513;   assign  wn_im[249] = 12'h9D1;   // 249  0.773  0.634
assign  wn_re[250] = 12'h471;   assign  wn_im[250] = 12'h959;   // 250  0.831  0.556
assign  wn_re[251] = 12'h3C5;   assign  wn_im[251] = 12'h8F2;   // 251  0.882  0.471
assign  wn_re[252] = 12'h30F;   assign  wn_im[252] = 12'h89C;   // 252  0.924  0.383
assign  wn_re[253] = 12'h252;   assign  wn_im[253] = 12'h858;   // 253  0.957  0.290
assign  wn_re[254] = 12'h18F;   assign  wn_im[254] = 12'h827;   // 254  0.981  0.195
assign  wn_re[255] = 12'h0C8;   assign  wn_im[255] = 12'h80A;   // 255  0.995  0.098

endmodule
