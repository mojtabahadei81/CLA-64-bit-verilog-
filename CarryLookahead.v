`timescale 1ns/1ps
module CarryLookahead (p, g, cin, c, c4, pout, gout);
   input [3:0] p;
   input [3:0] g;
   input cin;
   output reg [3:1] c;
   output reg c4;
   output reg pout;
   output reg gout;
   always @(*) begin
	   c[1] <= g[0] | (p[0]&cin);
	   c[2] <= g[1] | (p[1]&g[0]) | (p[1]&p[0]&&cin);
	   c[3] <= g[2] | (p[2]&g[1]) | (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&cin);
	   c4 <= g[3] | (p[3]&g[2]) || (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]) | (p[3]&p[2]&p[1]&p[0]&cin);
	   pout <= p[0]&p[1]&p[2]&p[3];
	   gout <= g[3] | (g[2]&p[3]) || (g[1]&p[3]&p[2]) | (g[0]&p[3]&p[2]&p[1]);
   end
endmodule