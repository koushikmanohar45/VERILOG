module factorial_tb ;
  reg [3:0]data;
  wire [40:0]out;
  integer i;
  factorial dut(.*);
  initial begin 
    $monitor("TIME=%0t  || DATA=%B  || OUT=%B",$time,data,out);
    for(i=0;i<16;i++) begin
      #10
      data=$random;
    end
  #10 $finish;  
  end
  initial begin
    $dumpfile("factorial.vcd");
    $dumpvars(1,factorial_tb);
  end
endmodule
