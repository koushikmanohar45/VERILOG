//Expect the simulator output
module tb_top;
wire w1;
xmit xmit_i1(w1);
rcv rcv_i1 (w1);
endmodule

module xmit (output reg w);
 initial w=1;
endmodule

module rcv (input wire w);
initial begin
$display ("w value is ");
$display(w);
end
endmodule

OUTPUT:
w value is 
1
