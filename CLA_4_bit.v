`timescale 1ns/1ps
module CLA_4_bit(input1, input2, cin, result, cout, pout, gout);
    parameter N = 4;
    input [N-1:0] input1;
    input [N-1:0] input2;
    input cin;
    output [N-1:0] result;
    output cout;
    output pout;
    output gout;
    wire [N-1:0] p;
    wire [N-1:0] g;
    wire [N-1:1] c;
    CarryLookahead carrylookahead (
		.cin(cin),
		.p(p),
		.g(g),
		.c(c),
		.c4(cout),
		.pout(pout),
		.gout(gout)
	);
	FullAdder uut0 (
		.input1(input1[0]),
		.input2(input2[0]),
		.result(result[0]),
		.cin(cin),
		.p(p[0]),
		.g(g[0])
	);
	genvar i;
	for(i = 1; i < N; i = i + 1) begin
		FullAdder uut1 (
			.input1(input1[i]), 
			.input2(input2[i]), 
			.result(result[i]), 
			.cin(c[i]), 
			.p(p[i]), 
			.g(g[i])
		);
	end
endmodule