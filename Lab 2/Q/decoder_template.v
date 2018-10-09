//assign SW and HEX
module decoder()


//module for s0 
module s0(c3, c2, c1, c0, o);
	input c3, c2, c1, c0;
	output o;
	
	assign o = ~c3 & ~c2 & ~c1 & c0 | ~c3 & c2 & ~c1 & ~c0 | c3 &c2 $ ~c1 & c0 | c3 & ~c2 & c1 & c0;
	

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
