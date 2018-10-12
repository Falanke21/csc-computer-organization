module shift_register (SW, KEY, LEDR);
  input [9:0] SW;
  input [3:0] KEY;
  output [7:0] LEDR;

  shift_register_logic sh0(.load_val(SW[7:0]), .load_n(KEY[1]), .shift_right(KEY[2]), .asr(KEY[3]), .clk(KEY[0]), .reset_n(SW[9]), .out(LEDR[7:0]));

endmodule // shift_register


module shift_register_logic (load_val, load_n, shift_right, asr, clk, reset_n, out);

  input [7:0] load_val;
  input load_n, shift_right, asr, clk, reset_n;
  output [7:0] out;


  wire asrout;

  arithmetic_shift_right a0(.asr(asr), .original(out[7]), .out(asrout));

  shifter s7(.load_val(load_val[7]), .load_n(load_n), .shift_right(shift_right), .in(asrout), .clk(clk), .reset_n(reset_n), .out(out[7]));
  shifter s6(.load_val(load_val[6]), .load_n(load_n), .shift_right(shift_right), .in(out[7]), .clk(clk), .reset_n(reset_n), .out(out[6]));
  shifter s5(.load_val(load_val[5]), .load_n(load_n), .shift_right(shift_right), .in(out[6]), .clk(clk), .reset_n(reset_n), .out(out[5]));
  shifter s4(.load_val(load_val[4]), .load_n(load_n), .shift_right(shift_right), .in(out[5]), .clk(clk), .reset_n(reset_n), .out(out[4]));
  shifter s3(.load_val(load_val[3]), .load_n(load_n), .shift_right(shift_right), .in(out[4]), .clk(clk), .reset_n(reset_n), .out(out[3]));
  shifter s2(.load_val(load_val[2]), .load_n(load_n), .shift_right(shift_right), .in(out[3]), .clk(clk), .reset_n(reset_n), .out(out[2]));
  shifter s1(.load_val(load_val[1]), .load_n(load_n), .shift_right(shift_right), .in(out[2]), .clk(clk), .reset_n(reset_n), .out(out[1]));
  shifter s0(.load_val(load_val[0]), .load_n(load_n), .shift_right(shift_right), .in(out[1]), .clk(clk), .reset_n(reset_n), .out(out[0]));


endmodule // shift_register_logic

//=========================================================

module arithmetic_shift_right(asr, original, out);

  input asr, original;
  output out;
  reg out;

  always @ ( * ) begin
    case (asr)
      1'b0: out = 1'b0;
      1'b1: out = original;
      default: out = 1'b0;
    endcase
  end

endmodule

//==============================================================

module shifter (load_val, load_n, shift_right, in, clk, reset_n, out);
  input load_val, load_n, shift_right, in, clk, reset_n;
  output out;

  wire data_to_dff;
  wire m0_to_m1;
  wire out_to_m0;

  mux2to1 m0(.x(out), .y(in), .s(shift_right), .m(m0_to_m1));
  mux2to1 m1(.x(load_val), .y(m0_to_m1), .s(load_n), .m(data_to_dff));
  flipflop f0(.clk(clk), .reset_n(reset_n), .d(data_to_dff), .q(out));

endmodule // shifter

//==============================================

module flipflop (clk, reset_n, d, q);
  input clk, reset_n, d;
  output q;
  reg q;
  always @(posedge clk)

    begin
      if (reset_n == 1'b0)
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
