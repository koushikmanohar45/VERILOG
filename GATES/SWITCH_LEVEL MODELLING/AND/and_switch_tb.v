module and_switch_tb();
  reg a,b; 
  wire y;
  and_switch dut(.a(a),.b(b),.y(y));
  initial begin 
    a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
  end
  initial begin
    $monitor("T=0%t|a=%b,b=%b|y=%b",$time,a,b,y);
  end
endmodule
