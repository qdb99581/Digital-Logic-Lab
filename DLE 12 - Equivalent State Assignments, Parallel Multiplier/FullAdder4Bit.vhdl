-- ASM4 stands for Adder-Subtracter-Multiplyer 4 bits

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY FullAdder4Bit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
        C4: OUT STD_LOGIC
    );
END FullAdder4Bit;

ARCHITECTURE Equations OF FullAdder4Bit IS
    SIGNAL A_int, B_int, results : INTEGER := 0;
BEGIN
    A_int <= to_integer(signed(A));
    B_int <= to_integer(signed(B));
    results <= A_int + B_int;
    S <= STD_LOGIC_VECTOR(to_signed(results, 5));
    C4 <= S(4);
END Equations;