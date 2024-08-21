module axi_set(
    input wire clk,
    input wire rst,
    output wire m_ready,
    output wire s_valid
);
always_ff @(posedge clk) begin
    if(rst)begin
        m_ready <= 0;
        s_valid <= 0;
    end else begin
        m_ready <= 1;
        s_valid <= 1;
    end
end
endmodule
