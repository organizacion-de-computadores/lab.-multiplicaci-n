library IEEE; 
use IEEE.std_logic_1164.all;


entity todo_mult is 
port(
	boton: IN std_logic; 
	switch: IN std_logic_vector(7 downto 0);
	reset: IN std_logic; 
	RESULTADO1		:OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	RESULTADO2		:OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	INT_MULT				:OUT STD_LOGIC
);
end Entity todo_mult; 

--******************************--
--Definicion de Arquitectura------
--******************************--

architecture todo_multArch of todo_mult is  

component control is 
port(
				boton		:	IN			STD_LOGIC;
				reset		:	IN			STD_LOGIC;
				switch	:	IN			STD_LOGIC_VECTOR(7 DOWNTO 0);
				X			:	OUT		STD_LOGIC_VECTOR(7 DOWNTO 0);
				Y			:	OUT		STD_LOGIC_VECTOR(7 DOWNTO 0);
				int_MULT	:	out		std_LOGIC
);
end component control;

component mult is 
port(
				X	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
				Y	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
				RESULTADO1		:OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				RESULTADO2		:OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end component mult;


--Conexion entre bloques--

	signal X_signal: std_logic_vector(7 downto 0);  
	signal Y_signal: std_logic_vector(7 downto 0);


begin

U1: control port map(boton, reset, switch, X_signal, Y_signal,int_MULT); 
U2: mult port map(X_signal, Y_signal,resultADO1,RESULTADO2);


end todo_multArch;