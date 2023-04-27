`timescale 1ns/1ps
module tb_64bitCLA;
	//module CLA_64_bit(input1, input2, cin, result, cout, pout, gout);
	reg [63:0] input1;
	reg [63:0] input2;
	reg c0;
	wire [63:0] result;
	wire cout;
	CLA_64_bit uut(
		.input1(input1),
		.input2(input2),
		.cin(c0),
		.result(result),
		.cout(cout),
		.pout(),
		.gout()
	);
	initial begin
		input1 = 64'h1234567890000000;
		input2 = 64'h00aabbccddeeff11;
		c0 = 1'b0;
		#20;
		input1 = 64'h5233458;
		input2 = 64'h4578213;
		c0 = 1'b0;
		#20;
		input1 = 64'd0025366408;
		input2 = 64'd40010303;
		c0 = 1'b0;
		#20;
	end
	

endmodule
