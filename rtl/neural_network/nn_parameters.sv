package nn_parameters;
//parameters for dense 1
localparam IN_SIZE_1 = 26;
localparam OUT_SIZE_1 = 128;
localparam WEIGHTS_FILE_1 = "../../python/generated_files/dense21_weights_hex.txt";
localparam BIAS_FILE_1 = "../../python/generated_files/dense21_biases_hex.txt";

//parameters for dense 2
localparam IN_SIZE_2 = 128;
localparam OUT_SIZE_2 = 64;
localparam WEIGHTS_FILE_2 = "../../python/generated_files/dense22_weights_hex.txt";
localparam BIAS_FILE_2 = "../../python/generated_files/dense22_biases_hex.txt";

//parameters for dense 3
localparam IN_SIZE_3 = 64;
localparam OUT_SIZE_3 = 32;
localparam WEIGHTS_FILE_3 = "../../python/generated_files/dense23_weights_hex.txt";
localparam BIAS_FILE_3 = "../../python/generated_files/dense23_biases_hex.txt";

//parameters for dense 4
localparam IN_SIZE_4 = 32;
localparam OUT_SIZE_4 = 3;
localparam WEIGHTS_FILE_4 = "../../python/generated_files/dense24_weights_hex.txt";
localparam BIAS_FILE_4 = "../../python/generated_files/dense24_biases_hex.txt";

//parameters for dropout layers
localparam DROPOUT_RATE = 0.2;

endpackage