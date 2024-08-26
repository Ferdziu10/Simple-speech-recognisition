import nn_parameters::*;

module dense_layer_1 (
    input clk,
    input rst,
    input logic [15:0] input_vector [IN_SIZE_1-1:0],
    output logic signed [23:0] output_vector [OUT_SIZE_1-1:0]
);


    logic signed [7:0] weight_matrix [IN_SIZE_1-1:0][OUT_SIZE_1-1:0];
    logic signed [7:0] bias_vector [OUT_SIZE_1-1:0];
    logic signed [23:0] output_vector_nxt [OUT_SIZE_1-1:0];
    logic [7:0] i;
    logic [7:0] i_nxt;

    integer j, k;
    assign weight_matrix = {fd 04 fb fa f8 fc fc 16 fe 0a 0a fb 01 fa 08 01 0c 14 f9 00 18 05 f3 07 16 ff 14 0e f7 07 01 13 f8 0f fd 02 f9 fc 17 0f 12 fa fb f7 0f fd 0d 0f fe 12 fd 06 ff fd f9 fb fd 0a fe fd 05 09 12 05 f8 06 f6 f9 05 02 fc 07 14 12 0e 0a 0d fd fc 15 ff 17 fc 10 02 17 f6 fd f8 02 02 f2 0b 10 f8 08 01 fb 03 01 04 f7 05 19 f4 00 f9 01 fd 16 00 f9 18 f8 fe 01 f9 09 14 f6 00 f6 f7 f9 0b 15 08 01
    f3 07 02 14 ed eb 06 0b 16 02 14 00 f3 0c f8 02 13 e9 f9 11 f7 01 06 00 f5 ea 16 11 ff ff f4 02 df 14 01 e1 fe e4 e9 ef fd fb 00 fa eb 07 ec f4 0a 14 0b 09 0e ee fa ef 08 ec fc e9 f3 ed f1 03 fb 0c e7 f9 02 ed e1 1a 11 0d 0a fb 0c 04 fc fd ff 10 fe 13 0f f2 f0 f8 ee e4 f1 ef f2 0f 05 1c 0b ef fd e9 0d 05 e8 e8 ef 02 ef 0b f7 18 fc 07 ee f4 09 05 e4 f6 12 eb 08 0d fb 02 f4 fa ee 03
    ff 19 f3 19 05 ee 09 eb e8 eb 04 ec 16 f6 03 f9 fc f8 13 07 0d e7 04 08 fc 24 0d 0f ff fe 0c 14 16 f1 f2 f4 fb ed 0f fe ff 18 1e ef 07 ee 07 12 f5 09 0e e2 f4 fe 02 08 f6 0b 1e 1b f9 f1 0d 04 e8 10 19 0e 05 08 00 29 0f 0b 0f 0b f7 e3 f3 fc fc f6 07 ea eb ea fe f8 f4 f3 0e f0 da e9 ed fc f5 0e 18 0b ee ef 0c eb f6 fe 09 fb 02 f4 1a ec 0c fa f6 06 fd f5 0f 01 12 e5 14 e5 ec ed 14 ed
    e8 f8 e9 00 00 0a 0c f2 f2 f7 f4 00 f6 ec fc fd f3 14 eb 0d 0f ed df e6 f7 e9 01 12 02 ed e3 03 0e 07 e4 f5 10 09 10 f7 0a f7 02 ed 10 00 0d 0b 0c fc eb 03 10 e5 0c fa 0d 13 07 ee fb fc 04 f1 f5 1b dc f2 4f 17 f0 0d 00 fc f5 09 11 00 20 ea 0c f0 f1 04 19 f4 f3 f9 12 0d 07 12 d9 14 0d 05 15 0a fa 02 18 fb 10 04 ed eb 15 12 fd ee 11 11 f2 f7 0c 23 e3 ed 0a f4 09 fb ed 13 18 08 00 43
    15 fd f4 1b 11 1a 1b 09 1f 18 ff 02 02 0c ed dd 19 0f 0e 1a 05 ff f0 f8 f6 f7 e9 0d 1d 0d ea f3 08 0e f8 fd fb ff e7 ed 0e fe 14 fc 0a 0c ec 07 f4 fd e3 ed f4 f9 01 fa 14 f2 2b f6 fe ea 00 fe ed 1b ec d3 1c f6 dc 12 e9 05 03 0d ff f0 ff fa 21 fe 00 16 21 0b f0 f4 fe 17 09 09 15 f6 eb 29 1e fc 0f 08 26 fc 04 04 05 0c 00 23 f5 10 e2 ed e9 03 12 14 fd fa 15 e6 e9 ee 19 0b f5 10 12 ff
    17 fc f0 f2 ef 08 f1 f5 11 eb 17 05 12 14 ea ef 03 03 fb e9 ea 11 f7 df 02 25 04 ea 10 1c 08 17 05 ec f5 e4 f5 03 15 0a ed f7 03 ff f4 0e 07 0c fd f6 07 ec fe d4 f3 ea 16 04 11 f5 ff 0e fa e9 19 f6 e5 cf e6 ee e3 08 18 12 00 11 f0 01 01 07 1d 22 ea f8 dc 07 ec ee 08 02 0a ed 17 ff f0 fe e7 f9 f8 06 09 1a fa 00 f8 e4 f7 0b 00 18 04 fe f3 1b f3 f3 f9 fa ed ed 04 f7 00 f0 06 f4 fe f4
    dc 03 17 0d 0a 0e f3 fd 0d 06 f6 fe 10 ee f2 f4 ed ee 17 f7 f6 01 09 08 ff 07 ea 13 ea 1b 13 05 07 f9 ee ef 1a f8 f4 ff ee fd f4 06 13 07 ef 05 05 02 fe 1d 08 10 00 d7 ee fb c4 f1 14 f4 09 03 03 06 01 ef ad f3 f7 0f f4 ef 18 ff ff 24 d8 14 1d 0a 00 0a 06 ea 0f fb 03 e9 17 f9 25 fd f2 fd 0d f6 ee 0e d4 ed 14 eb f1 f3 e7 be eb 08 0c 09 04 e1 0d e4 1b 2c e9 0e f1 ed 0c 14 f8 02 09 f6
    07 0a 07 0c df e3 ef 12 f9 f0 f3 11 e0 e1 f7 f4 19 0b 0e f4 05 00 f9 15 0c dc f3 19 06 07 36 00 10 0d 0e e2 04 f2 03 14 01 f8 2e 0d fa fc f5 f0 dd 16 1d fe 09 1a 09 1f ff 2a 2d 13 f4 10 f9 09 1b f9 f7 f1 e8 16 13 08 f5 fc f8 20 08 fc ed 04 d0 12 ee 07 c8 fa 08 eb e8 0d f8 fe 1e 12 0d f9 f4 0c 05 fb ea ec 01 ea dd 1f ec 0c 0e f7 ea 11 06 f5 0b ee 20 e9 14 11 fa ee e4 de 04 02 10 d8
    f8 ea 23 e6 f6 0f 1a 19 fc 01 03 03 dd 12 11 e7 09 fb ff e4 0b f9 f1 f1 f1 11 09 ee ed f3 eb 00 fc eb f4 d4 ff 03 06 fc 0d f3 07 16 f9 e4 03 f0 01 fa 03 1b 06 1e ee 04 20 cd 07 fe fe fa fa f9 17 1d f7 eb de 00 13 08 0d f1 03 17 08 3a d7 f1 38 09 06 04 13 02 00 ea fd ce 10 0b 2c 13 e8 1a d1 0f e8 0c fb e6 16 0e ff e2 0d 03 f6 03 cc fd 02 12 0c fb 03 16 05 f0 fb 06 0c 05 00 13 07 f0
    21 f4 ee 00 e3 dd ff 10 16 01 ed f1 f6 03 f4 03 f7 14 0a ff f0 fd fd 01 18 ea f5 07 00 00 09 e8 f4 f2 ed 02 ea 0f ef 12 19 f4 e9 17 07 1d eb f9 07 07 03 f3 dc 1f 18 07 e6 32 f4 fb 02 0d 07 10 f4 e1 0d 14 e3 e9 0c fc 0b f6 ff f9 ef d7 25 0e d3 fc 00 eb f6 f5 0f f8 1e f4 f4 1c 09 fa 14 e7 12 00 0b fd d2 13 e7 18 fd 26 ea 07 fa 13 17 e9 f3 fb f1 e9 11 1a fa 1b 14 e3 dc e9 01 16 05 17
    27 0f 00 11 e6 ee ef f4 1a 0f 03 20 28 fc 11 f1 f5 e9 ea 1d ef 12 2d 0a f3 fe eb 0c f6 ea 1a 02 11 05 14 15 e6 08 f0 f0 0d 0b f8 f0 ee 0d fe 00 e5 ec 02 ed f2 07 0e 1e f6 ec 0c 09 0d 00 ef eb f7 02 00 05 1a 0c 14 f1 e8 f9 0b 18 fc da 1c 12 e2 f1 11 eb 00 0f 13 04 ff 06 06 f9 36 0b 05 f7 f8 fd f4 fc 05 f0 f2 12 dd 0a 06 03 03 ec 37 f4 16 ff 0c f2 f4 e5 f7 22 fb 04 ef eb f2 01 ef ef
    0e ec 17 03 20 03 0a ee de 0c f9 e2 14 e3 eb 16 0a 09 ff fc 10 04 0a f3 0c 1c 08 08 db f1 37 fd fb 10 04 ff 13 f8 15 16 ff ed ff 01 f8 f9 fc 17 10 fd 17 31 0b 12 fd 08 f9 16 ef 2d f3 ea f0 0b f9 da 1a 02 ee 14 26 fe 18 ed f6 f3 f8 1b ce 01 04 ef 0d f0 e1 e8 0c f6 de bc 1f ed f8 08 03 fe eb 18 f4 08 cc f3 ff ff f2 15 f8 f3 07 fe 04 fb f5 f2 0e e9 0c 0c 14 10 19 f1 1e dd ec ef f0 fa
    01 05 f1 02 11 13 02 19 26 fe fd 0b 32 ea 05 0a 07 f2 17 ea 12 0e 04 0f 04 32 f5 ee e4 2c 1c 0a 22 e8 fe 03 08 08 17 06 0f ee f6 f7 f0 ee 13 10 20 0a 09 e7 f6 02 15 f0 12 f9 d5 0f 11 e5 04 10 1e de 25 03 e9 0e 2c f4 03 08 09 00 fa 12 f0 ef 0c 1f ff f3 de 0b ff fd fd 10 33 17 f9 fd 28 09 23 ef e8 e9 d7 fe 07 e8 00 18 e9 07 f9 0a 22 f1 f6 0c e9 ed 20 11 04 28 13 f8 f6 08 18 f2 08 26
    08 e8 ff e9 fe fc eb 17 f0 f2 fc ff 0e e7 fd f4 e8 07 fc 01 0a ef ea 10 01 0b f7 0c e3 07 08 04 06 f5 fc 0d 05 fb 05 f6 0d e9 dd 0b 0c 04 07 05 f0 ea f2 09 e8 05 00 ff ed 0c d5 08 f8 19 09 04 05 01 00 f3 fe ef 03 f6 f3 e7 ee 12 f0 fa f3 02 fb 0c fc f3 14 fe 09 04 fd 13 11 e1 17 ed e5 ea 0b fa e8 f5 12 ed e8 ed f2 0b e9 f7 0f f6 04 eb 04 f5 01 ed 0b 15 13 f6 0e e5 e3 e6 fc ee ed f3
    05 f2 fd f9 e9 12 f8 0c ee f8 ec 0a ed f9 0b 0b ef 06 fd f1 04 05 e1 0a 16 e9 f6 02 eb ef f2 04 f5 17 ed 0d eb f8 09 04 ea f1 00 fc f9 e7 fa 0c 05 ee e1 eb 09 03 e8 ea 11 00 07 fe 00 f5 eb f9 00 1a fa ee 05 0e 02 f0 15 ef e8 0d 12 1a f7 0e 13 e3 0f 00 e6 17 ef fe f3 f0 ee f4 ec 13 06 0c e7 e7 ea f8 06 f3 f3 ee ea fe fe f6 e6 f4 ec 0d 13 fb fe 00 e7 fb e9 02 f6 e5 01 0a 14 f9 00 f6
    11 0e f4 f6 05 03 0c fc 12 f5 ee dc f8 08 07 0d 0b 0a 00 f1 07 f4 03 0a 03 09 f4 e7 14 e8 e6 13 08 ee 0b 12 eb 12 f4 14 e8 03 18 dd 0c f0 06 e8 0a f5 f3 09 0d f6 02 12 d8 ee 3b fa f0 08 17 00 db 0c e7 f4 f3 0e e7 05 fb 13 00 e4 f1 f1 1b ec e7 0c f0 05 01 05 e9 f9 f2 04 ee fe 09 ec 05 13 0d e6 01 12 d8 e8 f4 fa 03 fa 02 0f 07 02 f7 e1 05 03 f8 0f db 15 11 02 e9 02 ec f8 ec fc 0c 16
    f7 ed f1 f7 e0 07 11 f8 ec fa e8 ff e1 ff f3 00 10 03 f3 02 eb fb ef 13 0a ed fb fa fc ea 08 e9 e5 ed f1 f0 07 e7 f2 ee 0c 0c f1 fd 06 f8 ef 0a fc f3 fd 0f e9 e9 0c 0e ef 17 fe 0c f3 04 05 fb 02 01 f4 00 2f f6 e4 fb 09 17 0d ec 07 e8 1f fe e7 eb e5 e8 fc 10 f7 0f 15 22 ed 08 0d f8 ed 05 0d 15 fe 0d 0f 00 e9 01 d6 ff 02 eb e4 e9 19 f9 f1 fe f7 0f e6 15 03 07 e5 e0 eb f0 ee f6 11 12
    e9 fc 03 ff e8 08 fa f6 f7 11 fe 07 eb fa fc ff 0f ee e4 fc 19 e8 f9 03 f6 e4 fb ef f7 22 1f 0b ff 0e 03 fc f5 f6 04 f0 ff f4 03 df 12 00 15 12 ff 05 06 fd 0e 04 e0 04 07 09 01 ef 18 11 fc ec ea 05 f4 02 e8 16 0e 00 16 0f 02 fb 0e 01 e7 10 e8 09 ea f8 f2 03 ea dd f3 f0 05 12 02 0f f0 fc df 0f ea 06 e7 e5 f1 09 ec e4 06 f8 0d 14 ec f3 14 f5 e6 0c 02 25 e7 ec e8 09 e5 ef 19 0c f7 f0
    f9 fa e9 ec f1 ef fc f6 fe fe 02 e9 1c f9 f3 eb 11 02 e9 0d e9 f0 d9 ee 0a 19 f9 0b 01 02 28 02 eb f9 1d fb fc 18 ef 09 fa f4 fe fe f5 fb fe 0b 0b 05 e6 12 0d 15 ea e1 10 05 e7 ea 0f f7 f2 05 e8 e3 e4 ea 06 12 12 f1 0c 13 18 18 11 f4 f5 f1 12 09 02 f8 ef 00 ed f8 fb fa 17 ec f9 f6 f7 0a 14 07 f1 fc ef 04 02 12 0c 0e 07 f9 f0 08 15 f7 14 00 df f3 ee 0b 12 ef 06 ef 0f 04 fb 13 f7 0c
    fe 08 de ea 10 f1 ec 09 15 f6 e8 e7 1c e7 eb fa e9 f0 ee ea 10 e8 fb 05 f0 2a 0b ea fc 1a 30 fa 0b e7 0f f1 dd 21 f6 14 f4 0f 0e db f4 f7 f3 ed ed 06 09 f0 07 17 0a 10 0f 1d fa 11 05 ea ec 0c 03 0d 09 19 ef 00 19 fe ff 09 12 0f 12 e3 fe ed 09 f0 0c 16 ec fb f3 e5 e7 ea 2b ec 09 0e fb 17 f8 02 15 11 ea fe 04 ec f1 05 f8 05 f8 e8 14 f5 0a f7 03 0c f2 e9 f2 ff e7 e3 0f f4 16 e8 0b 01
    e9 ed e4 fa fc fb 09 eb 05 ec fb ed 1b 09 ff 0d 07 03 04 03 0e fe f1 fb 11 1b 11 08 0e 0a f7 18 e8 0f 16 f7 fc 14 f9 e7 f2 ea 02 e3 03 f0 e8 0e ee 14 fd f9 02 ff 0a e9 fa 12 06 11 ef fd 03 f5 d6 ea 06 ff 11 f4 0a 06 16 0b f2 fd ee e4 f7 08 fa 06 06 12 fc 14 e3 04 05 f0 10 e7 08 01 0e 1c 0b 05 0c f6 eb fe f8 fc df 11 ef 11 fd f0 17 ed f6 e9 05 0f 01 fd f5 06 07 f6 dc f7 14 01 eb 1d
    09 13 10 f0 fc f2 f4 f5 10 06 00 00 2a 05 00 e5 ed ed 07 f7 0f fa f3 e7 ef 05 19 ea df 0b 0e 0f e5 fa f3 fa ef 12 02 05 ea 0f ef f2 0b 07 07 01 11 f0 0f ef 05 00 03 f1 fc 20 02 f9 f4 19 03 01 e4 f5 11 f1 f5 06 0d f3 e9 fa ed ec ed f7 fa 0c fc 10 f8 f4 dd ed f6 f9 01 18 16 04 1b 01 02 ee f2 0c 0b 19 f3 fb 15 17 0b e0 11 07 fc fb 14 09 17 05 ea f2 e5 e5 07 ff 0a eb e2 fa fd 09 07 1d
    e2 fd 00 04 11 ec 10 0d f4 f7 17 eb 13 00 0b 0d e8 0f e1 01 ff e7 fd 10 f1 fa fc 12 0d 0a 03 04 dd fd 0b f6 ee 05 09 fc ed f6 f7 df 05 03 f0 e7 15 ef ff f4 ef 03 09 17 f8 13 2d eb 10 fd 04 0f fc f8 08 04 1c 16 fd e4 18 f7 07 f3 f9 10 ed f0 01 12 fa 03 06 ee e7 04 ef f7 fc e8 10 0c f6 04 e6 f6 e9 f2 f3 fa e8 15 02 03 e6 17 eb 15 0f 0c 16 00 df fc e3 fe fc f3 f9 e5 0e fe 12 00 e8 0d
    e3 0b e9 03 ff f2 fa ec f9 f3 04 01 fa 1e 01 00 fc f5 f9 00 fa 05 e2 eb fb f2 fd 06 15 06 f8 13 ee 12 ff fe e5 08 00 ed 02 e3 08 fe fd e0 18 02 01 f6 02 17 0d 0a ec 11 f8 f9 25 e3 0e 16 f3 ee fd 0e e5 f3 07 19 f9 0d f7 ef 13 fc 0a 12 02 f5 1c 01 f8 f6 18 08 00 04 07 00 07 e4 15 e9 ed 19 fa 04 0b 13 17 ec fd f4 15 f2 0f 07 e4 ea f8 e5 ee 07 10 23 08 1e ea 02 ed 0f 04 ed fc 0a fc 04
    fd 11 ee 0c ea ee f1 f1 f7 0e 08 02 ef e4 04 f4 0d f0 04 fd ec f7 07 e5 fe ed 0b 14 0f fe f9 12 da fc ee f6 dc f5 e7 f2 fc 0a 1e dd fa fd 12 06 13 11 f8 00 e3 df f2 11 e3 f8 28 f3 e9 fa f7 03 df 06 e8 0c 0a f5 e7 07 15 0f f3 fd f4 ea f2 02 fe f2 e9 16 ec e9 0b ee f0 07 e1 e4 ec f9 fb 15 f2 f8 0e 18 12 fb 16 09 10 00 0d 0e ea 11 fb e2 01 00 05 ec f6 f8 13 ee 00 fb df 16 f0 f8 18 eb
    0b 13 00 00 e8 00 22 04 f8 f0 f7 de eb f1 ef e5 ea 13 fc 1a 0d fd 07 e5 06 d9 ec f6 0b 16 de 18 ef e8 f5 05 fc 07 11 f1 e9 ee 10 f6 00 13 06 0b 15 0a ff 10 14 fc f8 00 0f 04 21 f8 ec ed f1 e9 d8 06 dc f8 18 f4 e5 0d 07 03 04 04 f9 f0 fa 0f eb ec e2 01 ec 10 eb 08 e8 de fe e5 1c 02 08 02 09 e6 e9 f0 ef f3 e7 fe f2 f0 17 0f e6 ef da ee f2 09 07 1e e3 04 ec db 09 10 f7 e7 fe 03 ee 0a
    };
    assign bias_vector = BIAS_FILE_1;
       
    always_ff @(posedge clk) begin
        if(rst) begin
            for (k = 0; k < OUT_SIZE_1; k++) 
            output_vector[k] <= '0;
            i <= '0;
        end else begin
            for (k = 0; k < OUT_SIZE_1; k++)
            output_vector[k] <= output_vector_nxt[k];
            i <= i_nxt;
    end
    end
    

    always_comb begin
        
        if (i < IN_SIZE_1) begin
            i_nxt = i + 1;
            for (j = 0; j < OUT_SIZE_1; j++) 
            output_vector_nxt[j] = output_vector[j] +  bias_vector[j] + input_vector[i] * weight_matrix[i][j];
        end else begin
            i_nxt = i;
            for (j = 0; j < OUT_SIZE_1; j++) begin
            if (output_vector[j] < 0) 
            output_vector_nxt [j] = 0;
            else
            output_vector_nxt [j] = output_vector [j];
            end
        end

        end
endmodule
