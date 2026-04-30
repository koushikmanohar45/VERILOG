/*
Design a finite state machine that has an input x and output y. The output should 
be asserted whenever x = 1 or x = 0 for three consecutive clock pulses. In other 
words, the FSM should detect the sequences 111 or 000. Overlapping sequences 
are allowed, so a sequence of four or five 0s or 1s should also output 1. 
*/

                                     //design
module fsm1
  (
    input clk,
    input rst,
    input x,
    output y
  );
  
  localparam s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6;
  reg [2:0] state,nxt_state;
  
  always@(posedge clk)begin
    if(rst)
      state<=s0;
    else
      state<=nxt_state;
  end
  
  always@(*)begin
    case(state)
      s0:nxt_state=x?s1:s3;
      s1:nxt_state=x?s2:s3;
      s2:nxt_state=x?s5:s3;
      s3:nxt_state=x?s1:s4;
      s4:nxt_state=x?s1:s6;
      s5:nxt_state=x?s5:s3;
      s6:nxt_state=x?s1:s6;
      default:nxt_state=s0;
    endcase
  end

  
  assign y=((state==s5 ) || (state==s6 ));
  
endmodule

                                               //testbench

module tb_fsm1;

  reg clk;
  reg rst;
  reg x;
  wire y;

  fsm1 dut (.clk(clk),.rst(rst),.x(x),.y(y));

  always #5 clk=~clk;

  initial begin
    $dumpfile("fsm1.vcd");
    $dumpvars(0, tb_fsm1);
    clk=0;
    rst=1;
    x=0;
    #10;
    rst=0;
    repeat(5)begin
      #10;
      x=1;
     end
    repeat(5)begin
      #10;
      x=0;
     end
    repeat(7)begin
      #10;
      x=$urandom_range(0,1);
    end

    #10;
    $finish;
  end

  initial begin
    $monitor("Time=%0t| clk=%b| rst=%b | x=%b  | y=%b",
              $time,clk, rst, x, y);
  end

endmodule

/*
OUTPUT:
VCD info: dumpfile fsm1.vcd opened for output.
Time=0| clk=0| rst=1 | x=0  | y=x
Time=5| clk=1| rst=1 | x=0  | y=0
Time=10| clk=0| rst=0 | x=0  | y=0
Time=15| clk=1| rst=0 | x=0  | y=0
Time=20| clk=0| rst=0 | x=1  | y=0
Time=25| clk=1| rst=0 | x=1  | y=0
Time=30| clk=0| rst=0 | x=1  | y=0
Time=35| clk=1| rst=0 | x=1  | y=0
Time=40| clk=0| rst=0 | x=1  | y=0
Time=45| clk=1| rst=0 | x=1  | y=1
Time=50| clk=0| rst=0 | x=1  | y=1
Time=55| clk=1| rst=0 | x=1  | y=1
Time=60| clk=0| rst=0 | x=1  | y=1
Time=65| clk=1| rst=0 | x=1  | y=1
Time=70| clk=0| rst=0 | x=0  | y=1
Time=75| clk=1| rst=0 | x=0  | y=0
Time=80| clk=0| rst=0 | x=0  | y=0
Time=85| clk=1| rst=0 | x=0  | y=0
Time=90| clk=0| rst=0 | x=0  | y=0
Time=95| clk=1| rst=0 | x=0  | y=1
Time=100| clk=0| rst=0 | x=0  | y=1
Time=105| clk=1| rst=0 | x=0  | y=1
Time=110| clk=0| rst=0 | x=0  | y=1
Time=115| clk=1| rst=0 | x=0  | y=1
Time=120| clk=0| rst=0 | x=1  | y=1
Time=125| clk=1| rst=0 | x=1  | y=0
Time=130| clk=0| rst=0 | x=0  | y=0
Time=135| clk=1| rst=0 | x=0  | y=0
Time=140| clk=0| rst=0 | x=0  | y=0
Time=145| clk=1| rst=0 | x=0  | y=0
Time=150| clk=0| rst=0 | x=0  | y=0
Time=155| clk=1| rst=0 | x=0  | y=1
Time=160| clk=0| rst=0 | x=1  | y=1
Time=165| clk=1| rst=0 | x=1  | y=0
Time=170| clk=0| rst=0 | x=1  | y=0
Time=175| clk=1| rst=0 | x=1  | y=0
Time=180| clk=0| rst=0 | x=0  | y=0
Time=185| clk=1| rst=0 | x=0  | y=0
*/
