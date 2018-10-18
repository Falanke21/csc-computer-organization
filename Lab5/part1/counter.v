module counter (KEY, SW, HEX0, HEX1);
  input [1:0] SW;
  input [3:0] KEY;
  output [6:0] HEX0;
  output [6:0] HEX1;

  wire [7:0] temp;

  counter_logic c0(.enable(SW[1]), .clock(KEY[0]), .clear_b(SW[0]), .out(temp));

  hex_display h1(.in(temp[7:4]), .HEX(HEX1));
  hex_display h0(.in(temp[3:0]), .HEX(HEX0));
endmodule // counter

module counter_logic (enable, clock, clear_b, out);
  input enable, clock, clear_b;
  output [7:0] out;
  wire zero;
  wire one;
  wire two;
  wire three;
  wire four;
  wire five;
  wire six;

  assign zero = (enable & out[0]);
  assign one = (zero & out[1]);
  assign two = (one & out[2]);
  assign three = (two & out[3]);
  assign four = (three & out[4]);
  assign five = (four & out[5]);
  assign six = (five & out[6]);

  my_tff m0(.clk(clock), .clear(clear_b), .t(enable), .q(out[0]));
  my_tff m1(.clk(clock), .clear(clear_b), .t(zero), .q(out[1]));
  my_tff m2(.clk(clock), .clear(clear_b), .t(one), .q(out[2]));
  my_tff m3(.clk(clock), .clear(clear_b), .t(two), .q(out[3]));
  my_tff m4(.clk(clock), .clear(clear_b), .t(three), .q(out[4]));
  my_tff m5(.clk(clock), .clear(clear_b), .t(four), .q(out[5]));
  my_tff m6(.clk(clock), .clear(clear_b), .t(five), .q(out[6]));
  my_tff m7(.clk(clock), .clear(clear_b), .t(six), .q(out[7]));

endmodule // counter_logic

//=========================================================

module my_tff (clk, clear, t, q);
  input clk, clear, t;
  output q;
  reg q;

  always @ ( posedge clk, negedge clear )
    begin
      if (clear == 1'b0)
        q <= 1'b0;
      else
        if (t == 1'b1)
          q <= ~q;
  end
endmodule // tff

//========================================================

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
