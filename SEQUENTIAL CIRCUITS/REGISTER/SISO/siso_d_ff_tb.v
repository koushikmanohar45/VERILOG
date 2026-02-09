module siso_d_ff_tb;
  reg d_sin;
  reg clk,rst,preset;
  wire q_sout;
  siso_d_ff dut (.*);
    initial begin
      $monitor("TIME=%0t  || CLK= %B  RST=%B PRESET=%B  || seial _in=%B  || q= %B ||Q=%b",$time,clk,rst,preset,d_sin,q_sout);
        rst=1;preset=0;d_sin=1;
        #10 rst=0; 
        #10 d_sin=0;
        #10d_sin=1;
        #10 d_sin=1;
        #10 d_sin=0;
        #10 d_sin=1;
        #10 d_sin=0;
        #10 d_sin=1;
        #10 d_sin=1;
        #40 preset=1;
        #10 d_sin=0;
        #10 preset=0;d_sin=0;
        #10 d_sin=1;
        #10 d_sin=1;
        #40 $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("siso_d_ff.vcd");
    $dumpvars(1,siso_d_ff_tb);
  end

endmodule
