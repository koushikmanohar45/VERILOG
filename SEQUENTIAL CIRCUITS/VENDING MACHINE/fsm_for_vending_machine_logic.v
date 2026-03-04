module fsm
(
  input clk,rst,
  input [15:0]sel,
  output reg y 
);
  localparam s0=1'b0,s1=1'b1;
  reg nxt_state,state;  
  always@(posedge clk) begin
    if(rst)
      state<=s0;
    else
      state<=nxt_state;
  end
  always@(*) begin
    if(rst) begin
      y<=1'b0;
    end
      else begin
    case(state) 
      s0: begin
       casex(sel)
          16'b1xxxxxxxxxxxxxxx:nxt_state=s1;
          16'b01xxxxxxxxxxxxxx:nxt_state=s1;
          16'b001xxxxxxxxxxxxx:nxt_state=s1;
          16'b0001xxxxxxxxxxxx:nxt_state=s1;
          16'b00001xxxxxxxxxxx:nxt_state=s1;
          16'b000001xxxxxxxxxx:nxt_state=s1;
          16'b0000001xxxxxxxxx:nxt_state=s1;
          16'b00000001xxxxxxxx:nxt_state=s1;
          16'b000000001xxxxxxx:nxt_state=s1;
          16'b0000000001xxxxxx:nxt_state=s1;
          16'b00000000001xxxxx:nxt_state=s1;
          16'b000000000001xxxx:nxt_state=s1;
          16'b0000000000001xxx:nxt_state=s1;
          16'b00000000000001xx:nxt_state=s1;
          16'b000000000000001x:nxt_state=s1;
          16'b0000000000000001:nxt_state=s1;
          default:nxt_state=s0;
        endcase
        end
     s1: begin
       y=1'b1;
       nxt_state=s0;
     end
    default:begin
      y=1'b0;
      nxt_state=s0;
    end
     endcase
      end
    end
  endmodule
