library ieee;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity Transmitter is
port(
	clk     : in std_logic;
	data    : in std_logic_vector(0 to 58);
	done	: out std_logic := '0';
	Tx  	: out std_logic := '1'
);
end entity;

architecture arc_Transmitter of Transmitter is
signal zero : std_logic_vector(0 to 58) := x"00000000000000" & "000";
signal trame : std_logic_vector(0 to 58) := zero;
begin

process (clk)
begin
if rising_edge(clk) then
	if trame /= zero then
		Tx <= (trame(0) and '1');
		trame(0 to 58) <= trame(1 to 58) & '0';
		done <= '0';
	else 
		trame <= data;
		done <= '1';
		Tx <= '1';
	end if;
end if;
end process;

end architecture;