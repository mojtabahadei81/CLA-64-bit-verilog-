`timescale 1ns/1ps

module CLA_16_bit(input1, input2, cin, result, cout, pout, gout);
	parameter N = 16;
	input [N-1:0] input1;
	input [N-1:0] input2;
	output [N-1:0] result;
	input cin;
	output cout;
	output pout;
	output gout;
	wire [3:0] p;
    	wire [3:0] g;
    	wire [3:1] c;
	CarryLookahead carrylookahead2 (
		.cin(cin),
		.p(p),
		.g(g),
		.c(c),
		.c4(cout),
		.pout(pout),
		.gout(gout)
	);
	CLA_4_bit f0(
		.input1(input1[(N/4)-1:0]),
		.input2(input2[(N/4)-1:0]),
		.result(result[(N/4)-1:0]),
		.cin(cin),
		.cout(),
		.pout(p[0]),
		.gout(g[0])
	);
	genvar i;
	generate
	  for(i=1; i<4; i=i+1) begin
		CLA_4_bit f1(
			.input1(input1[(N/4)*(i+1)-1:(N/4)*i]),
			.input2(input2[(N/4)*(i+1)-1:(N/4)*i]),
			.result(result[(N/4)*(i+1)-1:(N/4)*i]),
			.cin(c[i]),
			.cout(),
			.pout(p[i]),
			.gout(g[i])
		);
	  end
	endgenerate
endmodule

