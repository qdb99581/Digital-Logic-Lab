LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RightShifter is
    port(
        D_X: in std_logic_vector(3 downto 0);
        Si, Sh, Load: in std_logic;
        CLK: in std_logic;
        x_out: out std_logic;
        x_viz: out std_logic_vector(3 downto 0)
    );
end RightShifter;

architecture Behavior of RightShifter is
    signal prev_X: std_logic_vector(3 downto 0);
    signal state: std_logic_vector(1 downto 0);
    
    begin
        x_out <= prev_X(0);
        x_viz <= prev_X;
        state <= Sh & Load;
        
        process(CLK)
        begin
            if (CLK'event and CLK='1') then
                -- Load input data
                if state = "01" then 
                    prev_X <= D_X; 
                end if;

                if Sh = '1' then 
                    prev_X <= prev_X srl 1;
                    prev_X(3) <= Si;
                end if;
            end if;
        end process;
    end Behavior;