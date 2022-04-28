LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity my_counter is	
	port(
		-- Input ports
		CLK	: in  std_logic;
		
		-- Output ports		
		a_out, b_out, c_out	: out std_logic
    );
end my_counter;

architecture state_graph of my_counter is	
	signal z : std_logic_vector(2 downto 0) := "000";
begin
	a_out <= z(0);
	b_out <= z(1);
	c_out <= z(2);
	process(clk) is
 	begin
 		if(rising_edge(clk)) then
			if(z = "000") then z <= "111";
			elsif(z = "111") then z <= "001";
			elsif(z = "001") then z <= "110";
			elsif(z = "110") then z <= "101";
            elsif(z = "101") then z <= "100";
            elsif(z = "100") then z <= "010";
			else z <= "000";
			end if;
		end if;
	end process; 
end state_graph;
