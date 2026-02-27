//sum of two numbers using task
module sum #(parameter N=4)(input [N-1:0]a,b,output reg [N:0]out);
  always@(*)begin
    addition(out,a,b);
  end
  
  task automatic addition;
    output [N:0] add;
    input [N-1:0]a;
    input [N-1:0]b;
    begin
        add=a+b;
    end
  endtask
    
endmodule

//test bench
module sum_tb#( parameter N=4);
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
