module mel_filter_bank_tb;

    // Testbench signals
    reg clk;
    reg rst;
    logic [15:0] out [0:39];
    logic s_valid;
    logic m_ready;
    logic s_ready;
    logic m_valid;
    logic signed [15:0] test_in [0:63] = {-95, 1769, -559, -187, -457, -200, -75, -187, 1029, 164, -385, -917, 1761, -517, 1756, 1354, 903, -1009, 1190, -986, 1173, -1951, 904, -207, 1071, -1706, 1156, -1614, -2033, 152, 1511, -1618, -1597, 656, -1084, 1690, -1733, -1547, 1307, 1058, -1872, -1737, 1227, 745, -1560, 1961, -430, 1992, 1487, -1091, 726, 1699, 1569, 514, -91, 473, 293, -1169, -829, -1892, -1684, -1279, -1674, 1655};
    // Instantiate the top_fft module
    mel_filter_bank uut (
        .clk(clk),
        .reset(rst),
        .in(test_in),
        .out(out),
        .s_valid(s_valid),
        .m_ready(m_ready),
        .s_ready(s_ready),
        .m_valid(m_valid)
    );

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

    // Load data from file and feed to DUT
    initial begin
        
        // Initialize
        clk = 0;
        rst = 1;

        // Reset pulse
        #10 rst = 0;
        #10 rst = 1;
        rst = 0;
        s_valid = 1;
        m_ready = 1;

        #1000
    

    // Capture and display the processed data
        $display("m_valid: %p", m_valid);
        $display("s_ready: %p", s_ready);
    for (int j = 0; j < 64; j++) begin
        $display("test_in[%0d]: %0d", j, test_in[j]);
    end
        for (int i = 0; i < 40; i++) begin
        $display("real_out[%0d]: %0d", i, out[i]);
    end
    // End the simulation
    $stop;
    end

endmodule
