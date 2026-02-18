module mod_7_counter(input clk,rst,output reg [2:0]y);
  localparam [2:0] s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110;
  reg [2:0]state,nxt_state;
  always@(posedge clk or posedge rst) begin
    if (rst)
      state<=s0;
    else
      state<=nxt_state;
   end
  always @(*)begin
    case(state)
      s0: nxt_state=s1;
      s1: nxt_state=s2;
      s2: nxt_state=s3;
      s3: nxt_state=s4;
      s4: nxt_state=s5;
      s5: nxt_state=s6;
      s6: nxt_state=s0;
   default:nxt_state=s0;
   endcase
  end
   always@(posedge clk or posedge rst) begin
        if(rst)
          y<=3'b000;
     else begin
      case(state)
      s0:y<=s0;
      s1:y<=s1;
      s2:y<=s2;
      s3:y<=s3;
      s4:y<=s4;
      s5:y<=s5;
      s6:y<=s6;     
      default:y=3'b000;
    endcase
    end
   end
endmodule
