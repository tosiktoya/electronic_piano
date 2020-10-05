----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:24 12/07/2017 
-- Design Name: 
-- Module Name:    CLCD - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLCD is
    Port ( RESETN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_RW : out  STD_LOGIC;
           LCD_DATA : out  STD_LOGIC);
end CLCD;

architecture Behavioral of CLCD is

begin


--동작 상태 확인
PROCESS(RESETN, CLK)
BEGIN 
	IF RESETN = '1' THEN
		LCD_STATE <= DELAY;
	ELSIF CLK'EVENT AND CLK = '1' THEN
		CASE LCD_STATE IS
			WHEN DELAY =>
				IF CNT = 70 THEN
					LCD_STATE <= FUNCTION_SET;
				END IF;
			WHEN FUNCTION_SET =>
				IF CNT = 30 THEN
					LCD_STATE <= DISP_ONOFF;	
				END IF;
			WHEN DISP_ONOFF =>
				IF CNT = 30 THEN
					LCD_STATE <= ENTRY_MODE;
				END IF;
			WHEN ENTRY_MODE =>
				IF CNT = 30 THEN
					LCD_STATE <= LINE1;
				END IF;
			WHEN LINE1 =>
				IF CNT = 20 THEN
					LCD_STATE <= LINE2;
				END IF;
			WHEN LINE2 =>
				IF CNT = 20 THEN
					LCD_STATE <= DELAY_T;
				END IF;
			WHEN DELAY_T =>
				IF CNT = 400 THEN
					LCD_STATE <= CLEAR_DISP;
				END IF;
			WHEN CLEAR_DISP =>
				IF CNT = 200 THEN
					LCD_STATE <= LINE1;
				END IF;
			END CASE;
		END IF;
	END PROCESS;
	
PROCESS(RESETN, CLK)
BEGIN
	IF RESETN = '1' THEN
		CNT <= 0;
	ELSIF CLK'EVENT AND CLK = '1' THEN
		CASE LCD_STATE IS
			WHEN DELAY =>
				IF CNT = 70 THEN CNT <= 0;
				ELSE   CNT <= CNT + 1;
				END IF;
			WHEN FUNCTION_SET =>
				IF CNT = 30 THEN  CNT <= 0;
				ELSE  CNT <= CNT + 1;
				END IF;
			WHEN ENTRY_MODE =>
				IF CNT = 30 THEN CNT <= 0;
				ELSE  CNT  <= CNT + 1;
				END IF;
			WHEN LINE1 =>
				IF CNT = 20 THEN CNT <= 0;
				ELSE CNT <= CNT + 1;
				END IF;
			WHEN LINE2 =>
				IF CNT = 20 THEN CNT <= 0;
				ELSE  CNT <= CNT + 1;
				END IF;
			WHEN DELAY_T =>
				IF CNT = 400 THEN  CNT <= 0;
				ELSE   CNT <= CNT + 1;
				END IF;
			WHEN CLEAR_DISP =>
				IF CNT = 200 THEN  CNT <= 0;
				ELSE  CNT <= CNT + 1;
				END IF;
			WHEN CLEAR_DISP =>
				IF CNT = 200 THEN  CNT <= 0;
				ELSE  CNT <= CNT + 1;
				END IF;
			END CASE;
		END IF;
	END PROCESS;
	

PROCESS(RESETN, CLK)
BEGIN
	IF RESETN = '1' THEN
		LCD_RS <= '1';
		LCD_RW <= '1';
		LCD_DATA <= "00000000";
	ELSIF CLK'EVENT AND CLK = '1' THEN
		CASE LCD_STATE IS
			WHEN DELAY =>
			WHEN FUNCTION_SET =>
				LCD_RS <= '0'; LCD_RW <= '0';
				LCD_DATA <= "00001100";
			WHEN ENTRY_MODE =>
				LCD_RS <= '0'; LCD_RW <= '0';
				LCD_DATA <= "00000110";
			WHEN CLEAR_DISP =>
				LCD_RS <= '0'; LCD_RW <= '0';
				LCD_DATA <= "00000001";
			WHEN DELAY_T =>
				LCD_RS <= '0'; LCD_RW <= '0';
				LCD_DATA <= "00000010";
			WHEN LINE1 =>
				LCD_RW <= '0';
				CASE CNT IS
					WHEN 0 =>
						LCD_RS <= '0'; LCD_DATA <= "10000000";
					WHEN 1 =>
						LCD_RS <= '1'; LCD_DATA <= "01010100";
					WHEN 2 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 3 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 4 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 5 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 6 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 7 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 8 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 9 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 10 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 11 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 12 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 13 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 14 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 15 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 16 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN OTHERS =>
				END CASE;
			WHEN LINE2 =>
			LCD_RW <= '0';
			CASE CNT IS
					WHEN 0 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 1 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 2 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 3 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 4 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 5 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 6 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 7 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 8 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 9 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 10 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 11 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 12 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 13 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 14 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 15 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 16 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN OTHERS =>
				END CASE;
				END CASE;
		END IF;
	END PROCESS;
	
	LCD_E <= CLK;
	
end Behavioral;

