package nn_parameters;
//parameters for dense 1
localparam IN_SIZE_1 = 26;
localparam OUT_SIZE_1 = 128;
localparam WEIGHTS_FILE_1 = "dense1_weights_hex.txt"
localparam BIAS_FILE_1 = "dense1_biases_hex.txt"

//parameters for dense 2
localparam IN_SIZE_2 = 128;
localparam OUT_SIZE_2 = 64;
localparam WEIGHTS_FILE_2 = "dense2_weights_hex.txt"
localparam BIAS_FILE_2 = "dense2_biases_hex.txt"

//parameters for dense 3
localparam IN_SIZE_3 = 64;
localparam OUT_SIZE_3 = 32;
localparam WEIGHTS_FILE_3 = "dense3_weights_hex.txt"
localparam BIAS_FILE_3 = "dense3_biases_hex.txt"

//parameters for dense 4
localparam IN_SIZE_4 = 32;
localparam OUT_SIZE_4 = 3;
localparam WEIGHTS_FILE_4 = "dense4_weights_hex.txt"
localparam BIAS_FILE_4 = "dense4_biases_hex.txt"
localparam EXP_LUT_FILE = "exp_lut_hex.txt"

//parameters for dropout layers
localparam DROPOUT_RATE = 0.2;

endpackage