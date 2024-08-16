module ppbar (
    input a,
    input b,
    input c,
    input d,
    input [15:0] x,
    output [16:0] y
);

wire xi, xi_1, xi_2, si;
wire [16:0] x1, x2, x3, yf;

assign xi = (~a & ~b & ~c & d) | (~a & ~b & c & ~d) | (a & b & ~c & d) | (a & b & c & ~d);
assign xi_1 = (b & ~c & ~d) | (~b & c & d);
assign xi_2 = (~a & b & c & d) | (a & ~b & ~c & ~d);
assign si = (~a & b & ~c & d) | (~a & b & c & ~d) | (a & ~b & ~c & d) | (a & ~b & c & ~d);

assign x2[15:0] = x << 1;
assign x2[16] = 1'b0;
assign x1[15:0] = x[15:0];
assign x1[16] = 1'b0;
assign x3[16:0] = x1 + x2;

assign yf = xi ? x1 : (xi_1 ? x2 : (xi_2 ? x3 : 17'b0));
assign y = si ? ~yf : yf;

endmodule

