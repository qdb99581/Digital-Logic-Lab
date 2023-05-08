library ieee;
use ieee.std_logic_1164.all;

entity binary_sequential_detector is
    port (
        CLK   : in std_logic;
        X : in std_logic;
        Z: out std_logic
    );
end entity;

architecture behavioral of binary_sequential_detector is
    type state_type is (S0, S1, S2, S3, S4);
    signal current_state, next_state : state_type;
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            current_state <= next_state;
        end if;
    end process;

    process (current_state, X)
    begin
        case current_state is
            when S0 =>
				Z <= '0';
                if X = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
            when S1 =>
				Z <= '0';
                if X = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
            when S2 =>
				Z <= '0';
                if X = '0' then
                    next_state <= S3;
                else
                    next_state <= S1;
                end if;
            when S3 =>
                if X = '1' then
                    Z <= '1';
                    next_state <= S4;
                else
					Z <= '0';
                    next_state <= S0;
                end if;
			when S4 =>
				Z <= '0';
				if X = '0' then
					next_state <= S2;
				else
					next_state <= S0;
				end if;
            when others =>
                next_state <= S0;
        end case;
    end process;
end architecture;
