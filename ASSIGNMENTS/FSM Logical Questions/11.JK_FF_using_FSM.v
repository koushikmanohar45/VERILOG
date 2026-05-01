                                     //DESIGN
module fsm11(
    input clk,
    input areset, 
    input j,
    input k,
    output out); 

    parameter OFF=0,ON=1;
    reg state,next_state;
    always @(*) begin    
        case(state)
            ON:begin
                if(k)
                    next_state=OFF;
                else
                    next_state=ON;
              end
            OFF:begin
                if(j)
                    next_state=ON;
                else
                    next_state=OFF;
            end
            default:next_state=OFF;
        endcase
    end

   always @(posedge clk or posedge areset) begin   
        if(areset)
            state<=OFF;
        else
            state<=next_state;
    end
  assign out=(state==ON);

endmodule

                                           //TESTBENCH
module tb;
   reg clk,areset,j,k;
   wire out;
  
  fsm11 dut(.clk(clk),.areset(areset),.j(j),.k(k),.out(out));
  
   always #5 clk=~clk;
  
   initial begin
     $dumpfile("v.vcd");
     $dumpvars(1,tb);
     clk=0;areset=1;j=0;k=0;
     #10 areset=0;
     repeat(20)begin
        #10;
        j=$urandom_range(0,1);
        k=$urandom_range(0,1);
       
     end
     #10 j=0;k=0;
     #10 j=0;k=1;
     #10 j=1;k=0;
     #10 j=1;k=1;
     #10 j=1;k=1;
     #10 j=0;k=0;
     #10 j=0;k=1;
     #10 j=1;k=0;
     #10 $finish;
   end
   initial begin
     $monitor("t=%0t |clk=%b |reset=%b |j=%b |k=%B |out=%b",$time,clk,areset,j,k,out);
   end
endmodule


/*
OUTPUT:
t=0 |clk=0 |reset=1 |j=0 |k=0 |out=0
t=5 |clk=1 |reset=1 |j=0 |k=0 |out=0
t=10 |clk=0 |reset=0 |j=0 |k=0 |out=0
t=15 |clk=1 |reset=0 |j=0 |k=0 |out=0
t=20 |clk=0 |reset=0 |j=1 |k=0 |out=0
t=25 |clk=1 |reset=0 |j=1 |k=0 |out=1
t=30 |clk=0 |reset=0 |j=0 |k=0 |out=1
t=35 |clk=1 |reset=0 |j=0 |k=0 |out=1
t=40 |clk=0 |reset=0 |j=1 |k=1 |out=1
t=45 |clk=1 |reset=0 |j=1 |k=1 |out=0
t=50 |clk=0 |reset=0 |j=0 |k=0 |out=0
t=55 |clk=1 |reset=0 |j=0 |k=0 |out=0
t=60 |clk=0 |reset=0 |j=1 |k=1 |out=0
t=65 |clk=1 |reset=0 |j=1 |k=1 |out=1
t=70 |clk=0 |reset=0 |j=1 |k=1 |out=1
t=75 |clk=1 |reset=0 |j=1 |k=1 |out=0
t=80 |clk=0 |reset=0 |j=1 |k=1 |out=0
t=85 |clk=1 |reset=0 |j=1 |k=1 |out=1
t=90 |clk=0 |reset=0 |j=1 |k=0 |out=1
t=95 |clk=1 |reset=0 |j=1 |k=0 |out=1
t=100 |clk=0 |reset=0 |j=0 |k=0 |out=1
t=105 |clk=1 |reset=0 |j=0 |k=0 |out=1
t=110 |clk=0 |reset=0 |j=1 |k=0 |out=1
t=115 |clk=1 |reset=0 |j=1 |k=0 |out=1
t=120 |clk=0 |reset=0 |j=0 |k=1 |out=1
t=125 |clk=1 |reset=0 |j=0 |k=1 |out=0
t=130 |clk=0 |reset=0 |j=1 |k=0 |out=0
t=135 |clk=1 |reset=0 |j=1 |k=0 |out=1
t=140 |clk=0 |reset=0 |j=0 |k=0 |out=1
t=145 |clk=1 |reset=0 |j=0 |k=0 |out=1
t=150 |clk=0 |reset=0 |j=1 |k=0 |out=1
t=155 |clk=1 |reset=0 |j=1 |k=0 |out=1
t=160 |clk=0 |reset=0 |j=0 |k=0 |out=1
t=165 |clk=1 |reset=0 |j=0 |k=0 |out=1
t=170 |clk=0 |reset=0 |j=0 |k=1 |out=1
t=175 |clk=1 |reset=0 |j=0 |k=1 |out=0
t=180 |clk=0 |reset=0 |j=0 |k=1 |out=0
t=185 |clk=1 |reset=0 |j=0 |k=1 |out=0
t=190 |clk=0 |reset=0 |j=1 |k=0 |out=0
t=195 |clk=1 |reset=0 |j=1 |k=0 |out=1
t=200 |clk=0 |reset=0 |j=0 |k=0 |out=1
t=205 |clk=1 |reset=0 |j=0 |k=0 |out=1
t=210 |clk=0 |reset=0 |j=0 |k=0 |out=1
t=215 |clk=1 |reset=0 |j=0 |k=0 |out=1
t=220 |clk=0 |reset=0 |j=0 |k=0 |out=1
t=225 |clk=1 |reset=0 |j=0 |k=0 |out=1
t=230 |clk=0 |reset=0 |j=0 |k=1 |out=1
t=235 |clk=1 |reset=0 |j=0 |k=1 |out=0
t=240 |clk=0 |reset=0 |j=1 |k=0 |out=0
t=245 |clk=1 |reset=0 |j=1 |k=0 |out=1
t=250 |clk=0 |reset=0 |j=1 |k=1 |out=1
t=255 |clk=1 |reset=0 |j=1 |k=1 |out=0
t=260 |clk=0 |reset=0 |j=1 |k=1 |out=0
t=265 |clk=1 |reset=0 |j=1 |k=1 |out=1
t=270 |clk=0 |reset=0 |j=0 |k=0 |out=1
t=275 |clk=1 |reset=0 |j=0 |k=0 |out=1
t=280 |clk=0 |reset=0 |j=0 |k=1 |out=1
t=285 |clk=1 |reset=0 |j=0 |k=1 |out=0
t=290 |clk=0 |reset=0 |j=1 |k=0 |out=0
t=295 |clk=1 |reset=0 |j=1 |k=0 |out=1
*/

