-- ASM4 stands for Adder-Subtracter-Multiplyer 4 bits

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ASM4 IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        F : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Function selecting
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ASM4;

ARCHITECTURE Equations OF ASM4 IS
    SIGNAL A_int, B_int, results : INTEGER := 0;
BEGIN
    A_int <= to_integer(signed(A));
    B_int <= to_integer(signed(B));
    WITH F SELECT
        results <=
        A_int + B_int WHEN "00",
        A_int - B_int WHEN "01",
        A_int * B_int WHEN "10",
        0 WHEN OTHERS;
    S <= STD_LOGIC_VECTOR(to_signed(results, 8));
END Equations;