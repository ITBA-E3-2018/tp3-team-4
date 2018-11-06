`include "src/mux.v"
`include "src/tff.v"
`include "src/dff.v" 
`include "src/clock.v"

module tb;
    reg S, I, reset, T;
    wire net0, y, net2, b1, b2, Clk;

    clock_gen myclock(Clk);

    nand(net0,~S,I);
    dff my_dff(net0, Clk, reset, y);
    tff my_tff(T, y, reset, net2);
    mux my_mux1(net2, ~S, y, b1);
    mux my_mux2(~net2, ~S, y, b2);

    initial begin

        S = 0;
        I = 0;
        reset = 0;
        T = 1;
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