LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity JKFF is
    port(
        SN, RN, J, K, CLK: in std_logic;
        Q, QN: out std_logic
    );
end JKFF;

architecture JKFF1 of JKFF is
    signal Qint: std_logic; -- internal value of Q

    begin
        Q <= Qint; -- output Q and QN to port
        QN <= not Qint;

        process(SN, RN, CLK) -- seems this is necessary for using "if-else"
        begin
            if RN = '0' then 
                Qint <= '0'; -- RN = '0' will clear the FF
            elsif SN = '0' then 
                Qint <= '1'; -- SN = '0' will set FF
            elsif CLK'event and CLK = '0' then -- falling edge of CLK
                Qint <= (J and not Qint) or (not K and Qint);
            end if;
        end process;
end JKFF1;