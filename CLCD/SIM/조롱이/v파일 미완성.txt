`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:10 12/07/2017 
// Design Name: 
// Module Name:    CLCD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CLCD(
    input RESETN,
    input CLK,
    input LCD_E,
    input LCD_RS,
    input LCD_RW,
    input [7:0] LCD_DATA
    );
	 
	 
	 
always @(posedge RESETN or posedge CLK)
begin
	if(RESETN) STATE = DELAY;
	else
		begin
			case(STATE)
				DELAY :  			if (CNT == 70) STATE = FUNCTION_SET;
				FUNCTION_SET : 	if (CNT == 30) STATE = DISP_ONOFF;
				DISP_ONOFF :		if (CNT == 30) STATE = ENTRY_MODE;
				ENTRY_MODE :		if (CNT == 30) STATE = LINE1;
				LINE1 :				if (CNT == 20) STATE = LINE2;
				LINE2 :				if (CNT == 20) STATE = DELAY_T;
				DELAY_T :			if (CNT == 400) STATE = CLEAR_DISP;
				CLEAR_DISP :		if (CNT == 200) STATE = LINE1;
				default :			STATE = DELAY;
			end case
		end
	end
		
always @(posedge RESETN or posedge CLK)
begin
	if(RESETN) CNT = 0;
	else
		begin
			case(STATE)
				DELAY :  			if (CNT >= 30) CNT = 0;
										else CNT = CNT + 1;
				FUNCTION_SET : 	if (CNT >= 30) CNT = 0;
										else CNT = CNT + 1;
				DISP_ONOFF :		if (CNT >= 30) CNT = 0;
										else CNT = CNT + 1;
				ENTRY_MODE :		if (CNT >= 30) CNT = 0;
										else CNT = CNT + 1;
				LINE1 :				if (CNT >= 20) CNT = 0;
										else CNT = CNT + 1;
				LINE2 :				if (CNT >= 20) CNT = 0;
										else CNT = CNT + 1;
				DELAY_T :			if (CNT >= 400) CNT = 0;
										else CNT = CNT + 1;
				CLEAR_DISP :		if (CNT >= 200) CNT = 0;
										else CNT = CNT + 1;
				default :			CNT = 0;
			end case
		end
	end

always @(posedge RESETN or posedge CLK)
begin
	if(RESETN) begin
		LCD_RS = 1'b1l;
		LCD_RW = 1'b1l;
		LCD_DATA = 8'B00000000;
	end
else begin
	case (STATE)
		FUNCTION-SET : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8`b00111100;
		end
		
		DISP_ONOFF : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8`b00111100;
		end
		
		ENTRY_MODE : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8`b00111100;
		end
		
		LINE1 : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8`b00111100;
		end
		
		LINE2 : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8`b00111100;
		end
		
		DELAY_T : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8`b00111100;
		end
		
		CLEAR_DISP : begin
		
		default : begin
		
	
	
	
	
	
	
	
endmodule
