module mux4to1_using_gates (input i0,i1,i2,i3,input s0,s1,output y);
   wire ns0, ns1;
    wire y0, y1, y2, y3;
    not (ns0, s0);
    not (ns1, s1);
    and (y0, i0, ns1, ns0);
    and (y1, i1, ns1, s0);
    and (y2, i2, s1, ns0);
    and (y3, i3, s1, s0);
    or (y, y0, y1, y2, y3);
endmodule
