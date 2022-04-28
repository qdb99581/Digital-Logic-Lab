LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity my_TFF is
    port(
        toggle, clk: in std_logic;
	    Q0: out std_logic
    );
end my_TFF;

architecture Behavior of my_TFF is
    signal Q_temp: std_logic;
begin

	process (clk)
	begin
		if(rising_edge(clk)) then
            if toggle = '0' then Q_temp <= Q_temp;
            elsif toggle = '1' then Q_temp <= not Q_temp;
			end if;
		end if;
	end process;
    Q0 <= Q_temp;
end Behavior;
