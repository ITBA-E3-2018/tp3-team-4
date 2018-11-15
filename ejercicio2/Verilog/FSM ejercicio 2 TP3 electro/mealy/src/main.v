`timescale 1s / 1s
module mealyTest;

  // My signal definitions
  wire clk;
  clock_gen clk_gen(clk);
  reg resetn = 1;

  reg  out;
 reg w; 
  FSMmealy myFSM(clk,resetn,w,out);
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
	


  // Additional documentation on $dumpfile and $dumpvars: http://referencedesigner.com/tutorials/verilog/verilog_62.php
  // Setup to allow us to pass an output path for $dumpfile
  reg dummy;
  reg[8*64:0] dumpfile_path = "output.vcd";

  initial begin
    dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
    $dumpfile(dumpfile_path);
    $dumpvars(0,mealyTest);
  end

endmodule // End of Module hello_world



