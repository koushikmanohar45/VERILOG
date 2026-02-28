module factorial (input [3:0] data,output reg [40:0]out);
  integer i;
  always@(*) begin
    out=fact(data);
  end
  function automatic [40:0] fact;
    input [3:0]a;
    begin
      fact=1;
      for(i=1;i<=a;i++) begin
         fact=fact*i;
    end
    end
      endfunction
endmodule
