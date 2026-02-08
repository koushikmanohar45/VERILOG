module gray_to_binary_using_gate(input [3:0] gray,output [3:0] binary);
    wire w2, w1;
    assign binary[3] = gray[3];
    xor (binary[3], .gray[2], binary[2]);
    xor (binary[2], gray[1], binary[1]);
    xor (binary[1], gray[0], binary[0]);
endmodule
