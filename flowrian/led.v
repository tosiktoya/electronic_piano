module led(c,d,e,f,a,b,g,up,down,led1,led2,led3,led4,led5,led6,led7);

input c;
input d;
input e;
input f;
input a;
input b;
input g;
input up;
input down;
output led1;
output led2;
output led3;
output led4;
output led5;
output led6;
output led7;

wire  w8;
wire  w10;
wire  w12;
wire  w14;
wire  w15;
wire  w16;
wire  w17;
wire  w20;
wire  w21;
wire  w18;
wire  w23;
wire  w22;
wire  w19;
wire  w24;
wire  w25;
wire  w26;
wire  w27;
wire  w28;
wire  w29;
wire  w32;
wire  w31;
wire  w30;
wire  w33;
wire  w34;
wire  w35;
wire  w36;
wire  w37;
wire  w38;
wire  w39;
wire  w40;
wire  w41;
wire  w42;

assign w18 = c;
assign w19 = d;
assign w26 = e;
assign w29 = f;
assign w40 = a;
assign w21 = b;
assign w32 = g;
assign w41 = up;
assign w42 = down;
assign led1 = w39;
assign led2 = w38;
assign led3 = w37;
assign led4 = w36;
assign led5 = w35;
assign led6 = w34;
assign led7 = w33;

PNU_AND2
     s7 (
      .o1(w10),
      .i2(w21),
      .i1(w42));

PNU_AND2
     s8 (
      .i1(w21),
      .o1(w23),
      .i2(w41));

PNU_AND2
     s10 (
      .i1(w19),
      .o1(w24),
      .i2(w41));

PNU_AND2
     s11 (
      .o1(w25),
      .i2(w26),
      .i1(w42));

PNU_AND2
     s12 (
      .i1(w26),
      .o1(w27),
      .i2(w41));

PNU_AND2
     s14 (
      .i1(w29),
      .o1(w30),
      .i2(w41));

PNU_AND2
     s15 (
      .i2(w32),
      .o1(w31),
      .i1(w42));

PNU_AND2
     s16 (
      .i2(w18),
      .o1(w22),
      .i1(w42));

PNU_AND2
     s6 (
      .o1(w8),
      .i1(w40),
      .i2(w41));

PNU_AND2
     s13 (
      .o1(w28),
      .i2(w29),
      .i1(w42));

PNU_OR3
     s17 (
      .i2(w8),
      .i3(w10),
      .o1(w39),
      .i1(w40));

PNU_OR3
     s18 (
      .i1(w8),
      .i2(w10),
      .o1(w12),
      .i3(w21));

PNU_OR2
     s19 (
      .o1(w14),
      .i1(w23),
      .i2(w22));

PNU_OR2
     s20 (
      .i1(w12),
      .i2(w14),
      .o1(w38));

PNU_OR3
     s21 (
      .i3(w18),
      .i1(w23),
      .i2(w22),
      .o1(w37));

PNU_OR3
     s22 (
      .i1(w19),
      .i2(w24),
      .i3(w25),
      .o1(w36));

PNU_OR3
     s23 (
      .o1(w15),
      .i1(w24),
      .i2(w25),
      .i3(w26));

PNU_OR2
     s24 (
      .o1(w16),
      .i1(w27),
      .i2(w28));

PNU_OR2
     s25 (
      .i1(w15),
      .i2(w16),
      .o1(w35));

PNU_OR3
     s26 (
      .o1(w17),
      .i1(w27),
      .i2(w28),
      .i3(w29));

PNU_OR2
     s27 (
      .o1(w20),
      .i2(w31),
      .i1(w30));

PNU_OR2
     s28 (
      .i1(w17),
      .i2(w20),
      .o1(w34));

PNU_OR3
     s29 (
      .i3(w32),
      .i2(w31),
      .i1(w30),
      .o1(w33));

endmodule

