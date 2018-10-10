module alu (SW, KEY, LEDR, HEX0, HEX4, HEX5);
  input [9:0] SW;
  input [2:0] KEY;
  output [7:0] LEDR;
  output [6:0] HEX0;
  output [6:0] HEX4;
  output [6:0] HEX5;

  reg [7:0] ALUout;

  registor r0(.d(ALUout[7:0]), .clk(KEY[0]), .reset_n(SW[9]), .q(wout[7:0]));

  wire [4:0] wire0;
  wire [4:0] wire1;
  wire [7:0] wout;

  rc_adder u0(.SW({1'b0, SW[3:0], 4'b0001}), .LEDR(wire0[4:0]));
  rc_adder u1(.SW({1'b0, SW[3:0], wout[3:0]}), .LEDR(wire1[4:0]));

  always @ (*) begin
    case (SW[7:5])
      3'b000: ALUout = {3'b000, wire0};
      3'b001: ALUout = {3'b000, wire1};
      3'b010: ALUout = SW[3:0] + wout[3:0];
      3'b011: ALUout = {SW[3:0] | wout[3:0], SW[3:0] ^ wout[3:0]};
      3'b100: ALUout = {7'b0000000, SW[3] | SW[2] | SW[1] | SW[0] | wout[3] | wout[2] | wout[1] | wout[0]};
      3'b101: ALUout = wout[3:0] << SW[3:0];
      3'b110: ALUout = wout[3:0] >> SW[3:0];
      3'b111: ALUout = SW[3:0] * wout[3:0];

      default: ALUout = 8'b0000_0000;
    endcase
  end

  assign LEDR = (ALUout);

  decoder d0(.SW(SW[3:0]), .HEX0(HEX0[6:0]));
  decoder d4(.SW(LEDR[3:0]), .HEX0(HEX4[6:0]));
  decoder d5(.SW(LEDR[7:4]), .HEX0(HEX5[6:0]));

endmodule // alu
//==================================================================

module registor (d, clk, reset_n, q);
  input [7:0] d;
  input clk;
  input reset_n;
  output  [7:0] q;
  reg [7:0] q;

  always @ (posedge clk) begin
    if (reset_n == 1'b0)
      q <= 8'b0000_0000;
    else
      q <= d;
  end
endmodule // registor


//==================================================================

module rc_adder (SW, LEDR);
  input [8:0] SW;
  output [4:0] LEDR;

  wire _0to1, _1to2, _2to3;

    full_adder u0(
                .ci(SW[8]),
                .a(SW[4]),
                .b(SW[0]),
                .s(LEDR[0]),
                .co(_0to1)
                );

    full_adder u1(.ci(_0to1),
                .a(SW[5]),
                .b(SW[1]),
                .s(LEDR[1]),
                .co(_1to2));

    full_adder u2(.ci(_1to2),
                .a(SW[6]),
                .b(SW[2]),
                .s(LEDR[2]),
                .co(_2to3));

    full_adder u3(.ci(_2to3),
                .a(SW[7]),
                .b(SW[3]),
                .s(LEDR[3]),
                .co(LEDR[4]));
endmodule // rc_adder


module full_adder (ci, a, b, s, co);
  input ci;
  input a, b;
  output s;
  output co;

  assign s = a ^ b ^ ci;
  assign co = (a & b) | ((a ^ b) & ci);

endmodule // full_adder

//=======================================================

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
