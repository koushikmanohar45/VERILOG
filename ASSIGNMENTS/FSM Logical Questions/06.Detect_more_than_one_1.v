/*
To design a Finite State Machine (FSM) in Verilog that detects more than one "1" 
in the last three samples. 
*/


                        //DESIGN
module fsm6 (
    input clk,
    input reset,   
    input x,
    output z
);
    localparam [1:0]A=0,B=1,C=2;
    reg [1:0] state,next_state;
    reg[2:0]temp;
    
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
            C:next_state=A;
            default:next_state=A;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)begin
            temp<=3'd0;
        end
         else begin
           temp<={x,temp[2:1]};
         end
    end
    
  assign z=(temp==3'b101||temp==3'b110||temp==3'b011||temp==3'b111);

endmodule

                          //TESHBENCH
module tb;
  reg clk,reset,x;
  wire z;
  
  fsm4 dut(clk,reset,x,z);
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("v.vcd");
    $dumpvars(1,tb);
    clk=0;reset=1;x=0;
    #10 reset=0;
    repeat(20)begin
      #10; x=$urandom_range(0,1);
    end
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=1;
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
t=0| clk=0 |reset=1 |x=0 |z=0 
t=5| clk=1 |reset=1 |x=0 |z=0 
t=10| clk=0 |reset=0 |x=0 |z=0 
t=15| clk=1 |reset=0 |x=0 |z=0 
t=20| clk=0 |reset=0 |x=0 |z=0 
t=25| clk=1 |reset=0 |x=0 |z=0 
t=30| clk=0 |reset=0 |x=0 |z=0 
t=35| clk=1 |reset=0 |x=0 |z=0 
t=40| clk=0 |reset=0 |x=0 |z=0 
t=45| clk=1 |reset=0 |x=0 |z=0 
t=50| clk=0 |reset=0 |x=0 |z=0 
t=55| clk=1 |reset=0 |x=0 |z=0 
t=60| clk=0 |reset=0 |x=0 |z=0 
t=65| clk=1 |reset=0 |x=0 |z=0 
t=70| clk=0 |reset=0 |x=0 |z=0 
t=75| clk=1 |reset=0 |x=0 |z=0 
t=80| clk=0 |reset=0 |x=0 |z=0 
t=85| clk=1 |reset=0 |x=0 |z=0 
t=90| clk=0 |reset=0 |x=0 |z=0 
t=95| clk=1 |reset=0 |x=0 |z=0 
t=100| clk=0 |reset=0 |x=1 |z=0 
t=105| clk=1 |reset=0 |x=1 |z=0 
t=110| clk=0 |reset=0 |x=1 |z=0 
t=115| clk=1 |reset=0 |x=1 |z=0 
t=115| clk=1 |reset=0 |x=1 |z=1 
t=120| clk=0 |reset=0 |x=1 |z=1 
t=125| clk=1 |reset=0 |x=1 |z=1 
t=130| clk=0 |reset=0 |x=1 |z=1 
t=135| clk=1 |reset=0 |x=1 |z=1 
t=140| clk=0 |reset=0 |x=1 |z=1 
t=145| clk=1 |reset=0 |x=1 |z=1 
t=150| clk=0 |reset=0 |x=0 |z=1 
t=155| clk=1 |reset=0 |x=0 |z=1 
t=160| clk=0 |reset=0 |x=0 |z=1 
t=165| clk=1 |reset=0 |x=0 |z=1 
t=165| clk=1 |reset=0 |x=0 |z=0 
t=170| clk=0 |reset=0 |x=1 |z=0 
t=175| clk=1 |reset=0 |x=1 |z=0 
t=180| clk=0 |reset=0 |x=0 |z=0 
t=185| clk=1 |reset=0 |x=0 |z=0 
t=190| clk=0 |reset=0 |x=0 |z=0 
t=195| clk=1 |reset=0 |x=0 |z=0 
t=200| clk=0 |reset=0 |x=1 |z=0 
t=205| clk=1 |reset=0 |x=1 |z=0 
t=210| clk=0 |reset=0 |x=0 |z=0 
t=215| clk=1 |reset=0 |x=0 |z=0 
t=220| clk=0 |reset=0 |x=1 |z=0 
t=225| clk=1 |reset=0 |x=1 |z=0 
t=225| clk=1 |reset=0 |x=1 |z=1 
t=230| clk=0 |reset=0 |x=0 |z=1 
t=235| clk=1 |reset=0 |x=0 |z=1 
t=235| clk=1 |reset=0 |x=0 |z=0 
t=240| clk=0 |reset=0 |x=1 |z=0 
t=245| clk=1 |reset=0 |x=1 |z=0 
t=245| clk=1 |reset=0 |x=1 |z=1 
t=250| clk=0 |reset=0 |x=1 |z=1 
t=255| clk=1 |reset=0 |x=1 |z=1 
t=260| clk=0 |reset=0 |x=0 |z=1 
t=265| clk=1 |reset=0 |x=0 |z=1 
t=270| clk=0 |reset=0 |x=1 |z=1 
t=275| clk=1 |reset=0 |x=1 |z=1 
t=280| clk=0 |reset=0 |x=1 |z=1 
t=285| clk=1 |reset=0 |x=1 |z=1 
t=290| clk=0 |reset=0 |x=1 |z=1 
t=295| clk=1 |reset=0 |x=1 |z=1 
t=300| clk=0 |reset=0 |x=0 |z=1 
t=305| clk=1 |reset=0 |x=0 |z=1 
- testbench.sv:27: Verilog $finish
*/
