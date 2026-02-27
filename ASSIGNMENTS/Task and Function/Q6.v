//Verilog function to shift the input data 1 bit to the right

module shift#(parameter N=4)(
  input signed [N-1:0]data1,
  output reg [N-1:0]r_shift,l_shift
);
   always @(*) begin
     r_shift=shift_r(data1);
     //l_shift=shift_l(data1);
   end
  
 function automatic [N-1:0]shift_r;
   input [N-1:0]x;
    begin
      shift_r={1'b0,x[N-1:1]}; //right shift
    end
 endfunction
  
 /*function automatic [N-1:0]shift_l;
   input [N-1:0]x;
    begin
      shift_l={x[N-2:0],1'b0}; //left shift      
    end
  endfunction*/

 endmodule

//test bench
module shift_tb#(parameter N=4);

  reg [N-1:0]data1;
  wire [N-1:0]r_shift,l_shift;
  integer i;
  shift dut(.*);

  initial begin
    $dumpfile("shift.vcd");
    $dumpvars(0,shift_tb);
    $monitor("TIME=%0T ||  data=%B   r_shift=%B   l_shift=%B",$time,data1,r_shift,l_shift);
    data1=4'b0111;
    #10  data1=4'b0101;
    #10  data1=4'b0001;
    #10  data1=4'b1011;
    #10  data1=4'b1110;
    #10 $finish;
  end
endmodule
