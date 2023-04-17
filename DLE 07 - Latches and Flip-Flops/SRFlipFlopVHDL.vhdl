LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity SRFlipFlop is
    port(
        S, R, CLK: in std_logic;
        Q: out std_logic
    );
end SRFlipFlop;

architecture Behaviors of SRFlipFlop is
    signal Q_int: std_logic; -- internal value of Q

    begin
        Q <= Q_int;

        process(CLK, S, R) -- seems this is necessary for using "if-else"
        begin
            if CLK'event and CLK = '1' then -- rising edge of CLK
                if S = '0' and R = '0' then
                    Q_int <= Q;
                elsif S = '0' and R = '1' then
                    Q_int <= '0';                    
                elsif S = '1' and R = '0' then
                    Q_int <= '1';
                else
                    Q_int <= 'Z';
                end if;
            end if;
        end process;
end Behaviors;