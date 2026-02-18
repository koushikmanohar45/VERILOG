module alu(
  input clk, rst,
  input signed [3:0]data1,data2,
  input[3:0]sel_in,
  output reg signed [15:0]out
);
  task automatic arthmetic(
    input signed [3:0]x,
    input signed [3:0]y,
    input[3:0]s,
    output[15:0]out);
    begin
      case({s[2],s[1],s[0]}) 
        3'b000:out=x+y;
        3'b001:out=x-y;
        3'b010:out=x*y;
        3'b011:out=x/y;
        3'b100:out=x%y;
        3'b101:out=x+1;
        3'b110:out=x<<2;
        3'b111:out=x<<1;
        default:out=16'sd0;
      endcase 
    end
  endtask
    task automatic logic_op(
      input signed [3:0]a,
      input signed [3:0]b,
      input[3:0]s,
      output[15:0]out);
    begin
      case({s[2],s[1],s[0]}) 
        3'b000:out=a&b;
        3'b001:out=a|b;
        3'b010:out=a^b;
        3'b011:out=~(a&b);
        3'b100:out=~(a|b);
        3'b101:out=~(a^b);
        3'b110:out=^a;
        3'b111:out=&a;
        default:out=16'sd0;
      endcase 
    end
    endtask
  always @(posedge clk) begin
    if(rst) out<=16'sd0;
    else begin
     if(sel_in[3])
          arthmetic(data1,data2,sel_in,out);
      else
          logic_op(data1,data2,sel_in,out);
      end
  end
 endmodule
