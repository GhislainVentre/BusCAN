LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

Entity FrequencyGenerator is
generic(
	Fclock : positive := 50E6;
	Frequency : positive := 25E6; --max 25MHz !![Fclock/Frequency = int] sinon arrondi
	Period_ns : positive := 40 --min 40 (25MHz) !![period*0.025 = int] sinon arrondi
);
port(
	MAX10_CLK1_50	: in  std_logic;
	rst 	: in  std_logic;
	clk : out std_logic := '0'
);
end FrequencyGenerator;

architecture F of FrequencyGenerator is
constant Divisor_f	: positive := Fclock / (2*Frequency);
signal Countf	     	: integer range 0 to Divisor_f;
signal clock			: std_logic := '0';
begin

clk <= clock;

process (rst, MAX10_CLK1_50)
begin
if rst = '1' then
	Countf <= 0;
elsif rising_edge(MAX10_CLK1_50) then
	if Countf >= Divisor_f - 1 then
		clock <= not clock;
		Countf <= 0;
	else
		Countf <= Countf  + 1;
	end if;
end if;
end process;
end architecture;

-- ============================================================

architecture T of FrequencyGenerator is
constant Divisor_T	: positive := (Fclock/10E6 * Period_ns) / 200;
signal CountT			: integer range 0 to Divisor_T;
signal clock				: std_logic := '0';
begin

clk <= clock;

process (rst, MAX10_CLK1_50)
begin
if rst = '1' then
	CountT <= 0;
elsif rising_edge(MAX10_CLK1_50) then
	if CountT >= Divisor_T - 1 then
		clock <= not clock;
		CountT <= 0;
	else
		CountT <= CountT  + 1;
	end if;
end if;
end process;
end architecture; 
