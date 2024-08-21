//----------------------------------------------------------------------
//  Twiddle: 256-Point Twiddle Table for Radix-2^2 Butterfly
//----------------------------------------------------------------------
module Twiddle256 #(
    parameter   TW_FF = 1   //  Use Output Register
)(
    input           clock,  //  Master Clock
    input   [7:0]   addr,   //  Twiddle Factor Number
    output  [15:0]  tw_re,  //  Twiddle Factor (Real)
    output  [15:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[15:0]  wn_re[0:255];   //  Twiddle Table (Real)
wire[15:0]  wn_im[0:255];   //  Twiddle Table (Imag)
wire[15:0]  mx_re;          //  Multiplexer output (Real)
wire[15:0]  mx_im;          //  Multiplexer output (Imag)
reg [15:0]  ff_re;          //  Register output (Real)
reg [15:0]  ff_im;          //  Register output (Imag)

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

assign  wn_re[  0] = 16'h0000;   assign  wn_im[  0] = 16'h0000;   //   0  1.000  0.000
assign  wn_re[  1] = 16'h7F62;   assign  wn_im[  1] = 16'hF374;   //   1  0.995 -0.098
assign  wn_re[  2] = 16'h7D8A;   assign  wn_im[  2] = 16'hE707;   //   2  0.981 -0.195
assign  wn_re[  3] = 16'h7A7D;   assign  wn_im[  3] = 16'hDAD8;   //   3  0.957 -0.290
assign  wn_re[  4] = 16'h7642;   assign  wn_im[  4] = 16'hCF04;   //   4  0.924 -0.383
assign  wn_re[  5] = 16'h70E3;   assign  wn_im[  5] = 16'hC3A9;   //   5  0.882 -0.471
assign  wn_re[  6] = 16'h6A6E;   assign  wn_im[  6] = 16'hB8E3;   //   6  0.831 -0.556
assign  wn_re[  7] = 16'h62F2;   assign  wn_im[  7] = 16'hAECC;   //   7  0.773 -0.634
assign  wn_re[  8] = 16'h5A82;   assign  wn_im[  8] = 16'hA57E;   //   8  0.707 -0.707
assign  wn_re[  9] = 16'h5134;   assign  wn_im[  9] = 16'h9D0E;   //   9  0.634 -0.773
assign  wn_re[ 10] = 16'h471D;   assign  wn_im[ 10] = 16'h9592;   //  10  0.556 -0.831
assign  wn_re[ 11] = 16'h3C57;   assign  wn_im[ 11] = 16'h8F1D;   //  11  0.471 -0.882
assign  wn_re[ 12] = 16'h30FC;   assign  wn_im[ 12] = 16'h89BE;   //  12  0.383 -0.924
assign  wn_re[ 13] = 16'h2528;   assign  wn_im[ 13] = 16'h8583;   //  13  0.290 -0.957
assign  wn_re[ 14] = 16'h18F9;   assign  wn_im[ 14] = 16'h8276;   //  14  0.195 -0.981
assign  wn_re[ 15] = 16'h0C8C;   assign  wn_im[ 15] = 16'h809E;   //  15  0.098 -0.995
assign  wn_re[ 16] = 16'h0000;   assign  wn_im[ 16] = 16'h8000;   //  16  0.000 -1.000
assign  wn_re[ 17] = 16'hF374;   assign  wn_im[ 17] = 16'h809E;   //  17 -0.098 -0.995
assign  wn_re[ 18] = 16'hE707;   assign  wn_im[ 18] = 16'h8276;   //  18 -0.195 -0.981
assign  wn_re[ 19] = 16'hDAD8;   assign  wn_im[ 19] = 16'h8583;   //  19 -0.290 -0.957
assign  wn_re[ 20] = 16'hCF04;   assign  wn_im[ 20] = 16'h89BE;   //  20 -0.383 -0.924
assign  wn_re[ 21] = 16'hC3A9;   assign  wn_im[ 21] = 16'h8F1D;   //  21 -0.471 -0.882
assign  wn_re[ 22] = 16'hB8E3;   assign  wn_im[ 22] = 16'h9592;   //  22 -0.556 -0.831
assign  wn_re[ 23] = 16'hAECC;   assign  wn_im[ 23] = 16'h9D0E;   //  23 -0.634 -0.773
assign  wn_re[ 24] = 16'hA57E;   assign  wn_im[ 24] = 16'hA57E;   //  24 -0.707 -0.707
assign  wn_re[ 25] = 16'h9D0E;   assign  wn_im[ 25] = 16'hAECC;   //  25 -0.773 -0.634
assign  wn_re[ 26] = 16'h9592;   assign  wn_im[ 26] = 16'hB8E3;   //  26 -0.831 -0.556
assign  wn_re[ 27] = 16'h8F1D;   assign  wn_im[ 27] = 16'hC3A9;   //  27 -0.882 -0.471
assign  wn_re[ 28] = 16'h89BE;   assign  wn_im[ 28] = 16'hCF04;   //  28 -0.924 -0.383
assign  wn_re[ 29] = 16'h8583;   assign  wn_im[ 29] = 16'hDAD8;   //  29 -0.957 -0.290
assign  wn_re[ 30] = 16'h8276;   assign  wn_im[ 30] = 16'hE707;   //  30 -0.981 -0.195
assign  wn_re[ 31] = 16'h809E;   assign  wn_im[ 31] = 16'hF374;   //  31 -0.995 -0.098
assign  wn_re[ 32] = 16'h8000;   assign  wn_im[ 32] = 16'h0000;   //  32 -1.000  0.000
assign  wn_re[ 33] = 16'h809E;   assign  wn_im[ 33] = 16'h0C8C;   //  33 -0.995  0.098
assign  wn_re[ 34] = 16'h8276;   assign  wn_im[ 34] = 16'h18F9;   //  34 -0.981  0.195
assign  wn_re[ 35] = 16'h8583;   assign  wn_im[ 35] = 16'h2528;   //  35 -0.957  0.290
assign  wn_re[ 36] = 16'h89BE;   assign  wn_im[ 36] = 16'h30FC;   //  36 -0.924  0.383
assign  wn_re[ 37] = 16'h8F1D;   assign  wn_im[ 37] = 16'h3C57;   //  37 -0.882  0.471
assign  wn_re[ 38] = 16'h9592;   assign  wn_im[ 38] = 16'h471D;   //  38 -0.831  0.556
assign  wn_re[ 39] = 16'h9D0E;   assign  wn_im[ 39] = 16'h5134;   //  39 -0.773  0.634
assign  wn_re[ 40] = 16'hA57E;   assign  wn_im[ 40] = 16'h5A82;   //  40 -0.707  0.707
assign  wn_re[ 41] = 16'hAECC;   assign  wn_im[ 41] = 16'h62F2;   //  41 -0.634  0.773
assign  wn_re[ 42] = 16'hB8E3;   assign  wn_im[ 42] = 16'h6A6E;   //  42 -0.556  0.831
assign  wn_re[ 43] = 16'hC3A9;   assign  wn_im[ 43] = 16'h70E3;   //  43 -0.471  0.882
assign  wn_re[ 44] = 16'hCF04;   assign  wn_im[ 44] = 16'h7642;   //  44 -0.383  0.924
assign  wn_re[ 45] = 16'hDAD8;   assign  wn_im[ 45] = 16'h7A7D;   //  45 -0.290  0.957
assign  wn_re[ 46] = 16'hE707;   assign  wn_im[ 46] = 16'h7D8A;   //  46 -0.195  0.981
assign  wn_re[ 47] = 16'hF374;   assign  wn_im[ 47] = 16'h7F62;   //  47 -0.098  0.995
assign  wn_re[ 48] = 16'h0000;   assign  wn_im[ 48] = 16'h7FFF;   //  48  0.000  1.000
assign  wn_re[ 49] = 16'h0C8C;   assign  wn_im[ 49] = 16'h7F62;   //  49  0.098  0.995
assign  wn_re[ 50] = 16'h18F9;   assign  wn_im[ 50] = 16'h7D8A;   //  50  0.195  0.981
assign  wn_re[ 51] = 16'h2528;   assign  wn_im[ 51] = 16'h7A7D;   //  51  0.290  0.957
assign  wn_re[ 52] = 16'h30FC;   assign  wn_im[ 52] = 16'h7642;   //  52  0.383  0.924
assign  wn_re[ 53] = 16'h3C57;   assign  wn_im[ 53] = 16'h70E3;   //  53  0.471  0.882
assign  wn_re[ 54] = 16'h471D;   assign  wn_im[ 54] = 16'h6A6E;   //  54  0.556  0.831
assign  wn_re[ 55] = 16'h5134;   assign  wn_im[ 55] = 16'h62F2;   //  55  0.634  0.773
assign  wn_re[ 56] = 16'h5A82;   assign  wn_im[ 56] = 16'h5A82;   //  56  0.707  0.707
assign  wn_re[ 57] = 16'h62F2;   assign  wn_im[ 57] = 16'h5134;   //  57  0.773  0.634
assign  wn_re[ 58] = 16'h6A6E;   assign  wn_im[ 58] = 16'h471D;   //  58  0.831  0.556
assign  wn_re[ 59] = 16'h70E3;   assign  wn_im[ 59] = 16'h3C57;   //  59  0.882  0.471
assign  wn_re[ 60] = 16'h7642;   assign  wn_im[ 60] = 16'h30FC;   //  60  0.924  0.383
assign  wn_re[ 61] = 16'h7A7D;   assign  wn_im[ 61] = 16'h2528;   //  61  0.957  0.290
assign  wn_re[ 62] = 16'h7D8A;   assign  wn_im[ 62] = 16'h18F9;   //  62  0.981  0.195
assign  wn_re[ 63] = 16'h7F62;   assign  wn_im[ 63] = 16'h0C8C;   //  63  0.995  0.098
assign  wn_re[ 64] = 16'h7FFF;   assign  wn_im[ 64] = 16'h0000;   //  64  1.000  0.000
assign  wn_re[ 65] = 16'h7F62;   assign  wn_im[ 65] = 16'hF374;   //  65  0.995 -0.098
assign  wn_re[ 66] = 16'h7D8A;   assign  wn_im[ 66] = 16'hE707;   //  66  0.981 -0.195
assign  wn_re[ 67] = 16'h7A7D;   assign  wn_im[ 67] = 16'hDAD8;   //  67  0.957 -0.290
assign  wn_re[ 68] = 16'h7642;   assign  wn_im[ 68] = 16'hCF04;   //  68  0.924 -0.383
assign  wn_re[ 69] = 16'h70E3;   assign  wn_im[ 69] = 16'hC3A9;   //  69  0.882 -0.471
assign  wn_re[ 70] = 16'h6A6E;   assign  wn_im[ 70] = 16'hB8E3;   //  70  0.831 -0.556
assign  wn_re[ 71] = 16'h62F2;   assign  wn_im[ 71] = 16'hAECC;   //  71  0.773 -0.634
assign  wn_re[ 72] = 16'h5A82;   assign  wn_im[ 72] = 16'hA57E;   //  72  0.707 -0.707
assign  wn_re[ 73] = 16'h5134;   assign  wn_im[ 73] = 16'h9D0E;   //  73  0.634 -0.773
assign  wn_re[ 74] = 16'h471D;   assign  wn_im[ 74] = 16'h9592;   //  74  0.556 -0.831
assign  wn_re[ 75] = 16'h3C57;   assign  wn_im[ 75] = 16'h8F1D;   //  75  0.471 -0.882
assign  wn_re[ 76] = 16'h30FC;   assign  wn_im[ 76] = 16'h89BE;   //  76  0.383 -0.924
assign  wn_re[ 77] = 16'h2528;   assign  wn_im[ 77] = 16'h8583;   //  77  0.290 -0.957
assign  wn_re[ 78] = 16'h18F9;   assign  wn_im[ 78] = 16'h8276;   //  78  0.195 -0.981
assign  wn_re[ 79] = 16'h0C8C;   assign  wn_im[ 79] = 16'h809E;   //  79  0.098 -0.995
assign  wn_re[ 80] = 16'h0000;   assign  wn_im[ 80] = 16'h8000;   //  80  0.000 -1.000
assign  wn_re[ 81] = 16'hF374;   assign  wn_im[ 81] = 16'h809E;   //  81 -0.098 -0.995
assign  wn_re[ 82] = 16'hE707;   assign  wn_im[ 82] = 16'h8276;   //  82 -0.195 -0.981
assign  wn_re[ 83] = 16'hDAD8;   assign  wn_im[ 83] = 16'h8583;   //  83 -0.290 -0.957
assign  wn_re[ 84] = 16'hCF04;   assign  wn_im[ 84] = 16'h89BE;   //  84 -0.383 -0.924
assign  wn_re[ 85] = 16'hC3A9;   assign  wn_im[ 85] = 16'h8F1D;   //  85 -0.471 -0.882
assign  wn_re[ 86] = 16'hB8E3;   assign  wn_im[ 86] = 16'h9592;   //  86 -0.556 -0.831
assign  wn_re[ 87] = 16'hAECC;   assign  wn_im[ 87] = 16'h9D0E;   //  87 -0.634 -0.773
assign  wn_re[ 88] = 16'hA57E;   assign  wn_im[ 88] = 16'hA57E;   //  88 -0.707 -0.707
assign  wn_re[ 89] = 16'h9D0E;   assign  wn_im[ 89] = 16'hAECC;   //  89 -0.773 -0.634
assign  wn_re[ 90] = 16'h9592;   assign  wn_im[ 90] = 16'hB8E3;   //  90 -0.831 -0.556
assign  wn_re[ 91] = 16'h8F1D;   assign  wn_im[ 91] = 16'hC3A9;   //  91 -0.882 -0.471
assign  wn_re[ 92] = 16'h89BE;   assign  wn_im[ 92] = 16'hCF04;   //  92 -0.924 -0.383
assign  wn_re[ 93] = 16'h8583;   assign  wn_im[ 93] = 16'hDAD8;   //  93 -0.957 -0.290
assign  wn_re[ 94] = 16'h8276;   assign  wn_im[ 94] = 16'hE707;   //  94 -0.981 -0.195
assign  wn_re[ 95] = 16'h809E;   assign  wn_im[ 95] = 16'hF374;   //  95 -0.995 -0.098
assign  wn_re[ 96] = 16'h8000;   assign  wn_im[ 96] = 16'h0000;   //  96 -1.000  0.000
assign  wn_re[ 97] = 16'h809E;   assign  wn_im[ 97] = 16'h0C8C;   //  97 -0.995  0.098
assign  wn_re[ 98] = 16'h8276;   assign  wn_im[ 98] = 16'h18F9;   //  98 -0.981  0.195
assign  wn_re[ 99] = 16'h8583;   assign  wn_im[ 99] = 16'h2528;   //  99 -0.957  0.290
assign  wn_re[100] = 16'h89BE;   assign  wn_im[100] = 16'h30FC;   // 100 -0.924  0.383
assign  wn_re[101] = 16'h8F1D;   assign  wn_im[101] = 16'h3C57;   // 101 -0.882  0.471
assign  wn_re[102] = 16'h9592;   assign  wn_im[102] = 16'h471D;   // 102 -0.831  0.556
assign  wn_re[103] = 16'h9D0E;   assign  wn_im[103] = 16'h5134;   // 103 -0.773  0.634
assign  wn_re[104] = 16'hA57E;   assign  wn_im[104] = 16'h5A82;   // 104 -0.707  0.707
assign  wn_re[105] = 16'hAECC;   assign  wn_im[105] = 16'h62F2;   // 105 -0.634  0.773
assign  wn_re[106] = 16'hB8E3;   assign  wn_im[106] = 16'h6A6E;   // 106 -0.556  0.831
assign  wn_re[107] = 16'hC3A9;   assign  wn_im[107] = 16'h70E3;   // 107 -0.471  0.882
assign  wn_re[108] = 16'hCF04;   assign  wn_im[108] = 16'h7642;   // 108 -0.383  0.924
assign  wn_re[109] = 16'hDAD8;   assign  wn_im[109] = 16'h7A7D;   // 109 -0.290  0.957
assign  wn_re[110] = 16'hE707;   assign  wn_im[110] = 16'h7D8A;   // 110 -0.195  0.981
assign  wn_re[111] = 16'hF374;   assign  wn_im[111] = 16'h7F62;   // 111 -0.098  0.995
assign  wn_re[112] = 16'h0000;   assign  wn_im[112] = 16'h7FFF;   // 112  0.000  1.000
assign  wn_re[113] = 16'h0C8C;   assign  wn_im[113] = 16'h7F62;   // 113  0.098  0.995
assign  wn_re[114] = 16'h18F9;   assign  wn_im[114] = 16'h7D8A;   // 114  0.195  0.981
assign  wn_re[115] = 16'h2528;   assign  wn_im[115] = 16'h7A7D;   // 115  0.290  0.957
assign  wn_re[116] = 16'h30FC;   assign  wn_im[116] = 16'h7642;   // 116  0.383  0.924
assign  wn_re[117] = 16'h3C57;   assign  wn_im[117] = 16'h70E3;   // 117  0.471  0.882
assign  wn_re[118] = 16'h471D;   assign  wn_im[118] = 16'h6A6E;   // 118  0.556  0.831
assign  wn_re[119] = 16'h5134;   assign  wn_im[119] = 16'h62F2;   // 119  0.634  0.773
assign  wn_re[120] = 16'h5A82;   assign  wn_im[120] = 16'h5A82;   // 120  0.707  0.707
assign  wn_re[121] = 16'h62F2;   assign  wn_im[121] = 16'h5134;   // 121  0.773  0.634
assign  wn_re[122] = 16'h6A6E;   assign  wn_im[122] = 16'h471D;   // 122  0.831  0.556
assign  wn_re[123] = 16'h70E3;   assign  wn_im[123] = 16'h3C57;   // 123  0.882  0.471
assign  wn_re[124] = 16'h7642;   assign  wn_im[124] = 16'h30FC;   // 124  0.924  0.383
assign  wn_re[125] = 16'h7A7D;   assign  wn_im[125] = 16'h2528;   // 125  0.957  0.290
assign  wn_re[126] = 16'h7D8A;   assign  wn_im[126] = 16'h18F9;   // 126  0.981  0.195
assign  wn_re[127] = 16'h7F62;   assign  wn_im[127] = 16'h0C8C;   // 127  0.995  0.098
assign  wn_re[128] = 16'h7FFF;   assign  wn_im[128] = 16'h0000;   // 128  1.000  0.000
assign  wn_re[129] = 16'h7F62;   assign  wn_im[129] = 16'hF374;   // 129  0.995 -0.098
assign  wn_re[130] = 16'h7D8A;   assign  wn_im[130] = 16'hE707;   // 130  0.981 -0.195
assign  wn_re[131] = 16'h7A7D;   assign  wn_im[131] = 16'hDAD8;   // 131  0.957 -0.290
assign  wn_re[132] = 16'h7642;   assign  wn_im[132] = 16'hCF04;   // 132  0.924 -0.383
assign  wn_re[133] = 16'h70E3;   assign  wn_im[133] = 16'hC3A9;   // 133  0.882 -0.471
assign  wn_re[134] = 16'h6A6E;   assign  wn_im[134] = 16'hB8E3;   // 134  0.831 -0.556
assign  wn_re[135] = 16'h62F2;   assign  wn_im[135] = 16'hAECC;   // 135  0.773 -0.634
assign  wn_re[136] = 16'h5A82;   assign  wn_im[136] = 16'hA57E;   // 136  0.707 -0.707
assign  wn_re[137] = 16'h5134;   assign  wn_im[137] = 16'h9D0E;   // 137  0.634 -0.773
assign  wn_re[138] = 16'h471D;   assign  wn_im[138] = 16'h9592;   // 138  0.556 -0.831
assign  wn_re[139] = 16'h3C57;   assign  wn_im[139] = 16'h8F1D;   // 139  0.471 -0.882
assign  wn_re[140] = 16'h30FC;   assign  wn_im[140] = 16'h89BE;   // 140  0.383 -0.924
assign  wn_re[141] = 16'h2528;   assign  wn_im[141] = 16'h8583;   // 141  0.290 -0.957
assign  wn_re[142] = 16'h18F9;   assign  wn_im[142] = 16'h8276;   // 142  0.195 -0.981
assign  wn_re[143] = 16'h0C8C;   assign  wn_im[143] = 16'h809E;   // 143  0.098 -0.995
assign  wn_re[144] = 16'h0000;   assign  wn_im[144] = 16'h8000;   // 144  0.000 -1.000
assign  wn_re[145] = 16'hF374;   assign  wn_im[145] = 16'h809E;   // 145 -0.098 -0.995
assign  wn_re[146] = 16'hE707;   assign  wn_im[146] = 16'h8276;   // 146 -0.195 -0.981
assign  wn_re[147] = 16'hDAD8;   assign  wn_im[147] = 16'h8583;   // 147 -0.290 -0.957
assign  wn_re[148] = 16'hCF04;   assign  wn_im[148] = 16'h89BE;   // 148 -0.383 -0.924
assign  wn_re[149] = 16'hC3A9;   assign  wn_im[149] = 16'h8F1D;   // 149 -0.471 -0.882
assign  wn_re[150] = 16'hB8E3;   assign  wn_im[150] = 16'h9592;   // 150 -0.556 -0.831
assign  wn_re[151] = 16'hAECC;   assign  wn_im[151] = 16'h9D0E;   // 151 -0.634 -0.773
assign  wn_re[152] = 16'hA57E;   assign  wn_im[152] = 16'hA57E;   // 152 -0.707 -0.707
assign  wn_re[153] = 16'h9D0E;   assign  wn_im[153] = 16'hAECC;   // 153 -0.773 -0.634
assign  wn_re[154] = 16'h9592;   assign  wn_im[154] = 16'hB8E3;   // 154 -0.831 -0.556
assign  wn_re[155] = 16'h8F1D;   assign  wn_im[155] = 16'hC3A9;   // 155 -0.882 -0.471
assign  wn_re[156] = 16'h89BE;   assign  wn_im[156] = 16'hCF04;   // 156 -0.924 -0.383
assign  wn_re[157] = 16'h8583;   assign  wn_im[157] = 16'hDAD8;   // 157 -0.957 -0.290
assign  wn_re[158] = 16'h8276;   assign  wn_im[158] = 16'hE707;   // 158 -0.981 -0.195
assign  wn_re[159] = 16'h809E;   assign  wn_im[159] = 16'hF374;   // 159 -0.995 -0.098
assign  wn_re[160] = 16'h8000;   assign  wn_im[160] = 16'h0000;   // 160 -1.000  0.000
assign  wn_re[161] = 16'h809E;   assign  wn_im[161] = 16'h0C8C;   // 161 -0.995  0.098
assign  wn_re[162] = 16'h8276;   assign  wn_im[162] = 16'h18F9;   // 162 -0.981  0.195
assign  wn_re[163] = 16'h8583;   assign  wn_im[163] = 16'h2528;   // 163 -0.957  0.290
assign  wn_re[164] = 16'h89BE;   assign  wn_im[164] = 16'h30FC;   // 164 -0.924  0.383
assign  wn_re[165] = 16'h8F1D;   assign  wn_im[165] = 16'h3C57;   // 165 -0.882  0.471
assign  wn_re[166] = 16'h9592;   assign  wn_im[166] = 16'h471D;   // 166 -0.831  0.556
assign  wn_re[167] = 16'h9D0E;   assign  wn_im[167] = 16'h5134;   // 167 -0.773  0.634
assign  wn_re[168] = 16'hA57E;   assign  wn_im[168] = 16'h5A82;   // 168 -0.707  0.707
assign  wn_re[169] = 16'hAECC;   assign  wn_im[169] = 16'h62F2;   // 169 -0.634  0.773
assign  wn_re[170] = 16'hB8E3;   assign  wn_im[170] = 16'h6A6E;   // 170 -0.556  0.831
assign  wn_re[171] = 16'hC3A9;   assign  wn_im[171] = 16'h70E3;   // 171 -0.471  0.882
assign  wn_re[172] = 16'hCF04;   assign  wn_im[172] = 16'h7642;   // 172 -0.383  0.924
assign  wn_re[173] = 16'hDAD8;   assign  wn_im[173] = 16'h7A7D;   // 173 -0.290  0.957
assign  wn_re[174] = 16'hE707;   assign  wn_im[174] = 16'h7D8A;   // 174 -0.195  0.981
assign  wn_re[175] = 16'hF374;   assign  wn_im[175] = 16'h7F62;   // 175 -0.098  0.995
assign  wn_re[176] = 16'h0000;   assign  wn_im[176] = 16'h7FFF;   // 176  0.000  1.000
assign  wn_re[177] = 16'h0C8C;   assign  wn_im[177] = 16'h7F62;   // 177  0.098  0.995
assign  wn_re[178] = 16'h18F9;   assign  wn_im[178] = 16'h7D8A;   // 178  0.195  0.981
assign  wn_re[179] = 16'h2528;   assign  wn_im[179] = 16'h7A7D;   // 179  0.290  0.957
assign  wn_re[180] = 16'h30FC;   assign  wn_im[180] = 16'h7642;   // 180  0.383  0.924
assign  wn_re[181] = 16'h3C57;   assign  wn_im[181] = 16'h70E3;   // 181  0.471  0.882
assign  wn_re[182] = 16'h471D;   assign  wn_im[182] = 16'h6A6E;   // 182  0.556  0.831
assign  wn_re[183] = 16'h5134;   assign  wn_im[183] = 16'h62F2;   // 183  0.634  0.773
assign  wn_re[184] = 16'h5A82;   assign  wn_im[184] = 16'h5A82;   // 184  0.707  0.707
assign  wn_re[185] = 16'h62F2;   assign  wn_im[185] = 16'h5134;   // 185  0.773  0.634
assign  wn_re[186] = 16'h6A6E;   assign  wn_im[186] = 16'h471D;   // 186  0.831  0.556
assign  wn_re[187] = 16'h70E3;   assign  wn_im[187] = 16'h3C57;   // 187  0.882  0.471
assign  wn_re[188] = 16'h7642;   assign  wn_im[188] = 16'h30FC;   // 188  0.924  0.383
assign  wn_re[189] = 16'h7A7D;   assign  wn_im[189] = 16'h2528;   // 189  0.957  0.290
assign  wn_re[190] = 16'h7D8A;   assign  wn_im[190] = 16'h18F9; // 190 0.981 0.195
assign wn_re[191] = 16'h7F62; assign wn_im[191] = 16'h0C8C; // 191 0.995 0.098
assign wn_re[192] = 16'h7FFF; assign wn_im[192] = 16'h0000; // 192 1.000 0.000
assign wn_re[193] = 16'h7F62; assign wn_im[193] = 16'hF374; // 193 0.995 -0.098
assign wn_re[194] = 16'h7D8A; assign wn_im[194] = 16'hE707; // 194 0.981 -0.195
assign wn_re[195] = 16'h7A7D; assign wn_im[195] = 16'hDAD8; // 195 0.957 -0.290
assign wn_re[196] = 16'h7642; assign wn_im[196] = 16'hCF04; // 196 0.924 -0.383
assign wn_re[197] = 16'h70E3; assign wn_im[197] = 16'hC3A9; // 197 0.882 -0.471
assign wn_re[198] = 16'h6A6E; assign wn_im[198] = 16'hB8E3; // 198 0.831 -0.556
assign wn_re[199] = 16'h62F2; assign wn_im[199] = 16'hAECC; // 199 0.773 -0.634
assign wn_re[200] = 16'h5A82; assign wn_im[200] = 16'hA57E; // 200 0.707 -0.707
assign wn_re[201] = 16'h5134; assign wn_im[201] = 16'h9D0E; // 201 0.634 -0.773
assign wn_re[202] = 16'h471D; assign wn_im[202] = 16'h9592; // 202 0.556 -0.831
assign wn_re[203] = 16'h3C57; assign wn_im[203] = 16'h8F1D; // 203 0.471 -0.882
assign wn_re[204] = 16'h30FC; assign wn_im[204] = 16'h89BE; // 204 0.383 -0.924
assign wn_re[205] = 16'h2528; assign wn_im[205] = 16'h8583; // 205 0.290 -0.957
assign wn_re[206] = 16'h18F9; assign wn_im[206] = 16'h8276; // 206 0.195 -0.981
assign wn_re[207] = 16'h0C8C; assign wn_im[207] = 16'h809E; // 207 0.098 -0.995
assign wn_re[208] = 16'h0000; assign wn_im[208] = 16'h8000; // 208 0.000 -1.000
assign wn_re[209] = 16'hF374; assign wn_im[209] = 16'h809E; // 209 -0.098 -0.995
assign wn_re[210] = 16'hE707; assign wn_im[210] = 16'h8276; // 210 -0.195 -0.981
assign wn_re[211] = 16'hDAD8; assign wn_im[211] = 16'h8583; // 211 -0.290 -0.957
assign wn_re[212] = 16'hCF04; assign wn_im[212] = 16'h89BE; // 212 -0.383 -0.924
assign wn_re[213] = 16'hC3A9; assign wn_im[213] = 16'h8F1D; // 213 -0.471 -0.882
assign wn_re[214] = 16'hB8E3; assign wn_im[214] = 16'h9592; // 214 -0.556 -0.831
assign wn_re[215] = 16'hAECC; assign wn_im[215] = 16'h9D0E; // 215 -0.634 -0.773
assign wn_re[216] = 16'hA57E; assign wn_im[216] = 16'hA57E; // 216 -0.707 -0.707
assign wn_re[217] = 16'h9D0E; assign wn_im[217] = 16'hAECC; // 217 -0.773 -0.634
assign wn_re[218] = 16'h9592; assign wn_im[218] = 16'hB8E3; // 218 -0.831 -0.556
assign wn_re[219] = 16'h8F1D; assign wn_im[219] = 16'hC3A9; // 219 -0.882 -0.471
assign wn_re[220] = 16'h89BE; assign wn_im[220] = 16'hCF04; // 220 -0.924 -0.383
assign wn_re[221] = 16'h8583; assign wn_im[221] = 16'hDAD8; // 221 -0.957 -0.290
assign wn_re[222] = 16'h8276; assign wn_im[222] = 16'hE707; // 222 -0.981 -0.195
assign wn_re[223] = 16'h809E; assign wn_im[223] = 16'hF374; // 223 -0.995 -0.098
assign wn_re[224] = 16'h8000; assign wn_im[224] = 16'h0000; // 224 -1.000 0.000
assign wn_re[225] = 16'h809E; assign wn_im[225] = 16'h0C8C; // 225 -0.995 0.098
assign wn_re[226] = 16'h8276; assign wn_im[226] = 16'h18F9; // 226 -0.981 0.195
assign wn_re[227] = 16'h8583; assign wn_im[227] = 16'h2528; // 227 -0.957 0.290
assign wn_re[228] = 16'h89BE; assign wn_im[228] = 16'h30FC; // 228 -0.924 0.383
assign wn_re[229] = 16'h8F1D; assign wn_im[229] = 16'h3C57; // 229 -0.882 0.471
assign wn_re[230] = 16'h9592; assign wn_im[230] = 16'h471D; // 230 -0.831 0.556
assign wn_re[231] = 16'h9D0E; assign wn_im[231] = 16'h5134; // 231 -0.773 0.634
assign wn_re[232] = 16'hA57E; assign wn_im[232] = 16'h5A82; // 232 -0.707 0.707
assign wn_re[233] = 16'hAECC; assign wn_im[233] = 16'h62F2; // 233 -0.634 0.773
assign wn_re[234] = 16'hB8E3; assign wn_im[234] = 16'h6A6E; // 234 -0.556 0.831
assign wn_re[235] = 16'hC3A9; assign wn_im[235] = 16'h70E3; // 235 -0.471 0.882
assign wn_re[236] = 16'hCF04; assign wn_im[236] = 16'h7642; // 236 -0.383 0.924
assign wn_re[237] = 16'hDAD8; assign wn_im[237] = 16'h7A7D; // 237 -0.290 0.957
assign wn_re[238] = 16'hE707; assign wn_im[238] = 16'h7D8A; // 238 -0.195 0.981
assign wn_re[239] = 16'hF374; assign wn_im[239] = 16'h7F62; // 239 -0.098 0.995
assign wn_re[240] = 16'h7FFF; assign wn_im[240] = 16'h0000; // 240 1.000 0.000
assign wn_re[241] = 16'h7F62; assign wn_im[241] = 16'hF374; // 241 0.995 -0.098
assign wn_re[242] = 16'h7D8A; assign wn_im[242] = 16'hE707; // 242 0.981 -0.195
assign wn_re[243] = 16'h7A7D; assign wn_im[243] = 16'hDAD8; // 243 0.957 -0.290
assign wn_re[244] = 16'h7642; assign wn_im[244] = 16'hCF04; // 244 0.924 -0.383
assign wn_re[245] = 16'h70E3; assign wn_im[245] = 16'hC3A9; // 245 0.882 -0.471
assign wn_re[246] = 16'h6A6E; assign wn_im[246] = 16'hB8E3; // 246 0.831 -0.556
assign wn_re[247] = 16'h62F2; assign wn_im[247] = 16'hAECC; // 247 0.773 -0.634
assign wn_re[248] = 16'h5A82; assign wn_im[248] = 16'hA57E; // 248 0.707 -0.707
assign wn_re[249] = 16'h5134; assign wn_im[249] = 16'h9D0E; // 249 0.634 -0.773
assign wn_re[250] = 16'h471D; assign wn_im[250] = 16'h9592; // 250 0.556 -0.831
assign wn_re[251] = 16'h3C57; assign wn_im[251] = 16'h8F1D; // 251 0.471 -0.882
assign wn_re[252] = 16'h30FC; assign wn_im[252] = 16'h89BE; // 252 0.383 -0.924
assign wn_re[253] = 16'h2528; assign wn_im[253] = 16'h8583; // 253 0.290 -0.957
assign wn_re[254] = 16'h18F9; assign wn_im[254] = 16'h8276; // 254 0.195 -0.981
assign wn_re[255] = 16'h0C8C; assign wn_im[255] = 16'h809E; // 255 0.098 -0.995

endmodule
