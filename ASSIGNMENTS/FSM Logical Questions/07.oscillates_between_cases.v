/*
Given the conditions, such that If A = 0, the circuit oscillates between either one 
of the two cases. Case 1: 00-01-00-01… and Case 2: 10-11-10-11… 
And If A = 1, it switches inter between two cases. write Verilog code 
*/

                               //DESIGN
module fsm7 (
    input clk,
    input reset,   
    input A,
    output reg [1:0] y
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
            s0:nxt_state=(A==0)?s1:s2;
            s1:nxt_state=(A==0)?s0:s3;
            s2:nxt_state=(A==0)?s3:s0;
            s3:nxt_state=(A==0)?s2:s1;
            default:nxt_state=s0;
        endcase
    end
  
  assign y=state;

endmodule


                                           //TESTBENCH


module tb;
  reg clk,reset,A;
  wire [1:0] y;
  
  fsm7 dut(clk,reset,A,y);
  
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
t=0 |clk=0|reset=1 |A=0 |Y=xx 
t=5 |clk=1|reset=1 |A=0 |Y=00 
t=10 |clk=0|reset=0 |A=0 |Y=00 
t=15 |clk=1|reset=0 |A=0 |Y=01 
t=20 |clk=0|reset=0 |A=1 |Y=01 
t=25 |clk=1|reset=0 |A=1 |Y=11 
t=30 |clk=0|reset=0 |A=0 |Y=11 
t=35 |clk=1|reset=0 |A=0 |Y=10 
t=40 |clk=0|reset=0 |A=0 |Y=10 
t=45 |clk=1|reset=0 |A=0 |Y=11 
t=50 |clk=0|reset=0 |A=0 |Y=11 
t=55 |clk=1|reset=0 |A=0 |Y=10 
t=60 |clk=0|reset=0 |A=1 |Y=10 
t=65 |clk=1|reset=0 |A=1 |Y=00 
t=70 |clk=0|reset=0 |A=1 |Y=00 
t=75 |clk=1|reset=0 |A=1 |Y=10 
t=80 |clk=0|reset=0 |A=0 |Y=10 
t=85 |clk=1|reset=0 |A=0 |Y=11 
t=90 |clk=0|reset=0 |A=0 |Y=11 
t=95 |clk=1|reset=0 |A=0 |Y=10 
t=100 |clk=0|reset=0 |A=1 |Y=10 
t=105 |clk=1|reset=0 |A=1 |Y=00 
t=110 |clk=0|reset=0 |A=1 |Y=00 
t=115 |clk=1|reset=0 |A=1 |Y=10 
t=120 |clk=0|reset=0 |A=1 |Y=10 
t=125 |clk=1|reset=0 |A=1 |Y=00 
t=130 |clk=0|reset=0 |A=1 |Y=00 
t=135 |clk=1|reset=0 |A=1 |Y=10 
t=140 |clk=0|reset=0 |A=1 |Y=10 
t=145 |clk=1|reset=0 |A=1 |Y=00 
t=150 |clk=0|reset=0 |A=1 |Y=00 
t=155 |clk=1|reset=0 |A=1 |Y=10 
t=160 |clk=0|reset=0 |A=1 |Y=10 
t=165 |clk=1|reset=0 |A=1 |Y=00 
t=170 |clk=0|reset=0 |A=0 |Y=00 
t=175 |clk=1|reset=0 |A=0 |Y=01 
t=180 |clk=0|reset=0 |A=0 |Y=01 
t=185 |clk=1|reset=0 |A=0 |Y=00 
t=190 |clk=0|reset=0 |A=0 |Y=00 
t=195 |clk=1|reset=0 |A=0 |Y=01 
t=200 |clk=0|reset=0 |A=1 |Y=01 
t=205 |clk=1|reset=0 |A=1 |Y=11 
t=210 |clk=0|reset=0 |A=0 |Y=11 
t=215 |clk=1|reset=0 |A=0 |Y=10 
t=220 |clk=0|reset=0 |A=1 |Y=10 
t=225 |clk=1|reset=0 |A=1 |Y=00 
t=230 |clk=0|reset=0 |A=0 |Y=00 
t=235 |clk=1|reset=0 |A=0 |Y=01 
t=240 |clk=0|reset=0 |A=1 |Y=01 
t=245 |clk=1|reset=0 |A=1 |Y=11 
t=250 |clk=0|reset=0 |A=1 |Y=11 
t=255 |clk=1|reset=0 |A=1 |Y=01 
t=260 |clk=0|reset=0 |A=0 |Y=01 
t=265 |clk=1|reset=0 |A=0 |Y=00 
t=270 |clk=0|reset=0 |A=1 |Y=00 
t=275 |clk=1|reset=0 |A=1 |Y=10 
t=280 |clk=0|reset=0 |A=1 |Y=10 
t=285 |clk=1|reset=0 |A=1 |Y=00 
t=290 |clk=0|reset=0 |A=1 |Y=00 
t=295 |clk=1|reset=0 |A=1 |Y=10 
t=300 |clk=0|reset=0 |A=0 |Y=10 
t=305 |clk=1|reset=0 |A=0 |Y=11
*/
