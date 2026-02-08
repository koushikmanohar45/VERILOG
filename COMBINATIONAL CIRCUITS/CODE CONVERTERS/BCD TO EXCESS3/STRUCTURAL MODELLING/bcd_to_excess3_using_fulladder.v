module full_adder( input a, b, cin,output sum, cout);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
module bcd_to_excess3_using_fulladder (input [3:0] bcd,output [3:0] excess3);
    wire c1, c2, c3;
    full_adder fa0(bcd[0], 1'b1, 1'b0, excess3[0], c1); 
    full_adder fa1(bcd[1], 1'b1, c1, excess3[1], c2);
    full_adder fa2(bcd[2], 1'b0, c2, excess3[2], c3);
    full_adder fa3(bcd[3], 1'b0, c3, excess3[3], ); 
endmodule
