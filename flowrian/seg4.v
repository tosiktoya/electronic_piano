module seg4(c,d,e,f,a,b,g,up,down,SEGa,SEGb,SEGc,SEGd,SEGe,SEGf,SEGg);

input c;
input d;
input e;
input f;
input a;
input b;
input g;
input up;
input down;
output SEGa;
output SEGb;
output SEGc;
output SEGd;
output SEGe;
output SEGf;
output SEGg;

wire  w14;
wire  w12;
wire  w19;
wire  w21;
wire  w22;
wire  w25;
wire  w29;
wire  w32;
wire  w35;
wire  w15;
wire  w16;
wire  w17;
wire  w20;
wire  w23;
wire  w24;
wire  w26;
wire  w28;
wire  w30;
wire  w31;
wire  w33;
wire  w34;
wire  w36;
wire  w27;
wire  w37;
wire  w38;
wire  w42;
wire  w43;
wire  w45;
wire  w44;
wire  w46;
wire  w47;
wire  w48;
wire  w39;
wire  w49;
wire  w40;
wire  w41;
wire  w50;

assign w15 = c;
assign w17 = d;
assign w33 = e;
assign w20 = f;
assign w35 = a;
assign w16 = b;
assign w23 = g;
assign w12 = up;
assign w14 = down;
assign SEGa = w44;
assign SEGb = w45;
assign SEGc = w50;
assign SEGd = w44;
assign SEGe = w49;
assign SEGf = w46;
assign SEGg = w44;

PNU_AND2
     s8 (
      .i2(w12),
      .i1(w16),
      .o1(w26));

PNU_AND2
     s10 (
      .i2(w12),
      .i1(w17),
      .o1(w27));

PNU_AND2
     s11 (
      .i1(w14),
      .i2(w33),
      .o1(w36));

PNU_AND2
     s12 (
      .i2(w12),
      .o1(w30),
      .i1(w33));

PNU_AND2
     s14 (
      .i2(w12),
      .i1(w20),
      .o1(w28));

PNU_AND2
     s15 (
      .i1(w14),
      .i2(w23),
      .o1(w31));

PNU_AND2
     s16 (
      .i1(w14),
      .i2(w15),
      .o1(w37));

PNU_AND2
     s6 (
      .i2(w12),
      .i1(w35),
      .o1(w24));

PNU_AND2
     s13 (
      .i1(w14),
      .i2(w20),
      .o1(w34));

PNU_AND2
     s7 (
      .i1(w14),
      .i2(w16),
      .o1(w38));

PNU_OR4
     s17 (
      .o1(w19),
      .i1(w35),
      .i3(w15),
      .i2(w16),
      .i4(w17));

PNU_OR3
     s18 (
      .o1(w21),
      .i2(w20),
      .i3(w23),
      .i1(w33));

PNU_OR3
     s19 (
      .o1(w22),
      .i1(w24),
      .i2(w26),
      .i3(w27));

PNU_OR2
     s20 (
      .o1(w25),
      .i2(w28),
      .i1(w30));

PNU_OR3
     s21 (
      .o1(w29),
      .i3(w36),
      .i2(w37),
      .i1(w38));

PNU_OR2
     s22 (
      .o1(w32),
      .i2(w31),
      .i1(w34));

PNU_OR2
     s23 (
      .i1(w19),
      .i2(w21),
      .o1(w39));

PNU_OR2
     s24 (
      .i1(w22),
      .i2(w25),
      .o1(w40));

PNU_OR2
     s25 (
      .i1(w29),
      .i2(w32),
      .o1(w41));

PNU_OR2
     s26 (
      .o1(w42),
      .i1(w39),
      .i2(w40));

PNU_NOT
     s27 (
      .o1(w43),
      .i1(w41));

PNU_AND2
     s28 (
      .i1(w42),
      .i2(w43),
      .o1(w44));

PNU_OR3
     s29 (
      .o1(w45),
      .i1(w39),
      .i2(w40),
      .i3(w41));

PNU_NOT
     s30 (
      .o1(w46),
      .i1(w39));

PNU_NOT
     s31 (
      .o1(w47),
      .i1(w40));

PNU_NOT
     s32 (
      .o1(w48),
      .i1(w41));

PNU_AND3
     s33 (
      .i2(w47),
      .i3(w48),
      .i1(w39),
      .o1(w49));

PNU_OR2
     s34 (
      .i1(w40),
      .i2(w41),
      .o1(w50));

endmodule

