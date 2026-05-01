/*
Design a sequential FSM to check if the number of 1’s in the given inputs
together is multiple of 4 or not. Use Moore Machine for the design.
*/

module fsm10 (
    input clk,
    input reset,   
    input A,
    output y
);
  localparam [1:0]s0=0,s1=1,s2=2,s3=3;
    reg [1:0] state,nxt_state;
    
    always@(posedge clk)begin
        if(reset)
            state<=s0;
        else
            state<=nxt_state;
    end
    
    always@(*)begin
        case(state)
            s0:nxt_state=A?s1:s0;
            s1:nxt_state=A?s2:s1;
            s2:nxt_state=A?s3:s2;
            s3:nxt_state=A?s0:s3;
            default:nxt_state=s0;
        endcase
    end
    
  assign y=(!reset && state==s0);

endmodule

                                        //TESTBENCH


module tb;
  reg clk,reset,A;
  wire y;
  
  fsm10 dut(clk,reset,A,y);
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("v.vcd");
    $dumpvars(1,tb);
    clk=0;reset=1;A=0;
    #10 reset=0;
    repeat(20)begin
      #10; A=$urandom_range(0,1);
    end
    #10 A=1;
    #10 A=0;
    #10 A=1;
    #10 A=1;
    #10 A=0;
    #10 A=1;
    #10 A=1;
    #10 A=1;
    #10 A=0;
    #10 $finish;
  end
  initial begin
    
    $monitor("t=%0t |clk=%B|reset=%b |A=%b |Y=%b ",$time,clk,reset,A,y);
  end
endmodule

/*
OUTPUT:
t=0 |clk=0|reset=1 |A=0 |Y=0 
t=5 |clk=1|reset=1 |A=0 |Y=0 
t=10 |clk=0|reset=0 |A=0 |Y=1 
t=15 |clk=1|reset=0 |A=0 |Y=1 
t=20 |clk=0|reset=0 |A=1 |Y=1 
t=25 |clk=1|reset=0 |A=1 |Y=0 
t=30 |clk=0|reset=0 |A=0 |Y=0 
t=35 |clk=1|reset=0 |A=0 |Y=0 
t=40 |clk=0|reset=0 |A=0 |Y=0 
t=45 |clk=1|reset=0 |A=0 |Y=0 
t=50 |clk=0|reset=0 |A=0 |Y=0 
t=55 |clk=1|reset=0 |A=0 |Y=0 
t=60 |clk=0|reset=0 |A=1 |Y=0 
t=65 |clk=1|reset=0 |A=1 |Y=0 
t=70 |clk=0|reset=0 |A=1 |Y=0 
t=75 |clk=1|reset=0 |A=1 |Y=0 
t=80 |clk=0|reset=0 |A=0 |Y=0 
t=85 |clk=1|reset=0 |A=0 |Y=0 
t=90 |clk=0|reset=0 |A=0 |Y=0 
t=95 |clk=1|reset=0 |A=0 |Y=0 
t=100 |clk=0|reset=0 |A=1 |Y=0 
t=105 |clk=1|reset=0 |A=1 |Y=1 
t=110 |clk=0|reset=0 |A=1 |Y=1 
t=115 |clk=1|reset=0 |A=1 |Y=0 
t=120 |clk=0|reset=0 |A=1 |Y=0 
t=125 |clk=1|reset=0 |A=1 |Y=0 
t=130 |clk=0|reset=0 |A=1 |Y=0 
t=135 |clk=1|reset=0 |A=1 |Y=0 
t=140 |clk=0|reset=0 |A=1 |Y=0 
t=145 |clk=1|reset=0 |A=1 |Y=1 
t=150 |clk=0|reset=0 |A=1 |Y=1 
t=155 |clk=1|reset=0 |A=1 |Y=0 
t=160 |clk=0|reset=0 |A=1 |Y=0 
t=165 |clk=1|reset=0 |A=1 |Y=0 
t=170 |clk=0|reset=0 |A=0 |Y=0 
t=175 |clk=1|reset=0 |A=0 |Y=0 
t=180 |clk=0|reset=0 |A=0 |Y=0 
t=185 |clk=1|reset=0 |A=0 |Y=0 
t=190 |clk=0|reset=0 |A=0 |Y=0 
t=195 |clk=1|reset=0 |A=0 |Y=0 
t=200 |clk=0|reset=0 |A=1 |Y=0 
t=205 |clk=1|reset=0 |A=1 |Y=0 
t=210 |clk=0|reset=0 |A=0 |Y=0 
t=215 |clk=1|reset=0 |A=0 |Y=0 
t=220 |clk=0|reset=0 |A=1 |Y=0 
t=225 |clk=1|reset=0 |A=1 |Y=1 
t=230 |clk=0|reset=0 |A=0 |Y=1 
t=235 |clk=1|reset=0 |A=0 |Y=1 
t=240 |clk=0|reset=0 |A=1 |Y=1 
t=245 |clk=1|reset=0 |A=1 |Y=0 
t=250 |clk=0|reset=0 |A=1 |Y=0 
t=255 |clk=1|reset=0 |A=1 |Y=0 
t=260 |clk=0|reset=0 |A=0 |Y=0 
t=265 |clk=1|reset=0 |A=0 |Y=0 
t=270 |clk=0|reset=0 |A=1 |Y=0 
t=275 |clk=1|reset=0 |A=1 |Y=0 
t=280 |clk=0|reset=0 |A=1 |Y=0 
t=285 |clk=1|reset=0 |A=1 |Y=1 
t=290 |clk=0|reset=0 |A=1 |Y=1 
t=295 |clk=1|reset=0 |A=1 |Y=0 
t=300 |clk=0|reset=0 |A=0 |Y=0 
t=305 |clk=1|reset=0 |A=0 |Y=0 
*/
