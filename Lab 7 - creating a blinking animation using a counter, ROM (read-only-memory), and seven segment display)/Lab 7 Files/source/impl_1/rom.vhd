library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity rom is 
	port (
			clk : in std_logic;
			addr : in std_logic_vector (2 downto 0); --make 2 downto 0 later on
			data : out std_logic_vector (6 downto 0)
		);
end rom;

architecture synth of rom is
begin

process(clk) is
begin
	if rising_edge(clk) then
		case addr is
			when "000" => data <= 7b"1001111"; -- Assumes 2-bit address and 16-bit data
			when "001" => data <= 7b"0011111"; -- You can make these any size you want
			when "010" => data <= 7b"0111101";
			when "011" => data <= 7b"1111100";
			when "100" => data <= 7b"1101110";
			when "101" => data <= 7b"1100111";
			when "110" => data <= 7b"1110011";
			when "111" => data <= 7b"1111001";
			when others => data <= 7b"0000000"; -- Don't forget the "others" case
		end case; 
	end if;
end process;

end;