module armstrong_num_tb;
  reg [9:0] n;
  wire out;
  armstrong_num dut(.*);
  initial begin 
    $monitor("time=%0t || n=%0d || out=%B",$time,n,out);
     n=15;
    #2 n=12;  
    #2 n=153;
    #2 n=370; 
    #2 n=1;
    #2 n=512;
    #2 n=407; 
    #2 n=371;
    #2 $finish;
  end
  initial begin
    $dumpfile("armstrong_num.vcd");
    $dumpvars(1,armstrong_num_tb);
  end
endmodule
