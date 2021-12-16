library ieee;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity jsp is
port(
	clk	: in std_logic;
	Tx	: in std_logic;
	Rx	: in std_logic;
	equal 	: out std_logic := '0'
);
end entity;

architecture behavioral of jsp is
begin
process(clk)
begin
if rising_edge(clk) then
	if Tx = Rx then
		equal <= '1';
	else
		equal <= '0';
	end if;
end if;
end process;
end architecture;