LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

entity Transceiver is
port(
	clk     : in std_logic;
	datasend    : in std_logic_vector(0 to 58);
	Rx  	: out std_logic;
	data	: out std_logic_vector(0 to 58);
	Tx  	: out std_logic := '1');
end entity;

architecture Behavioral of Transceiver is
signal Rec,done, T : std_logic;
begin
Tx <= T;

Reception : entity work.Receiver port map(clk=>clk,Rx=>T,data=>data,Rec=>Rec);
Transmission : entity work.Transmitter port map(clk=>clk,data=>datasend,done=>done,Tx=>T);

end architecture;
