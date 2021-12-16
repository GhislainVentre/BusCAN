library IEEE;
  use IEEE.std_logic_1164.ALL;
  use IEEE.numeric_std.ALL;
  use work.CanBus;
	
entity IHM is
port(
	data				: in std_logic_vector(3 downto 0);
	clk				: in std_logic;
	rst				: in std_logic;
	--LEDR			: in std_logic_vector(3 downto 0);
	--Affichage
	HEX				: out CanBus.HEXTab;
	LEDR				: out std_logic_vector(9 downto 0)
);
end entity;

architecture data of IHM is
begin

Segment0   : entity work.SEVEN_SEG port map(Segout=>HEX(0),Data=>data,point=>'0');
Segment1   : entity work.SEVEN_SEG port map(Segout=>HEX(1),Data=>data,point=>'0');
Segment2   : entity work.SEVEN_SEG port map(Segout=>HEX(2),Data=>data,point=>'1');
Segment3   : entity work.SEVEN_SEG port map(Segout=>HEX(3),Data=>data,point=>'0');
Segment4   : entity work.SEVEN_SEG port map(Segout=>HEX(4),Data=>data,point=>'1');
Segment5   : entity work.SEVEN_SEG port map(Segout=>HEX(5),Data=>data,point=>'0');


end architecture;

architecture Horloge of IHM is
signal sec1,sec2,min1,min2,heur1,heur2 : std_logic_vector(3 downto 0);
begin


Horloge	  : entity work.Horloge   port map(clk=>clk,sec1=>sec1,min1=>min1,heur1=>heur1,sec2=>sec2,min2=>min2,heur2=>heur2,rst=>rst);
Segment0   : entity work.SEVEN_SEG port map(Segout=>HEX(0),Data=>sec1,point=>'0');
Segment1   : entity work.SEVEN_SEG port map(Segout=>HEX(1),Data=>sec2,point=>'0');
Segment2   : entity work.SEVEN_SEG port map(Segout=>HEX(2),Data=>min1,point=>'1');
Segment3   : entity work.SEVEN_SEG port map(Segout=>HEX(3),Data=>min2,point=>'0');
Segment4   : entity work.SEVEN_SEG port map(Segout=>HEX(4),Data=>heur1,point=>'1');
Segment5   : entity work.SEVEN_SEG port map(Segout=>HEX(5),Data=>heur2,point=>'0');


end architecture;