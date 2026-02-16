module fsm_1001_overlap_sequencedetect_moore(input clk,rst,x,output reg y);
  localparam [2:0] s0='b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  reg[2:0] state,nxt_state;
  always@(posedge clk or posedge rst) begin
    if (rst)
      state<=s0;
    else
      state<=nxt_state;
  end
  always @(*)begin
    case(state)
      s0: begin
             if(x)
               nxt_state=s1;
             else
               nxt_state=s0;
           end
      s1: begin
             if(x)
               nxt_state=s1;
             else
               nxt_state=s2;
           end
      s2: begin
             if(x)
               nxt_state=s1;
             else
               nxt_state=s3;
           end
      s3: begin
             if(x)
               nxt_state=s4;
             else
               nxt_state=s0;
           end
      s4: begin
             if(x)
               nxt_state=s1;
             else
               nxt_state=s2;
           end
      default:nxt_state=s0;
    endcase
  end
  always@(posedge clk or posedge rst) begin
    if(rst)
      y<=1'b0;
    else begin
      case(state)
      s4: y<=1'b1;
        default:y<=1'b0;
    endcase
    end
    end
endmodule
