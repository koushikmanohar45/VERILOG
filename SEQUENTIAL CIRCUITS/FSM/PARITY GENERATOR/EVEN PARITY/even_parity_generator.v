module even_parity_generator_fsm(input clk,rst,input [2:0]x,output reg y);
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
      s0:
        y=0;
      s1:
        y=1;
      default:y=0;
    endcase
    end
endmodule
