module parity_generator(input[2:0]x,output even_p,odd_p);
 assign even_p=^x;
 assign odd_p=~^x;
endmodule
