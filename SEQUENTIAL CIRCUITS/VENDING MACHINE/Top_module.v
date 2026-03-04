module vending_machine#(parameter a=5)
(
  input clk,rst,
  input A_1,A_2,A_3,A_4,
  input B_1,B_2,B_3,B_4,
  input C_1,C_2,C_3,C_4,
  input D_1,D_2,D_3,D_4,
  input[a-1:0] amt,
  output [a-1:0] bal,
  output y,valid 
);
  wire [a-1:0]A1;
  amt_assignment#(.A(a)) a1(.sel({A_1,A_2,A_3,A_4,B_1,B_2,B_3,B_4,C_1,C_2,C_3,C_4,D_1,D_2,D_3,D_4}),.y(A1));
            
  amt_calculation #(.A(a)) a2(.a(amt),.b(A1),.bal(bal),.valid(valid));
  fsm a3 (.clk(clk),.rst(rst),.sel({A_1,A_2,A_3,A_4,B_1,B_2,B_3,B_4,C_1,C_2,C_3,C_4,D_1,D_2,D_3,D_4}),.y(y));
  
endmodule 
