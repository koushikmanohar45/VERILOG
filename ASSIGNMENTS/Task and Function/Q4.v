//Verilog code to create two functions for multiplication and division
module mul_div #(parameter N=4)
(
  input [N-1:0]a,b,
  input  sel,
  output reg [2*N-1:0]out
);
  always@(*) begin 
    if(sel)
      out=mul(a,b);
     else
       out=div(a,b);
  end
    
  function automatic [2*N-1:0]mul;
    input [N-1:0]a,b;
    begin
        mul=a*b;        
      end 
  endfunction
  
  function automatic [2*N-1:0]div;
    input [N-1:0]a,b;
     begin
       div= a/b;
      end 
  endfunction
    
endmodule


//test bench
module mul_div_tb#( parameter N=4);
  reg [N-1:0]a,b;
  reg  sel;
  wire [2*N-1:0]out;
  integer i;
  mul_div  dut(.*);
  initial begin
    $monitor("TIME=%0t  || A=%B B=%B sel=%B || out=%d",$time,a,b,sel,out);
    sel=1;
    for(i=0;i<256;i++) begin
      #10;
      {a,b}=i;
    end
    #10 sel=0;
    for(i=0;i<256;i++) begin
      #10;
      {a,b}=i;
    end
    #10 $finish;
  end
  initial begin
    $dumpfile("mul_div.vcd");
    $dumpvars(1,mul_div_tb);
  end
endmodule
