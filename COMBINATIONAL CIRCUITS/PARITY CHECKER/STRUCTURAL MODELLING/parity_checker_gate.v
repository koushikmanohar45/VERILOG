module parity_checker(
input[7:0]data,
input parity_bit,
input mode,
output error
);
wire x,e,o,mn;
xor(x,data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],parity_bit);
not(e,x);
not(mn,mode);
and(o,e,mode);
and(x,x,mn);
or(error,o,x);
endmodule
