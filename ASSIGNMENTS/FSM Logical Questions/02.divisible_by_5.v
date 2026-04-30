/*
To design a state diagram and implement a circuit that outputs a "1" if the 
aggregate serial binary input is divisible by 5, we first need to understand the 
problem and then translate it into Verilog code.
*/

                                                     //DESIGN
module fsm2
  (
    input clk,
    input rst,
    input x,
    output reg y
  );
  
  localparam s0=0,s1=1,s2=2,s3=3,s4=4;
  reg [2:0] state,nxt_state;
  
  always@(posedge clk)begin
    if(rst)
      state<=s0;
    else
      state<=nxt_state;
  end
  
  always@(*)begin
    case(state)
      s0:nxt_state=x?s1:s0;
      s1:nxt_state=x?s3:s2;
      s2:nxt_state=x?s0:s4;
      s3:nxt_state=x?s2:s1;
      s4:nxt_state=x?s4:s3;
      default:nxt_state=s0;
    endcase
  end
 always@(posedge clk)begin
    if(rst)
      y<=0;
    else begin
      if((state==s2 && nxt_state==s0)||(state==s3 && nxt_state==s0))
           y<=1'b1;
      else
        y<=1'b0;
    end
    
  end
endmodule


                                                            //TESTBENCH


module tb_fsm2;

  reg clk;
  reg rst;
  reg x;
  wire y;

  fsm2 dut (.clk(clk),.rst(rst),.x(x),.y(y));

  always #5 clk=~clk;

  initial begin
    $dumpfile("fsm1.vcd");
    $dumpvars(0, tb_fsm1);
    clk=0;
    rst=1;
    x=0;
    #10;
    rst=0;
    repeat(50)begin
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
Time=0| clk=0| rst=1 | x=0  | y=x
Time=5| clk=1| rst=1 | x=0  | y=0
Time=10| clk=0| rst=0 | x=0  | y=0
Time=15| clk=1| rst=0 | x=0  | y=0
Time=20| clk=0| rst=0 | x=1  | y=0
Time=25| clk=1| rst=0 | x=1  | y=0
Time=30| clk=0| rst=0 | x=0  | y=0
Time=35| clk=1| rst=0 | x=0  | y=0
Time=40| clk=0| rst=0 | x=0  | y=0
Time=45| clk=1| rst=0 | x=0  | y=0
Time=50| clk=0| rst=0 | x=0  | y=0
Time=55| clk=1| rst=0 | x=0  | y=0
Time=60| clk=0| rst=0 | x=1  | y=0
Time=65| clk=1| rst=0 | x=1  | y=0
Time=70| clk=0| rst=0 | x=1  | y=0
Time=75| clk=1| rst=0 | x=1  | y=1
Time=80| clk=0| rst=0 | x=0  | y=1
Time=85| clk=1| rst=0 | x=0  | y=0
Time=90| clk=0| rst=0 | x=0  | y=0
Time=95| clk=1| rst=0 | x=0  | y=0
Time=100| clk=0| rst=0 | x=1  | y=0
Time=105| clk=1| rst=0 | x=1  | y=0
Time=110| clk=0| rst=0 | x=1  | y=0
Time=115| clk=1| rst=0 | x=1  | y=0
Time=120| clk=0| rst=0 | x=1  | y=0
Time=125| clk=1| rst=0 | x=1  | y=0
Time=130| clk=0| rst=0 | x=1  | y=0
Time=135| clk=1| rst=0 | x=1  | y=1
Time=140| clk=0| rst=0 | x=1  | y=1
Time=145| clk=1| rst=0 | x=1  | y=0
Time=150| clk=0| rst=0 | x=1  | y=0
Time=155| clk=1| rst=0 | x=1  | y=0
Time=160| clk=0| rst=0 | x=1  | y=0
Time=165| clk=1| rst=0 | x=1  | y=0
Time=170| clk=0| rst=0 | x=0  | y=0
Time=175| clk=1| rst=0 | x=0  | y=0
Time=180| clk=0| rst=0 | x=0  | y=0
Time=185| clk=1| rst=0 | x=0  | y=0
Time=190| clk=0| rst=0 | x=0  | y=0
Time=195| clk=1| rst=0 | x=0  | y=0
Time=200| clk=0| rst=0 | x=1  | y=0
Time=205| clk=1| rst=0 | x=1  | y=0
Time=210| clk=0| rst=0 | x=0  | y=0
Time=215| clk=1| rst=0 | x=0  | y=0
Time=220| clk=0| rst=0 | x=0  | y=0
Time=225| clk=1| rst=0 | x=0  | y=0
Time=230| clk=0| rst=0 | x=1  | y=0
Time=235| clk=1| rst=0 | x=1  | y=1
Time=240| clk=0| rst=0 | x=1  | y=1
Time=245| clk=1| rst=0 | x=1  | y=0
Time=250| clk=0| rst=0 | x=0  | y=0
Time=255| clk=1| rst=0 | x=0  | y=0
Time=260| clk=0| rst=0 | x=0  | y=0
Time=265| clk=1| rst=0 | x=0  | y=0
Time=270| clk=0| rst=0 | x=0  | y=0
Time=275| clk=1| rst=0 | x=0  | y=0
Time=280| clk=0| rst=0 | x=1  | y=0
Time=285| clk=1| rst=0 | x=1  | y=0
Time=290| clk=0| rst=0 | x=0  | y=0
Time=295| clk=1| rst=0 | x=0  | y=0
Time=300| clk=0| rst=0 | x=0  | y=0
Time=305| clk=1| rst=0 | x=0  | y=0
Time=310| clk=0| rst=0 | x=0  | y=0
Time=315| clk=1| rst=0 | x=0  | y=0
Time=320| clk=0| rst=0 | x=0  | y=0
Time=325| clk=1| rst=0 | x=0  | y=0
Time=330| clk=0| rst=0 | x=1  | y=0
Time=335| clk=1| rst=0 | x=1  | y=1
Time=340| clk=0| rst=0 | x=0  | y=1
Time=345| clk=1| rst=0 | x=0  | y=0
Time=350| clk=0| rst=0 | x=1  | y=0
Time=355| clk=1| rst=0 | x=1  | y=0
Time=360| clk=0| rst=0 | x=1  | y=0
Time=365| clk=1| rst=0 | x=1  | y=0
Time=370| clk=0| rst=0 | x=0  | y=0
Time=375| clk=1| rst=0 | x=0  | y=0
Time=380| clk=0| rst=0 | x=0  | y=0
Time=385| clk=1| rst=0 | x=0  | y=0
Time=390| clk=0| rst=0 | x=0  | y=0
Time=395| clk=1| rst=0 | x=0  | y=0
Time=400| clk=0| rst=0 | x=0  | y=0
Time=405| clk=1| rst=0 | x=0  | y=0
Time=410| clk=0| rst=0 | x=0  | y=0
Time=415| clk=1| rst=0 | x=0  | y=0
Time=420| clk=0| rst=0 | x=1  | y=0
Time=425| clk=1| rst=0 | x=1  | y=0
Time=430| clk=0| rst=0 | x=0  | y=0
Time=435| clk=1| rst=0 | x=0  | y=0
Time=440| clk=0| rst=0 | x=0  | y=0
Time=445| clk=1| rst=0 | x=0  | y=0
Time=450| clk=0| rst=0 | x=0  | y=0
Time=455| clk=1| rst=0 | x=0  | y=0
Time=460| clk=0| rst=0 | x=1  | y=0
Time=465| clk=1| rst=0 | x=1  | y=0
Time=470| clk=0| rst=0 | x=0  | y=0
Time=475| clk=1| rst=0 | x=0  | y=0
Time=480| clk=0| rst=0 | x=1  | y=0
Time=485| clk=1| rst=0 | x=1  | y=0
Time=490| clk=0| rst=0 | x=1  | y=0
Time=495| clk=1| rst=0 | x=1  | y=1
Time=500| clk=0| rst=0 | x=0  | y=1
Time=505| clk=1| rst=0 | x=0  | y=0
Time=510| clk=0| rst=0 | x=0  | y=0
Time=515| clk=1| rst=0 | x=0  | y=0
*/
