//Verilog code to generate 20 odd or even values using a function.

module generate_odd_even #(parameter N=6,count=20)
(
  input x,
  output reg [N-1:0]even_out[0:count-1],
  output reg [N-1:0]odd_out[0:count-1]
);
  integer i;
  always@(*) begin 
    for(i=0;i<count;i++) begin   
      if(x)
       even_out[i]=e_out(i);
     else
       odd_out[i]=o_out(i);
    end
  end
    
  function automatic [N-1:0]e_out;
    input [N-1:0]a;
    begin
        e_out=2*a;        
      end 
  endfunction
  function automatic [N-1:0]o_out;
    input [N-1:0]a;
     begin
       o_out= (2*a)+1;
      end 
  endfunction
    
endmodule

//test bench
module generate_odd_even_tb#( parameter N=6,count=20);
  reg x;
  wire [N-1:0]even_out[0:count-1];
  wire  [N-1:0]odd_out[0:count-1];
  integer i;
  generate_odd_even dut(.*);
  initial begin 
    x=1;
    for(i=0;i<count;i++) begin
      #10;
      $display("TIME=%0t  || x=%B ||e_out=%d  o_out=%d",$time,x,even_out[i],odd_out[i]);
    end
    #10 x=0;
    for(i=0;i<count;i++) begin
      #10;
      $display("TIME=%0t  || x=%B ||e_out=%d  o_out=%d",$time,x,even_out[i],odd_out[i]);
    end
    #10 $finish;
  end
  initial begin
    $dumpfile("generate_odd_even.vcd");
    $dumpvars(1,generate_odd_even_tb);
  end
endmodule
