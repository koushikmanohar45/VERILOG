module factorial (input [3:0] data,output reg [40:0]out);
  integer i;
  always@(*) begin
    out=fact(data);
  end
  function automatic [40:0] fact;
    input [3:0]a;
    begin
      if(a==1 || a==0)
        fact=1;
      else 
        fact=a*fact(a-1);
    end
      endfunction
endmodule
