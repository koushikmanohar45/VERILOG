module palindrome_tb ;
  reg [15:0] n;
  wire out;
  palindrome dut(.*);
  initial begin 
    $monitor("time=%0t || n=%0d || out=%b",$time,n,out);
       n=16'd12213;
    #2 n=16'd1221;  
    #2 n=16'd12321;
    #2 n=16'd12223; 
    #2 n=16'd12221;
    #2 n=16'd121;
    #2 n=16'd12; 
    #2 n=16'd1;
    #2 $finish;
  end
  initial begin
    $dumpfile("palindrome.vcd");
    $dumpvars(1,palindrome_tb);
  end
endmodule
