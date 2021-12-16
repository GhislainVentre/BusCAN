library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_arith.all;

entity tb is
end entity;

architecture arc_tb of tb is
signal RST, TICK1US, TICK1MS, TICK4US, TICK10US, TICK10MS: std_logic;
signal CLK : std_logic := '0';
begin

Diviser : entity work.FDIV port map(CLK=>CLK,RST=>RST,TICK1US=>TICK1US,TICK1MS=>TICK1MS,TICK4US=>TICK4US,TICK10US=>TICK10US,TICK10MS=>TICK10MS);
RST<='0';

process is
begin
CLK <= not CLK;
wait for 20 ns;
end process;

end architecture;
