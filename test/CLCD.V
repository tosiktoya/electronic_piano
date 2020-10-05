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
			endcase
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
			endcase
		end
	end

always @(posedge RESETN or posedge CLK)
begin
	if(RESETN) begin
		LCD_RS = 1'b1;
		LCD_RW = 1'b1;
		LCD_DATA = 8'B00000000;
	end
else begin
	case (STATE)
		FUNCTION-SET : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8'b00001100;
		end
		
		DISP_ONOFF : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8'b00111100;
		end
		
		ENTRY_MODE : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8'b00111100;
		end
		
		LINE1 : begin
			LCD_RW = 1'b0;

			case (CNT)
			0 : begin
				LCD_RS = 1'b0; LCD_DATA = 8'b10000000;
			end

			1 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001000;
			end

			2 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001100;
			end

			3 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001100;
			end

			4 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001100;
			end

			5 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001111;
			end

			6 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			7 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			8 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			9 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			10 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			11 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			12 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			13 : begin
				LCD_RS = 1'b1; LCD_DATA =8'b00100000;
			end

			14 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			15 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end
			
			16 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			endcase
			
		end

		LINE2 : begin
			LCD_RW = 1'b0;

			case (CNT)
			0 : begin
				LCD_RS = 1'b0; LCD_DATA = 8'b11000000;
			end

			1 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01010100;
			end

			2 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001000;
			end

			3 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001001;
			end

			4 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			5 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			6 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001001;
			end

			7 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01010011;
			end

			8 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			9 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01000001;
			end

			10 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end

			11 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01010000;
			end

			12 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001110;
			end

			13 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01000001;
			end

			14 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001110;
			end

			15 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b01001111;
			end
			
			16 : begin
				LCD_RS = 1'b1; LCD_DATA = 8'b00100000;
			end
		endcase
		end



		DELAY_T : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8'b00000010;
		end
		
		CLEAR_DISP : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8'b00000001;
		end
		
		default : begin
			LCD_RS = 1'b0;		LCD_RW = 1'b0;
			LCD_DATA = 8'b00000000;
		end
		
	endcase
	end


end
