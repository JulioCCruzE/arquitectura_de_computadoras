library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity divider is
Port ( reloj : in std_logic;
r_div_clk : out std_logic;
l_div_clk: out std_logic);
end divider;
architecture Behavioral of divider is
begin
process (reloj)
variable cuenta: std_logic_vector (19 downto 0):=X"00000";
variable l_salida: std_logic:='0';
variable r_salida: std_logic:='0';
begin
if rising_edge (reloj) then

if cuenta = X"DFFFD" and l_salida='0' then
 l_salida:= '1';
 end if;
if cuenta = X"E7FFF" and r_salida='0' then
	r_salida:='1';
	end if;
if cuenta = X"FFFFF" and l_salida='1' then
	l_salida:='0';
	r_salida:='0';
	end if;
if cuenta = X"FFFFF" then 
	cuenta:= X"00000";
	else
	cuenta:= cuenta+1;
	end if;
end if;
l_div_clk <= l_salida;
r_div_clk <= r_salida;
end process;
end Behavioral;