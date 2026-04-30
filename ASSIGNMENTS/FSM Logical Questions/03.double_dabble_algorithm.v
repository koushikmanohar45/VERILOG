/*
The purpose of this lab is to build a Binary-to-BCD converter using the double 
dabble algorithm (aka the shift-add-3 algorithm). You will only utilize 
combinational circuit components, verify the functionality of the converter using 
a testbench 
*/
 
                                                  //DESIGN
module fsm3 
  (
    input clk,
    input rst,
    input[8:0]b,
    input transfer_en,
    output reg [11:0]bcd
  );
  
  reg [8:0]bin;
  localparam IDLE=0,SHIFT=1,CHECK_DIGIT=2,ADD=3;
  reg [2:0] state,nxt_state;
  reg [3:0] count;
  
  always@(posedge clk)begin
    if(rst)begin
      state<=IDLE;
      bcd<=0;
    end
    else
      state<=nxt_state;
  end
  
  always@(*)begin
    case(state)
      IDLE:nxt_state=transfer_en?SHIFT:IDLE;
      SHIFT:nxt_state=(count<9)?CHECK_DIGIT:IDLE;
      CHECK_DIGIT:begin
        if(bcd[3:0]>=4||bcd[7:4]>=4||bcd[11:8]>=4 && count<9)
          nxt_state=ADD;
        else
          nxt_state=(count<9)?SHIFT:IDLE;
      end
      
      
      ADD:nxt_state=(count<9)?SHIFT:IDLE;
      default:nxt_state=IDLE;
    endcase
  end
  
  always@(posedge clk)begin
    case(state)
      IDLE:
        begin
          bin<=b;
          count<=0;
        end
      SHIFT:
        begin
          {bcd,bin}<={bcd,bin}<<1;
        end
      ADD:
        begin
          if(bcd[3:0]>=4)
            bcd[3:0]<=bcd[3:0]+4'b0011;
           
          else if(bcd[7:4]>=4)
            bcd[7:4]<=bcd[7:4]+4'b0011;
          
          else if(bcd[11:8]>=4)
            bcd[11:8]<=bcd[11:8]+4'b0011;
        end
      default:bcd<=bcd;
    endcase
  end
  
 always@(posedge clk)begin
    if(rst)
      count<=0;
    else begin
      if((state==IDLE && nxt_state==SHIFT)||(state==CHECK_DIGIT && nxt_state==SHIFT)||(state==ADD && nxt_state==SHIFT))
           count<=count+1;
      else
        count<=count;
    end
    
  end

endmodule


                                             //TESTBENCH
module tb_fsm3;

  reg clk;
  reg rst;
  reg [8:0] b;
  reg transfer_en;
  wire [11:0] bcd;

  fsm3 dut (.clk(clk),.rst(rst),.b(b),.bcd(bcd),.transfer_en(transfer_en));

  always #5 clk = ~clk;

  initial begin
    $dumpfile("fsm2.vcd");
    $dumpvars(0, tb_fsm3);

    clk=0;
    rst=1;
    b=0;
    #10;
    rst=0;transfer_en=1;
    b=9'b000001101;
    #10 transfer_en=0;
    #200;
    $display("Input = 13, BCD Output = %b", bcd);
    rst=1;
    #10;
    rst=0;transfer_en=1;
    b=9'b000011001;   // 25
    #10 transfer_en=0;
    #200;
    $display("Input = 25, BCD Output = %b", bcd);
    rst=1;
    #10;
    rst=0;transfer_en=1;
    b=9'b000101101; 
    #10 transfer_en=0;// 45
    #200;
    $display("Input = 45, BCD Output = %b", bcd);
    #50;
    $finish;
  end
  initial begin
    $monitor("Time=%0t |clk=%b| rst=%b |Transfe_en=%b | bin=%b | BCD=%b",$time, clk,rst,transfer_en,b,bcd);
  end

endmodule

/*
OUTPUT:
Time=0 |clk=0| rst=1 |Transfe_en=0 | bin=000000000 | BCD=000000000000
Time=5 |clk=1| rst=1 |Transfe_en=0 | bin=000000000 | BCD=000000000000
Time=10 |clk=0| rst=0 |Transfe_en=1 | bin=000001101 | BCD=000000000000
Time=15 |clk=1| rst=0 |Transfe_en=1 | bin=000001101 | BCD=000000000000
Time=20 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=25 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=30 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=35 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=40 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=45 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=50 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=55 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=60 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=65 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=70 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=75 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=80 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=85 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=90 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=95 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=100 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=105 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=110 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=115 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=120 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=125 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=125 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000001
Time=130 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000001
Time=135 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000001
Time=140 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000001
Time=145 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000001
Time=145 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000011
Time=150 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000011
Time=155 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000011
Time=160 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000011
Time=165 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000011
Time=165 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000110
Time=170 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000110
Time=175 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000110
Time=180 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000110
Time=185 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000000110
Time=185 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000001001
Time=190 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000001001
Time=195 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000001001
Time=195 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000010011
Time=200 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000010011
Time=205 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000010011
Time=210 |clk=0| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000010011
Time=215 |clk=1| rst=0 |Transfe_en=0 | bin=000001101 | BCD=000000010011
Input = 13, BCD Output = 000000010011
Time=220 |clk=0| rst=1 |Transfe_en=0 | bin=000001101 | BCD=000000010011
Time=225 |clk=1| rst=1 |Transfe_en=0 | bin=000001101 | BCD=000000010011
Time=225 |clk=1| rst=1 |Transfe_en=0 | bin=000001101 | BCD=000000000000
Time=230 |clk=0| rst=0 |Transfe_en=1 | bin=000011001 | BCD=000000000000
Time=235 |clk=1| rst=0 |Transfe_en=1 | bin=000011001 | BCD=000000000000
Time=240 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=245 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=250 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=255 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=260 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=265 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=270 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=275 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=280 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=285 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=290 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=295 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=300 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=305 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=310 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=315 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=320 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=325 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=325 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000001
Time=330 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000001
Time=335 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000001
Time=340 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000001
Time=345 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000001
Time=345 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000011
Time=350 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000011
Time=355 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000011
Time=360 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000011
Time=365 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000011
Time=365 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000110
Time=370 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000110
Time=375 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000110
Time=380 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000110
Time=385 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000000110
Time=385 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000001001
Time=390 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000001001
Time=395 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000001001
Time=395 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000010010
Time=400 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000010010
Time=405 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000010010
Time=410 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000010010
Time=415 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000010010
Time=415 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000100101
Time=420 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000100101
Time=425 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000100101
Time=430 |clk=0| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000100101
Time=435 |clk=1| rst=0 |Transfe_en=0 | bin=000011001 | BCD=000000100101
Input = 25, BCD Output = 000000100101
Time=440 |clk=0| rst=1 |Transfe_en=0 | bin=000011001 | BCD=000000100101
Time=445 |clk=1| rst=1 |Transfe_en=0 | bin=000011001 | BCD=000000100101
Time=445 |clk=1| rst=1 |Transfe_en=0 | bin=000011001 | BCD=000000000000
Time=450 |clk=0| rst=0 |Transfe_en=1 | bin=000101101 | BCD=000000000000
Time=455 |clk=1| rst=0 |Transfe_en=1 | bin=000101101 | BCD=000000000000
Time=460 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=465 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=470 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=475 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=480 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=485 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=490 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=495 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=500 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=505 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=510 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=515 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=520 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=525 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000000
Time=525 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000001
Time=530 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000001
Time=535 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000001
Time=540 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000001
Time=545 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000001
Time=545 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000010
Time=550 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000010
Time=555 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000010
Time=560 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000010
Time=565 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000010
Time=565 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000101
Time=570 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000101
Time=575 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000101
Time=580 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000101
Time=585 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000000101
Time=585 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000001000
Time=590 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000001000
Time=595 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000001000
Time=595 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000010001
Time=600 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000010001
Time=605 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000010001
Time=610 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000010001
Time=615 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000010001
Time=615 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000100010
Time=620 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000100010
Time=625 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000100010
Time=630 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000100010
Time=635 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000000100010
Time=635 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=640 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=645 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=650 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=655 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Input = 45, BCD Output = 000001000101
Time=660 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=665 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=670 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=675 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=680 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=685 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=690 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=695 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=700 |clk=0| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
Time=705 |clk=1| rst=0 |Transfe_en=0 | bin=000101101 | BCD=000001000101
- testbench.sv:41: Verilog $finish
*/
