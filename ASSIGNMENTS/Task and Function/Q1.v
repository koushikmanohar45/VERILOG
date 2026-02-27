//sum of two numbers using function
module sum #(parameter N=4)(input [N-1:0]a,b,output [N:0]out);
  
  assign out=addition(a,b);
  
  function [N:0] addition;
    input [N-1:0]a;
    input [N-1:0]b;
       addition=a+b;
  endfunction 
  
endmodule

//test_bench
module sum_tb #( parameter N=4);
  reg [N-1:0]a,b;
  wire [N:0]out;
  sum dut(.*);
  initial begin 
    a=4'd12;b=4'd12;
    $monitor("TIME=%0t  || A=%B B=%B  || OUT=%B",$time,a,b,out);
    #10 a=4'd2;b=4'd11;
    #10 a=4'd1;b=4'd10;
    #10 a=4'd13;b=4'd1;
    #10 a=4'd11;b=4'd2;
    #10 a=4'd12;b=4'd6;
    #10 a=4'd3;b=4'd7;
    #10 a=4'd4;b=4'd5;    
    #10 $finish;
  end
  initial begin
    $dumpfile("sum.vcd");
    $dumpvars(1,sum_tb);
  end
endmodule
