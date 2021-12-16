library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

Entity SEVEN_SEG is
  port ( data   : in  std_logic_vector(3 downto 0);
			point	 : in std_logic;
         Segout : out std_logic_vector(0 to 7));
end entity;

Architecture COMB of SEVEN_SEG is
begin

process(data)
begin
case data is
	when "0000" => Segout <= "0000001" & not point;
	when "0001" => Segout <= "1001111" & not point;
	when "0010" => Segout <= "0010010" & not point;
	when "0011" => Segout <= "0000110" & not point;
	when "0100" => Segout <= "1001100" & not point;
	when "0101" => Segout <= "0100100" & not point;
	when "0110" => Segout <= "0100000" & not point;
	when "0111" => Segout <= "0001111" & not point;
	when "1000" => Segout <= "0000000" & not point;
	when "1001" => Segout <= "0000100" & not point;
	when "1010" => Segout <= "0001000" & not point;
	when "1011" => Segout <= "1100000" & not point;
	when "1100" => Segout <= "0110001" & not point;
	when "1101" => Segout <= "1000010" & not point;
	when "1110" => Segout <= "0110000" & not point;
	when "1111" => Segout <= "0111000" & not point;
	when others => Segout <= "1111111" & not point;
end case;
end process;
end architecture;
