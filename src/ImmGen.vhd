library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ImmGen is

	port(
		instruction : in std_logic_vector( 31 downto 0);
		output : out std_logic_vector( 11 downto 0)
	);

end ImmGen;

architecture Behavioral of ImmGen is

signal opcode : std_logic_vector( 6 downto 0);

begin

	opcode <= instruction(6 downto 0);

	   output <=  instruction(31 downto 20) when opcode = "0000011" else -- I type
					 (instruction(31 downto 26) & instruction(11 downto 6)) when opcode = "0100011" else -- S type
					 (instruction(7) & instruction(30 downto 25) & instruction(11 downto 7))  when opcode =  "1100011"; -- SB type
	
	
	

end Behavioral;

