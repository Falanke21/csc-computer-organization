module shifter (load_val, load_n, shift_right, in, clk, reset_n, out);
  input load_val, load_n, shift_right, in, clk, reset_n;
  output out;

  wire data_to_dff;

  mux2to1 m0(.x(load_val), .y(in), .s(load_n), .m(data_to_dff));
  flipflop f0(.clk(clk), .reset_n(reset_n), .d(data_to_dff), .q(out));

endmodule // shifter

//==============================================

module flipflop (clk, reset_n, d, q);
  input clk, reset_n, d;
  output q;
  reg q;
  always @(posedge clk)

    begin
      if (reset_n == 1’b0)
        q <= 0;
      else
        q <= d;
  end
endmodule // dff


//==============================================

module mux2to1(x, y, s, m);
    input x; //selected when s is 0
    input y; //selected when s is 1
    input s; //select signal
    output m; //output

    assign m = s & y | ~s & x;
    // OR
    // assign m = s ? y : x;

endmodule
