//assign SW and HEX
module decoder(SW, HEX0);
	input [3:0] SW;
	output [6:0] HEX0;

	s0 u0(.c3(SW[3]),
				  .c2(SW[2]),
				  .c1(SW[1]),
				  .c0(SW[0]),
				  .o(HEX0[0])
				  );

	s1 u1(.c3(SW[3]),
				  .c2(SW[2]),
				  .c1(SW[1]),
				  .c0(SW[0]),
				  .o(HEX0[1])
				  );


	s2 u2(.c3(SW[3]),
				  .c2(SW[2]),
				  .c1(SW[1]),
				  .c0(SW[0]),
				  .o(HEX0[2])
				  );


	s3 u3(.c3(SW[3]),
				  .c2(SW[2]),
				  .c1(SW[1]),
				  .c0(SW[0]),
				  .o(HEX0[3])
				  );


	s4 u4(.c3(SW[3]),
				  .c2(SW[2]),
				  .c1(SW[1]),
				  .c0(SW[0]),
				  .o(HEX0[4])
				  );


	s5 u5(.c3(SW[3]),
				  .c2(SW[2]),
				  .c1(SW[1]),
				  .c0(SW[0]),
				  .o(HEX0[5])
				  );


	s6 u6(.c3(SW[3]),
				  .c2(SW[2]),
				  .c1(SW[1]),
				  .c0(SW[0]),
				  .o(HEX0[6])
				  );

endmodule

//module for s0
module s0(c3, c2, c1, c0, o);
	input c3, c2, c1, c0;
	output o;

	assign o = ~c3 & ~c2 & ~c1 & c0 | ~c3 & c2 & ~c1 & ~c0 | c3 & c2 & ~c1 & c0 | c3 & ~c2 & c1 & c0;
endmodule


//module for s1
module s1(c3, c2, c1, c0, o);
	input c3, c2, c1, c0;
	output o;

	assign o = ~c3 & c2 & ~c1 & c0 | c3 & c2 & ~c0 | c1 & c0 & c3 | c1 & ~c0 & c2;
endmodule


//module for s2
module s2(c3, c2, c1, c0, o);
	input c3, c2, c1, c0;
	output o;

	assign o = ~c3 & ~c2 & c1 & ~c0 | c3 & c2 & ~c0 | c3 & c2 & c1;
endmodule


//module for s3
module s3(c3, c2, c1, c0, o);
	input c3, c2, c1, c0;
	output o;

	assign o = ~c3 & c2 & ~c1 & ~c0 | c3 & ~c2 & c1 & ~c0 | ~c1 & c0 & ~c2 | c1 & c0 & c2;
endmodule


//module for s4
module s4(c3, c2, c1, c0, o);
	input c3, c2, c1, c0;
	output o;

	assign o = ~c3 & c0 | ~c3 & c2 & ~c1 | ~c1 & c0 & ~c2;
endmodule


//module for s5
module s5(c3, c2, c1, c0, o);
	input c3, c2, c1, c0;
	output o;

	assign o = c3 & c2 & ~c1 & c0 | c1 & c0 & ~c3 | ~c3 & ~c2 & c0 | ~c3 & ~c2 & c1;
endmodule


//module for s6
module s6(c3, c2, c1, c0, o);
	input c3, c2, c1, c0;
	output o;

	assign o = ~c3 & c2 & c1 & c0 | c3 & c2 & ~c1 & ~c0 | ~c3 & ~c2 & ~c1;
endmodule
