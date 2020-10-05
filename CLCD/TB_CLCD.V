`timescale 1ns / 1ps

module TestBench;

reg RESETN, CLK;

wire LCD_RW, LCD_RS, LCD_E;
wire [7:0] LCD_DATA;

CLCD U1(
	RESETN, CLK,
	LCD_E, LCD_RS, LCD_RW,
	LCD_DATA
	);
	
initial begin
	RESETN = 1; CLK = 0;
	#5 RESETN = 0;
	end
	
	always begin
		CLK = 0;
		#1;
		CLK = 1;
		#1;
	end
	
	endmodule