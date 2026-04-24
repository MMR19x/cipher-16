library ieee;
use	ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity non_linear_lookup_tb is
end entity ;
architecture sim of non_linear_lookup_tb is
	signal LUTIN_tb : std_logic_vector(7 downto 0);
	signal LUTOUT_tb : std_logic_vector(7 downto 0);
begin
	UUT : entity work.non_linear_lookup	 -- Unit under test
		port map(
			LUTIN => LUTIN_tb ,
			LUTOUT => LUTOUT_tb
		);
		
		process is
		begin
			LUTIN_tb <= "00000000";
			wait for 10 ns;
			assert(LUTOUT_tb = "11110001")
			report "Error at Input 00" severity error;
			
			LUTIN_tb <= "00010001";
        
			wait for 10 ns;
        
			assert (LUTOUT_tb = "00001011") 
        
			report "Error at Input 11" severity error;
			
			for i in 0 to 255 loop
				LUTIN_tb <= std_logic_vector(to_unsigned(i,8));
				wait for 10 ns;
			end loop;
			
			report "Simulation Finished Successfully!";
			wait;
		end process;
		
end sim ;

	