LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity my_counter is	
	port(
		-- Input ports
		CLK: in std_logic;
		
		-- Output ports		
		Q0, Q1, Q2: out std_logic
    );
end my_counter;

architecture bool_state of my_counter is
    signal T: std_logic_vector(2 downto 0) := "000"; -- [c, b, a]
    signal Q: std_logic_vector(2 downto 0) := "000"; -- [c, b, a]
begin
    T(2) <= ((not Q0) and (not Q1)) or ((not Q1) and (not Q2)) or (Q1 and Q2);
    T(1) <= (not Q0) or Q1 or (not Q2);
    T(0) <= ((not Q0) and (not Q1)) or (Q0 and Q1 and (not Q2)) or ((not Q1) and Q2);
	Q0 <= Q(2);
	Q1 <= Q(1);
	Q2 <= Q(0);

    process(CLK)
    begin
        if (rising_edge(CLK)) then
            Q(2) <= (not T(2) and Q0) or (T(2) and not Q0); 
            Q(1) <= (not T(1) and Q1) or (T(1) and not Q1);
            Q(0) <= (not T(0) and Q2) or (T(0) and not Q2);
        end if;
    end process;
end bool_state;