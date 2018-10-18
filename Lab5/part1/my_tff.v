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
