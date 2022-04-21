LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity SRFF is
    port(
        S, R, CLK: in std_logic;
        Q_next: out std_logic
    );
end SRFF;

architecture SRFF1 of SRFF is
    signal Qint: std_logic; -- internal value of Q

    begin
        Q_next <= Qint;

        process(CLK) -- seems this is necessary for using "if-else"
        begin
            if CLK'event and CLK = '1' then -- rising edge of CLK
                Qint <= S or (not R and Qint) after 5 ns;
            end if;
        end process;
end SRFF1;