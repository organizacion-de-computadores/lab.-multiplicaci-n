LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-------------------------------------------------------
ENTITY Control IS
	PORT (	boton		:	IN			STD_LOGIC;
				reset		:	IN			STD_LOGIC;
				switch	:	IN			STD_LOGIC_VECTOR(7 DOWNTO 0);
				X			:	OUT		STD_LOGIC_VECTOR(7 DOWNTO 0);
				Y			:	OUT		STD_LOGIC_VECTOR(7 DOWNTO 0);
				int_mult	:	out		std_LOGIC);  
END ENTITY Control; 

Architecture FSM OF Control IS 
TYPE states IS  (	State0,State1,State2,State3,State4,State5,state6,state7,state8);
SIGNAL state: states;
BEGIN 
---------------sequential section:------------------------
PROCESS (reset,boton,state)
BEGIN  
     IF (reset= '0') THEN
			state <= state0;
		ELSE	
   CASE state IS
	    WHEN state0=> 
	      IF (boton='0') THEN
			state<= State1;
			ELSE 
			state<=State0; 
	      END IF; 
	    WHEN state1=>
			IF (boton='1') THEN
			state<= State2;
			ELSE 
			state<=State1; 
	      END IF; 
	  WHEN state2=> 
			state<= State3; 
	    WHEN state3=>
			IF (boton='0') THEN
			state<= State4;
			ELSE 
			state<=State3; 
	      END IF; 
	  WHEN state4=> 
	      IF (boton='1') THEN
			state<= State5;
			ELSE 
			state<=State4; 
	      END IF; 
	    WHEN state5=>
			state<= State6;
		when state6=>
			state<=state7;
		when state7=>
			state<=state8;
		when state8=>
			state<=state8;
	    
END CASE ;
END IF;
END PROCESS;

process(state)
	
		begin
		case state is
				when state0 =>
				int_mult<='0';
				X<="00000000";
				Y<="00000000";				
				when state1 =>
				X<="00000000";
				Y<="00000000";				             
				WHEN state2 =>
				X<=switch;
				Y<="00000000";
								
				when state3 =>
				Y<="00000000";				 
				when state4 =>
				Y<="00000000";				 				 
				WHEN state5 =>
				Y<=switch;
				int_mult<='1';
				when state6 =>
				when state7 =>
				when state8 =>
				int_mult<='0';
								
				END CASE;
END PROCESS;
END ARChitecture FSM;