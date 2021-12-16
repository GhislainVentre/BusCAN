library ieee;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity tb_Transmitter is
end entity;

architecture behavioral of tb_Transmitter is
signal clk 	: std_logic := '0';
signal address	: std_logic_vector(10 downto 0) := "00010010110";
signal RW	: std_logic := '1';
signal cmd	: std_logic_vector(5 downto 0) := "100001";
signal donnee	: std_logic_vector(23 downto 0) := x"1AFE3B";
signal crc	: std_logic_vector(15 downto 0) := x"2EF1";
signal data	: std_logic_vector(0 to 58) := '0' & address  & RW & cmd & donnee & crc;
signal done	: std_logic;
signal Tx  	: std_logic;
begin

--clock
process
begin
wait for 1 us;
clk <= not clk;
end process;

process
begin
wait for 1 us;
if done = '1' then
	data <= x"00000000000000" & "000";
end if;
end process;
--init
transmit : entity work.Transmitter port map(clk=>clk,data=>data,done=>done,Tx=>Tx);


end architecture;