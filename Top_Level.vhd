--Top level entity

library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;
  use work.CanBus;
	
entity Top_Level is
port(
	--Clock
	MAX10_CLK1_50 			: in std_logic;
	--Bouton
	SW 				: in std_logic_vector(9 downto 0);
	KEY				: in std_logic_vector(1 downto 0);
	--Sortie
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5	: out std_logic_vector(0 to 7);
	LEDR				: out std_logic_vector(9 downto 0);
	--VGA
	VGA_R				: out std_logic_vector(3 downto 0);
	VGA_G				: out std_logic_vector(3 downto 0);
	VGA_B				: out std_logic_vector(3 downto 0);
	--Port COM
	Rx				: in std_logic;
	Tx				: out std_logic
);
end entity;

architecture Behavioral of Top_Level is
signal data : std_logic_vector(3 downto 0);
signal HEX  : CanBus.HEXTab;
signal clk, rst : std_logic := '0';
begin

HEX0 <= HEX(0);
HEX1 <= HEX(1);
HEX2 <= HEX(2);
HEX3 <= HEX(3);
HEX4 <= HEX(4);
HEX5 <= HEX(5);

rst <= not KEY(0);
data <= SW(9 downto 6);

Timer			: entity work.FrequencyGenerator(f) generic map(Frequency => 100) port map(MAX10_CLK1_50=>MAX10_CLK1_50,clk=>clk,rst=>rst);
InterfaceHommeMachine	: entity work.IHM(Horloge) port map(HEX=>HEX,data=>data,LEDR=>LEDR,clk=>clk,rst=>rst);

end architecture;