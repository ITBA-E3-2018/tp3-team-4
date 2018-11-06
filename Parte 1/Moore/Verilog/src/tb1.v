`include "src/mux.v"
`include "src/tff.v"
`include "src/dff.v" 
`include "src/clock.v"
`include "src/decoder.v"

module tb;

    
    reg enable_T, reset, S, I, enable;
    wire b1, b2, Q, ambas, una_sola, ninguna;
    wire Y_1, Y_0, net0, Clk, y1, y0;
    wire[3:0] state;
    wire[15:0] dec_out;

    clock_gen myclock(Clk);

    not(Y_0,S);
    not(net0, I);
    and(Y_1, Y_0, net0);

    dff state_y1(Y_1, Clk, reset, y1);
    dff state_y0(Y_0, Clk, reset, y0);

    assign state = {2'b0, y1, y0};
    decoder my_decoder(state, dec_out, enable);


    tff my_ttf(enable_T, una_sola, reset, Q);
    
    mux mux_b1(ambas,  Q, una_sola, b1);
    mux mux_b2(ambas, ~Q, una_sola, b2);

    
    assign ninguna = dec_out[0];
    assign una_sola = dec_out[1];
    assign ambas = dec_out[3];

    initial begin

        S = 0;
        I = 0;
        reset = 0;
        enable = 1;
        enable_T = 1;
        #1;
        reset = 1;
        #20;
        S = 0;
        I = 1;
        #20;
        S = 1;
        I = 1;
        #20;
        S = 0;
        I = 0;
        #20;
        S = 0;
        I = 1;
        #20;
        S = 0;
        I = 0;
        #20;
        S = 0;
        I = 1;
        $finish;
    end

    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        $dumpfile(dumpfile_path);
        $dumpvars(0, tb);
    end
endmodule
