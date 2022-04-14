LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ABFF is
    port(
        A, B, CLK: in std_logic;
        Q_next: out std_logic
    );
end ABFF;

architecture ABFF1 of ABFF is
    signal Qint: std_logic; -- internal value of Q
    signal input: std_logic_vector(0 to 1);

    begin
        input <= A & B;
        Q_next <= Qint;
        
        -- seems this is necessary for using "if-else"
        -- process makes program to execute in order
        -- only when args' value changes, the process begin
        process(CLK) 
        begin
            if CLK'event and CLK = '1' then -- rising edge of CLK
                Qint <=
                    '0' when input = "00" else
                    Qint when input = "01" else
                    not Qint when input = "10" else
                    '1' when input = "11";
            end if;
        end process;
end ABFF1;