LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY todo_mult_tb IS
END ENTITY todo_mult_tb;
-------------------------------------------------------
ARCHITECTURE testbench OF todo_mult_tb IS
	SIGNAL boton_tb				:	STD_LOGIC;
	SIGNAL reset_tb				:	STD_LOGIC;
	SIGNAL switch_tb				:	STD_LOGIC_VECTOR(7 DOWNTO 0);

	-------------------------------------------------------
BEGIN
	DUT: ENTITY work.todo_mult
	PORT MAP(		boton => boton_tb,
						switch => switch_tb,
						reset => reset_tb);
						
	signal_generation: PROCESS
	BEGIN

		reset_tb	<='0';
		WAIT FOR 40 ns;
		
		reset_tb	<='1';
		WAIT FOR 40 ns;
		
		switch_tb<="00001011";
		WAIT FOR 50 ns;

		boton_tb	<='0';
		WAIT FOR 50 ns;
		
		boton_tb	<='1';
		WAIT FOR 50 ns;
		
		switch_tb<="00001010";
		WAIT FOR 50 ns;
		
		boton_tb	<='0';
		WAIT FOR 50 ns;
		
		boton_tb	<='1';
		WAIT FOR 5 us;
		
	END PROCESS signal_generation;
	
END ARCHITECTURE;