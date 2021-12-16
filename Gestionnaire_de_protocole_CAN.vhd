library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity Gestionnaire_de_protocole_CAN is
port(
	SW 		: in  std_logic_vector(9 downto 0);
	KEY		: in std_logic_vector(1 downto 0);
	MAX10_CLK1_50	: in  std_logic;
	GPIO		: inout std_logic_vector(1 downto 0);

	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 	: out std_logic_vector(0 to 6);
	LEDR 		: out std_logic_vector(9 downto 0));
end entity;

architecture gestion of Gestionnaire_de_protocole_CAN is
signal CLK, RST, Tick1us, Tick4us, Tick10us, Tick1ms, Tick10ms, Mode, Rx, Tx : std_logic;
signal datasend : std_logic_vector(0 to 58);
signal data : std_logic_vector(23 downto 0);
begin

CLK <= MAX10_CLK1_50;
Mode <= SW(0);
LEDR(0) <= Mode;

IHM 		: entity work.top_IHM port map(data=>data,
					HEX0=>HEX0,HEX1=>HEX1,
					HEX2=>HEX2,HEX3=>HEX3,
					HEX4=>HEX4,HEX5=>HEX5,
					LEDR=>LEDR(9 downto 1));

diviseur_freq 	: entity work.FDIV port map(CLK=>CLK, RST=>RST, Tick1us=>Tick1us,
					Tick4us=>Tick4us, Tick10us=>Tick10us,
					Tick1ms=>Tick1ms, Tick10ms=>Tick10ms);

Comm		: entity work.Transceiver port map(clk=>clk,datasend=>datasend,Rx=>Rx,Tx=>Tx);

end architecture;