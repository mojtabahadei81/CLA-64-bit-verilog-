`timescale 1ns/1ns
module FullAdder (input1, input2, result, cin, p, g);
    input input1;
    input input2;
    output reg result;
    input cin;
    output reg p;
    output reg g;
    always @(*) begin
        p <= input1^input2;
	g <= input1 && input2;
	result <= input1^input2^cin;
    end
endmodule