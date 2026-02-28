module fibonacci_series_tb;
  reg [3:0] N;
  wire [31:0]out[0:15];
  integer i;
  fibonacci_series dut(.*);
  initial begin 
    #2 N=15;
    for(i=0;i<=N;i++) begin
      #10
      $display("time=%0t  a[%0d]=%0d",$time,i,out[i]);
    end
    #500 $finish;
  end
  initial begin
    $dumpfile("fibonacci_series.vcd");
    $dumpvars(1,fibonacci_series_tb);
  end
endmodule
