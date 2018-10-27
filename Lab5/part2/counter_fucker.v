// SW[2] enable, SW[1:0] select, SW[9] reset_n
module counter_fucker (SW, CLOCK_50, HEX0);
  input CLOCK_50;
  input [9:0] SW;
  output [6:0] HEX0;
  wire [3:0] wtohex;

  CLOCK_counter c0 (SW[2], SW[1:0], CLOCK_50, SW[9], wtohex);
  hex_display h0 (wtohex, HEX0);
endmodule // counter_fucker

module CLOCK_counter (enable, select, clk, reset_n, out);
  input enable, clk, reset_n;
  input [1:0] select;
  output [3:0] out;

  wire w0;
  wire w1;
  wire w2;

  always @ ( * ) begin
    case (select)
      2'b00: out = enable;
      2'b01: out = (w0 == 0) ? 1 : 0;
      2'b10: out = (w1 == 0) ? 1 : 0;
      2'b11: out = (w2 == 0) ? 1 : 0;
      default: out = enable;
    endcase
  end

  rate_divider r0(enable, {2'b00, 26'd49999999}, clk, reset_n, w0);
  rate_divider r1(enable, {1'b0, 27'd99999999}, clk, reset_n, w1);
  rate_divider r2(enable, 28'd199999999, clk, reset_n, w2);

endmodule // CLOCK_counter

module rate_divider(enable, load, clk, reset_n, q);
	input enable, clk, reset_n;
	input [27:0] load;
	output reg [27:0] q;

	always @(posedge clk)
	begin
		if (reset_n == 1'b0)
			q <= load;
		else if (enable == 1'b1)
			begin
				if (q == 0)
					q <= load;
				else
					q <= q - 1'b1;
			end
	end
endmodule

//=========================================================

//assign in and HEX
module hex_display(in, HEX);
	input [3:0] in;
	output [6:0] HEX;

	s0 u0(.c3(in[3]),
				  .c2(in[2]),
				  .c1(in[1]),
				  .c0(in[0]),
				  .o(HEX[0])
				  );

	s1 u1(.c3(in[3]),
				  .c2(in[2]),
				  .c1(in[1]),
				  .c0(in[0]),
				  .o(HEX[1])
				  );


	s2 u2(.c3(in[3]),
				  .c2(in[2]),
				  .c1(in[1]),
				  .c0(in[0]),
				  .o(HEX[2])
				  );


	s3 u3(.c3(in[3]),
				  .c2(in[2]),
				  .c1(in[1]),
				  .c0(in[0]),
				  .o(HEX[3])
				  );


	s4 u4(.c3(in[3]),
				  .c2(in[2]),
				  .c1(in[1]),
				  .c0(in[0]),
				  .o(HEX[4])
				  );


	s5 u5(.c3(in[3]),
				  .c2(in[2]),
				  .c1(in[1]),
				  .c0(in[0]),
				  .o(HEX[5])
				  );


	s6 u6(.c3(in[3]),
				  .c2(in[2]),
				  .c1(in[1]),
				  .c0(in[0]),
				  .o(HEX[6])
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
