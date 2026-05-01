//Write an RTL code to generate 60% duty cycle clock 

                                     //DESIGN

module fsm6 (
    input clk,
    input reset,   
    output z
);
  localparam [2:0] A=0,B=1,C=2,D=3,E=4,F=5;
  reg [2:0] state,next_state;
    
    always@(posedge clk)begin
        if(reset)
            state<=A;
        else
            state<=next_state;
    end
    
    always@(*)begin
        case(state)
            A:next_state=B;
            B:next_state=C;
            C:next_state=D;
            D:next_state=E;
            E:next_state=F;
            F:next_state=B;
            default:next_state=A;
        endcase
    end
  
  assign z=(state==D||state==E||state==F);
  
endmodule


                          //TESHBENCH
module tb;
  reg clk,reset;
  wire z;
  
  fsm6 dut(clk,reset,z);
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("v.vcd");
    $dumpvars(0,tb);
    clk=0;reset=1;
    #10 reset=0;
    #200 $finish;
  end
  initial begin
    $monitor("t=%0t| clk=%b |reset=%b |z=%b ",$time,clk,reset,z);
  end
endmodule

/*
OUTPUT:
t=0| clk=0 |reset=1 |z=x 
t=5| clk=1 |reset=1 |z=0 
t=10| clk=0 |reset=0 |z=0 
t=15| clk=1 |reset=0 |z=0 
t=20| clk=0 |reset=0 |z=0 
t=25| clk=1 |reset=0 |z=0 
t=30| clk=0 |reset=0 |z=0 
t=35| clk=1 |reset=0 |z=1 
t=40| clk=0 |reset=0 |z=1 
t=45| clk=1 |reset=0 |z=1 
t=50| clk=0 |reset=0 |z=1 
t=55| clk=1 |reset=0 |z=1 
t=60| clk=0 |reset=0 |z=1 
t=65| clk=1 |reset=0 |z=0 
t=70| clk=0 |reset=0 |z=0 
t=75| clk=1 |reset=0 |z=0 
t=80| clk=0 |reset=0 |z=0 
t=85| clk=1 |reset=0 |z=1 
t=90| clk=0 |reset=0 |z=1 
t=95| clk=1 |reset=0 |z=1 
t=100| clk=0 |reset=0 |z=1 
t=105| clk=1 |reset=0 |z=1 
t=110| clk=0 |reset=0 |z=1 
t=115| clk=1 |reset=0 |z=0 
t=120| clk=0 |reset=0 |z=0 
t=125| clk=1 |reset=0 |z=0 
t=130| clk=0 |reset=0 |z=0 
t=135| clk=1 |reset=0 |z=1 
t=140| clk=0 |reset=0 |z=1 
t=145| clk=1 |reset=0 |z=1 
t=150| clk=0 |reset=0 |z=1 
t=155| clk=1 |reset=0 |z=1 
t=160| clk=0 |reset=0 |z=1 
t=165| clk=1 |reset=0 |z=0 
t=170| clk=0 |reset=0 |z=0 
t=175| clk=1 |reset=0 |z=0 
t=180| clk=0 |reset=0 |z=0 
t=185| clk=1 |reset=0 |z=1 
t=190| clk=0 |reset=0 |z=1 
t=195| clk=1 |reset=0 |z=1 
t=200| clk=0 |reset=0 |z=1 
t=205| clk=1 |reset=0 |z=1 
testbench.sv:15: $finish called at 210 (1s)
*/
