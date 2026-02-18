module parity_checker_tb();
  reg clk,rst;
  reg [2:0]d;
  wire[3:0] data;
  wire[3:0] error_data;
  wire p_c1,p_c2;
  integer i;
  parity_checker dut(.*);
  always #5 clk=~clk;
  initial begin
    $dumpfile("parity_checker.vcd");
    $dumpvars(0,parity_checker_tb);
    $monitor("TIME=%0T || CLK=%B RST=%B correct_data_with_parity=%B  parity_checker_corrected_data=%b ||Error_data_with_parity=%B   parity_checker_error_data=%b ",$time,clk,rst,data,p_c1,error_data,p_c2);
    clk=1;rst=1;d=3'b000;
    #10 rst=0;
    for(i=0;i<8;i++) begin
      #10;
      d=i;
    end   
    #10 $finish;
  end
endmodule 
