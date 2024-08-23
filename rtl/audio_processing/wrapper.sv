//tbd
module wrapper(
    input logic clk,
    input logic rst,
    input logic [11:0] in [255:0],
    input logic window_ready,
    output logic wrapper_ready,
    output logic [11:0] out 
    );
    logic [11:0] out_nxt;
    logic [11:0] regi [255:0];
    logic [11:0] regi_nxt [255:0];
    logic wrapper_ready_nxt;
    logic [11:0] j;
    logic [11:0] j_nxt;
    integer i,k ;

    always_ff @(posedge clk) begin
        if(rst) begin
            out <= '0;
            for(k=0; k<256; k++)begin
            regi[k] <= '0;
            end
            j <= '0;
            wrapper_ready <= '0;
            end else begin
            out <= out_nxt;
            for(k=0; k<256; k++)begin
            regi[k] <= regi_nxt[k];
            end
            wrapper_ready <= wrapper_ready_nxt;
            j <= j_nxt;
        end
    end

    always_comb begin
        if(window_ready & j < 256) begin
            for(i=0; i<256; i++)
            regi_nxt[i] = in[i];
            out_nxt = regi[j];
            wrapper_ready_nxt = 1;
            j_nxt = j + 1;
        end else begin
        for(i=0; i<256; i++)
        regi_nxt[i] = regi[i];
        out_nxt = out;
        wrapper_ready_nxt = wrapper_ready;
        j_nxt = 0;
        end
    end
                




    
endmodule