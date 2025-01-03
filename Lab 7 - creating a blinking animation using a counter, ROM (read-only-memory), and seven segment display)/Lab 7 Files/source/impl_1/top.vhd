library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  port(
	  display : out std_logic_vector(6 downto 0)
	  --leds : out std_logic_vector(6 downto 0) --what is this????? do i even need it...
  );
end top;

architecture synth of top is
signal clk : std_logic;

component HSOSC is
    generic (
        CLKHF_DIV : String := "0b00"); -- Divide 48MHz clock by 2^N (0-3)
    port(
        CLKHFPU : in std_logic := 'X'; -- Set to 1 to power up
        CLKHFEN : in std_logic := 'X'; -- Set to 1 to enable output
        CLKHF : out std_logic := 'X'); -- Clock output
end component;

component counter is 
	port( 
			clk : in std_logic;
			count : out unsigned(25 downto 0) := (others => '0')
		);
end component;

--component sevenseg is
  --port(
	  --S : in unsigned(3 downto 0);
	  --segments : out std_logic_vector(6 downto 0)
  --);
--end component;

component rom is 
	port (
			clk : in std_logic;
			addr : in std_logic_vector (2 downto 0); --make 2 downto 0 later on
			data : out std_logic_vector (6 downto 0)
		);
end component;

signal counttoaddr : unsigned(25 downto 0) := (others => '0');
signal address : unsigned(2 downto 0);

begin 
    osc : HSOSC generic map ( CLKHF_DIV => "0b00")
            port map (CLKHFPU => '1',
            CLKHFEN => '1',
            CLKHF => clk); -- clk is run by CLKHF now
	
	counter1: counter port map (clk => clk, count(25 downto 23) => address); --clk => clk syncs all the clks, since each component has its own clk
	rom1: rom port map (clk => clk, addr => std_logic_vector(address), data => display);
end;
