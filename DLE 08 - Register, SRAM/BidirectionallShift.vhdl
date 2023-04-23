LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity BidirectionalShift is
    port(
        D: in std_logic_vector(3 downto 0);
        Si: in std_logic;
        LSh, RSh, L: in std_logic;
        CLK: in std_logic;
        Q: out std_logic_vector(3 downto 0)
    );
end BidirectionalShift;

architecture Behavior of BidirectionalShift is
    signal prev_Q: std_logic_vector(3 downto 0);
    begin
        Q <= prev_Q;
        
        process(CLK)
        begin
            if (CLK'event and CLK='1') then
                if L = '1' then 
                    prev_Q <= D; 
                end if;

                if LSh = '1' then 
                    prev_Q <= prev_Q sll 1;
                    prev_Q(0) <= Si;
                elsif RSh = '1' then 
                    prev_Q <= prev_Q srl 1;
                    prev_Q(3) <= Si;
                else
                    prev_Q <= prev_Q;
                end if;
            end if;
        end process;
    end Behavior;