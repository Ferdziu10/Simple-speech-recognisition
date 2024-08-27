`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 10:22:11 PM
// Design Name: 
// Module Name: mfcc_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mfcc_tb(

    );
    
    localparam OUT_WIDTH = 5;
    localparam N = 512;
    localparam STRIDE = 512;
    
    logic clk;
    logic reset;
    logic [15:0] in;
    logic [15:0] out[OUT_WIDTH];
    
    logic s_valid;
    logic s_ready;
    logic m_valid;
    logic m_ready;
    logic m_last;
    
    
//    python generated values for comparing
    logic[15:0] test_in[N] = { -4943, -1251, -1031, -1488, -103, -8157, -2868, 4092, -6098, -410, -7843, 3220, 11616, -12303, -719, -11394, 9165, -101, 7796, 5799, -6464, 2966, 5740, 5464, 7735, -292, -5153, 12281, -6664, 2382, -5027, -5008, -6907, 9830, 6925, -1207, -8564, -11101, 7646, -2717, -7740, 8539, -14771, -13521, 2081, -5792, 5617, 4240, 2904, 501, 17608, -9290, -16523, -2221, 4040, 413, -8535, -5281, -21, 1214, -1936, 19720, -7144, -9986, 8686, -6430, 1407, 5634, -15863, 4075, -3482, -235, 1842, -7117, -7341, -13254, -5664, 4733, 11488, 139, 7087, 4533, 876, -1869, 5488, -7570, -2288, -1189, 5917, -3361, -7677, 5320, 4366, -3303, -5967, 2951, 2737, 1056, 2568, -2769, 9914, 3740, -14106, -6749, -533, 11014, 1890, -15384, -8428, -2457, 10706, 835, 3917, 5920, -10872, -2910, 12434, -11131, -607, 14021, 8190, -467, 15504, 165, -9152, -6836, 2273, -9906, 4784, 4295, -536, -895, -5136, 14078, -6190, 1869, -156, -572, -10549, -3278, 13270, -10802, 10949, -2764, 3266, 17811, 2551, 727, -2038, 4505, 6098, 1790, 3491, 9893, 1265, 4606, -1359, 8706, -4514, -3173, 6447, 2528, -15818, 1569, -1923, -15461, 8629, -6298, 9159, -9885, 2613, 388, 2538, 6501, -14948, -1512, -8657, -3706, -6542, 2028, 4135, -549, 13538, -3898, -7009, 3646, -2473, 2037, 590, 20723, -4592, -6747, -3334, -23528, -11263, -2392, -21136, -8108, -5479, 4499, 8296, 16925, 7656, -11666, 3153, -5710, 16122, -10500, -99, 368, 1897, 5584, 3898, -10533, -1395, 1494, 12854, 1264, 3323, 3065, 3190, 7264, 9648, 6343, -3029, 10031, 4327, -12410, 4525, -12995, -8572, 5218, -3033, -4152, 10694, 7918, -6261, 927, 2149, -8820, 4184, -2875, -9869, -15373, 2950, 4209, 5791, 15087, -7979, 5815, -4577, -1020, -1582, -2399, -17544, 12302, -6512, -12005, -13247, -7613, 8405, -11447, -2811, 3295, 4394, -7293, 2774, 4298, 6237, 11865, -2658, -3428, 3981, -8131, 1229, -7638, 13699, -1275, -2004, -1923, 142, 9559, -575, -1177, -11361, -13125, 2443, 2634, -11568, 1778, 968, -13450, 3570, 6544, 3804, -14501, -2639, -2793, -868, -3604, -4427, 12712, 8311, 6234, 419, -5971, 5014, -7044, -4751, 14093, -1034, 2396, 7877, -8589, -3697, -140, 6137, 1628, 4028, -1175, -2032, -2984, 4246, 10994, 3744, -5342, -18024, 718, -4324, 378, -8943, 439, -2645, 3682, -2845, -1410, -7425, 8443, 5389, -5836, -9660, -6285, -1797, -4265, -13153, 11639, 12066, -7049, -12991, -5023, -1261, -20829, -3807, 10256, -13228, 9940, -6226, 671, 1465, -4333, 5241, -4517, 1125, -512, 3124, -1482, -262, -6330, 3453, 9408, 7653, -9554, 6442, 273, -1287, -4292, -11838, 14367, 7229, 19773, 3441, 14341, -5789, 2739, -3452, -5818, 388, -3456, -2272, 1426, -2572, 10343, -286, 2287, 4470, -5103, -1958, 408, -2516, 6651, -11754, 8404, -8476, 13833, -3190, 5410, -242, 8197, -7908, 10415, -1564, -8589, -335, -3340, -4643, 275, -7782, 1814, -10362, 9254, -10068, 3563, -1598, 14769, 108, -10337, -3397, 14, -6735, 7788, 3397, -7709, 2006, -6242, -11412, -3903, 5625, 10265, -7931, -12263, 4452, 5358, -8297, 3700, 8900, 5821, -1766, -2438, -2883, -9941, 3689, -4153, -2305, 4072, -6905, 3342, 4355, -20, -232, -1755, 2523, 8480, 1561, 5574, 1279, 9923, 9090, 10091, -8604, 997, -12793, -4364, 10100, -3826, -9294, -4053, 20398, 3590, 15111, 12720, 4958, 8233, -7076, 116, 9929, 11467, 6100, -6869, 8441, 14715, 18235, 3531, -5401, -9059, -2370, 1873, 6792, 3413, 8873, -6246, 10584, -987, 3408, 1131, 4984, -2978, 6243, 129, 9981, -5825, 4368, -2517};
    logic[15:0] test_pre_emph[N] = { -4943, 3543, 182, -487, 1340, -8057, 5044, 6873, -10067, 5505, -7445, 10827, 8492, -23570, 11214, -10696, 20217, -8991, 7893, -1763, -12089, 9236, 2862, -103, 2434, -7794, -4869, 17279, -18576, 8846, -7337, -131, -2049, 16529, -2610, -7924, -7393, -2793, 18413, -10133, -5104, 16046, -23053, 806, 15196, -7810, 11235, -1208, -1208, -2315, 17122, -26369, -7511, 13806, 6194, -3505, -8935, 2997, 5101, 1234, -3113, 21597, -26272, -3056, 18372, -14855, 7644, 4269, -21327, 19462, -7434, 3142, 2069, -8903, -437, -6133, 7192, 10227, 6896, -11004, 6952, -2341, -3521, -2718, 7300, -12893, 5054, 1030, 7070, -9100, -4416, 12766, -794, -7538, -2763, 8738, -125, -1598, 1543, -5259, 12599, -5876, -17733, 6933, 6013, 11531, -8793, -17217, 6494, 5718, 13089, -9549, 3107, 2120, -16614, 7635, 15256, -23191, 10190, 14609, -5410, -8411, 15956, -14873, -9312, 2041, 8903, -12110, 14392, -345, -4702, -375, -4267, 19059, -19845, 7873, -1968, -420, -9994, 6954, 16449, -23673, 21426, -13384, 5947, 14642, -14725, -1747, -2743, 6481, 1728, -4125, 1754, 6506, -8331, 3378, -5826, 10024, -12958, 1205, 9524, -3725, -18270, 16912, -3444, -13595, 23626, -14668, 15268, -18769, 12201, -2146, 2161, 4039, -21253, 12987, -7190, 4691, -2947, 8373, 2167, -4559, 14070, -17029, -3227, 10444, -6009, 4435, -1385, 20150, -24693, -2292, 3210, -20294, 11559, 8533, -18815, 12393, 2385, 9813, 3931, 8877, -8761, -19092, 14469, -8768, 21660, -26138, 10086, 464, 1540, 3743, -1518, -14314, 8822, 2847, 11404, -11204, 2096, -158, 216, 4169, 2601, -3015, -9181, 12969, -5403, -16607, 16562, -17384, 4033, 13532, -8094, -1209, 14721, -2455, -13941, 7000, 1249, -10904, 12739, -6933, -7080, -5800, 17861, 1347, 1708, 9469, -22613, 13554, -10217, 3419, -592, -864, -15216, 29319, -18444, -5688, -1602, 5236, 15789, -19599, 8292, 6021, 1197, -11555, 9848, 1607, 2067, 5815, -14167, -849, 7306, -11992, 9116, -8830, 21107, -14563, -767, 20, 2007, 9421, -9847, -619, -10219, -2104, 15174, 264, -14122, 12998, -756, -14388, 16616, 3081, -2543, -18190, 11426, -233, 1841, -2762, -931, 17006, -4019, -1827, -5627, -6377, 10805, -11907, 2081, 18701, -14704, 3398, 5552, -16229, 4634, 3446, 6272, -4324, 2448, -5082, -892, -1012, 7140, 6875, -6920, -8973, -12842, 18201, -5020, 4572, -9309, 9113, -3070, 6247, -6416, 1349, -6057, 15645, -2800, -11063, -3999, 3085, 4299, -2521, -9015, 24397, 776, -18753, -6153, 7578, 3611, -19605, 16397, 13948, -23176, 22771, -15867, 6710, 814, -5754, 9444, -9600, 5506, -1603, 3620, -4512, 1175, -6075, 9593, 6058, -1472, -16977, 15709, -5975, -1551, -3043, -7674, 25849, -6706, 12760, -15738, 11003, -19699, 8354, -6108, -2469, 6031, -3832, 1080, 3629, -3955, 12837, -10318, 2564, 2251, -9438, 2991, 2307, -2911, 9091, -18205, 19805, -16627, 22054, -16608, 8504, -5489, 8431, -15859, 18085, -11666, -7071, 7996, -3015, -1403, 4778, -8048, 9362, -12121, 19305, -19044, 13328, -5054, 16319, -14217, -10441, 6629, 3309, -6748, 14320, -4157, -11004, 9483, -8187, -5357, 7166, 9410, 4808, -17888, -4569, 16347, 1039, -13494, 11748, 5311, -2812, -7412, -724, -518, -7144, 13331, -7731, 1723, 6307, -10854, 10039, 1113, -4244, -212, -1529, 4225, 6032, -6664, 4059, -4127, 8682, -535, 1273, -18392, 9342, -13760, 8045, 14333, -13623, -5582, 4962, 24329, -16196, 11628, -1937, -7380, 3423, -15062, 6979, 9816, 1835, -5022, -12786, 15103, 6527, 3961, -14156, -8826, -3820, 6417, 4171, 4975, -3175, 5562, -14852, 16642, -11253, 4365, -2174, 3886, -7812, 9131, -5926, 9855, -15506, 10018, -6753};
    logic[15:0] test_hamming[N] = { -395, 283, 14, -39, 107, -651, 409, 561, -827, 455, -621, 911, 721, -2024, 973, -939, 1796, -809, 720, -163, -1134, 879, 276, -10, 243, -791, -503, 1816, -1987, 963, -813, -14, -235, 1939, -312, -966, -919, -354, 2380, -1336, -686, 2202, -3227, 115, 2213, -1161, 1703, -186, -190, -372, 2811, -4417, -1283, 2405, 1100, -635, -1651, 564, 980, 241, -621, 4393, -5446, -645, 3954, -3257, 1707, 971, -4940, 4590, -1785, 768, 514, -2254, -112, -1607, 1917, 2773, 1902, -3086, 1982, -678, -1037, -814, 2221, -3986, 1587, 328, 2290, -2994, -1475, 4329, -273, -2633, -979, 3143, -45, -591, 579, -2002, 4864, -2300, -7036, 2788, 2450, 4762, -3679, -7298, 2788, 2486, 5764, -4258, 1402, 969, -7685, 3574, 7228, -11117, 4942, 7167, -2684, -4221, 8098, -7632, -4831, 1070, 4719, -6488, 7792, -188, -2599, -209, -2407, 10857, -11417, 4574, -1154, -249, -5974, 4196, 10018, -14550, 13288, -8375, 3754, 9325, -9459, -1132, -1792, 4270, 1147, -2762, 1184, 4428, -5714, 2335, -4058, 7036, -9164, 858, 6835, -2693, -13301, 12399, -2543, -10107, 17682, -11052, 11580, -14328, 9375, -1659, 1681, 3162, -16742, 10292, -5732, 3761, -2376, 6791, 1768, -3739, 11602, -14117, -2690, 8749, -5060, 3753, -1178, 17221, -21204, -1978, 2782, -17670, 10110, 7496, -16601, 10981, 2122, 8767, 3526, 7994, -7920, -17325, 13178, -8015, 19871, -24062, 9316, 430, 1432, 3492, -1420, -13435, 8305, 2688, 10798, -10637, 1996, -151, 207, 3999, 2501, -2906, -8868, 12554, -5241, -16142, 16131, -16963, 3942, 13252, -7940, -1188, 14486, -2419, -13758, 6917, 1236, -10801, 12633, -6882, -7035, -5768, 17780, 1342, 1702, 9446, -22569, 13534, -10206, 3417, -592, -864, -15215, 29319, -18444, -5687, -1601, 5234, 15778, -19579, 8280, 6009, 1194, -11518, 9810, 1599, 2056, 5778, -14063, -842, 7237, -11865, 9008, -8713, 20801, -14330, -753, 20, 1965, 9209, -9608, -603, -9933, -2041, 14688, 255, -13610, 12498, -725, -13768, 15859, 2933, -2414, -17223, 10788, -219, 1728, -2584, -868, 15813, -3725, -1688, -5181, -5850, 9877, -10845, 1889, 16906, -13241, 3048, 4960, -14440, 4106, 3040, 5510, -3782, 2132, -4405, -769, -869, 6102, 5847, -5856, -7555, -10758, 15169, -4162, 3770, -7635, 7433, -2490, 5038, -5145, 1075, -4800, 12324, -2192, -8608, -3092, 2370, 3282, -1912, -6793, 18260, 577, -13845, -4511, 5517, 2610, -14070, 11681, 9864, -16267, 15862, -10968, 4602, 554, -3884, 6324, -6377, 3627, -1047, 2345, -2898, 748, -3835, 6003, 3757, -905, -10339, 9479, -3572, -918, -1785, -4458, 14871, -3820, 7197, -8788, 6081, -10776, 4523, -3272, -1309, 3163, -1988, 554, 1842, -1984, 6370, -5062, 1243, 1079, -4472, 1400, 1067, -1330, 4104, -8118, 8722, -7231, 9469, -7040, 3558, -2267, 3436, -6377, 7176, -4566, -2730, 3044, -1132, -519, 1744, -2895, 3319, -4234, 6645, -6458, 4452, -1663, 5287, -4535, -3279, 2049, 1007, -2020, 4220, -1205, -3138, 2660, -2258, -1452, 1911, 2466, 1238, -4529, -1136, 3995, 249, -3182, 2721, 1208, -627, -1625, -156, -109, -1481, 2712, -1543, 337, 1211, -2045, 1855, 201, -754, -37, -261, 707, 990, -1072, 640, -638, 1316, -79, 185, -2626, 1307, -1888, 1082, 1890, -1761, -707, 616, 2966, -1937, 1364, -223, -834, 379, -1640, 746, 1031, 189, -510, -1277, 1484, 631, 377, -1328, -816, -348, 577, 370, 436, -275, 477, -1262, 1401, -939, 361, -178, 317, -634, 738, -477, 791, -1242, 801, -540};
    logic[31:0] test_re[N/2] = { -2549, 3258, -2432, -606, 702, 2313, -12995, 10135, 2879, -14930, 15709, -11782, 8459, -10204, 5205, 14401, -33924, 17252, 312, 2966, -14497, 12607, -18008, 28074, -29391, -13775, 27722, -16378, 21010, 13847, -54758, 59311, -64692, 44345, 9475, -20226, -8550, 18892, -32236, 39175, -21545, -21389, 34176, -10370, 33574, -73221, 97106, -65013, 7443, 746, -34736, -7955, 40529, -26701, 9243, 36085, -75248, 50900, 8930, -55256, 40272, 45866, -34274, -31144, -10778, 90427, -79080, 49227, 13940, 18873, -52592, 17694, -80600, 112280, -64615, 63032, -80881, 30206, -40792, 28242, 34300, -16496, -37329, -59531, 59666, -30008, 58344, -91608, 116037, -12847, 30238, -106080, 43070, 101753, -76591, 81882, -62042, 20179, 16192, -49613, 127430, -224549, 113927, 54301, -108937, 54937, -140147, 156295, -17624, -14435, -52762, 72844, -117613, 106840, 99472, -99155, -86485, 170365, -177384, 85870, -47834, -39068, 69333, -56905, -6256, 22778, 38011, -99585, 126257, 46745, -117391, -29297, 43699, -52825, -13219, 121975, 39219, -219660, 266520, -172768, -14512, 89887, -29367, 25548, 48243, -51030, -169031, 208334, -19796, -188495, 90197, 71266, -33774, -88641, 101605, 94901, -61297, -81832, 36570, -132265, 174095, -71887, -146722, 82601, 219534, -322881, 303760, -208182, 38917, 141554, -108321, -26524, -45308, 189382, -118263, 5808, -61718, 211100, -274316, 345675, -179453, -26886, 3509, -128654, 100101, 14200, 27293, 80272, -268887, 255266, -210271, 181166, -82022, 35094, -64838, 156323, -177438, -36879, -39640, 226804, -122085, -49046, 97111, -129536, 51858, 12723, -66486, -167700, 103828, 262370, -424011, 275811, -150806, 93131, -21312, -55450, 319005, -120742, -243688, 262114, -57718, -72296, -51110, 46636, 666, 46700, 42102, -43277, 86752, -115648, -31450, 223775, 28126, -298272, 31592, 262122, -233360, -3411, 44141, 129879, -292551, 179163, -153639, 140130, 12059, -64069, 11505, 23909, -132696, 298186, -207309, 79167, -25409, -24998, 216789, -85604};
    logic[31:0] test_im[N/2] = { 0, -148, 846, -144, 3737, 3806, -10329, 7245, -2888, -1824, -2895, 5640, -7075, 1086, -91, 2512, -19921, 28316, -16454, 8162, 1945, 5767, -12414, 17031, -12469, 20697, -34489, 21541, -8119, -33187, 38735, 9991, -28057, 45259, -56388, 57175, -46901, -3472, -12903, 40485, -26285, -12770, -13444, 64159, 4701, -85901, 133991, -56620, -10073, -17904, -21081, 75185, -34418, -44674, 67742, -63608, 41931, -31835, -19172, 74899, -72350, -3393, 37498, -16485, 27710, -6604, 7631, -91255, 119438, -43902, -43606, 72008, -111076, 59192, 47413, -96025, 88526, 6096, -7542, -7536, -20531, 1592, 4599, -44936, 48640, -38403, -55936, 117851, -119725, 99675, -60276, -43420, 175493, -59110, 27123, -2589, -48840, -14994, 36214, -115657, 117001, -86154, 113681, -78210, 48900, -48872, -2097, 2733, -40104, 1831, -33249, 37896, 87626, -123381, 13179, 26460, 38664, 10180, 40569, -148781, 125073, -135348, 188524, -81556, 100386, -204521, 88664, 48752, -89552, -9592, 78428, -44072, 74435, -15558, 96087, -179238, 146565, -61889, 7893, 15370, -37092, -2224, 58812, -112220, 96718, -14939, 102170, -145272, -29040, -72488, 221504, -71657, 105001, -244077, 157917, 4120, -250158, 304200, -196358, 191378, -131181, 7242, 84595, -50846, -33280, -49148, 83392, -122121, 215889, -173583, 58599, -46504, 85356, -7204, -68755, 62245, 87873, -51313, -179956, 15725, 45961, -44063, 11183, 17454, 177514, -129041, 37304, 12238, -15542, -105452, 65499, 44028, -20315, -87312, 154528, -99008, -129338, 109019, -63657, -69732, 272074, -150790, -65215, 54730, -48474, 58231, -127760, 126976, -36325, 38938, -5179, -70789, -59760, 337765, -374589, 119334, 154876, -181149, 73191, 59442, -40153, -125246, 315106, -235486, 107943, -163679, 172578, -160536, 218278, -309337, 124454, 50266, -71955, 107121, -81243, -101519, 183778, -201164, 120838, -191629, 120719, -19428, -25978, 98742, 66406, -211115, 217734, -140824, -25001, -68068, 174911, -33546, -96286, -84522, -6045, 243636};
    logic[31:0] test_pow_spec[N/2] = { 12690, 20781, 12953, 758, 28242, 38756, 538243, 303165, 32482, 441892, 498354, 333268, 237556, 205705, 52943, 417405, 3022921, 2147367, 528999, 147318, 417879, 375417, 934424, 2105979, 1990928, 1207345, 3824310, 1430203, 990954, 2525708, 8786973, 7065863, 9711549, 7841640, 6385675, 7183846, 4439095, 720644, 2354905, 6198777, 2256045, 1212067, 2634277, 8249845, 2244785, 24883487, 53482991, 14516798, 306404, 627198, 3224699, 11164392, 5521973, 5290557, 9129957, 10445631, 14493400, 7039841, 873750, 16920407, 13391506, 4131320, 5040760, 2425358, 1726671, 16056179, 12328049, 20997856, 28241946, 4460237, 9116220, 10739064, 36786002, 31466251, 12545471, 25769526, 28083576, 1854656, 3361233, 1668862, 3121192, 536443, 2762988, 10865683, 11574221, 4639328, 12759720, 43517703, 54294440, 19726993, 8881986, 25660917, 63775550, 27046370, 12894355, 13108266, 12177024, 1234490, 3073617, 30933874, 58453068, 112978268, 50591551, 17706196, 27848796, 10559883, 38370325, 47726306, 3748028, 413568, 7596370, 13168946, 42014576, 52027257, 19665175, 20570419, 17528713, 56890754, 64670513, 57635961, 35022228, 38761111, 78805880, 19315937, 19758924, 82711026, 18176124, 24011936, 46798220, 4447495, 38929416, 5470187, 14551453, 5923033, 18374200, 91805877, 44960313, 101720620, 138858739, 58759864, 3098575, 15790438, 8440211, 25871460, 22816227, 5522030, 76192496, 125990465, 2412592, 79658159, 111718749, 19948661, 23761729, 131701194, 68870662, 17623752, 129564026, 193817289, 77917815, 105702526, 92808214, 10195839, 56023261, 18375499, 96294796, 208335360, 193798944, 113776330, 93989770, 97986504, 29624179, 5598121, 18239431, 70151545, 36550101, 7633318, 22521296, 92180217, 210222566, 233864975, 67023698, 5203972, 268333, 32923317, 81117057, 32916594, 4172922, 12877682, 141683760, 148987086, 94735287, 67890060, 13946005, 17295065, 54849948, 66874789, 94165891, 25869807, 10983697, 109966659, 173690924, 49107790, 26725829, 38623121, 9841999, 6939127, 40513941, 86418585, 23632785, 137411624, 351196728, 158365953, 51394296, 239763562, 274943804, 33819001, 245608264, 92566177, 126447108, 141088479, 9655736, 40846609, 199031635, 112556366, 22758349, 56586129, 61632358, 53993709, 107756943, 213016060, 32183484, 102738917, 11657576, 196175204, 14840988, 154325315, 172327994, 79059863, 32325084, 104669127, 195624157, 63431417, 47422088, 57395992, 8896886, 95068014, 92852627, 39850144, 35611923, 182711905, 143693247, 14439351, 19368385, 15173799, 91863464, 130248009};
    logic[15:0]test_filt_bank[40] = { 86, 82, 83, 110, 115, 108, 118, 114, 111, 133, 123, 125, 135, 135, 147, 148, 141, 142, 157, 150, 152, 153, 154, 160, 159, 157, 165, 166, 168, 169, 171, 171, 174, 179, 180, 179, 178, 183, 184, 183};

    
    
    mfcc#(.OUT_WIDTH(OUT_WIDTH),
          .N(N),
          .STRIDE(STRIDE)) dut(.clk(clk),
                                       .reset(reset),
                                       .s_axis_tdata(in),
                                       .m_axis_tdata(out),
                                       .s_axis_tready(s_ready),
                                       .s_axis_tvalid(s_valid),
                                       .m_axis_tready(m_ready),
                                       .m_axis_tvalid(m_valid),
                                       .m_axis_tlast(m_last));
                                   
    initial begin
        reset <= 1; s_valid <= 0;#10;
        in = 0;
        m_ready <= 1; clk <= 0; reset <= 0;
       
        while(1) begin  
            for (int i=0; i<512;i++) begin
                while(!s_ready) begin
                    clk <= 1; #5;
                    clk <= 0; #5;
                end
                
                s_valid <= 1;
                in = test_in[i];
                clk <= 1; #5;
                clk <= 0; #5;
                s_valid <= 0;
                in <= 0;
                
                // 3 clock cycle delay between input samples. This is just an arbitrary amount, feel free to change or remove
                for(int j=0; j<3;j++) begin
                    clk <= 1; #5;
                    clk <= 0; #5;
                end
            end
        end
    end
endmodule