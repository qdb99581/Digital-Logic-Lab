-- 4-bit Comparator
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Comparator4 IS
    PORT (
        X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        C0 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        C4 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END Comparator4;

ARCHITECTURE Structure OF Comparator4 IS
    COMPONENT Comparator1
        PORT (
            X, Y : IN STD_LOGIC;
            Ci : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            Ci_next : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
    END COMPONENT;

    SIGNAL C1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL C2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL C3 : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    FC0 : Comparator1 PORT MAP(X(0), Y(0), C0, C1);
    FC1 : Comparator1 PORT MAP(X(1), Y(1), C1, C2);
    FC2 : Comparator1 PORT MAP(X(2), Y(2), C2, C3);
    FC3 : Comparator1 PORT MAP(X(3), Y(3), C3, C4);
END Structure;

-- 1-bit Comparator
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Comparator1 IS
    PORT (
        X, Y : IN STD_LOGIC;
        Ci : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Ci_next : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END Comparator1;

ARCHITECTURE Equations OF Comparator1 IS
    SIGNAL input : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    input <= Ci(0) & Ci(1) & X & Y;

    Ci_next(0) <= 
        '0' WHEN input = "0000" ELSE
        '0' WHEN input = "0001" ELSE
        '1' WHEN input = "0010" ELSE
        '0' WHEN input = "0011" ELSE
        '0' WHEN input = "0100" ELSE
        '0' WHEN input = "0101" ELSE
        '1' WHEN input = "0110" ELSE
        '0' WHEN input = "0111" ELSE
        '1' WHEN input = "1000" ELSE
        '0' WHEN input = "1001" ELSE
        '1' WHEN input = "1010" ELSE
        '1' WHEN input = "1011" ELSE
        'X' WHEN input = "1100" ELSE
        'X' WHEN input = "1101" ELSE
        'X' WHEN input = "1110" ELSE
        'X' WHEN input = "1111";

    Ci_next(1) <= 
        '0' WHEN input = "0000" ELSE
        '1' WHEN input = "0001" ELSE
        '0' WHEN input = "0010" ELSE
        '0' WHEN input = "0011" ELSE
        '1' WHEN input = "0100" ELSE
        '1' WHEN input = "0101" ELSE
        '0' WHEN input = "0110" ELSE
        '1' WHEN input = "0111" ELSE
        '0' WHEN input = "1000" ELSE
        '1' WHEN input = "1001" ELSE
        '0' WHEN input = "1010" ELSE
        '0' WHEN input = "1011" ELSE
        'X' WHEN input = "1100" ELSE
        'X' WHEN input = "1101" ELSE
        'X' WHEN input = "1110" ELSE
        'X' WHEN input = "1111";
END Equations;