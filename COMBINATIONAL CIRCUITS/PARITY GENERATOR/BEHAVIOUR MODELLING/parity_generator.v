module parity_generator(input[2:0]x,output reg even_p,odd_p);
 always@(*)begin
   odd_p=x[2]^x[1]^x[0];
   even_p=~odd_p;
  end
endmodule

