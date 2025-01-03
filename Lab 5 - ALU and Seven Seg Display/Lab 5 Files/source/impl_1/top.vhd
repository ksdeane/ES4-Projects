library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
	port(
		signalA : in unsigned(3 downto 0);
		signalB : in unsigned(3 downto 0);
		signalC : in std_logic_vector(1 downto 0);
		finalResult : out std_logic_vector(6 downto 0)
	);
end top;

architecture synth of top is 
component alu is
	port(
		a : in unsigned(3 downto 0);
		b : in unsigned(3 downto 0);
		s : in std_logic_vector(1 downto 0);
		y : out unsigned(3 downto 0)
	);
end component;

component sevenseg is
  port(
        binary : in unsigned(3 downto 0);
        segments : out std_logic_vector(6 downto 0)
  );
end component;

signal aluresult : unsigned(3 downto 0);

begin
	alu1 : alu port map(a => signalA, b => signalB, y => aluresult, s => signalC);
	sevenseg1: sevenseg port map(binary => aluresult, segments => finalResult);
end;