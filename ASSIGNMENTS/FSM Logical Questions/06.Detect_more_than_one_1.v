//To design a Finite State Machine (FSM) in Verilog that detects more than one "1" in the last three samples. 



                        //DESIGN
module fsm6 (
    input clk,
    input reset,   
    input x,
    output z
);
  localparam [2:0]S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6,S7=7;
  reg [2:0] state,next_state;
    
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
            S2:next_state=x?S5:S4;
            S3:next_state=x?S7:S6;
            S4:next_state=x?S1:S0;
            S5:next_state=x?S3:S2;
            S6:next_state=x?S5:S4;
            S7:next_state=x?S7:S6;
            default:next_state=S0;
        endcase
    end
  
  assign z=(state==S3||state==S7||state==S6||state==S5);
    

endmodule


                          //TESHBENCH
module tb;
  reg clk,reset,x;
  wire z;
  
  fsm6 dut(clk,reset,x,z);
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("v.vcd");
    $dumpvars(0,tb);
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
t=35| clk=1 |reset=0 |x=0 |z=0 
t=40| clk=0 |reset=0 |x=0 |z=0 
t=45| clk=1 |reset=0 |x=0 |z=0 
t=50| clk=0 |reset=0 |x=0 |z=0 
t=55| clk=1 |reset=0 |x=0 |z=0 
t=60| clk=0 |reset=0 |x=1 |z=0 
t=65| clk=1 |reset=0 |x=1 |z=0 
t=70| clk=0 |reset=0 |x=1 |z=0 
t=75| clk=1 |reset=0 |x=1 |z=1 
t=80| clk=0 |reset=0 |x=0 |z=1 
t=85| clk=1 |reset=0 |x=0 |z=1 
t=90| clk=0 |reset=0 |x=0 |z=1 
t=95| clk=1 |reset=0 |x=0 |z=0 
t=100| clk=0 |reset=0 |x=1 |z=0 
t=105| clk=1 |reset=0 |x=1 |z=0 
t=110| clk=0 |reset=0 |x=1 |z=0 
t=115| clk=1 |reset=0 |x=1 |z=1 
t=120| clk=0 |reset=0 |x=1 |z=1 
t=125| clk=1 |reset=0 |x=1 |z=1 
t=130| clk=0 |reset=0 |x=0 |z=1 
t=135| clk=1 |reset=0 |x=0 |z=1 
t=140| clk=0 |reset=0 |x=1 |z=1 
t=145| clk=1 |reset=0 |x=1 |z=1 
t=150| clk=0 |reset=0 |x=1 |z=1 
t=155| clk=1 |reset=0 |x=1 |z=1 
t=160| clk=0 |reset=0 |x=0 |z=1 
t=165| clk=1 |reset=0 |x=0 |z=1 
t=170| clk=0 |reset=0 |x=1 |z=1 
t=175| clk=1 |reset=0 |x=1 |z=1 
t=180| clk=0 |reset=0 |x=0 |z=1 
t=185| clk=1 |reset=0 |x=0 |z=0 
t=190| clk=0 |reset=0 |x=1 |z=0 
t=195| clk=1 |reset=0 |x=1 |z=1 
t=200| clk=0 |reset=0 |x=0 |z=1 
t=205| clk=1 |reset=0 |x=0 |z=0 
testbench.sv:27: $finish called at 210 (1s)
*/
