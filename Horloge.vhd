library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

Entity Horloge is
port ( 
	clk		: in  std_logic;
	rst		: in std_logic;
	sec1 		: out std_logic_vector(3 downto 0);
	min1		: out std_logic_vector(3 downto 0);
	heur1		: out std_logic_vector(3 downto 0);
	sec2 		: out std_logic_vector(3 downto 0);
	min2		: out std_logic_vector(3 downto 0);
	heur2		: out std_logic_vector(3 downto 0)
);
end entity;

Architecture Behavioral of Horloge is
signal Count : integer range 0 to 86400;
begin

process(clk)
begin
if rst = '1' then
	Count <= 0;
elsif rising_edge(clk) then
	if Count < 86400 - 1 then
		Count <= Count + 1;
	else
		Count <=0;
	end if;
end if;
end process;

sec1 <= std_logic_vector(to_unsigned(Count MOD 10,4));
sec2 <= std_logic_vector(to_unsigned((Count/10) MOD 6,4));

min1 <= std_logic_vector(to_unsigned((Count/60) MOD 10,4));
min2 <= std_logic_vector(to_unsigned((Count/600) MOD 6,4));

heur1 <= std_logic_vector(to_unsigned((Count/3600) MOD 10,4));
heur2 <= std_logic_vector(to_unsigned((Count/36000) MOD 2,4));


end architecture;
