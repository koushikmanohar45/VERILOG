module a_power #(parameter N=4,pow=3)(input [N-1:0] data,output reg [2*N-1:0]out);
  integer i;
  always@(*) begin
    sq(data,out);
  end
  task automatic sq;
    input [N:0] a;
    output[2*N-1:0] out;
    out=1;
    for(i=1;i<=pow;i++) begin
     out=out*a;
    end
  endtask
endmodule
