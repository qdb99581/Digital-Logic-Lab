LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ABFlipFlop is
    port(
        A, B, CLK: in std_logic;
        Q: out std_logic
    );
end ABFlipFlop;

architecture Behaviors of ABFlipFlop is
    signal Q_int: std_logic; -- internal value of Q

    begin
        Q <= Q_int;

        process(CLK, A, B) -- seems this is necessary for using "if-else"
        begin
            if CLK'event and CLK = '1' then -- rising edge of CLK
                if A = '0' and B = '0' then
                    Q_int <= '0';
                elsif A = '1' and B = '0' then
                    Q_int <= not Q;
                elsif A = '0' and B = '1' then
                    Q_int <= Q;
                else
                    Q_int <= '1';
                end if;
            end if;
        end process;
end Behaviors;