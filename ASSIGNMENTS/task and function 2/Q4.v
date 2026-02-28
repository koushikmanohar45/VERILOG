//task to calculate the square of an 8-bit input number
module square#(parameter N=8 )(input [N:0] data,output reg [2*N-1:0]out);
  always@(*) begin
    sq(data,out);
  end
  task automatic sq;
    input [N:0] a;
    output[2*N-1:0] o;
     o=a*a;
  endtask
endmodule


//test bench
module square_tb #( parameter N=8);
  reg [N-1:0]data;
  wire [2*N-1:0]out;
  square dut(.*);
  initial begin 
    data=8'd12;
    $monitor("TIME=%0t  || DATA=%B  || OUT=%B",$time,data,out);
    #10 data=8'd14;
    #10 data=8'd25;
    #10 data=8'd100;
    #10 data=8'd200;
    #10 data=8'd125;
    #10 data=8'd0;
    #30 $finish;
  end
  initial begin
    $dumpfile("square.vcd");
    $dumpvars(1,square_tb);
  end
endmodule
