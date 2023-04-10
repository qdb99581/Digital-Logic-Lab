-- 4-bit Comparator
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Comparator4 is
    port (
        X, Y: in std_logic_vector(3 downto 0);
        C0: in std_logic_vector(1 downto 0);
        C4: out std_logic_vector(1 downto 0));
end Comparator4;

architecture Structure of Comparator4 is
    component Comparator1
        port (X, Y: in std_logic; 
              Ci: in std_logic_vector(1 downto 0);
              Ci_next: out std_logic_vector(1 downto 0));
    end component;

    signal C1: std_logic_vector(1 downto 0);
    signal C2: std_logic_vector(1 downto 0);
    signal C3: std_logic_vector(1 downto 0);

    begin
        FC0: Comparator1 port map(X(0), Y(0), C0, C1);
        FC1: Comparator1 port map(X(1), Y(1), C1, C2);
        FC2: Comparator1 port map(X(2), Y(2), C2, C3);
        FC3: Comparator1 port map(X(3), Y(3), C3, C4);
end Structure;

-- 1-bit Comparator
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Comparator1 is
    port (X, Y: in std_logic;
          Ci: in std_logic_vector(1 downto 0);
          Ci_next: out std_logic_vector(1 downto 0));
end Comparator1;

architecture Equations of Comparator1 is
    signal input: std_logic_vector(3 downto 0);
    begin
        input <= Ci(0) & Ci(1) & X & Y;

        Ci_next(0) <= '0' when input = "0000" else
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
            '1' when input = "1011" else
            'X' when input = "1100" else
            'X' when input = "1101" else
            'X' when input = "1110" else
            'X' when input = "1111";

        Ci_next(1) <= '0' when input = "0000" else
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
            '0' when input = "1011" else
            'X' when input = "1100" else
            'X' when input = "1101" else
            'X' when input = "1110" else
            'X' when input = "1111";
end Equations;