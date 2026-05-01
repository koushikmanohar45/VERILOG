//Design an FSM-finite state machine which detects the alternate 0’s and 1’s in the previous three samples.

 
                                     //DESIGN
module fsm13 (
    input clk,
    input reset,   
    input x,
    output reg z
);
  localparam [1:0]S0=0,S1=1,S2=2,S3=3,S4=4,S5=5;
    reg [1:0] state,next_state;
    reg[2:0]temp;
    
    always@(posedge clk)begin
        if(reset)
            state<=S0;
        else
            state<=next_state;
    end
    
    always@(*)begin
        case(state)
            S0:next_state=x?S1:S0;
            S1:next_state=x?S3:S2;
            S2:next_state=x?S1:S0;
            S3:next_state=x?S3:S2;
            default:next_state=S0;
        endcase
    end
  
  always@(posedge clk)begin
    z=0;
      if((state==S1 && x==0)||(state==S2 && x==1))
        z=1;
  end
    

endmodule

                                             //TESHBENCH
module tb;
  reg clk,reset,x;
  wire z;
  
  fsm13 dut(clk,reset,x,z);
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("v.vcd");
    $dumpvars(1,tb);
    clk=0;reset=1;x=0;
    #10 reset=0;
    repeat(10)begin
      #10; x=$urandom_range(0,1);
    end
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 $finish;
  end
  initial begin
    $monitor("t=%0t| clk=%b |reset=%b |x=%b |z=%b ",$time,clk,reset,x,z);
  end
endmodule

/*
OUTPUT:
t=0| clk=0 |reset=1 |x=0 |z=x 
t=5| clk=1 |reset=1 |x=0 |z=0 
t=10| clk=0 |reset=0 |x=0 |z=0 
t=15| clk=1 |reset=0 |x=0 |z=0 
t=20| clk=0 |reset=0 |x=1 |z=0 
t=25| clk=1 |reset=0 |x=1 |z=0 
t=30| clk=0 |reset=0 |x=0 |z=0 
t=35| clk=1 |reset=0 |x=0 |z=1 
t=40| clk=0 |reset=0 |x=0 |z=1 
t=45| clk=1 |reset=0 |x=0 |z=0 
t=50| clk=0 |reset=0 |x=0 |z=0 
t=55| clk=1 |reset=0 |x=0 |z=0 
t=60| clk=0 |reset=0 |x=1 |z=0 
t=65| clk=1 |reset=0 |x=1 |z=0 
t=70| clk=0 |reset=0 |x=1 |z=0 
t=75| clk=1 |reset=0 |x=1 |z=0 
t=80| clk=0 |reset=0 |x=0 |z=0 
t=85| clk=1 |reset=0 |x=0 |z=0 
t=90| clk=0 |reset=0 |x=0 |z=0 
t=95| clk=1 |reset=0 |x=0 |z=0 
t=100| clk=0 |reset=0 |x=1 |z=0 
t=105| clk=1 |reset=0 |x=1 |z=0 
t=110| clk=0 |reset=0 |x=1 |z=0 
t=115| clk=1 |reset=0 |x=1 |z=0 
t=120| clk=0 |reset=0 |x=1 |z=0 
t=125| clk=1 |reset=0 |x=1 |z=0 
t=130| clk=0 |reset=0 |x=0 |z=0 
t=135| clk=1 |reset=0 |x=0 |z=0 
t=140| clk=0 |reset=0 |x=1 |z=0 
t=145| clk=1 |reset=0 |x=1 |z=1 
t=150| clk=0 |reset=0 |x=1 |z=1 
t=155| clk=1 |reset=0 |x=1 |z=0 
t=160| clk=0 |reset=0 |x=0 |z=0 
t=165| clk=1 |reset=0 |x=0 |z=0 
t=170| clk=0 |reset=0 |x=1 |z=0 
t=175| clk=1 |reset=0 |x=1 |z=1 
t=180| clk=0 |reset=0 |x=0 |z=1 
t=185| clk=1 |reset=0 |x=0 |z=1 
t=190| clk=0 |reset=0 |x=1 |z=1 
t=195| clk=1 |reset=0 |x=1 |z=1 
t=200| clk=0 |reset=0 |x=0 |z=1 
t=205| clk=1 |reset=0 |x=0 |z=1
*/
