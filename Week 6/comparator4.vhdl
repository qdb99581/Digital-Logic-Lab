-- Main Circuit: 4-bit Comparator
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Comparator4 is
    port(
        A, B: in std_logic_vector(3 downto 0);
        Cin0, Cin1: in std_logic; -- Initial input of C
        Cout0, Cout1: out std_logic -- Output to show whose larger, 0: X, 1: Y.
    );
end Comparator4;

architecture Structure of Comparator4 is
    component Comparator
        port(
            Ci00, Ci01, X, Y: in std_logic; 
            Ci10, Ci11: out std_logic
        );
    end component;

    signal C0: std_logic_vector(3 downto 1);
    signal C1: std_logic_vector(3 downto 1);
    begin
        FC0: Comparator port map(Cin0, Cin1, A(0), B(0), C0(1), C1(1));
        FC1: Comparator port map(C0(1), C1(1), A(1), B(1), C0(2), C1(2));
        FC2: Comparator port map(C0(2), C1(2), A(2), B(2), C0(3), C1(3));
        FC3: Comparator port map(C0(3), C1(3), A(3), B(3), Cout0, Cout1);
end Structure;

-- 1-bit Comparator
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Comparator is
    -- Ciab
    -- where: a=0 means current stage, a=1 means next stage.
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
        Ci10 <= 
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

        Ci11 <= 
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