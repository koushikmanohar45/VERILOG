module sum_of_digits_tb#(parameter N=10,B=7);
  reg [N-1:0] n;
  wire [B-1:0]sum;
  sum_of_digits dut(.*);
  initial begin 
    $monitor("time=%0t || n=%0d || out=%0d",$time,n,sum);
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
    $dumpfile("sum_of_digits.vcd");
    $dumpvars(1,sum_of_digits_tb);
  end
endmodule
