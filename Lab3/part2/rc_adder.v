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
