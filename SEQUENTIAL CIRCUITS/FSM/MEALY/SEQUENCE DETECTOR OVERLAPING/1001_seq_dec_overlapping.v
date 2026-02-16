module fsm_1001_overlap_sequencedetect_melay(input clk,rst,x,output reg y);
  localparam [1:0] s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  reg[1:0] state,nxt_state;
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
               nxt_state=s1;
             else
               nxt_state=s0;
           end
      default:nxt_state=s0;
    endcase
  end
  always@(posedge clk or posedge rst) begin
    if(rst)
      y<=1'b0;
    else begin
      case(state)
        s3: begin
               if(x)
                 y<=1;
               else
                 y<=0;
             end
        default:y<=0;
    endcase
    end
    end
endmodule
