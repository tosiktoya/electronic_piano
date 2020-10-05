module seg(c,d,e,f,a,b,g,up,down,SEGa,SEGb,SEGc,SEGd,SEGe,SEGf,SEGg);

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
wire  w44;
wire  w46;
wire  w47;
wire  w48;
wire  w49;
wire  w50;
wire  w51;
wire  w52;
wire  w53;
wire  w54;
wire  w55;
wire  w56;
wire  w60;
wire  w61;
wire  w62;
wire  w45;
wire  w57;
wire  w58;
wire  w59;

assign w15 = c;
assign w17 = d;
assign w33 = e;
assign w20 = f;
assign w35 = a;
assign w16 = b;
assign w23 = g;
assign w12 = up;
assign w14 = down;
assign SEGa = w45;
assign SEGb = w48;
assign SEGc = w53;
assign SEGd = w45;
assign SEGe = w60;
assign SEGf = w62;
assign SEGg = w45;

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
      .o1(w57));

PNU_OR2
     s24 (
      .i1(w22),
      .i2(w25),
      .o1(w58));

PNU_OR2
     s25 (
      .i1(w29),
      .i2(w32),
      .o1(w59));

PNU_OR3
     s26 (
      .i3(w42),
      .o1(w43),
      .i1(w57),
      .i2(w58));

PNU_NOT
     s27 (
      .o1(w42),
      .i1(w59));

PNU_OR3
     s28 (
      .o1(w44),
      .i1(w57),
      .i2(w58),
      .i3(w59));

PNU_AND2
     s29 (
      .i1(w43),
      .i2(w44),
      .o1(w45));

PNU_AND2
     s30 (
      .i2(w47),
      .o1(w48),
      .i1(w45));

PNU_OR3
     s31 (
      .i2(w46),
      .o1(w47),
      .i1(w57),
      .i3(w59));

PNU_OR3
     s33 (
      .i3(w49),
      .o1(w51),
      .i1(w57),
      .i2(w58));

PNU_NOT
     s32 (
      .o1(w46),
      .i1(w58));

PNU_OR3
     s34 (
      .i2(w50),
      .o1(w52),
      .i1(w57),
      .i3(w59));

PNU_NOT
     s35 (
      .o1(w49),
      .i1(w59));

PNU_NOT
     s36 (
      .o1(w50),
      .i1(w58));

PNU_AND2
     s37 (
      .i1(w51),
      .i2(w52),
      .o1(w53));

PNU_OR3
     s38 (
      .i1(w54),
      .i2(w55),
      .i3(w56),
      .o1(w60));

PNU_NOT
     s39 (
      .o1(w54),
      .i1(w57));

PNU_NOT
     s40 (
      .o1(w55),
      .i1(w58));

PNU_NOT
     s41 (
      .o1(w56),
      .i1(w59));

PNU_OR3
     s42 (
      .o1(w61),
      .i1(w57),
      .i2(w58),
      .i3(w59));

PNU_NOT
     s43 (
      .i1(w61),
      .o1(w62));

endmodule

