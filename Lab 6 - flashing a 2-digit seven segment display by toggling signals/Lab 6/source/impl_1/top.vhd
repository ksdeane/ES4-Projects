library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  port(
	  dipBits : in unsigned(5 downto 0);
	  display : out std_logic_vector(6 downto 0);
	  leds : out std_logic_vector(1 downto 0)
  );
end top;

architecture synth of top is
signal clk : std_logic;
signal count : unsigned(25 downto 0) := (others => '0');

component HSOSC is
    generic (
        CLKHF_DIV : String := "0b00"); -- Divide 48MHz clock by 2^N (0-3)
    port(
        CLKHFPU : in std_logic := 'X'; -- Set to 1 to power up
        CLKHFEN : in std_logic := 'X'; -- Set to 1 to enable output
        CLKHF : out std_logic := 'X'); -- Clock output
end component;

component dddd is
  port(
    value : in unsigned(5 downto 0);    
    tensdigit : out std_logic_vector(6 downto 0);    
    onesdigit : out std_logic_vector(6 downto 0)
  );
end component;

signal finalTens : std_logic_vector(6 downto 0);
signal finalOnes : std_logic_vector(6 downto 0);

begin 
    osc : HSOSC generic map ( CLKHF_DIV => "0b00")
            port map (CLKHFPU => '1',
            CLKHFEN => '1',
            CLKHF => clk); -- clk is run by CLKHF now

process (clk) begin
    if rising_edge(clk) then --process (clk) & if rising_edge(clk) always together
        count <= count + '1';
    end if;
end process;

	leds(0) <= count(12);
	leds(1) <= not count(12);
	
	dddd1: dddd port map(value => dipBits, tensdigit => finalTens, onesdigit => finalOnes);
	display <= finalOnes when (leds(0)) else finalTens;  
end;

