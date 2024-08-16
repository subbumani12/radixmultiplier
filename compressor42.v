module compressor42 (y1, y2, y3, y4, cin, s, c, cout) ;
input y1, y2, y3, y4, cin ;
wire temp ;
output s, c, cout ;
full_adder u1 (y1, y2, y3, temp, cout) ;
full_adder u2 (temp, y4, cin, s, c) ;
endmodule
