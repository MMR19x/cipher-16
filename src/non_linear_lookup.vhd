library	ieee;
use ieee.std_logic_1164.all;

entity non_linear_lookup is
	port(
	LUTIN   : in std_logic_vector(7 downto 0);
	LUTOUT  : out std_logic_vector(7 downto 0)
	);
end entity ;
architecture behave of non_linear_lookup is
signal sbox1_in : std_logic_vector(3 downto 0);
signal sbox2_in : std_logic_vector(3 downto 0);
signal sbox1_out : std_logic_vector(3 downto 0);
signal sbox2_out : std_logic_vector(3 downto 0); 
begin
	sbox1_in <= LUTIN  (3 downto 0);
	sbox2_in <= LUTIN  (7 downto 4);
	
	with sbox1_in select
        
	   sbox1_out <= "0001" when "0000",
                     
					"1011" when "0001",                      
					"1001" when "0010",                      
					"1100" when "0011",                      	
					"1101" when "0100",                     	
					"0110" when "0101",                     
					"1111" when "0110",                     	
					"0011" when "0111",                      
					"1110" when "1000",                      
					"1000" when "1001",                     
					"0111" when "1010",                     
					"0100" when "1011",                      
					"1010" when "1100",                     
					"0010" when "1101",                     
					"0101" when "1110",                      
					"0000" when "1111",                     
					"0000" when others;	
					
	with sbox2_in select
	   sbox2_out <= "1111" when "0000",                    
					"0000" when "0001",                     
					"1101" when "0010", 
                     
					"0111" when "0011",                     
					"1011" when "0100",                      
					"1110" when "0101", 
                     
					"0101" when "0110",                      
					"1010" when "0111",                     
					"1001" when "1000",                      
					"0010" when "1001", 
                     
					"1100" when "1010",                      
					"0001" when "1011",                     
					"0011" when "1100",                      
					"0100" when "1101", 
                     
					"1000" when "1110",                     
					"0110" when "1111", 
                     
					"0000" when others;
					
		LUTOUT <= sbox2_out & sbox1_out;
end architecture ;

				