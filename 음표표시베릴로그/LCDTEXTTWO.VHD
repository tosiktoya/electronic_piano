
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LCDTEXTTWO is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  KEY : in  STD_LOGIC_VECTOR(6 DOWNTO 0) --AD
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_RW : out  STD_LOGIC;
           LCD_DATA : out  STD_LOGIC_VECTOR(7 DOWNTO 0)
			  );
end LCDTEXTTWO;

architecture Behavioral of LCDTEXTTWO is

	TYPE STATE IS (DELAY, FUNCTION_SET, ENTRY_MODE, DISP_ONOFF, LINE1, LINE2, DELAY_T, CLEAR_DISP);
	SIGNAL LCD_STATE : STATE;
	SIGNAL CNT : INTEGER RANGE 0 TO 512;
	
	SIGNAL CNT_A : INTEGER RANGE 0 TO 512;
	SIGNAL CNT_B : INTEGER RANGE 0 TO 512;
	SIGNAL CNT_C : INTEGER RANGE 0 TO 512;
	SIGNAL CNT_D : INTEGER RANGE 0 TO 512;
	SIGNAL CNT_E : INTEGER RANGE 0 TO 512;
	SIGNAL CNT_F : INTEGER RANGE 0 TO 512;
	SIGNAL CNT_G : INTEGER RANGE 0 TO 512;

begin

PROCESS(RST, CLK)
BEGIN 
	IF RST = '1' THEN
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
			WHEN OTHERS => 			
			END CASE;
		END IF;
	END PROCESS;
	
PROCESS(RST, CLK)

BEGIN
	IF RST = '1' THEN
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
			WHEN DISP_ONOFF =>
				IF CNT = 30 THEN CNT <= 0;
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
			WHEN OTHERS =>
			
			END CASE;
		END IF;
	END PROCESS;
	
PROCESS(RST, CLK)

BEGIN
	IF RST = '1' THEN
		LCD_RS <= '1';
		LCD_RW <= '1';
		LCD_DATA <= "00000000";		
	ELSIF CLK'EVENT AND CLK = '1' THEN	
		CASE LCD_STATE IS	
			WHEN DELAY =>
			WHEN FUNCTION_SET =>
				LCD_RS <= '0'; LCD_RW <= '0';
				LCD_DATA <= "00111100";
			WHEN DISP_ONOFF =>
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
						LCD_RS <= '1'; LCD_DATA <= "01001000"; --H
					WHEN 2 =>
						LCD_RS <= '1'; LCD_DATA <= "01000101"; --E
					WHEN 3 =>
						LCD_RS <= '1'; LCD_DATA <= "01001100"; --L
					WHEN 4 =>
						LCD_RS <= '1'; LCD_DATA <= "01001100"; --L
					WHEN 5 =>
						LCD_RS <= '1'; LCD_DATA <= "01001111"; --O
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
						LCD_RS <= '0'; LCD_DATA <= "11000000";
					WHEN 1 =>
						LCD_RS <= '1'; LCD_DATA <= "01010100"; --T
					WHEN 2 =>
						LCD_RS <= '1'; LCD_DATA <= "01001000"; --H
					WHEN 3 =>
						LCD_RS <= '1'; LCD_DATA <= "01001001"; --I
					WHEN 4 =>
						LCD_RS <= '1'; LCD_DATA <= "01010011"; --S
					WHEN 5 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 6 =>
						LCD_RS <= '1'; LCD_DATA <= "01001001"; --I
					WHEN 7 =>
						LCD_RS <= '1'; LCD_DATA <= "01010011"; --S
					WHEN 8 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 9 =>
						LCD_RS <= '1'; LCD_DATA <= "01000001"; --A
					WHEN 10 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN 11 =>
						LCD_RS <= '1'; LCD_DATA <= "01010000"; --P
					WHEN 12 =>
						LCD_RS <= '1'; LCD_DATA <= "01001001"; --I
					WHEN 13 =>
						LCD_RS <= '1'; LCD_DATA <= "01000001"; --A
					WHEN 14 =>
						LCD_RS <= '1'; LCD_DATA <= "01001110"; --N
					WHEN 15 =>
						LCD_RS <= '1'; LCD_DATA <= "01001111"; --O
					WHEN 16 =>
						LCD_RS <= '1'; LCD_DATA <= "00100000";
					WHEN OTHERS =>			
				END CASE;
				WHEN OTHERS =>				
				END CASE;
		END IF;
	END PROCESS;
	 
PROCESS(KEY)                                               --  KEY PROCESS START
BEGIN
	CASE KEY IS
		WHEN "10000000" =>											  --  도일때
			PROCESS(RST, CLK)
				BEGIN
					IF RST = '1' THEN
						LCD_RS <= '1';
						LCD_RW <= '1';
						LCD_DATA <= "00000000";						
					ELSIF CLK'EVENT AND CLK = '1' THEN					
						CASE LCD_STATE IS						
							WHEN DELAY =>
							WHEN FUNCTION_SET =>
								LCD_RS <= '0'; LCD_RW <= '0';
								LCD_DATA <= "00111100";
							WHEN DISP_ONOFF =>
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
										LCD_RS <= '1'; LCD_DATA <= "10010110";
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
										LCD_RS <= '0'; LCD_DATA <= "11000000";
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
								WHEN OTHERS =>								
								END CASE;
						END IF;
					END PROCESS;
		WHEN "01000000" =>											  --  레일때
			PROCESS(RST, CLK)
				BEGIN
					IF RST = '1' THEN
						LCD_RS <= '1';
						LCD_RW <= '1';
						LCD_DATA <= "00000000";						
					ELSIF CLK'EVENT AND CLK = '1' THEN					
						CASE LCD_STATE IS						
							WHEN DELAY =>
							WHEN FUNCTION_SET =>
								LCD_RS <= '0'; LCD_RW <= '0';
								LCD_DATA <= "00111100";
							WHEN DISP_ONOFF =>
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
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 2 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
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
										LCD_RS <= '0'; LCD_DATA <= "11000000";
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
								WHEN OTHERS =>								
								END CASE;
						END IF;
					END PROCESS;		
		WHEN "00100000" =>											  --  미일때
			PROCESS(RST, CLK)
				BEGIN
					IF RST = '1' THEN
						LCD_RS <= '1';
						LCD_RW <= '1';
						LCD_DATA <= "00000000";						
					ELSIF CLK'EVENT AND CLK = '1' THEN					
						CASE LCD_STATE IS						
							WHEN DELAY =>
							WHEN FUNCTION_SET =>
								LCD_RS <= '0'; LCD_RW <= '0';
								LCD_DATA <= "00111100";
							WHEN DISP_ONOFF =>
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
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 2 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 3 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
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
										LCD_RS <= '0'; LCD_DATA <= "11000000";
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
								WHEN OTHERS =>								
								END CASE;
						END IF;
					END PROCESS;				
		WHEN "00010000" =>											  --  파일때
			PROCESS(RST, CLK)
				BEGIN
					IF RST = '1' THEN
						LCD_RS <= '1';
						LCD_RW <= '1';
						LCD_DATA <= "00000000";						
					ELSIF CLK'EVENT AND CLK = '1' THEN					
						CASE LCD_STATE IS						
							WHEN DELAY =>
							WHEN FUNCTION_SET =>
								LCD_RS <= '0'; LCD_RW <= '0';
								LCD_DATA <= "00111100";
							WHEN DISP_ONOFF =>
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
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 2 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 3 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 4 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
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
										LCD_RS <= '0'; LCD_DATA <= "11000000";
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
								WHEN OTHERS =>								
								END CASE;
						END IF;
					END PROCESS;				
		WHEN "00001000" =>											  --  솔일때
			PROCESS(RST, CLK)
				BEGIN
					IF RST = '1' THEN
						LCD_RS <= '1';
						LCD_RW <= '1';
						LCD_DATA <= "00000000";						
					ELSIF CLK'EVENT AND CLK = '1' THEN					
						CASE LCD_STATE IS						
							WHEN DELAY =>
							WHEN FUNCTION_SET =>
								LCD_RS <= '0'; LCD_RW <= '0';
								LCD_DATA <= "00111100";
							WHEN DISP_ONOFF =>
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
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 2 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 3 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 4 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 5 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
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
										LCD_RS <= '0'; LCD_DATA <= "11000000";
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
								WHEN OTHERS =>								
								END CASE;
						END IF;
					END PROCESS;				
		WHEN "00000100" =>											  --  라일때
			PROCESS(RST, CLK)
				BEGIN
					IF RST = '1' THEN
						LCD_RS <= '1';
						LCD_RW <= '1';
						LCD_DATA <= "00000000";						
					ELSIF CLK'EVENT AND CLK = '1' THEN					
						CASE LCD_STATE IS						
							WHEN DELAY =>
							WHEN FUNCTION_SET =>
								LCD_RS <= '0'; LCD_RW <= '0';
								LCD_DATA <= "00111100";
							WHEN DISP_ONOFF =>
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
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 2 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 3 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 4 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 5 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 6 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
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
										LCD_RS <= '0'; LCD_DATA <= "11000000";
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
								WHEN OTHERS =>								
								END CASE;
						END IF;
					END PROCESS;				
		WHEN "00000010" =>											  --  시일때
			PROCESS(RST, CLK)
				BEGIN
					IF RST = '1' THEN
						LCD_RS <= '1';
						LCD_RW <= '1';
						LCD_DATA <= "00000000";						
					ELSIF CLK'EVENT AND CLK = '1' THEN					
						CASE LCD_STATE IS						
							WHEN DELAY =>
							WHEN FUNCTION_SET =>
								LCD_RS <= '0'; LCD_RW <= '0';
								LCD_DATA <= "00111100";
							WHEN DISP_ONOFF =>
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
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 2 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 3 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 4 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 5 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 6 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
									WHEN 7 =>
										LCD_RS <= '1'; LCD_DATA <= "10010110";
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
										LCD_RS <= '0'; LCD_DATA <= "11000000";
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
								WHEN OTHERS =>								
								END CASE;
						END IF;
					END PROCESS;			
		WHEN OTHERS =>
	END CASE
END PROCESS	
	LCD_E <= CLK;	
end Behavioral ;

