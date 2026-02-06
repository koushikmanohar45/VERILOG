module dff_tb;
    reg d,clk,rst;
    wire q;
    dff dut (.d(d),.clk(clk),.rst(rst),.q(q));
    initial begin
      $monitor("TIME=0%t  || CLK= %B  RST=%B  || D=%B  || Q= %B",$time,clk,rst,d,q);
        clk=0;rst=1;d=0;
        #7 rst=0; 
        #11 d=1;
        #15 d=0;
        #4 d=1;
        #6 rst=1; 
        #7 d=0;
        #5 d=1;
        #20 rst=0;
        #20 $finish;
    end
  initial begin
     clk=1;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("dff.vcd");
    $dumpvars(1,dff_tb);
  end

endmodule
