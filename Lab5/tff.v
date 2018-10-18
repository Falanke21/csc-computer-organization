module tff (clk, clear, t, q);
  input clk, clear, t;
  output q;
  reg q;

  always @ ( posedge clk, negedge clear )
    begin
      if (clear == 1'b0)
        q <= 0;
      else
        q <= ~q;
  end
endmodule // tff
