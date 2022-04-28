LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity my_fsm is	
	port(
		-- Input ports
        X: in std_logic;
		CLK: in std_logic;
		
		-- Output ports		
		Q0, Q1, Q2: out std_logic;
        Z: out std_logic
    );
end my_fsm;

architecture state_graph of my_fsm is	
	signal Q : std_logic_vector(2 downto 0) := "000";
begin
	Q0 <= Q(2);
	Q1 <= Q(1);
	Q2 <= Q(0);
	process(CLK) is
 	begin
 		if(rising_edge(CLK)) then
            if (X = '0') then
                if (Q = "000") then Q <= "001"; Z <= '0';
                elsif (Q = "001") then Q <= "010"; Z <= '0';
                elsif (Q = "010") then Q <= "001"; Z <= '0';
                elsif (Q = "011") then Q <= "100"; Z <= '0';
                elsif (Q = "100") then Q <= "011"; Z <= '0';
                else Q <= "000"; Z <= '0';
                end if;
            else
                if (Q = "000") then Q <= "011"; Z <= '0';
                elsif (Q = "001") then Q <= "011"; Z <= '0';
                elsif (Q = "010") then Q <= "011"; Z <= '1';
                elsif (Q = "011") then Q <= "000"; Z <= '0';
                elsif (Q = "100") then Q <= "000"; Z <= '1';
                else Q <= "000"; Z <= '0';
                end if;
			end if;
		end if;
	end process; 
end state_graph;
