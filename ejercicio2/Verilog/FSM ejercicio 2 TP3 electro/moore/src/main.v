`timescale 1s / 1s
module mooreTest;

  wire clk, out;
  clock_gen clk_gen(clk);
  reg resetn = 1;
  reg w=0;

  
  
  FSMmoore myFSM(clk,resetn,w,out);
  initial begin

    #1
    w = 1;
	#3
    w = 0;
    #2
    w = 1;
    #1
    w = 0; 
    #3
    resetn = 0;
    #2
    w = 1;
    #1
    w = 0;
    #2
    w = 1;
    #5
    w = 0;
    #5
    w = 1;
    #1
    w = 0;
    #10;
    $finish;

  end



	//$monitor("Clock: %d, W: %d, Z: %d",clk,w,out);
	

//
// 
// reg dummy;
// reg[8*64:0] dumpfile_path = "output.vcd";
//
// initial begin
//   dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
//   $dumpfile(dumpfile_path);
//   $dumpvars(0,mooreTest);
// end

endmodule 



