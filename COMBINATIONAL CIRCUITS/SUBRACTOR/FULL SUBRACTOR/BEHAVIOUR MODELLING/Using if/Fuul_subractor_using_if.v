module full_subractor(input a,b,bin,output reg d,br);
always@(*)begin
if({a,b,bin}==3'b000)begin 
d=0;br=0;
end
else if({a,b,bin}==3'b001)begin 
d=1;br=1;
end
else if({a,b,bin}==3'b010)begin
d=1;br=1;
end
else if({a,b,bin}==3'b011)begin
d=0;br=1;
end
else if({a,b,bin}==3'b100)begin 
d=1;br=0;
end
else if({a,b,bin}==3'b101)begin 
d=0;br=0;
end
else if({a,b,bin}==3'b110)begin 
d=0;br=0;
end
else begin 
d=1;br=1;
end
end
endmodule
