LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity LRShift is
    port(
        D: in std_logic_vector(3 downto 0);
        Si: in std_logic;
        LSH, RSH, L: in std_logic;
        CLK: in std_logic;
        Q: out std_logic_vector(3 downto 0)
    );
end LRShift;

architecture Behavior of LRShift is
    signal prev_Q: std_logic_vector(3 downto 0);
    begin
        
        process(CLK)
        begin
            if (CLK'event and CLK='1') then
                if L = '1' then 
                    Q <= D; 
                    prev_Q <= D;
                end if;
                

                if LSH = '1' then 
                    Q <= prev_Q sll 1;
                    if Si = '1' then
                        Q(0) <= '1';
                    end if;
                elsif RSH = '1' then 
                    Q <= prev_Q srl 1;
                    if Si = '1' then
                        Q(3) <= '1';
                    end if;
                end if;
            end if;
            prev_Q <= Q;
        end process;
    end Behavior;