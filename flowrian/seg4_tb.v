module seg4_tb;

reg a;
reg b;
reg c;
reg d;
reg e;
reg f;
reg g;
reg up;
reg down;
wire SEGa;
wire SEGb;
wire SEGc;
wire SEGd;
wire SEGe;
wire SEGf;
wire SEGg;

seg4
 U0 (
  .a(a),
  .b(b),
  .c(c),
  .d(d),
  .e(e),
  .f(f),
  .g(g),
  .up(up),
  .down(down),
  .SEGa(SEGa),
  .SEGb(SEGb),
  .SEGc(SEGc),
  .SEGd(SEGd),
  .SEGe(SEGe),
  .SEGf(SEGf),
  .SEGg(SEGg));

  initial
  begin
    a = 1'b1;
    #500 a = 1'b0;
  end

  initial
  begin
    b = 1'b0;
    #500 b = 1'b1;
    #500 b = 1'b0;
  end

  initial
  begin
    c = 1'b0;
    #1000 c = 1'b1;
    #500 c = 1'b0;
  end

  initial
  begin
    d = 1'b0;
    #1500 d = 1'b1;
    #500 d = 1'b0;
  end

  initial
  begin
    e = 1'b0;
    #2000 e = 1'b1;
    #500 e = 1'b0;
  end

  initial
  begin
    f = 1'b0;
    #2500 f = 1'b1;
    #500 f = 1'b0;
  end

  initial
  begin
    g = 1'b0;
    #3000 g = 1'b1;
    #500 g = 1'b0;
  end

  initial
  begin
    up = 1'b0;
    #300 up = 1'b1;
    #200 up = 1'b0;
    #300 up = 1'b1;
    #200 up = 1'b0;
    #800 up = 1'b1;
    #200 up = 1'b0;
    #300 up = 1'b1;
    #200 up = 1'b0;
    #300 up = 1'b1;
    #200 up = 1'b0;
  end

  initial
  begin
    down = 1'b0;
    #600 down = 1'b1;
    #200 down = 1'b0;
    #300 down = 1'b1;
    #200 down = 1'b0;
    #800 down = 1'b1;
    #200 down = 1'b0;
    #300 down = 1'b1;
    #200 down = 1'b0;
    #300 down = 1'b1;
    #200 down = 1'b0;
  end

endmodule
