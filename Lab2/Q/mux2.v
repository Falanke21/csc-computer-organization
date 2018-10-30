module mux2to1(x, y, s, m);
    input x; //selected when s is 0
    input y; //selected when s is 1
    input s; //select signal
    output m; //output
  
    assign m = s & y | ~s & x;
    // OR
    // assign m = s ? y : x;

endmodule

//assign input and output to SW and LEDR
module mux2(LEDR, SW);
	input [9:0] SW;
	output [9:0] LEDR;
	
	mux4to1 u0(.u(SW[0]),
			  .v(SW[1]),
			  .w(SW[2]),
			  .x(SW[3]),
			  .s0(SW[9]),
			  .s1(SW[8]),
			  .m(LEDR[0])
			  );
			  
endmodule


module mux4to1(u, v, w, x, s0, s1, m);
	input u, v, w, x, s0, s1;
	output m;
	
	wire mux1_to_mux3, mux2_to_mux3;
	
	mux2to1 u1(u, w, s0, mux1_to_mux3);
	mux2to1 u2(v, x, s0, mux2_to_mux3);
	mux2to1 u3(mux1_to_mux3, mux2_to_mux3, s1, m);

endmodule


