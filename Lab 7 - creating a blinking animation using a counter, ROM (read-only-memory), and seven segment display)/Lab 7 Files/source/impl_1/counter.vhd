library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is 
	port( 
			clk : in std_logic;
			count : out unsigned(25 downto 0) := (others => '0')
		);
end counter;

architecture synth of counter is 
begin
process (clk) begin
    if rising_edge(clk) then 
        count <= count + '1';
    end if;
end process;

end;