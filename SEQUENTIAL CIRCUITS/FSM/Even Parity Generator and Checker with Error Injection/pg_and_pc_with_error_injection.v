module even_parity_generator_fsm(input clk,rst,input [2:0]x,output reg p,output [3:0]data_with_parity,test_data);
  localparam  s0=1'b0,s1=1'b1;
  reg state,nxt_state;
  always@(posedge clk or posedge rst) begin
    if (rst)
      state<=s0;
    else
      state<=nxt_state;
  end
  always @(*)begin
    nxt_state=x[2]?(x[1]?(x[0]?s1:s0):(x[0]?s0:s1)):(x[1]?(x[0]?s0:s1):(x[0]?s1:s0));    
  end
  always@(*) begin
      case(state)
      s0:p=0;
      s1:p=1;
      default:p=0;
    endcase
    end
  assign data_with_parity={x,p};
  assign test_data={x[2:1],1'b1,p};//ERROR INJECTION
endmodule
module parity_checker(input clk, rst,input[2:0]d,output p_c1,p_c2,	output [3:0]data,error_data);
  wire y;
  even_parity_generator_fsm  p1(clk,rst,d,y,data,error_data);
  xor(p_c1,data[3],data[2],data[1],data[0]);//PARITY CHECK FOR CORRECTED DATA
  xor(p_c2,error_data[3],error_data[2],error_data[1],error_data[0]);//PARITY CHECK FOR ERROR DATA
endmodule
