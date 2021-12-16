library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity tb_top_level is
port(
	SW 		: in  std_logic_vector(9 downto 0);
	KEY		: in std_logic_vector(1 downto 0);
	MAX10_CLK1	: in  std_logic;
	GPIO		: inout std_logic_vector(1 downto 0);

	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 	: out std_logic_vector(0 to 6);
	LEDR 		: out std_logic_vector(9 downto 0));
end entity;

architecture arc of tb_top_level is
signal CLK, RST, Tick1us, Tick4us, Tick10us, Tick1ms, Tick10ms, Mode, Rx, Tx : std_logic;
signal zero : std_logic_vector(0 to 58) := x"00000000000000" & "000";
signal address	: std_logic_vector(10 downto 0) := "00010010110";
signal RW, MAX10_CLK1_50	: std_logic := '1';
signal cmd	: std_logic_vector(5 downto 0) := "100001";
signal donnee	: std_logic_vector(23 downto 0) := x"1AFE3B";
signal crc	: std_logic_vector(15 downto 0) := x"2EF1";
signal datasend	: std_logic_vector(0 to 58) := '0' & address  & RW & cmd & donnee & crc;
signal data : std_logic_vector(0 to 58);
begin

CLK <= MAX10_CLK1_50;

process
begin
Wait for 1 us;
MAX10_CLK1_50 <= not MAX10_CLK1_50;
end process;

process
begin
wait for 200 us;
datasend <= zero;
end process;

diviseur_freq 	: entity work.FDIV port map(CLK=>CLK, RST=>RST, Tick1us=>Tick1us,
					Tick4us=>Tick4us, Tick10us=>Tick10us,
					Tick1ms=>Tick1ms, Tick10ms=>Tick10ms);

Comm		: entity work.Transceiver port map(clk=>CLK,datasend=>datasend,data=>data,Rx=>Rx,Tx=>Tx);

end architecture;
