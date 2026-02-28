module a_power_tb #( parameter N=4,pow=3);
  reg [N-1:0]data;
  wire [pow*N-1:0]out;
  integer i;
  a_power dut(.*);
  initial begin 
    $monitor("TIME=%0t  || DATA=%B  || OUT=%B",$time,data,out);
    for(i=0;i<16;i++) begin
      #10
      data=$random;
    end
  #10 $finish;  
  end
  initial begin
    $dumpfile("a_power.vcd");
    $dumpvars(1,a_power_tb);
  end
endmodule
