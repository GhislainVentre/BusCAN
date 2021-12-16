LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

entity top_IHM is
port(
	data	: in  std_logic_vector(23 downto 0);
	HEX0 	: out std_logic_vector(0 to 6);
	HEX1 	: out std_logic_vector(0 to 6);
	HEX2 	: out std_logic_vector(0 to 6);
	HEX3 	: out std_logic_vector(0 to 6);
	HEX4 	: out std_logic_vector(0 to 6);
	HEX5 	: out std_logic_vector(0 to 6);
	LEDR 	: out std_logic_vector(8 downto 0));
end entity;

architecture arc_IHM of top_IHM is
begin


-- Initialisation des affichages 7seg
SEG_0 : entity work.SEVEN_SEG port map(data=>data(3 downto 0), Segout=>HEX0);
SEG_1 : entity work.SEVEN_SEG port map(data=>data(7 downto 4), Segout=>HEX1);
SEG_2 : entity work.SEVEN_SEG port map(data=>data(11 downto 8), Segout=>HEX2);
SEG_3 : entity work.SEVEN_SEG port map(data=>data(15 downto 12), Segout=>HEX3);
SEG_4 : entity work.SEVEN_SEG port map(data=>data(19 downto 16), Segout=>HEX4);
SEG_5 : entity work.SEVEN_SEG port map(data=>data(23 downto 20), Segout=>HEX5);

end architecture;
