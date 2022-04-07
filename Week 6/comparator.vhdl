LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Comparator is
    -- Ciab, where a=0 means current stage, a=1 means next stage.
    -- b=0 when X>Y, b=1 when Y>X.
    port(
        Ci00, Ci01, X, Y: in std_logic; 
        Ci10, Ci11: out std_logic
    );
end Comparator;

architecture Equations of Comparator is
    signal input: std_logic_vector(0 to 3);
    begin
        input <= Ci00 & Ci01 & X & Y;
        Ci1_0 <= 
            '0' when input = "0000" else
            '0' when input = "0001" else
            '1' when input = "0010" else
            '0' when input = "0011" else
            '0' when input = "0100" else
            '0' when input = "0101" else
            '1' when input = "0110" else
            '0' when input = "0111" else
            '1' when input = "1000" else
            '0' when input = "1001" else
            '1' when input = "1010" else
            '1' when input = "1011";

        Ci1_1 <= 
            '0' when input = "0000" else
            '1' when input = "0001" else
            '0' when input = "0010" else
            '0' when input = "0011" else
            '1' when input = "0100" else
            '1' when input = "0101" else
            '0' when input = "0110" else
            '1' when input = "0111" else
            '0' when input = "1000" else
            '1' when input = "1001" else
            '0' when input = "1010" else
            '0' when input = "1011"; 
    end Equations;          